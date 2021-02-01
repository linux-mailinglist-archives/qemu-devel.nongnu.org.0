Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C330AB67
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:32:44 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bBz-0000sf-DC
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6b99-0007Sn-Mr; Mon, 01 Feb 2021 10:29:48 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6b97-0007P3-53; Mon, 01 Feb 2021 10:29:47 -0500
Received: by mail-il1-x135.google.com with SMTP id g7so14851606iln.2;
 Mon, 01 Feb 2021 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GmdPeZb/oJT4aN44C5E62k5JoooyjcliKf9JKqs8+hM=;
 b=LoyPCsGTZJySEFcbIaxqOjnX8/Fqw0wdudMpr1ZYtUTePYWoghxLxrypHUNnXE9xgT
 8d7sUw6/VlkXoSXCp8l34cZ/PcXyf9ASGRfsaSGJgNaSv/W4AIUJoekZ339rPy3ddFWj
 /Wdt9SEznSFgBwE4gQ9wiYPhgaOkfFFag+g9oWkl7QUkBibFnR9E3azlCwAAeszK2iVi
 znz5L5cCHWrk+NjKL4CKiB3FTUUGJxqmnEHbFBKyxeVs/M0AvtLj3/cIu3jcC+6N92wq
 dkljVfMTe1wg52b10vUQCcZ5eDS/TYQwavWE+ivdEpnfA8obaur3djALtK1BfaMz9xvF
 fnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GmdPeZb/oJT4aN44C5E62k5JoooyjcliKf9JKqs8+hM=;
 b=EbrY6eumx6cHGujXxI4bQqAMOWm8pQyKiGNLz9GX/JY0cF93NBgF6yzAnqdnK2FHHN
 7fiC4yq+SMXYIGVOJWNQHeMGsXi5wrRHyw45NfMUZQS0PfEtV7DIwentjqp0WEFn4CSB
 jqOfsHIYir0edCr3rn0MWc84oVFgwcidmYwRBVMe/FN9DVVtpDzwAy8YGERnpnxwMAoi
 gvUUBCqNoxK9eJzCAOlbYsUnaKKa7iFYo6Nm51TZhQUOs1cEhzs6sGIhNJJ1DOS+zvME
 zNzolTvmmopKWYQxDrCbYDwuz2Ct4f/vCvZsiAh7y4mr7gzGCP4M3ixya65uHo3xUcra
 +IRw==
X-Gm-Message-State: AOAM53119RrSVdCJq+S9Z/w0irCwh/OdaMcSQ1xiSq+BoSLDAdfIWRE+
 AkRpHqlFycmrpwbYwjUevryBNYfoT6wLU4H40Uk=
X-Google-Smtp-Source: ABdhPJyAD0yzmq9zS4utSygcWQ54kJqTUBGfP+04+PhcGOTe97DcekVQRZKdT3ct+Vy+FXXQsGakNgl5hzG5PDVxuFo=
X-Received: by 2002:a92:4b06:: with SMTP id m6mr14280388ilg.177.1612193383077; 
 Mon, 01 Feb 2021 07:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-5-f4bug@amsat.org>
In-Reply-To: <20210131105918.228787-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 07:29:16 -0800
Message-ID: <CAKmqyKMDTs11Sm=Ho63SQEi_0XucQE0UfHB5V8fKidEem=LMHw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/arm/virt: Do not include 64-bit CPUs in 32-bit
 build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 31, 2021 at 3:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
> never been available on 32-bit build, see commit d14d42f19bf),
> to fix:
>
>   $ make check-qtest-arm
>   ...
>   Running test qtest-arm/device-introspect-test
>   missing object type 'cortex-a53-arm-cpu'
>   Broken pipe
>   ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from sig=
nal 6 (Aborted) (core dumped)
>   ERROR qtest-arm/device-introspect-test - too few tests run (expected 6,=
 got 5)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 399da734548..f0e9d7dd7d8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -199,9 +199,11 @@ static const int a15irqmap[] =3D {
>  static const char *valid_cpus[] =3D {
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +#endif /* TARGET_AARCH64 */
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> --
> 2.26.2
>
>

