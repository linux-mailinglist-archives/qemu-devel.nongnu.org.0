Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA313218B9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:31:26 +0100 (CET)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBJ7-0004Gb-07
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEBGG-0002Y8-Dc
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:28:28 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEBGC-0006GS-SW
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:28:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o82so13573853wme.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5FXerM3rfR0YIivOHTpZUvYzqCpVchbkj35IInIEuVE=;
 b=MC0m+WC9NmjFW5+z0fcaeUKIezRjPqqs/+QF82QRvqM39WotSb2KhfE+UgYNri23D3
 RfBEY3S62+DgXpOidAjpXKBYbCkEwnsquqQpALFB91dzCEc6/DefRcEhH8iEgjLlGXut
 iloACcDcE7+d4nUAW6MoaorkHBqZpTocW0wBZ1hmfPnBWxh8eqP4QRQyWtnt6xfEZJXQ
 vccvET5BPNkZp4PiDHS8025QT9sCy7IrjCJAqGx+pn8i49utJU5mfPbmUDxVguUNAvXq
 jeKs3USf8oIbKarvHq4NEhShVetsajJV+qVdicY+tuh7LdhOfcrzMxcgcG6CtT16pk16
 TYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5FXerM3rfR0YIivOHTpZUvYzqCpVchbkj35IInIEuVE=;
 b=YBeo50/4/uDB3UpCZnuldJ9nwLjlQzl6Y61xaZPjC3lJ1Br+jZa/R3Kfz+sdHW7q/k
 r/QmmFnEGOB2j8jQ7/67nSE8EQXSmuHU6RCPEpGbiN3ux8TSzS/7tYXl9U8NMDak+6Ye
 +D/18m/bsLYUSoiBVX3m5Du9YHWQDJN7L6Oc3rAV8weuWHBC8qQRz7+PguPAjZE92mAo
 Y8ydNeLkE+8yHlUaSuaASKHSNf6rehpkWm6iOPA6u9XikhHzkWOH3u5HMa96dHHvvh0R
 8KBBhfXujIn2MubVZgg/zJActBmaIQIlK2cxaQRZ9ChOOCUum6h2jWL1/S3VrrTlZySq
 /EWw==
X-Gm-Message-State: AOAM533soNPmfZdwXjz6XP34QTw8/g3jlwSrWP1ay05m4mHqHCN8puhl
 lGfGTnWQtOJa1TetA3miDkmSiw==
X-Google-Smtp-Source: ABdhPJwNUtw7vlEfSzmXjrevpOy3MgDwrz4PyJ58jwoBM1+u3/U9iLTkOxdkel4vwx5uhyS9fulB5Q==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr11075025wmj.177.1614000502030; 
 Mon, 22 Feb 2021 05:28:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b6sm14572566wrq.56.2021.02.22.05.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:28:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 76A761FF7E;
 Mon, 22 Feb 2021 13:28:19 +0000 (GMT)
References: <20210218172156.25520-1-cfontana@suse.de>
 <20210218172156.25520-7-cfontana@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v20 06/17] meson: add target_user_arch
Date: Mon, 22 Feb 2021 13:27:32 +0000
In-reply-to: <20210218172156.25520-7-cfontana@suse.de>
Message-ID: <87y2fg5j0s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from softmmu code.
>
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I suspect this needs an update since hexagon got merged under your feet
(which broke some of the CI):

  https://gitlab.com/stsquad/qemu/-/pipelines/259498090/failures

