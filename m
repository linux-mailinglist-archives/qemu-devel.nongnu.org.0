Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E9344B4F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:28:57 +0100 (CET)
Received: from localhost ([::1]:53098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONQG-0008WD-Uf
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONOl-0007Ex-A2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:27:25 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lONOj-0005rh-K1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:27:22 -0400
Received: by mail-ed1-x535.google.com with SMTP id l18so11903381edc.9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=g/8CSPWrZjFpBVVrYQzVd2kBsHmhE9RyZrLsttyPp4PATSbt144zHnTBJJPp2b9qVs
 XnsVUGyQ4lunpWalal/nq8c8MSdDbuhOrBsnF1nP8T204E0GPDNnkq0w9tUIYrHV/11h
 3J/DYjCEYKyzxFGowkL48uvabQ1km96rRrS769z8lI6Ptrv9VNbHlpIIKepBdTl1dOrx
 Mj2LyQvGlo0ilFn4EK87qoboOAoY+WzRsnwGk5gVlMhAGZ+awyrqvV7Aom2u4/ftAt4q
 KQt26JLXqDLhi4WUW1o231Rbp6+oOG8G9SJMOS5MfuGzSqGTp8LWvYFCFTXieJfp/3TL
 IVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=58oByHRQENKiTCsgJ5OOlEzdGn1qtJ2SPqsRrI/y+oY=;
 b=e6cDe6IVZnskEgOvJWmJBYypg9LePEP7HiYnyfdTC58wK2jpt2XskTmsISoySied07
 M7V9UsxvqvR/HXYj4RhTz15wcYrO2uRdiVInWOUGNmH9yN/sOuT9wPx0Q9Ytp01IAG2b
 6Nx1QLspCB2cUexgENmSpncS7x5hiKDGrQ0eDM+1KX+zXFRA9PKVb2tPKnmvp3PTz5pA
 uCfXSDvY2IpV+iSEpWqMmEb6w8zj5bCmOLE1VlnKtDhDbzRqV3de9uZp+pNAA0g+Z5pI
 /kfX1eGGqBLTZYzh9h3kJQdQojsYnr2BbmFONjEhkbMLidBrJWUu2Wfxoe1SB4pv15JD
 WYgg==
X-Gm-Message-State: AOAM532Tuf6KpBBrVJyDZoh5dVCStqncy4Ym34D2Bs2WnmsNhQtaObEx
 BbuBMHSAxaNq8BP8FrcjhwY1uA==
X-Google-Smtp-Source: ABdhPJx8ot2K8R+tu55cX9rTBdJANtQV0TiV/RcLM9UwlfGiEnFymMJ1DPlq1L8bARArsYJ5xYmSrw==
X-Received: by 2002:aa7:ce16:: with SMTP id d22mr380092edv.95.1616430437857;
 Mon, 22 Mar 2021 09:27:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u13sm10066167ejn.59.2021.03.22.09.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:27:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CE031FF7E;
 Mon, 22 Mar 2021 16:27:16 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
 <20210322140206.9513-2-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 01/49] target/arm: move translate modules to tcg/
Date: Mon, 22 Mar 2021 16:27:09 +0000
In-reply-to: <20210322140206.9513-2-cfontana@suse.de>
Message-ID: <87o8fbjgrf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

