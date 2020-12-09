Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58C2D4278
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:54:12 +0100 (CET)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyyx-00067L-CI
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmyxS-0005V6-2p
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:52:38 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmyxO-0004d4-95
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:52:37 -0500
Received: by mail-wr1-x444.google.com with SMTP id i9so1624947wrc.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8j9/xmKQhRU2ZjKQdDEa6eArKRFwxVeXxzSEXfQAnKM=;
 b=iwUgNDjPk10rLl6dtWLV6CRu4v+gnhIE5tOSf7U55lmc8Rct4nSpwA1CFYqQddQl3M
 A4rl6l2hjJqcje0fQlQbbb950KRH+wYDtMRqSmmOPAzGVmM8RGOuE2obt1K7lbh7S/TG
 nMcYeD41Nl8QtLlCQSG/RjukeyWMRje6WgEywiOC0PyfqJT9KlfblTVT9bT+oTOIBOUc
 2lD7P1E3L2oBjQugYIHLFnSzyAUw4iX4eEmXh7p/L1065D4bJN1UoM/lfeEGyaMImRgM
 gpvGIM3gFk0pqAxa7XQP3HxKE1CJPMWJPx43dEJkyyUR42A9PoLclo+U8L9s/T6gwaNF
 Ddpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8j9/xmKQhRU2ZjKQdDEa6eArKRFwxVeXxzSEXfQAnKM=;
 b=d6syrgugUmbfcDwgEpiSUZ6EXWu7k6+GpUoIkUou5YqDkXdUiQWLLFPZq7ERdpqBXF
 uxwVTkVhfRNxq13L/FuE/zRAttf0bsrJwOG23DNEdmU3tmam0WxgL6WOllhlaSt5rsDK
 NTmaWIL5eW1Oi5/uxDfluTiNW0ExR+OwhN+4YBD2mWt4caYxdHYbFy0eQFIaHmUCfxDe
 get6gRkvrk+NhP1xc9QTx9U7wqdKlXMhJbXy6WjDQ3/prBpi44oDdny9UBUkbjCyqlQb
 aKoFXJDttIPdbPIFKXKbf2wONjFmk0DI5IsLi5ZCOBpf0VvvLL/hIyjcF/oyZurpUK/6
 SJ/w==
X-Gm-Message-State: AOAM532iN1kraRTAgtcYsFeRwBs3GsyBMiEetWtyAMh7+WzA3B0TDH0f
 1PxyjvG5ncTdjzSz6paPdlUtog==
X-Google-Smtp-Source: ABdhPJxqwOQUrL4pae8A1F7Mj2+ypfJxnyoWPdmdiXDG5r5AM7uC5C2xS/kK3+FiMKEyU26jrI4QqQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr2553345wrp.201.1607518349825; 
 Wed, 09 Dec 2020 04:52:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v4sm3302562wru.12.2020.12.09.04.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 04:52:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDA7F1FF7E;
 Wed,  9 Dec 2020 12:52:27 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-27-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 26/32] accel: extend AccelState and AccelClass to
 user-mode
