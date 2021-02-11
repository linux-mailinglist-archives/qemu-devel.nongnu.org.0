Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99628318826
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:29:41 +0100 (CET)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9EC-0001rC-ME
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA9Ad-0006NB-QE
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:25:59 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA9Ac-0002eG-85
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:25:59 -0500
Received: by mail-ej1-x636.google.com with SMTP id lg21so9252520ejb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1UqKvY14tw/pJwQYl/W9YIW+5QdlwUkxA8hWF4emCuA=;
 b=AtukOBvgNNQMfol1fqQ0BcgrCL5knBxP6PfFiPWSkBpV0EQ8eO8FmlU2fQPnIsKH/u
 p1QXjCDFYf33lMMS/Sm8sBnj7jCFhtjEIW1FfcdJ4nAOK6ht8gUusLXyRCXcm02hD7DH
 XDuA2AiL1bfmGoobQ4IcU482sKXzM/Gb2kkZArUYNaK1H3sIc4bfRBJe2dktWEUFfFs3
 /GZmaYdmDdN9m5VS+OEHdNJVSrXMbkUIvRYQYi9g+8IrHqH5/qNfBeEK8quZZZZ2sEwb
 TjtgG7gFaVTbS7dyJpwLyKDUiNLdOlpfQIlQDScao1HO0NtsAL76WCSPjQw0bhodoI5e
 kj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1UqKvY14tw/pJwQYl/W9YIW+5QdlwUkxA8hWF4emCuA=;
 b=gRmVWjuc1Q0Z/WLRxa8KysoEPd0ze5xgJvfAEfwgITQ/auC0yNdtdeg5FWJHGLcCpj
 UrWL/kGL7rkIBLF/KP1pz+qIYIpQ45wC2h6d9ygthG+EkF4FkOToNkgqobcXv6o+i2nF
 DOn3AddO/zSEByvjVZ3Fd2OJaFpEKmzhXwHeI+MHf0rotKaAmj0HBhWWGLLpAu7V3qlz
 jB+FPuGzBohSsWpk8oo4AWrTe3zBue9gztjxOHXXbS5vBmC/8uIJBtIVAEkjB+WJ0DDL
 uMOQZgyD5hNWUBAAhusL7aDAuyobzcedUEBYtZLJ1KqeRGbfuVD84n2OILSinxxJoNIN
 ILxA==
X-Gm-Message-State: AOAM533ArtQtaJkb+00cNrVV5a1yDiQrKdFBmioJl47njpF8dRsarGnw
 Bgy+95cYfYe8OkxZEzSLTqRLz9DHQSiBAKUaSQc=
X-Google-Smtp-Source: ABdhPJyiqOqO2IFvRuZwTvSZwFGuURWPwfWPui6t2Qq26/DbHJ+7ISfmImJfEp1c98oUFagK2ZFfo+aroOQY1/7ExSs=
X-Received: by 2002:a17:906:a00e:: with SMTP id
 p14mr7864471ejy.532.1613039156813; 
 Thu, 11 Feb 2021 02:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-22-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-22-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Feb 2021 14:25:45 +0400
Message-ID: <CAJ+F1C+v-ca5Bbd9phNZzkc1WN4HcCgvTJ2GA0OH5QCr2OAhKg@mail.gmail.com>
Subject: Re: [PATCH 21/22] Acceptance Tests: introduce CPU hotplug test
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 9:51 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Even though there are qtest based tests for hotplugging CPUs (from
> which this test took some inspiration from), this one adds checks
> from a Linux guest point of view.
>
> It should also serve as an example for tests that follow a similar
> pattern and need to interact with QEMU (via qmp) and with the Linux
> guest via SSH.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/acceptance/hotplug_cpu.py | 38 +++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 tests/acceptance/hotplug_cpu.py
>
> diff --git a/tests/acceptance/hotplug_cpu.py b/tests/acceptance/hotplug_c=
pu.py
> new file mode 100644
> index 0000000000..a22b264b4b
> --- /dev/null
> +++ b/tests/acceptance/hotplug_cpu.py
> @@ -0,0 +1,38 @@
> +# Functional test that hotplugs a CPU and checks it on a Linux guest
> +#
> +# Copyright (c) 2021 Red Hat, Inc.
> +#
> +# Author:
> +#  Cleber Rosa <crosa@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import LinuxTest
> +
> +
> +class HotPlugCPU(LinuxTest):
> +
> +    def test(self):
> +        """
> +        :avocado: tags=3Darch:x86_64
> +        :avocado: tags=3Dmachine:q35
> +        :avocado: tags=3Daccel:kvm
> +        """
> +        self.require_accelerator('kvm')
> +        self.vm.add_args('-accel', 'kvm')
> +        self.vm.add_args('-cpu', 'Haswell')
> +        self.vm.add_args('-smp', '1,sockets=3D1,cores=3D2,threads=3D1,ma=
xcpus=3D2')
> +        self.launch_and_wait()
> +
> +        self.ssh_connect('root', self.ssh_key)
> +        self.ssh_command('test -e /sys/devices/system/cpu/cpu0')
> +        with self.assertRaises(AssertionError):
> +            self.ssh_command('test -e /sys/devices/system/cpu/cpu1')
> +
> +        self.vm.command('device_add',
> +                        driver=3D'Haswell-x86_64-cpu',
> +                        socket_id=3D0,
> +                        core_id=3D1,
> +                        thread_id=3D0)
> +        self.ssh_command('test -e /sys/devices/system/cpu/cpu1')
> --
> 2.25.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

