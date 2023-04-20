Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F306E9920
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:05:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWmo-0005Ap-3f; Thu, 20 Apr 2023 12:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWmZ-00051m-U4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:05:16 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWmX-0003FE-V2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:05:15 -0400
Received: by mail-ej1-x636.google.com with SMTP id z6so7555978ejc.5
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006712; x=1684598712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erUEiabrywpG86sQAsQxRWRw7QqnD818cW4sajn6rLI=;
 b=VyOR2lCaw8LDBm16F9cr8tmGHc/INbqVn1gBJqtg40eD3eVyIELmm0WHmCBczAbYtW
 Hlco26C+mZrSbB9jxycFl1KkbX4a3LR0Hkc7Z3FHQzaZFzMoJWj2a2sA9+fSqNaiVXDC
 S3qoKBtqfMGLydehQweENOi6sfrba4HqBQyGhr3I++aCDXrXbMFx4l2F9+p8zka6o+wk
 UqCuVEpJ9S5koQjVWWzTFpYVK8tMgEgfVrmEyyErbOX7MMeH17in4ZpiukTmYfLEIUY7
 /HYHz715K7hxVymPfBulr+vQt3dD8WJWhjo0nNjs+F9qrdUoLHYzL1swUxYt6jXWNtqL
 bszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006712; x=1684598712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=erUEiabrywpG86sQAsQxRWRw7QqnD818cW4sajn6rLI=;
 b=FiJvxGuxPE2zmCTaWePhRnE3Vfq/DJI3aEquR64qAUQCnVzrEInBS95XelYbPWrK4D
 Mz/rfzy7/8jhsI9SWz5io5hirdXaUijbjq9hdZrVDsrhzX5MbhrgP/PsETCIZY9z+3Y0
 qw6LWOznyo0FrFmQiHw7iSZo05c6S8+jAWkN+zHJQDg58MVeOOMDvABs2FO4RDt+weVJ
 HKlZUt7/RvywB727j3KdFyvq2HXOQbHMTaHCPx/rx0OrJqLrchUu6E7Z7tV+uDOgKLZ8
 bdKHJipXmfgsI/sJHY9NEYSKMyAPBEGGGFwnN6r9hWpVI+NthV4IWk5OtpQNMw0duS84
 ZNzw==
X-Gm-Message-State: AAQBX9eHJpe5+iqu4j3qBeH842n7WTo6URbPfxLYon/bhkUMq0Vwlziu
 4qXpASATk2wZ5dR9pPYoKIzuHpkVUi/P/fEU+IHDTA==
X-Google-Smtp-Source: AKy350Y3OFwneJqztVjwnUUN3KSEdR/mbvxUwkXQLJ2Tto6Rk8+Ra/uq6gGUiI2fiSZMBrt9iw6GGeb5ebonvtq0+TY=
X-Received: by 2002:a17:907:980a:b0:94f:7786:45c2 with SMTP id
 ji10-20020a170907980a00b0094f778645c2mr911637ejc.6.1682006711871; Thu, 20 Apr
 2023 09:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2023 17:05:01 +0100
Message-ID: <CAFEAcA8jfd6fqofBOzdkBHjxP9Ctv_5LB9gw1fbLYOEqdpfJnw@mail.gmail.com>
Subject: Re: [PATCH 0/9] docs: various (style, punctuation and typo fixes)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 16:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> I accumulated some doc fixes that didn't make it into 8.0 and thought
> I might as well see if there was anything worth adding to the coding
> style while at it.
>
> Let me know what you think.

> Peter Maydell (1):
>   docs/devel/kconfig.rst: Fix incorrect markup

This one is in my target-arm pullreq on the list, so you
can drop it.

thanks
-- PMM