> ---
>  meson.build                   | 5 +++++
>  target/alpha/meson.build      | 3 +++
>  target/arm/meson.build        | 2 ++
>  target/cris/meson.build       | 3 +++
>  target/hppa/meson.build       | 3 +++
>  target/i386/meson.build       | 2 ++
>  target/m68k/meson.build       | 3 +++
>  target/microblaze/meson.build | 3 +++
>  target/mips/meson.build       | 3 +++
>  target/nios2/meson.build      | 3 +++
>  target/openrisc/meson.build   | 3 +++
>  target/ppc/meson.build        | 3 +++
>  target/riscv/meson.build      | 3 +++
>  target/s390x/meson.build      | 3 +++
>  target/sh4/meson.build        | 3 +++
>  target/sparc/meson.build      | 3 +++
>  target/tilegx/meson.build     | 3 +++
>  target/tricore/meson.build    | 3 +++
>  target/xtensa/meson.build     | 3 +++
>  19 files changed, 57 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index a923f249d8..1a355b8c1e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1734,6 +1734,7 @@ modules =3D {}
>  hw_arch =3D {}
>  target_arch =3D {}
>  target_softmmu_arch =3D {}
> +target_user_arch =3D {}
>=20=20
>  ###############
>  # Trace files #
> @@ -2131,6 +2132,10 @@ foreach target : target_dirs
>      abi =3D config_target['TARGET_ABI_DIR']
>      target_type=3D'user'
>      qemu_target_name =3D 'qemu-' + target_name
> +    t =3D target_user_arch[arch].apply(config_target, strict: false)
> +    arch_srcs +=3D t.sources()
> +    arch_deps +=3D t.dependencies()
> +
>      if 'CONFIG_LINUX_USER' in config_target
>        base_dir =3D 'linux-user'
>        target_inc +=3D include_directories('linux-user/host/' / config_ho=
st['ARCH'])
> diff --git a/target/alpha/meson.build b/target/alpha/meson.build
> index 1aec55abb4..1b0555d3ee 100644
> --- a/target/alpha/meson.build
> +++ b/target/alpha/meson.build
> @@ -14,5 +14,8 @@ alpha_ss.add(files(
>  alpha_softmmu_ss =3D ss.source_set()
>  alpha_softmmu_ss.add(files('machine.c'))
>=20=20
> +alpha_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'alpha': alpha_ss}
>  target_softmmu_arch +=3D {'alpha': alpha_softmmu_ss}
> +target_user_arch +=3D {'alpha': alpha_user_ss}
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 15b936c101..a96af5ee1b 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -53,6 +53,8 @@ arm_softmmu_ss.add(files(
>    'monitor.c',
>    'psci.c',
>  ))
> +arm_user_ss =3D ss.source_set()
>=20=20
>  target_arch +=3D {'arm': arm_ss}
>  target_softmmu_arch +=3D {'arm': arm_softmmu_ss}
> +target_user_arch +=3D {'arm': arm_user_ss}
> diff --git a/target/cris/meson.build b/target/cris/meson.build
> index 67c3793c85..7fd81e0348 100644
> --- a/target/cris/meson.build
> +++ b/target/cris/meson.build
> @@ -10,5 +10,8 @@ cris_ss.add(files(
>  cris_softmmu_ss =3D ss.source_set()
>  cris_softmmu_ss.add(files('mmu.c', 'machine.c'))
>=20=20
> +cris_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'cris': cris_ss}
>  target_softmmu_arch +=3D {'cris': cris_softmmu_ss}
> +target_user_arch +=3D {'cris': cris_user_ss}
> diff --git a/target/hppa/meson.build b/target/hppa/meson.build
> index 8a7ff82efc..85ad314671 100644
> --- a/target/hppa/meson.build
> +++ b/target/hppa/meson.build
> @@ -15,5 +15,8 @@ hppa_ss.add(files(
>  hppa_softmmu_ss =3D ss.source_set()
>  hppa_softmmu_ss.add(files('machine.c'))
>=20=20
> +hppa_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'hppa': hppa_ss}
>  target_softmmu_arch +=3D {'hppa': hppa_softmmu_ss}
> +target_user_arch +=3D {'hppa': hppa_user_ss}
> diff --git a/target/i386/meson.build b/target/i386/meson.build
> index fd24479590..cac26a4581 100644
> --- a/target/i386/meson.build
> +++ b/target/i386/meson.build
> @@ -19,6 +19,7 @@ i386_softmmu_ss.add(files(
>    'machine.c',
>    'monitor.c',
>  ))
> +i386_user_ss =3D ss.source_set()
>=20=20
>  subdir('kvm')
>  subdir('hax')
> @@ -28,3 +29,4 @@ subdir('tcg')
>=20=20
>  target_arch +=3D {'i386': i386_ss}
>  target_softmmu_arch +=3D {'i386': i386_softmmu_ss}
> +target_user_arch +=3D {'i386': i386_user_ss}
> diff --git a/target/m68k/meson.build b/target/m68k/meson.build
> index 05cd9fbd1e..b507682684 100644
> --- a/target/m68k/meson.build
> +++ b/target/m68k/meson.build
> @@ -13,5 +13,8 @@ m68k_ss.add(files(
>  m68k_softmmu_ss =3D ss.source_set()
>  m68k_softmmu_ss.add(files('monitor.c'))
>=20=20
> +m68k_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'m68k': m68k_ss}
>  target_softmmu_arch +=3D {'m68k': m68k_softmmu_ss}
> +target_user_arch +=3D {'m68k': m68k_user_ss}
> diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
> index 05ee0ec163..52d8fcb0a3 100644
> --- a/target/microblaze/meson.build
> +++ b/target/microblaze/meson.build
> @@ -16,5 +16,8 @@ microblaze_softmmu_ss.add(files(
>    'machine.c',
>  ))
>=20=20
> +microblaze_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'microblaze': microblaze_ss}
>  target_softmmu_arch +=3D {'microblaze': microblaze_softmmu_ss}
> +target_user_arch +=3D {'microblaze': microblaze_user_ss}
> diff --git a/target/mips/meson.build b/target/mips/meson.build
> index 9741545440..30843c1521 100644
> --- a/target/mips/meson.build
> +++ b/target/mips/meson.build
> @@ -36,5 +36,8 @@ mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
>    'cp0_helper.c',
>  ))
>=20=20
> +mips_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'mips': mips_ss}
>  target_softmmu_arch +=3D {'mips': mips_softmmu_ss}
> +target_user_arch +=3D {'mips': mips_user_ss}
> diff --git a/target/nios2/meson.build b/target/nios2/meson.build
> index e643917db1..00367056fa 100644
> --- a/target/nios2/meson.build
> +++ b/target/nios2/meson.build
> @@ -11,5 +11,8 @@ nios2_ss.add(files(
>  nios2_softmmu_ss =3D ss.source_set()
>  nios2_softmmu_ss.add(files('monitor.c'))
>=20=20
> +nios2_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'nios2': nios2_ss}
>  target_softmmu_arch +=3D {'nios2': nios2_softmmu_ss}
> +target_user_arch +=3D {'nios2': nios2_user_ss}
> diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
> index 9774a58306..794a9e8161 100644
> --- a/target/openrisc/meson.build
> +++ b/target/openrisc/meson.build
> @@ -19,5 +19,8 @@ openrisc_ss.add(files(
>  openrisc_softmmu_ss =3D ss.source_set()
>  openrisc_softmmu_ss.add(files('machine.c'))
>=20=20
> +openrisc_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'openrisc': openrisc_ss}
>  target_softmmu_arch +=3D {'openrisc': openrisc_softmmu_ss}
> +target_user_arch +=3D {'openrisc': openrisc_user_ss}
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index bbfef90e08..cdd69bf989 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -33,5 +33,8 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
>    'mmu-radix64.c',
>  ))
>=20=20
> +ppc_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'ppc': ppc_ss}
>  target_softmmu_arch +=3D {'ppc': ppc_softmmu_ss}
> +target_user_arch +=3D {'ppc': ppc_user_ss}
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 14a5c62dac..a55851336b 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -31,5 +31,8 @@ riscv_softmmu_ss.add(files(
>    'machine.c'
>  ))
>=20=20
> +riscv_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'riscv': riscv_ss}
>  target_softmmu_arch +=3D {'riscv': riscv_softmmu_ss}
> +target_user_arch +=3D {'riscv': riscv_user_ss}
> diff --git a/target/s390x/meson.build b/target/s390x/meson.build
> index c42eadb7d2..1219f64112 100644
> --- a/target/s390x/meson.build
> +++ b/target/s390x/meson.build
> @@ -58,5 +58,8 @@ if host_machine.cpu_family() =3D=3D 's390x' and cc.has_=
link_argument('-Wl,--s390-pgs
>                         if_true: declare_dependency(link_args: ['-Wl,--s3=
90-pgste']))
>  endif
>=20=20
> +s390x_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'s390x': s390x_ss}
>  target_softmmu_arch +=3D {'s390x': s390x_softmmu_ss}
> +target_user_arch +=3D {'s390x': s390x_user_ss}
> diff --git a/target/sh4/meson.build b/target/sh4/meson.build
> index 56a57576da..5a05729bc1 100644
> --- a/target/sh4/meson.build
> +++ b/target/sh4/meson.build
> @@ -10,5 +10,8 @@ sh4_ss.add(files(
>  sh4_softmmu_ss =3D ss.source_set()
>  sh4_softmmu_ss.add(files('monitor.c'))
>=20=20
> +sh4_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'sh4': sh4_ss}
>  target_softmmu_arch +=3D {'sh4': sh4_softmmu_ss}
> +target_user_arch +=3D {'sh4': sh4_user_ss}
> diff --git a/target/sparc/meson.build b/target/sparc/meson.build
> index a3638b9503..cc77a77064 100644
> --- a/target/sparc/meson.build
> +++ b/target/sparc/meson.build
> @@ -19,5 +19,8 @@ sparc_softmmu_ss.add(files(
>    'monitor.c',
>  ))
>=20=20
> +sparc_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'sparc': sparc_ss}
>  target_softmmu_arch +=3D {'sparc': sparc_softmmu_ss}
> +target_user_arch +=3D {'sparc': sparc_user_ss}
> diff --git a/target/tilegx/meson.build b/target/tilegx/meson.build
> index 678590439c..23dab8b9a1 100644
> --- a/target/tilegx/meson.build
> +++ b/target/tilegx/meson.build
> @@ -9,5 +9,8 @@ tilegx_ss.add(zlib)
>=20=20
>  tilegx_softmmu_ss =3D ss.source_set()
>=20=20
> +tilegx_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'tilegx': tilegx_ss}
>  target_softmmu_arch +=3D {'tilegx': tilegx_softmmu_ss}
> +target_user_arch +=3D {'tilegx': tilegx_user_ss}
> diff --git a/target/tricore/meson.build b/target/tricore/meson.build
> index 0ccc829517..7086ae1a22 100644
> --- a/target/tricore/meson.build
> +++ b/target/tricore/meson.build
> @@ -11,5 +11,8 @@ tricore_ss.add(zlib)
>=20=20
>  tricore_softmmu_ss =3D ss.source_set()
>=20=20
> +tricore_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'tricore': tricore_ss}
>  target_softmmu_arch +=3D {'tricore': tricore_softmmu_ss}
> +target_user_arch +=3D {'tricore': tricore_user_ss}
> diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
> index dd750a977e..949b2c8334 100644
> --- a/target/xtensa/meson.build
> +++ b/target/xtensa/meson.build
> @@ -28,5 +28,8 @@ xtensa_softmmu_ss.add(files(
>    'xtensa-semi.c',
>  ))
>=20=20
> +xtensa_user_ss =3D ss.source_set()
> +
>  target_arch +=3D {'xtensa': xtensa_ss}
>  target_softmmu_arch +=3D {'xtensa': xtensa_softmmu_ss}
> +target_user_arch +=3D {'xtensa': xtensa_user_ss}


--=20
Alex Benn=C3=A9e

