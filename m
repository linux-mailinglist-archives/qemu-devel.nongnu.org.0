Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E383503DC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 17:54:07 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdAU-00087X-9K
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 11:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRd4c-0002Mg-Cs
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:48:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRd4W-0003DS-9s
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 11:47:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id x16so20142548wrn.4
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eFw3EDFgZL+GuhOStaUJQGwRpu4MxKa+wWXmCZYcrFI=;
 b=kAH7ADxM/NneEr4+4gEnvnwN1QuiOxUQeDxfmTnKWdw0pPsNi8aHhk1WQW5GCEipIB
 kCC4pwOvbGosepmx90YfUVuax37QzuJ8Fr6zbg8Zfm6ZkrcMPJ76SDlOlfRVkY0dF+vD
 CW9MVtxFRap+tPgvdV0geIspuTLn+lNL+U4MqeNwtOyBF0UOPQ+eWbb/8UamJqK+vve7
 J0kCsqGuBexCIWOgsMQX+xdEyWzHA/9b9FTuqSBi3S2jNin0oheeAV1Dz1vdxXdM/YGc
 YUKrppMK93IjyXo38hl7fu7tNSL3+7NcGU6CBsKCcmO+kTHsORp2vGgTLcM+yDWLvuve
 BIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eFw3EDFgZL+GuhOStaUJQGwRpu4MxKa+wWXmCZYcrFI=;
 b=IHrbwrR1yYyiWyokbZpng+pAvoLbMIInvnTajxgapxeZ7n0pP8YPHzZ+07s/9rwF+a
 ZUr4QAXdwXEz4zgysaP5oF1rmI6QKJmLv9U/BO97Hdj01Y4MVc/f50G99Yl1BZ/m+8gH
 ByhCtv7s0tqHwo2bZIWZjK51yYeOZAs9XcL7iVO7+0JOnD/k1ACzEzpj895b77/VUM7Z
 xouIPgVrZ7I3vCrmHc/eoyuPEv7PLhRjoOZKzCM6r9xA4SqSS1uB9kCx7jP/BmHoFoTg
 0PSZRj4rGKAjJ+PsHHyanogKYLXVY7vG4ou8o+xD/65wm6yTYVD0vXmzqYusYH1g5h9+
 wCYg==
X-Gm-Message-State: AOAM532wp7iyh8fbtRQwPh7xFNJRoQr7izLBJyDo5wgIQweqWaz9gIw/
 f1E78uz8EGq2MvXODuW+fuOOHg==
X-Google-Smtp-Source: ABdhPJwLi0BMPOyLyLhP5QZKax4IMSt/90HqD9Kine0x+oBwMfJdbopOE0h/y8GFnGpo0dTVWToRhQ==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr4510342wrs.229.1617205673212; 
 Wed, 31 Mar 2021 08:47:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm7184348wrj.63.2021.03.31.08.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 08:47:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51A541FF7E;
 Wed, 31 Mar 2021 16:47:51 +0100 (BST)
References: <20200929224857.1225107-1-philmd@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Date: Wed, 31 Mar 2021 16:45:25 +0100
In-reply-to: <20200929224857.1225107-1-philmd@redhat.com>
Message-ID: <87eefvnx3s.fsf@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The current 'virt_kvm' test is restricted to GICv2, but can also
> work with a GICv3. Duplicate it but add a GICv3 test which can be
> tested on some hardware.
>
> Noticed while running:
>
>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
>  ...
>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERR=
OR: Unexpected empty reply from server (1.82 s)
>
> The job.log content is:
>
>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-ker=
nel GICv2 emulation\n'
>
> With this patch:
>
>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
>  (1/1)
>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>  PASS (55.10 s)

On the new aarch64 machine which is GICv3 I get the following:

 (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gi=
cv2: ERROR: Unexpected empty reply from server (0.47 s)

which it shouldn't have run. However:

  ./tests/venv/bin/avocado --show=3Dapp run -t device:gic3 tests/acceptance/
  Test Suite could not be create. No test references provided nor any other=
 arguments resolved into tests

Is this something that has regressed or am I doing it wrong?

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index 0055dc7cee..c743e231f4 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -182,10 +182,11 @@ def test_virt_tcg(self):
>          self.add_common_args()
>          self.launch_and_wait()
>=20=20
> -    def test_virt_kvm(self):
> +    def test_virt_kvm_gicv2(self):
>          """
>          :avocado: tags=3Daccel:kvm
>          :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Ddevice:gicv2
>          """
>          if not kvm_available(self.arch, self.qemu_bin):
>              self.cancel(KVM_NOT_AVAILABLE)
> @@ -195,6 +196,20 @@ def test_virt_kvm(self):
>          self.add_common_args()
>          self.launch_and_wait()
>=20=20
> +    def test_virt_kvm_gicv3(self):
> +        """
> +        :avocado: tags=3Daccel:kvm
> +        :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Ddevice:gicv3
> +        """
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-machine", "virt,gic-version=3D3")
> +        self.add_common_args()
> +        self.launch_and_wait()
> +
>=20=20
>  class BootLinuxPPC64(BootLinux):
>      """


--=20
Alex Benn=C3=A9e

