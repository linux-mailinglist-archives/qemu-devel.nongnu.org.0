Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646C76A2984
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 13:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVtWV-0003nQ-9n; Sat, 25 Feb 2023 07:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1pVtWR-0003n7-Qh
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 07:19:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1pVtWP-0000Y0-2Z
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 07:19:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id c18so1435464wmr.3
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 04:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOY6ePTJuM993A9kMwXHTDq2P6HI97416IvhxTqk2ck=;
 b=r1sDmyHyGEcvTMWKwqDxvAdaNY2HXFPPHlm/YMAmBbgGAmy5v5r+HEadQljWKgyylk
 OM7WsZVLI428bt/Ir0Lw21JExBBFoKQiqHtxl0JWh1Q97MqicHkmiWq3COi8A61LRD57
 7eaAKEQD8GcxgrQae1IrDO3gIyuYscNJlqYjMjIAhAMZo8ZPfTehEshYF7r2+xkKswsJ
 wzX3kd4J0rPwZr4YLdASPt+nxUHaGZvMmNZ298Ufk55loCNXPgJC7ErsN+vlitw63MYM
 H6ivXjj6TRtQ5qViUsbezn6GfE6H4TqNXa3ovBGs14c+flB1Skvx/AoHnHuI0tWpE77z
 uX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOY6ePTJuM993A9kMwXHTDq2P6HI97416IvhxTqk2ck=;
 b=WKQT2CBqqv09n16CIYfgf96ZrwhZLayKYRpZxOLJ4K8LCUcPDXpCfd06ipXh2Pg7YA
 NIcia1f7fzfSS1sNEnN7ZEBuLUMx4AfuvYx4Oz9BdWADHMff9qWzCIJ4+ATBthLGnNtq
 e7S0x3jm9O6GnK07piuC4777AQhY0cS066PJUR4ADRcKHvrvXg7JR+J2X2COrUeeDgAm
 CqY5jVSWt/ugJkI8lACudX3HBE4BQgn36vGD1Nnyo7bqZVk/ZTIXTTe3gtsGVrEiBPyT
 Si2dElziKLl6htuzn7ZK8+DbmlZHTNNAyv2ZyDktl7zmZD7T/E/EDgFbHH+LtGDp1pV7
 UOHg==
X-Gm-Message-State: AO0yUKWXipT5w9YXLYPcCeFmow1EEdQMf/pOLR/NQlJ0swBqE/BCwSe0
 tNOrcFgmDC+3EpCC09qbu6ifoAjhm8AEUfeJMe/dUQ==
X-Google-Smtp-Source: AK7set+apyEpkx1tKLyM6GAK+vH9E/1yQJ/nTv9BR5Uk38aSMvgkkmv2xFrMRNzjqoZCX2pdCl4rlHK6xNMpEuevrN8=
X-Received: by 2002:a05:600c:1d83:b0:3e2:2107:b7f2 with SMTP id
 p3-20020a05600c1d8300b003e22107b7f2mr2138815wms.6.1677327562255; Sat, 25 Feb
 2023 04:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20230223125747.254914-1-jusual@redhat.com>
In-Reply-To: <20230223125747.254914-1-jusual@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 25 Feb 2023 17:49:11 +0530
Message-ID: <CAARzgwxFSW+Gsa=ACYqKcCv0ypo+g=yJFB0kmTqChn=48mEiLQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/smbios: fix field corruption in type 4 table
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::334;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x334.google.com
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

On Thu, Feb 23, 2023 at 6:27=E2=80=AFPM Julia Suvorova <jusual@redhat.com> =
wrote:
>
> Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
> strings which follow immediately after the struct fields have been
> overwritten by unconditional filling of later fields such as core_count2.
> Make these fields dependent on the SMBIOS version.
>
> Fixes: 05e27d74c7 ("hw/smbios: add core_count2 to smbios table type 4")
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2169904
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
> v2:
>     * add fixes tag
>     * check tbl_len instead of ep_type
>
>  hw/smbios/smbios.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 4869566cf5..d2007e70fb 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -750,14 +750,16 @@ static void smbios_build_type_4_table(MachineState =
*ms, unsigned instance)
>      t->core_count =3D (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
>      t->core_enabled =3D t->core_count;
>
> -    t->core_count2 =3D t->core_enabled2 =3D cpu_to_le16(ms->smp.cores);
> -
>      t->thread_count =3D (ms->smp.threads > 255) ? 0xFF : ms->smp.threads=
;
> -    t->thread_count2 =3D cpu_to_le16(ms->smp.threads);
>
>      t->processor_characteristics =3D cpu_to_le16(0x02); /* Unknown */
>      t->processor_family2 =3D cpu_to_le16(0x01); /* Other */
>
> +    if (tbl_len =3D=3D SMBIOS_TYPE_4_LEN_V30) {
> +        t->core_count2 =3D t->core_enabled2 =3D cpu_to_le16(ms->smp.core=
s);
> +        t->thread_count2 =3D cpu_to_le16(ms->smp.threads);
> +    }
> +
>      SMBIOS_BUILD_TABLE_POST;
>      smbios_type4_count++;
>  }
> --
> 2.38.1
>

