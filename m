Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D62ADCD0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:23:53 +0100 (CET)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXN2-0004aG-R1
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcXKu-0003cL-Tm
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:21:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcXKt-0004gI-1T
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:21:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id a3so2541497wmb.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=EtQadH5wdCquHp1Ne6lmXpYxa4LqCi/Yu3IEm9W27/M=;
 b=Q2RWaHnvy7KUfVR9+U/VTkH3POfjpMuHPJZDDu0m4WV8oGd4Q1vHV5DNoR/AIW+o+O
 kCIatNzSN41dUe6NykqWK6XeZp8g0t7UU5MNtTm6ZNrp0r2J/FeUIGciFX+Z42WyDODC
 nzx1pKkUyOX3WXUPqIyH7rTcv+3gHp+mAZqidT/gHT9a45nlRwRlzjtpVTEQ/ZfeRhI/
 S4rkA95Uy8Ft+nTzenp6w1FNF4aCsFyisr/C5m0iDBi/fTP0UF1ksK0Ean1lPjAwnHqU
 Ip3oWNLBE18/UU7chmMU1TGR0mFgrRtcA8Ebxm6RFBisNIOuP8TN6lNGeGyhbhAlWVN3
 uW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=EtQadH5wdCquHp1Ne6lmXpYxa4LqCi/Yu3IEm9W27/M=;
 b=Hf2+XzaLhy7u2xkGaEHst4pnrd72YQi+SuVHA68NFiV6MmXiNGXivCd+cGHfrSrIc7
 dVmj/XSxakmt5hisE1aoM8pmoX4ZP39C5FyJg1kroBYRjLaS72U+XEjGPjKE7kbNCOxW
 RjgzFys03kX01T8g3l3B752gImrbhxPMhizPMtyAVmRiCVZSpw77UQXDkCHX0DfmaDJP
 G0s57clRynZW/THl9ooW3Bav1MWR04Bll4M2Ops3rYkFVV+RJSRWKWsJu9mGuFOMs3k9
 HMIemvN9SVKBwmIsKfKE/E4ad0aUoRkBn12qsUYd6tNgkx9in6KHAG5BVn9Ul1ylZl02
 NKwA==
X-Gm-Message-State: AOAM531F627QFlJyb59/0BMLi9MtAZAm0befcnDBXnawnTUKY9qALleP
 vMe46X9F1DhN52l76+45WxWwmA==
X-Google-Smtp-Source: ABdhPJzMB4Mrb5//ouZoOlf+iW5Bdi95X8wrDrEPoQOzKKIUGUl7WaxZsukwckg8H10JWLJfKfWdnA==
X-Received: by 2002:a1c:2b03:: with SMTP id r3mr121304wmr.184.1605028897221;
 Tue, 10 Nov 2020 09:21:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m20sm20200249wrg.81.2020.11.10.09.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:21:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 49D151FF7E;
 Tue, 10 Nov 2020 17:21:35 +0000 (GMT)
References: <20201109091719.2449141-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.2 v3] tests/acceptance: Disable Spartan-3A DSP
 1800A test
In-reply-to: <20201109091719.2449141-1-f4bug@amsat.org>
Date: Tue, 10 Nov 2020 17:21:35 +0000
Message-ID: <87361h86w0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> This test is regularly failing on CI:
>
>    (05/34) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_m=
icroblaze_s3adsp1800:
>   Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Build=
root 2018.05.2) ) #5 Tue Dec 11 11:56:23 CET 2018
>   ...
>   Freeing unused kernel memory: 1444K
>   This architecture does not have kernel memory protection.
>   [nothing happens here]
>   Runner error occurred: Timeout reached (90.91 s)
>
> This is a regression. Until someone figure out the problem,
> disable the test to keep CI pipeline useful.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to for-5.2/various-fixes, thanks.

> ---
> v3: Simply disable with @skip
> ---
>  tests/acceptance/boot_linux_console.py | 2 ++
>  tests/acceptance/replay_kernel.py      | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 8f433a67f84..cc6ec0f8c15 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -13,6 +13,7 @@
>  import gzip
>  import shutil
>=20=20
> +from avocado import skip
>  from avocado import skipUnless
>  from avocado_qemu import Test
>  from avocado_qemu import exec_command_and_wait_for_pattern
> @@ -1025,6 +1026,7 @@ def test_m68k_mcf5208evb(self):
>          tar_hash =3D 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
>          self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
>=20=20
> +    @skip("Test currently broken") # Console stuck as of 5.2-rc1
>      def test_microblaze_s3adsp1800(self):
>          """
>          :avocado: tags=3Darch:microblaze
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_=
kernel.py
> index 00c228382bd..772633b01da 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -14,6 +14,7 @@
>  import logging
>  import time
>=20=20
> +from avocado import skip
>  from avocado import skipIf
>  from avocado import skipUnless
>  from avocado_qemu import wait_for_console_pattern
> @@ -280,6 +281,7 @@ def test_m68k_mcf5208evb(self):
>          file_path =3D self.fetch_asset(tar_url, asset_hash=3Dtar_hash)
>          self.do_test_advcal_2018(file_path, 'sanity-clause.elf')
>=20=20
> +    @skip("Test currently broken") # Console stuck as of 5.2-rc1
>      def test_microblaze_s3adsp1800(self):
>          """
>          :avocado: tags=3Darch:microblaze


--=20
Alex Benn=C3=A9e

