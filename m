Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831BC62B1CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 04:26:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov92f-0005QD-9t; Tue, 15 Nov 2022 22:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov92b-0005Pf-Tn
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:24:46 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ov92V-0002FM-9M
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 22:24:41 -0500
Received: by mail-io1-xd33.google.com with SMTP id h206so12290076iof.10
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 19:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fpN9hQ5HBb/wxraiFgGq2YXyqZYRUWVwDLejvnWyAJI=;
 b=r07xFSZmUIXY8ZXAh92ooH27omx0O8ZagENhfHHaH6/3NLAaYzmnzE+x3wkLY4DOA4
 cp7KGHU3LLvD20tTjtWYRNITS0s6nBVW6gv0ujE+glbuN/cuULcrXT4Zh3NheiI+NEQ1
 zzcXMGFXb+GqLydg7rAoQzP353nG1LP9YKsAKbz4bT6wsw3/vamHnjupm8FVOiZ1gL1G
 DXWOQ4hFO9dm4yFQQ9Omxp8/tOZVTY2szthRKTmo44M4a4KOt/DEBX6+JX3ceZeFadak
 I2odFqdK+g6VB5aQwYxB6lA8+iy0aS1x6olFKypOZ4HDTPJhkaVdhQCHocV644scrlN0
 18OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fpN9hQ5HBb/wxraiFgGq2YXyqZYRUWVwDLejvnWyAJI=;
 b=tIkS/P+LenHaqoR+gGBkEVYO0+CLziVpkWM28PrpU9PeTiLPEWuO3JDF7HWuwxbIOE
 GGsvhAOKIzJdFmHGAs4J4bnsJD5Zlu2DYS/geb+RzXl6MwjdPcqew+KLiPTfg3ISboSq
 Z5MvUvrGhNdykBM12d/EoxFiJ9N5d9L70bj8bYCSS8J5/dP1BrPX8K9venaOf7rplPT3
 5Bmfc9fTNtGd6XijReIIarAYvEeGXnDfP2tYQ+1IOX+fu5Ype6/mFxHfKJSjP3QT649Y
 0ESmO79YJaBkICsh2Wd5YypIl7ydG/ZwLRYJm0dB50+pWFQdx7t2+jXUtA/YTGjMTnQn
 BzDg==
X-Gm-Message-State: ANoB5plazoZwveP/fjvGb/za1gdKan7LQBoSYbW3B+IGRqCAQdqzQ1ce
 Qjmdf7tWWBcKZ3TIsFdTTPzuzT/Pqt5IrNWwpVe7NA==
X-Google-Smtp-Source: AA0mqf6zOoGshIGT68gMHDJ3WXrb6ASuboghjOCTR/SU1yskmZ4VPD8I7tAspZBQHWpTtfzKQS40j3aEP9yvzyTSyhU=
X-Received: by 2002:a6b:ef0e:0:b0:6c0:3ade:1c3e with SMTP id
 k14-20020a6bef0e000000b006c03ade1c3emr8939393ioh.63.1668569077458; Tue, 15
 Nov 2022 19:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20221115212759.3095751-1-jsnow@redhat.com>
In-Reply-To: <20221115212759.3095751-1-jsnow@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 16 Nov 2022 08:54:26 +0530
Message-ID: <CAARzgwxaVyQf424PeUOO=efyPHdiMK9nF7g+pHuKufqU1cg1-g@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 16, 2022 at 2:58 AM John Snow <jsnow@redhat.com> wrote:
>
> Instead of using a hardcoded timeout, just rely on Avocado's built-in
> test case timeout. This helps avoid timeout issues on machines where 60
> seconds is not sufficient.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/avocado/acpi-bits.py | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a766..ac13e22dc93 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
>          self._vm.launch()
>          # biosbits has been configured to run all the specified test suites
>          # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> -        while self._vm.is_running() and time.monotonic() < max_sleep_time:
> -            time.sleep(1)
> -
> -        self.assertFalse(time.monotonic() > max_sleep_time,
> -                         'The VM seems to have failed to shutdown in time')
> -
> +        # Rely on avocado's unit test timeout.
> +        self._vm.wait(timeout=None)

I think this is fine. This just waits until the VM is shutdown on its
own and relies on the avocado framework to timeout if it doesn't. We
do not need to look into the console. The test issues a shutdown from
the VM itself once its done with the batch operations.

>          self.parse_log()
> --
> 2.37.3
>