Date: Wed, 09 Dec 2020 12:51:32 +0000
In-reply-to: <20201208194839.31305-27-cfontana@suse.de>
Message-ID: <87v9dbcfas.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  MAINTAINERS                        |  2 +-
>  accel/accel-common.c               | 50 ++++++++++++++++++++++++++++++
>  accel/{accel.c =3D> accel-softmmu.c} | 27 ++--------------
>  accel/accel-user.c                 | 24 ++++++++++++++
>  accel/meson.build                  |  4 ++-
>  accel/qtest/qtest.c                |  2 +-
>  accel/tcg/meson.build              |  2 +-
>  accel/tcg/tcg-all.c                | 13 ++++++--
>  accel/xen/xen-all.c                |  2 +-
>  bsd-user/main.c                    |  6 +++-
>  include/hw/boards.h                |  2 +-
>  include/{sysemu =3D> qemu}/accel.h   | 14 +++++----
>  include/sysemu/hvf.h               |  2 +-
>  include/sysemu/kvm.h               |  2 +-
>  include/sysemu/kvm_int.h           |  2 +-
>  linux-user/main.c                  |  6 +++-
>  softmmu/memory.c                   |  2 +-
>  softmmu/qtest.c                    |  2 +-
>  softmmu/vl.c                       |  2 +-
>  target/i386/hax/hax-all.c          |  2 +-
>  target/i386/hvf/hvf-i386.h         |  2 +-
>  target/i386/hvf/hvf.c              |  2 +-
>  target/i386/hvf/x86_task.c         |  2 +-
>  target/i386/whpx/whpx-all.c        |  2 +-
>  24 files changed, 124 insertions(+), 52 deletions(-)
>  create mode 100644 accel/accel-common.c
>  rename accel/{accel.c =3D> accel-softmmu.c} (75%)
>  create mode 100644 accel/accel-user.c
>  rename include/{sysemu =3D> qemu}/accel.h (95%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d876f504a6..6235dd3a9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -434,7 +434,7 @@ Overall
>  M: Richard Henderson <richard.henderson@linaro.org>
>  R: Paolo Bonzini <pbonzini@redhat.com>
>  S: Maintained
> -F: include/sysemu/accel.h
> +F: include/qemu/accel.h
>  F: accel/accel.c
>  F: accel/Makefile.objs
>  F: accel/stubs/Makefile.objs
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> new file mode 100644
> index 0000000000..ddec8cb5ae
> --- /dev/null
> +++ b/accel/accel-common.c
> @@ -0,0 +1,50 @@
> +/*
> + * QEMU accel class, components common to system emulation and user mode
> + *
> + * Copyright (c) 2003-2008 Fabrice Bellard
> + * Copyright (c) 2014 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/accel.h"
> +
> +static const TypeInfo accel_type =3D {
> +    .name =3D TYPE_ACCEL,
> +    .parent =3D TYPE_OBJECT,
> +    .class_size =3D sizeof(AccelClass),
> +    .instance_size =3D sizeof(AccelState),
> +};
> +
> +/* Lookup AccelClass from opt_name. Returns NULL if not found */
> +AccelClass *accel_find(const char *opt_name)
> +{
> +    char *class_name =3D g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_nam=
e);
> +    AccelClass *ac =3D ACCEL_CLASS(object_class_by_name(class_name));
> +    g_free(class_name);
> +    return ac;
> +}
> +
> +static void register_accel_types(void)
> +{
> +    type_register_static(&accel_type);
> +}
> +
> +type_init(register_accel_types);
> diff --git a/accel/accel.c b/accel/accel-softmmu.c
> similarity index 75%
> rename from accel/accel.c
> rename to accel/accel-softmmu.c
> index cb555e3b06..f89da8f9d1 100644
> --- a/accel/accel.c
> +++ b/accel/accel-softmmu.c
> @@ -1,5 +1,5 @@
>  /*
> - * QEMU System Emulator, accelerator interfaces
> + * QEMU accel class, system emulation components
>   *
>   * Copyright (c) 2003-2008 Fabrice Bellard
>   * Copyright (c) 2014 Red Hat Inc.
> @@ -24,28 +24,12 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> -#include "sysemu/accel.h"
> +#include "qemu/accel.h"
>  #include "hw/boards.h"
>  #include "sysemu/arch_init.h"
>  #include "sysemu/sysemu.h"
>  #include "qom/object.h"
>=20=20
> -static const TypeInfo accel_type =3D {
> -    .name =3D TYPE_ACCEL,
> -    .parent =3D TYPE_OBJECT,
> -    .class_size =3D sizeof(AccelClass),
> -    .instance_size =3D sizeof(AccelState),
> -};
> -
> -/* Lookup AccelClass from opt_name. Returns NULL if not found */
> -AccelClass *accel_find(const char *opt_name)
> -{
> -    char *class_name =3D g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_nam=
e);
> -    AccelClass *ac =3D ACCEL_CLASS(object_class_by_name(class_name));
> -    g_free(class_name);
> -    return ac;
> -}
> -
>  int accel_init_machine(AccelState *accel, MachineState *ms)
>  {
>      AccelClass *acc =3D ACCEL_GET_CLASS(accel);
> @@ -76,10 +60,3 @@ void accel_setup_post(MachineState *ms)
>          acc->setup_post(ms, accel);
>      }
>  }
> -
> -static void register_accel_types(void)
> -{
> -    type_register_static(&accel_type);
> -}
> -
> -type_init(register_accel_types);
> diff --git a/accel/accel-user.c b/accel/accel-user.c
> new file mode 100644
> index 0000000000..26bdda6236
> --- /dev/null
> +++ b/accel/accel-user.c
> @@ -0,0 +1,24 @@
> +/*
> + * QEMU accel class, user-mode components
> + *
> + * Copyright 2020 SUSE LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/accel.h"
> +
> +AccelState *current_accel(void)
> +{
> +    static AccelState *accel;
> +
> +    if (!accel) {
> +        AccelClass *ac =3D accel_find("tcg");
> +
> +        g_assert(ac !=3D NULL);
> +        accel =3D ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
> +    }
> +    return accel;
> +}
> diff --git a/accel/meson.build b/accel/meson.build
> index b26cca227a..b44ba30c86 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,4 +1,6 @@
> -softmmu_ss.add(files('accel.c'))
> +specific_ss.add(files('accel-common.c'))
> +softmmu_ss.add(files('accel-softmmu.c'))
> +user_ss.add(files('accel-user.c'))
>=20=20
>  subdir('qtest')
>  subdir('kvm')
> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
> index b282cea5cf..b4e731cb2b 100644
> --- a/accel/qtest/qtest.c
> +++ b/accel/qtest/qtest.c
> @@ -17,7 +17,7 @@
>  #include "qemu/module.h"
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
> -#include "sysemu/accel.h"
> +#include "qemu/accel.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/cpu-timers.h"
> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
> index f39aab0a0c..424d9bb1fc 100644
> --- a/accel/tcg/meson.build
> +++ b/accel/tcg/meson.build
> @@ -1,5 +1,6 @@
>  tcg_ss =3D ss.source_set()
>  tcg_ss.add(files(
> +  'tcg-all.c',
>    'cpu-exec-common.c',
>    'cpu-exec.c',
>    'tcg-runtime-gvec.c',
> @@ -13,7 +14,6 @@ tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plug=
in-gen.c'), libdl])
>  specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
>=20=20
>  specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
> -  'tcg-all.c',
>    'cputlb.c',
>    'tcg-cpus.c',
>    'tcg-cpus-mttcg.c',
> diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
> index 1ac0b76515..7125d0cc29 100644
> --- a/accel/tcg/tcg-all.c
> +++ b/accel/tcg/tcg-all.c
> @@ -30,9 +30,12 @@
>  #include "tcg/tcg.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> -#include "hw/boards.h"
> +#include "qemu/accel.h"
>  #include "qapi/qapi-builtin-visit.h"
> +
> +#ifndef CONFIG_USER_ONLY
>  #include "tcg-cpus.h"
> +#endif /* CONFIG_USER_ONLY */
>=20=20
>  struct TCGState {
>      AccelState parent_obj;
> @@ -106,8 +109,12 @@ static int tcg_init(MachineState *ms)
>      mttcg_enabled =3D s->mttcg_enabled;
>=20=20
>      /*
> -     * Initialize TCG regions
> +     * Initialize TCG regions only for softmmu.
> +     *
> +     * This needs to be done later for user mode, because the prologue
> +     * generation needs to be delayed so that GUEST_BASE is already set.
>       */
> +#ifndef CONFIG_USER_ONLY
>      tcg_region_init();

This implies we broke bisectability with:

  accel/tcg: split tcg_start_vcpu_thread

<snip>

Otherwise with that fixed:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

