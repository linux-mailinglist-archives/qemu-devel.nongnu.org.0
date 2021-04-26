Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060136B275
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 13:46:14 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lazgr-0007Bw-0E
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 07:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lazfP-0006la-Fy
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:44:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lazfN-0004TG-Ov
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 07:44:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id x5so5239030wrv.13
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=T8fDac7TkvtuwKA5vFmYyyhFq54H/UOI/zpyRretY2Q=;
 b=QL2gQxk0RPLtf+ODD9WRZhPxDMlgQDteKWUK4q2VrmCkB5pUlUhirWYRXffvVGjR+P
 N7L6YkE93t6xXDLAK8yJ8UPkrg5wqSdlN5HX2Zafv970q5CsCMM7pqOHBoN76Jmj3NjM
 t6q5Dtaape4IG/Za/BmdfJmqi1SfeqeQo0F60bu1FkHY6WW3jnKSmu2pzGWp0iSlCmqq
 X7lkrBxy5ZiHlcvkniNe1+Vhdmne99+UpZI3ARsoRQ8/+nMI7qleTlba4ewpFrZMmpmA
 SxfUrrmPNRsBcNP/NmdH2y0DM2l90n/pTTVLa4FKxh+i+wKsGomedZxo4Ls2f2KyeWIO
 NC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=T8fDac7TkvtuwKA5vFmYyyhFq54H/UOI/zpyRretY2Q=;
 b=ZI/hZ9M9LH2Tn0Qldsgp+O+EmXSxJfkkG45NC7CVm64AyjxVam8VvoVFbW+GgHl203
 l1VomMHvOOtYYomdUj8o6X9WIsElAOsDJDmgQziSYAE6aYJ6TlLYwNyWJ0AZ1yNeozLd
 +hKm+ZBHcB3IVEX48EvXsnm6iqz3XucwoHtucIgiYNpXrYGC7nWYS5jviEBjrOnvUFAf
 9pZs1VORdsyuDNyIomfSpqXVlbBN6Vrx4gOzzPXBP+1z5xuGavy19Rvwv0ilyVWSeQyp
 qVNVa5IblVvPHZEpnGj50Nv3pyuRAd+4WFxvVKBKuxDjVCWtRnZ7BlG1402B859KfIzh
 QGNQ==
X-Gm-Message-State: AOAM533LRFa1R9INsFmNPeeeEbaYlLRMnHqjP1lyeknun7audibF5ys7
 4Pi0LpVrTqubkcO94xa76BTLsQ==
X-Google-Smtp-Source: ABdhPJwRTQb0r8ydCZ8SbuheMBlzhU7+KhTpBmnovlxOnJmVNabwDUV+coFpTwEGRWo3aZe63pxWag==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr22526043wrg.274.1619437480128; 
 Mon, 26 Apr 2021 04:44:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y11sm20886651wro.37.2021.04.26.04.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 04:44:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E43C41FF7E;
 Mon, 26 Apr 2021 12:44:37 +0100 (BST)
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
 <64701bfe-66c3-7221-a1ed-82e25a59837c@linaro.org>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 00/25] linux-user/sparc: Implement rt signals
Date: Mon, 26 Apr 2021 12:41:45 +0100
In-reply-to: <64701bfe-66c3-7221-a1ed-82e25a59837c@linaro.org>
Message-ID: <875z09tgm2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/25/21 7:53 PM, Richard Henderson wrote:
>> Supercedes:20210425155749.896330-1-richard.henderson@linaro.org
>> ("linux-user/sparc64: Implement signals")
>> This time, in the lead-up, merge the sparc and sparc64 directories.
>> Implement rt signals for sparc32 as well, since there are only a few
>> differences between the two.
>
> I notice that we don't actually have any sparc32 testing in tree.
> I wonder if I can steal an old debian libc image to install along with
> our modern-ish sparc64 compiler to get this working...

It depends on the crt0 bits packaged with the sparc64 compiler. I went
through this with riscv64/32 and found the compiler as packaged by
debian couldn't build 32 bit because it wasn't configured to.

Having said that if we are not expecting things to change that much we
could just do it the same way as hexagon. The alternative is to convince
someone to start a estoteric binary distribution that caters to weird
and ancient build tools ;-)

>
> Also, I've just had a look through linux/arch/sparc/kernel/sparc32.c,
> and see that there's more work to be done for sparcv8plus.  In
> particular, need to save the high-half of the global and out
> registers.
>
>
> r~


--=20
Alex Benn=C3=A9e

