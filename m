Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C265EAAC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPNk-0004s1-L0; Thu, 05 Jan 2023 07:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPNh-0004qj-OS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:30:01 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPNf-0005OP-QJ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:30:01 -0500
Received: by mail-pg1-x529.google.com with SMTP id 79so24389170pgf.11
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EreA2E/z+iNbcLiJuBiYI5z02CYKhjitAuCuUOBCEoc=;
 b=Rkhi/D+N0XlDMIaTTtJ/r/7/0uOw36pXp/xPVas6irST/XlDCBl6y0W5ti866BQAq6
 x1p/QsDzo2bkwcN6Oj77ij2bDbnU3h9V5n7e5QiVve0WVKifahRv6l2jxLt0nvFDZ5kS
 ihhFoIEQIUHVi6IMk84Peuwe+Vmxm2JKbulMWxsKNzSg5an24QA5TpbYLDFTNwq3wtDr
 02umXJ+fTmTPq5SmoDu7qcpym/LOJbZ+3k44Ar3OQev3hwYiJZwot+iVlQKf0m6Irw40
 1CiMr9NHBeDdxB/EZpRck42aIWbXoUyDnQM3/hnLquvfA+lX2tWlOV0J1XoWxy567ujV
 zXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EreA2E/z+iNbcLiJuBiYI5z02CYKhjitAuCuUOBCEoc=;
 b=723DpZVBbWyM6myzh8OM+vFf0ZcZjba+QoVhB/4i9roOzj6Y1wP3uuDYAMuYrT0K5G
 A0JUJ0ohi+XZeeU3WpKF9MdhcN/+qNYPZ2235uBVV9sXP20rGGfB8B79bVcK81xqwLUm
 BA9mBCSXwYSdjYEf25nV7AVQIVlbMwlZ2EWERgTwVKpLPJYpWqpo98FWrRxj51UCO/3v
 /MPYdMFeFXjo/CX2mco91F1AmiElRp0criXlgFSa8vaUVmJzUg1+FHBkN3wKge47plU2
 ZyNz+T6Ziavx8zbC/vDpe0i5ejniOcbtNYfeAlly4GQ6u5tSDawNMg9LFoCQwqpD0Ia7
 Ft1A==
X-Gm-Message-State: AFqh2koWshDh9pIUhgINpreTMcuN1+5Pgp40ScTPe4CTU8e5kSOVn+8D
 83pJ6iVtYsB6Yb4NXKzWfXMTtvSgwooQV35ixdOERA==
X-Google-Smtp-Source: AMrXdXtEKTgfBdzU8RnBLqlHx2o9Qtt4gNVzNkCpSRuUzxgiff8Xptq47MFnPNDlF7JlVDbLGBAo2Ykg/c/oJOQRRIQ=
X-Received: by 2002:a62:3245:0:b0:582:a212:d922 with SMTP id
 y66-20020a623245000000b00582a212d922mr736731pfy.3.1672921798084; Thu, 05 Jan
 2023 04:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20221213190537.511-1-farosas@suse.de>
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:29:46 +0000
Message-ID: <CAFEAcA-uYuaSfVBbcc2KNO_7PLOOSL5oTVOqYAe_kvTo6wJwUg@mail.gmail.com>
Subject: Re: [PATCH 0/6] target/arm: general cleanups
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 13 Dec 2022 at 19:08, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi folks,
>
> I'm splitting this big series from Claudio from last year into more
> manageable chunks (at least for me):
>
> https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de
>
> This is the first chunk with only the most trivial patches that make
> sense even without the kvm/tcg and sysemu/user splits.



Applied to target-arm.next, thanks.

-- PMM

