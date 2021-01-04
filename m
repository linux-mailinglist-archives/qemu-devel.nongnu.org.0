Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB812E9435
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 12:42:56 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOGF-0004ce-KB
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 06:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwOFR-0004CU-Lu
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 06:42:05 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwOFM-0002G8-At
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 06:42:04 -0500
Received: by mail-ej1-x634.google.com with SMTP id g20so36438109ejb.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2PZB7CFxUiQhHqh+6HRrKqpZKirPEUsItKKtTMkOpu8=;
 b=jWTq669gpdltqAUEdXY0J8tr6IijVxozjEo39FbaeWlTSeuntrHjzLEoIURoQlXJXw
 3XF8m2lFAKZiy6QdpBclX48v74LqGG0H53TgY5L95c6Lj4xsxLYUOboeQpBhxJVbUzIa
 4OodEnSaTEpPpbOkillimQkadEXoFMMPdd2u03rqeWPpn3vAxIphyPKSjWJQdG2hVOUE
 giowhX7WymHNKzLAdYNHBDW8HRdMtsTbImYmuHaH9I+uI7JOp5Uf4FMei3Y30Wyx7Vlf
 hNmM9o0smQUWvyAG6skY79bAL4gVlA6OCOP132Q7GvdNwmPWssJOR/Xrb1idIS1t6OJA
 vZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2PZB7CFxUiQhHqh+6HRrKqpZKirPEUsItKKtTMkOpu8=;
 b=uX0FKXQVyyqWbYN+832iaX6Q4yqyBRJNFabx5biOGKWNON4iiL3nfu7FPA3v4bAibg
 Swf2iVZEpO+YuEReEAIMxqqz5szKn7K0vF3Y2w0FtyGikG6FQTebqxjP74EUijR6D4jQ
 rA93sro6YyS6nasSxSWwxan0oA2E39nBFRPb9JLPKczREwNETfMnD7IQRd0sZuTxDvbI
 IiG4lTlLa36Bcp1UJ6h5Y2nReDiE6bCd7kARq4ZUoAq+cpXpth0aGc0SmeW0kaqcz1aY
 i3vh4Z4J5L9YMSvbenia6SjJpr9jb425agvQvN8mcI5fy/uJakBvEgoWpaXxIEwI1w8K
 dZ2w==
X-Gm-Message-State: AOAM531HOSllC2c7HJrm3uMsAoRoeqJ/SJNs8P0N/QPpObpPrQQ9m1Rc
 PnNj/vO3SL10haSx1nSaVM+eqz4bVDbJWpUTSkTfiA==
X-Google-Smtp-Source: ABdhPJwMjF6ujCK7RvPi9q22HIYnr7Y08lF5+EosjW8fJGeyy5ufXwBBQdWY/GrgbqjGDE1FsFdhVMYjv3zb8MiXQFU=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr41216423ejf.85.1609760518083; 
 Mon, 04 Jan 2021 03:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 11:41:47 +0000
Message-ID: <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 3 Jan 2021 at 20:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The following changes since commit 83734919c408ba02adb6ea616d68cd1a72837f=
be:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20201222=
' into staging (2021-01-01 18:19:44 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/mips-20210103
>
> for you to fetch changes up to 9c592996981fcb37fef011d7e9603cb31f8ef29f:
>
>   tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-03 21:=
41:03 +0100)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Use PCI macros (Philippe Mathieu-Daud=C3=A9)
> - Clean up VT82C686B south bridge (BALATON Zoltan)
> - Introduce clock_ticks_to_ns() (Peter Maydell)
> - Add Loongson-3 machine (Huacai Chen)
> - Make addresses used by bootloader unsigned (Jiaxun Yang)
> - Clean fuloong2e PROM environment (Jiaxun Yang)
> - Add integration test of fuloong2e booting Linux (Jiaxun Yang)


This fails 'make check' (consistently) on the aarch32-chroot-on-aarch64
host:

PASS 51 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-command-line-option=
s
PASS 52 qtest-mips64el/qmp-cmd-test /mips64el/qmp/query-acpi-ospm-status
PASS 53 qtest-mips64el/qmp-cmd-test /mips64el/qmp/object-add-failure-modes
MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=3D./qemu-img
G_TEST_DBUS_DAEMON=3D/home/peter.maydell/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=3D./qemu-system-mips64el tests/qtest/qom-test --tap -k
double free or corruption (out)
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 6 (Aborted)
ERROR qtest-mips64el/qom-test - too few tests run (expected 8, got 0)
Makefile.mtest:2249: recipe for target 'run-test-279' failed
make: *** [run-test-279] Error 1

thanks
-- PMM

