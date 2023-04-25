Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1B6EDB45
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 07:44:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prBS5-0000u2-NR; Tue, 25 Apr 2023 01:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hoo.linux@gmail.com>)
 id 1prBS2-0000tk-9Z
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 01:42:54 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.hoo.linux@gmail.com>)
 id 1prBRz-0003Pg-UP
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 01:42:53 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-3ef33f12995so24212261cf.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682401370; x=1684993370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqOIjUQas8Rx1/5sAHd8nDe5JfxJxpYrGJ2aW1S7/QE=;
 b=FBq0wSQZHFhDmAXJRtxc/cteLPhGBUqYaKY4zqT63wqEVsVXk7rqp7CpgtfyIu6gSD
 udOyk8v0wGFB+CVpkRCnnPbGB2GvhQIQHDFAsUpiRagIFEXWAyK3EmDIBnYTVqnWm1o2
 GMQM78qvzSLYO4EdyjzmOI8lt7uEchuf6nrzBzZLjts+CfO3cHrpQCe3tKIxoHzUve9f
 NYQHVsjLsloE70BlqCuNtEWnDdhl+iDhyaLrtFOFbYu2a1UFWPKzIyCL3uKRFq59lxF1
 Mf6m6iiXNgXeFroxFVzWN+Q73d5hXPMX/csrrsJeBTEI5TFc+82Y1DNF21hM2ls92zAh
 cgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682401370; x=1684993370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqOIjUQas8Rx1/5sAHd8nDe5JfxJxpYrGJ2aW1S7/QE=;
 b=BQDoc+znfnmGichmiY2NVU90J+OHCIitPcMq4kFnmhkvZihbnOAjqbFRyjuu/vCgte
 sfgkEJFcm9fFib3mhBbv2txk/+r+0ctKUGH9rymfJoXGQzPNtoUp+fmCY9C4ZgisM66q
 ialkfkguMKrd+y8HFJaoJlweIIG4bLrY9UyhFDgkH/xHBm6GxGe6YOUHqBw69+Gwhv3X
 Ej5p//CDN2Ssqx9x7O4V0bLRLUNC5h6StxB+ehriKho3vR9t7sUMPVaYC/rKCHpDwxxH
 cBDM9aDb8QQwVALYCdFbUPivY1fi6bKaKouxXmmmSIQLhdPzGC5X1hSk4TIJYCWlcPWx
 Zhvg==
X-Gm-Message-State: AAQBX9ft+6Xlv0/HqbkHd1lrZzmmUiWCKSRbjK+iqqYjkrp6UCi5mCZQ
 5bQno2gUy0q19qSfffwqt370WqpPVAac76WAepo=
X-Google-Smtp-Source: AKy350YNhM9vliZvFdaghRH04BWbcCfd9ESSD8DXYLJEnsZ7/gtC/Wrot6ju3hxldLyczOrK6tmEF0ll4WNq9TVV65w=
X-Received: by 2002:ac8:5c8c:0:b0:3d7:960e:5387 with SMTP id
 r12-20020ac85c8c000000b003d7960e5387mr23905537qta.35.1682401370265; Mon, 24
 Apr 2023 22:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230424163401.23018-1-babu.moger@amd.com>
 <20230424163401.23018-2-babu.moger@amd.com>
In-Reply-To: <20230424163401.23018-2-babu.moger@amd.com>
From: Robert Hoo <robert.hoo.linux@gmail.com>
Date: Tue, 25 Apr 2023 13:42:39 +0800
Message-ID: <CA+wubQCGyXujRJvREaWX97KhT0sw8o9bf_+qa6C0gYkcbrqr9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] target/i386: allow versioned CPUs to specify new
 cache_info
To: Babu Moger <babu.moger@amd.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, weijiang.yang@intel.com,
 philmd@linaro.org, dwmw@amazon.co.uk, paul@xen.org, joao.m.martins@oracle.com, 
 qemu-devel@nongnu.org, mtosatti@redhat.com, kvm@vger.kernel.org, 
 mst@redhat.com, marcel.apfelbaum@gmail.com, yang.zhong@intel.com, 
 jing2.liu@intel.com, vkuznets@redhat.com, michael.roth@amd.com, 
 wei.huang2@amd.com, berrange@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=robert.hoo.linux@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Babu Moger <babu.moger@amd.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=8C 00:42=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Michael Roth <michael.roth@amd.com>
>
> New EPYC CPUs versions require small changes to their cache_info's.

Do you mean, for the real HW of EPYC CPU, each given model, e.g. Rome,
has HW version updates periodically?

> Because current QEMU x86 CPU definition does not support cache
> versions,

cache version --> versioned cache info

> we would have to declare a new CPU type for each such case.

My understanding was, for new HW CPU model, we should define a new
vCPU model mapping it. But if answer to my above question is yes, i.e.
new HW version of same CPU model, looks like it makes sense to some
extent.

> To avoid this duplication, the patch allows new cache_info pointers
> to be specified for a new CPU version.

"To avoid the dup work, the patch adds "cache_info" in X86CPUVersionDefinit=
ion"
>
> Co-developed-by: Wei Huang <wei.huang2@amd.com>
> Signed-off-by: Wei Huang <wei.huang2@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  target/i386/cpu.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6576287e5b..e3d9eaa307 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1598,6 +1598,7 @@ typedef struct X86CPUVersionDefinition {
>      const char *alias;
>      const char *note;
>      PropValue *props;
> +    const CPUCaches *const cache_info;
>  } X86CPUVersionDefinition;
>
>  /* Base definition for a CPU model */
> @@ -5192,6 +5193,32 @@ static void x86_cpu_apply_version_props(X86CPU *cp=
u, X86CPUModel *model)
>      assert(vdef->version =3D=3D version);
>  }
>
> +/* Apply properties for the CPU model version specified in model */

I don't think this comment matches below function.

> +static const CPUCaches *x86_cpu_get_version_cache_info(X86CPU *cpu,
> +                                                       X86CPUModel *mode=
l)

Will "version" --> "versioned" be better?

> +{
> +    const X86CPUVersionDefinition *vdef;
> +    X86CPUVersion version =3D x86_cpu_model_resolve_version(model);
> +    const CPUCaches *cache_info =3D model->cpudef->cache_info;
> +
> +    if (version =3D=3D CPU_VERSION_LEGACY) {
> +        return cache_info;
> +    }
> +
> +    for (vdef =3D x86_cpu_def_get_versions(model->cpudef); vdef->version=
; vdef++) {
> +        if (vdef->cache_info) {
> +            cache_info =3D vdef->cache_info;
> +        }

No need to assign "cache_info" when traverse the vdef list, but in
below version matching block, do the assignment. Or, do you mean to
have last valid cache info (during the traverse) returned? e.g. v2 has
valid cache info, but v3 doesn't.
> +
> +        if (vdef->version =3D=3D version) {
> +            break;
> +        }
> +    }
> +
> +    assert(vdef->version =3D=3D version);
> +    return cache_info;
> +}
> +

