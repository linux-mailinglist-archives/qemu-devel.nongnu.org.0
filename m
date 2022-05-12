Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD3E524DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 15:12:01 +0200 (CEST)
Received: from localhost ([::1]:42106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np8bm-0000Hm-8o
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 09:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np8Z5-0006JA-Aj
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:09:11 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:42216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np8Z1-00042d-KX
 for qemu-devel@nongnu.org; Thu, 12 May 2022 09:09:09 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ef5380669cso55577457b3.9
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5eHJUA11iJOkI4jb8umNy3UQp7gHwcE4pbuy2s8SHsQ=;
 b=sUtaK+CkkgFhoBGxt0e/V58q52fBVtiMiU+iWMrteIlCVQflwcGqS4GJdN/o38z8X2
 dk0X4FTMmLqaDfy/ebt5ETo0XRG38Q7a/RTCALlNutQbamxFdeDRXrcGu2M5ChT5+hGj
 qOcTYVRoqEzAR+fjIsBEssvhfqsaktNil+qnzxhNrxofVrNrKXJ9HoK6o5o4eSDkdbXk
 6BTh9eYltmSzSKdDQ8CXqcnkZFes3LjaMpKzK0YTORZeMXD9Ykpr8H7G61HAKZceKzO/
 O3zHjj330E4ZMgBvG+T/MtAQQhRrrkiqA/JkPc0ub/r9t0xsgNDi9UK7v6YnFQID8N4/
 XgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5eHJUA11iJOkI4jb8umNy3UQp7gHwcE4pbuy2s8SHsQ=;
 b=WwTokGyhTLXNcR8zDv43eJUUVryaNlJui45LNi8XXIuAxvrPX2UwhVauKkm/x+SKbG
 sJjbeX8eP0MqFeVUPfaUykVUj8KrUUPmfFKrz4KGsFzvos1ZyxnIKbYVHkYfxYmg0+gi
 VKrWoMJBsTGvctmWanDEEyyvp9CmLMobqxT/9+INRaZftYkhcOD8qp6w0xrfGj6C2hBT
 OoOfXkgxft9J2Kk8KzghbeZ9L8h2h5EF1wv+61PndVpAy5ckL5MtUdvc8eKlbw4r4DXt
 lfbDMzUz/If200hikLr8XuAsy8tVIxXwQzq4KRAffPG3c9AGE+5Gt65ZuQmDJ3LafLf7
 F68w==
X-Gm-Message-State: AOAM530cxOF1eqB5DXdrAXXGCuNwb08ad6p77sbAGeZfZBndv7gpAZty
 GVn5EnCBMmme5tWSfW5JWFErM5YravWN/L4SDERggA==
X-Google-Smtp-Source: ABdhPJwJWOjiuoNMjJQgig2HpUAYcdvbVsc0jqow1kLv/OIz98aVk5Gtd6FpJiAimDdNC+3QggeQufzbWG8U5X8/T6E=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr31613330ywf.347.1652360945455; Thu, 12
 May 2022 06:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200305165149.618-1-eric.auger@redhat.com>
 <20200305165149.618-11-eric.auger@redhat.com>
In-Reply-To: <20200305165149.618-11-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 14:08:54 +0100
Message-ID: <CAFEAcA8pC4RQ3oVVVzG4NA8fBkhzspxD+DyZB+UCn7u1aPSP5A@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] test: tpm-tis: Add Sysbus TPM-TIS device test
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Mar 2020 at 16:52, Eric Auger <eric.auger@redhat.com> wrote:
>
> The tests themselves are the same as the ISA device ones.
> Only the main() changes as the "tpm-tis-device" device gets
> instantiated. Also the base address of the device is not
> 0xFED40000 anymore but matches the base address of the
> ARM virt platform bus.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

Hi Eric; the commit adding this test is from back in 2020, but I've
just noticed something a bit odd about it:

> +    args = g_strdup_printf(
> +        "-machine virt,gic-version=max -accel tcg "
> +        "-chardev socket,id=chr,path=%s "
> +        "-tpmdev emulator,id=dev,chardev=chr "
> +        "-device tpm-tis-device,tpmdev=dev",
> +        test.addr->u.q_unix.path);

This 'virt' command line doesn't specify a CPU type, so it
will end up running with a Cortex-A15 (32-bit). Was
that intended? Also, it will get a GICv3, which is a
definitely odd combination with an A15, which was a GICv2 CPU...

I noticed this because I have some recent GICv3 patches which
end up asserting if the GICv3 and a non-GICv3 CPU are used together,
and this test case triggers them. Since the user can also cause
an assert with that kind of command line I'm going to rework them
(either to make the virt board fail cleanly or else to make the
GICv3 code do something plausible even if the real hardware CPU
nominally didn't have a GICv3). But maybe we should make this
test case not use a non-standard combination anyway? (The meson
conversion seems to have resulted in this test being run under
qemu-system-arm as well, incidentally, so I guess we would want
it to specify either 'a 64 bit CPU and GICv3' or 'a 32 bit
CPU and GICv2' accordingly. Or limit the test to aarch64...)

thanks
-- PMM

