Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4413BAC3D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:36 +0200 (CEST)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzy3H-00026W-Aq
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 05:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzy2F-0001QR-95
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 05:03:31 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzy2D-0003Dx-OI
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 05:03:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id n33so1845342wms.1
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fvT+RTCJ1PlzZokcsO5KO4zzQn8VllaRBnBOUsBeMHE=;
 b=AaENSQ7AVhTD2Fn5luoh0a7LkDQsdLXvPuuGPLvERNYAFV+6ozA+BsllxecEnSaWom
 lRWMgTpvQNgCHQ19+FXg6rPFykhSN7RwPB0j11zkqcGFoesBymvIUttKZ9acZQIFCWHT
 NkGbgJ0LmHj3SiXkgXTKTSz4v/VrKxuLd43aR9mP7r2groaBVdINexnY2aBLwAYpNVxl
 cszMp6rRaXND+7n5zKZPHRmnFUPNeggIzClRx8aRhvZ9LfYJUvTJA95NxQtRCH6unsrx
 w4Si25Lf4JePhrZ+jpc+C2QIbsk37zruzpBFXMqnF/+dApIqAUf4UTGFanLB3ddg4CU3
 ICgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fvT+RTCJ1PlzZokcsO5KO4zzQn8VllaRBnBOUsBeMHE=;
 b=SeGk9x6QwUqi89D4t5VdGHcazuauN+GJ2m775pb42OObfe0dc+pZtTR/cSBGnJyatI
 Hi2cWkTj5zEbQpLKy70EYFPRPrUdKDeMjIq7YgWX/tgxVRnKkXQgxy3HVAmIkLOT1UUS
 o612Tkd5SC574GOgQVLRtEizfjQ1PM3tmiVJvQDt0P6HfK8bnAbazhZPgRqv052hiK+A
 hvf8NBm0b2a3ewXFqApGJoA9cmj1TAdI6VgJZsvpiF05AxheFJKVokhiPJp5mHvT1eDg
 SEJiz/lWBumeJwt1ZOADNqaVjp73iOz1Xy+QKdHphYZJ+znIiwPnobHFo5jLf+G8Lmtn
 uhOQ==
X-Gm-Message-State: AOAM533/4btjQ1VutgfaFt3V+t+i5TOOgGZ1q1PbVCat/NYQgCYgxsof
 hyv1ya8JUBA7bYem1xiWbHL+MEqTPdU=
X-Google-Smtp-Source: ABdhPJzaW60Tbv2PFPxe3BPHIxJfFwuf/iIvLmWuveHtwPJAxFhYaGO6Hj6yflga93Bx1bml99gkCA==
X-Received: by 2002:a05:600c:4143:: with SMTP id
 h3mr8827143wmm.35.1625389407460; 
 Sun, 04 Jul 2021 02:03:27 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b8sm19015252wmb.20.2021.07.04.02.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 02:03:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
Date: Sun, 4 Jul 2021 11:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 12:06 AM, Richard Zak wrote:
> For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the compiler
> complains about running out of memory. Best I can see, that's not what
> actually happens, but that's the error message. I was going to
> investigate this later, but this was the error which was causing the
> test with the Haiku VM with that corresponding make target. My desktop &
> laptop have 64 GB, and I'm pretty sure it didn't get to that point.
> 
> /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
> error:
> libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata)
> is too large (0xffff405a bytes)

This comes the following array from commit 2c44b19c199:

+/* Errno values taken from asm-mips/errno.h */
+static uint16_t host_to_mips_errno[] = {
+    [ENAMETOOLONG] = 78,
+#ifdef EOVERFLOW
+    [EOVERFLOW]    = 79,
+#endif
+#ifdef ELOOP
+    [ELOOP]        = 90,
+#endif
+};

See how Haiku handles POSIX errno:

https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h

#define B_GENERAL_ERROR_BASE   INT_MIN

#define B_POSIX_ERROR_BASE     (B_GENERAL_ERROR_BASE + 0x7000)

#define B_POSIX_ENOMEM  B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0)
#define E2BIG           B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1)
#define ECHILD          B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2)
...

