Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7430F3D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:28:18 +0100 (CET)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7egE-0007u8-2Z
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7ee1-0006bt-1C
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:26:02 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7edx-00010B-QT
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:26:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id c127so2968755wmf.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 05:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=t1kqjXAcfqKGsvUDjObHdyYOolHS416prALECSmtfDg=;
 b=jyLdik+0CqiUWXioGejGvbw/8MfIPjcWO7G8pu2Vtu2qC3wYMvYoeOO+awls4kergk
 jbDdCvbH3JKANpjZRKdpyjwwyg/eiknJTaSydnyirxkCxi3HxLwwNL3DnSZkTg6k9nU3
 uhQxQhLjOTWVINwtmvVnrbvt0Hs4uFTilvflIIHcEfp/ZBUgTJGzLfiUfmoXHq5bPNA/
 R4q3W27FJjThhg+NExSIEfGAWTE9t4Z8dUQrkWvZfYKjGEq43sFuHAflYMeno4U8fyHT
 ir7dOtfCyqN2TUNOEP9/a+JQIf3K7sgC8CLq18xVa8Lk+kNQssOBQF+Ooah5/4buZ298
 MUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=t1kqjXAcfqKGsvUDjObHdyYOolHS416prALECSmtfDg=;
 b=liexSsmjGLWeEfChasAxI+tXHpc/Bzo8zXMwIza4IzQNcoUL8aP/ECX4+tpq7frhfZ
 Xq5lgDbpUJoixUpt/Hwjy+cpPpbHwdTWuMnZQSLg5iAukeV3khAb+7tvLl2GIkY2eBuS
 Z9DQ9eOqeksjdCj3T5mf/ZIjOWo33Bo/QsoknBjxof//+Hs8+XcM3lg4vkuoANWrdlo4
 NNNrlfYNgIyQFdS9HX29oUJJUVFwSmmry3DeSnceeu0K7vaCeQZdJFgaq0mKoletFgrR
 fLqf+8ZHkLzJYcwn8nSw8zLlpKhpFFAD+hqHItVQ6LEjuKLcwRE9WOOMAvsplTNsaqUZ
 bWNA==
X-Gm-Message-State: AOAM531RmdjTKWIVGJjS/V4KSIU+qZ4/PYEqVhhkDUArX7Vh+Vx3WqDg
 bCM2GXLA+4MI3THgoKVVqQ1FBA==
X-Google-Smtp-Source: ABdhPJyzxs1wXcBGq8xxC97lLjlMUlLSRMvAyYJC7oXEQlFipFG2lQXtf/smEjbDS/l9JzEKECwU0w==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr7215787wmi.173.1612445156095; 
 Thu, 04 Feb 2021 05:25:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b13sm7911470wrt.31.2021.02.04.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:25:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 681DB1FF7E;
 Thu,  4 Feb 2021 13:25:53 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
Date: Thu, 04 Feb 2021 13:23:21 +0000
In-reply-to: <20210203172357.1422425-8-crosa@redhat.com>
Message-ID: <8735ycq80u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> If the vmlinuz variable is set to anything that evaluates to True,
> then the respective arguments should be set.  If the variable contains
> an empty string, than it will evaluate to False, and the extra
> arguments will not be set.
>
> This keeps the same logic, but improves readability a bit.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/vi=
rtiofs_submounts.py
> index f1b49f03bb..f25a386a19 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -241,7 +241,7 @@ class VirtiofsSubmountsTest(BootLinux):
>=20=20
>          super(VirtiofsSubmountsTest, self).setUp(pubkey)
>=20=20
> -        if len(vmlinuz) > 0:
> +        if vmlinuz:
>              self.vm.add_args('-kernel', vmlinuz,
>                               '-append', 'console=3DttyS0 root=3D/dev/sda=
1')

And this is were I gave up because I can't see how to run the test:

  ./tests/venv/bin/avocado run ./tests/acceptance/virtiofs_submounts.py
  JOB ID     : b3d9bfcfcd603189a471bec7d770fca3b50a81ee
  JOB LOG    : /home/alex/avocado/job-results/job-2021-02-04T13.21-b3d9bfc/=
job.log
   (1/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.tes=
t_pre_virtiofsd_set_up: CANCEL: vmlinuz parameter not set; you must point i=
t to a Linux kernel binary to test (to run this test with the on-image kern=
el, set it to an empty string) (0.00 s)
   (2/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.tes=
t_pre_launch_set_up: CANCEL: vmlinuz parameter not set; you must point it t=
o a Linux kernel binary to test (to run this test with the on-image kernel,=
 set it to an empty string) (0.00 s)
   (3/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.tes=
t_post_launch_set_up: CANCEL: vmlinuz parameter not set; you must point it =
to a Linux kernel binary
  to test (to run this test with the on-image kernel, set it to an empty st=
ring) (0.00 s)
   (4/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.tes=
t_post_mount_set_up: CANCEL: vmlinuz parameter not set; you must point it t=
o a Linux kernel binary to test (to run this test with the on-image kernel,=
 set it to an empty string) (0.00 s)
   (5/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsTest.tes=
t_two_runs: CANCEL: vmlinuz parameter not set; you must point it to a Linux=
 kernel binary to test (to run this test with the on-image kernel, set it t=
o an empty string) (0.00 s)
  RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 5
  JOB TIME   : 0.56 s

Given the test seems to make assumptions about an environment being
setup for it I think we need some documentation somewhere about what
those pre-requisites are. FWIW I also had the following locally applied
to workaround the fact the losetup and mkfs.xfs binaries aren't visible
to normal users.

modified   tests/acceptance/virtiofs_submounts.py
@@ -173,7 +173,10 @@ class VirtiofsSubmountsTest(LinuxTest):
         self.run(('bash', self.get_data('cleanup.sh'), scratch_dir))
=20
     @skipUnless(*has_cmds(('sudo -n', ('sudo', '-n', 'true')),
-                          'ssh-keygen', 'bash', 'losetup', 'mkfs.xfs', 'mo=
unt'))
+                          'ssh-keygen', 'bash',
+                          ('losetup', ('sudo', '-n', 'losetup')),
+                          ('mkfs.xfs', ('sudo', '-n', 'which', 'mkfs.xfs')=
),
+                          'mount'))
     def setUp(self):
         vmlinuz =3D self.params.get('vmlinuz')
         if vmlinuz is None:

--=20
Alex Benn=C3=A9e

