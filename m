Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8E3CC6B4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:01:12 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tJ1-0004Sg-DV
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tHl-0003lE-VQ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:59:54 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tHk-0003V0-8r
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:59:53 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bu12so21283710ejb.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0X5vP5UuRZmmiXN7+ZoPEGRw3pfY8AyeS8QhlBApc84=;
 b=IPu7KPs4q5k1WXdeX20KcbcMLHvHPVDoejJ/1CFWs5VHU4iugqVZjqTNId1FjOBi0h
 ii8EDWexiUEqwrYG2+DQjUAD2enKMJiys1kl3+pDrhbxTGT9EN5vOFpotSIACmY+9S4Y
 uRi7oYmNZr34IeUF77rTyvcXkdTVctNPn521Fr0mL/zUtxdqnVUFfsvDF01jwGAaJbEu
 cILuEj6N29fKaFVQdznzNnnesUjfRqyeBhYtqoCfETJyuZ26OTz2GmaANg6+JnJRBAfc
 FYJvqNrBeY4+oL2S/JJnkeX7/S7xOxq5ReC/uj/36ch+hvJHpdxpMFgXcubRztqTS7Kp
 l0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0X5vP5UuRZmmiXN7+ZoPEGRw3pfY8AyeS8QhlBApc84=;
 b=CVaErpfN0kwvSLmA3uRhOt4tlgLiz/evI5hLoMdn4TGeVCt7VhULKaIXpevSsOuktX
 FkADQ5QQR+bNPS51OIlaNqmISivPmKlF0dlDPngpjREkEsi3TvISfDV9PyxgO+H5vul9
 eytE1l9cOxhqaJpF4+R1NThxWEZtZKSoKOVY5zpXgnVKMa75nnp7QSRZ98kPd2mY+iEK
 SNwLGpO2KshUSDjux1Q03qFGeI0kbj0Z6AhClQWhLrBoBnNngCugMyVR7B/XhGtsk3bA
 7LyXxgex+i8WXkx3Daqb607ukIIFMYilkuhp7sIuVoMqQXpVIGKGMtLXBL1kOva/tpDs
 tPig==
X-Gm-Message-State: AOAM531ZtCduYxukWR5YCjlR3+azmD5bbXDRPvG4iAoV5ZcGu/kgzgvb
 cjymwGwBHRLVm5ZDfxeWMgEWTYgOQ1twN+JX105PBA==
X-Google-Smtp-Source: ABdhPJzR1liBt3QqGosJMJ1vKDt8CazwWIe+wz66wMXGMx0wMY2HFFq1A1K/SnU6AM7OW9D2tiuZOuwohRJcNpwvYUA=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr12817665eja.85.1626562789938; 
 Sat, 17 Jul 2021 15:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151748.408754-1-pbonzini@redhat.com>
 <20210708151748.408754-45-pbonzini@redhat.com>
In-Reply-To: <20210708151748.408754-45-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 23:59:09 +0100
Message-ID: <CAFEAcA9=6pqDQb4fpa91F5L6FfiBb505+f=ZMv6b=sekkT8UEw@mail.gmail.com>
Subject: Re: [PULL 44/48] meson: Introduce target-specific Kconfig
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 16:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Add a target-specific Kconfig. We need the definitions in Kconfig so
> the minikconf tool can verify they exits. However CONFIG_FOO is only
> enabled for target foo via the meson.build rules.
>
> Two architecture have a particularity, ARM and MIPS. As their
> translators have been split you can potentially build a plain 32 bit
> build along with a 64-bit version including the 32-bit subset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20210707131744.26027-2-alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; this change (commit f4063f9c319e392 in master) seems to have
resulted in qemu-system-tricore no longer building the
'tricore_testboard'. Before this commit:

$ ./build/tricore/qemu-system-tricore -M help
Supported machines are:
KIT_AURIX_TC277_TRB  Infineon AURIX TriBoard TC277 (D-Step)
none                 empty machine
tricore_testboard    a minimal TriCore board

After this commit, 'tricore_testboard' no longer appears in the list.
The hw/tricore/meson.build uses "when: 'CONFIG_TRICORE'" to
compile the source files for the board, so presumably that
CONFIG switch is no longer being defined ?

This in turn breaks 'make check-tcg' for builds which build
tricore-softmmu, because some of the tests there want to run
code on the tricore_testboard:

[...]
  RUN     tests for tricore
  TEST    test_abs.tst on tricore
qemu-system-tricore: unsupported machine type
Use -machine help to list supported machines
../Makefile.target:168: recipe for target 'run-test_abs.tst' failed


(I guess we're not running "check-tcg" in gitlab CI. I do run
it locally, but only on a linux-user-only build tree, which is
why I didn't see this earlier.)

thanks
-- PMM

