Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD03AC6A2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 10:57:34 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luAJh-0008Ed-9l
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 04:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luAHf-00062T-VN
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:55:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1luAHb-0005wn-Kz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 04:55:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id c84so5137817wme.5
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 01:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yCs3NROrZCWzC+VF7Ed7Zg+CSfK98h/BzXS8h1Jj/QU=;
 b=SmWBOMEjqZKoh6T5o8G2QaiMAXqEs03dVEIFUTVciNqjmmZTWyKSMMBaECQ7NNimM6
 mjnHnJsDkmXytn8jGqH/EcSCA2D+fbbXQmeYE9chusEMnXAfGpBje6LZPQDBmdL/w375
 FdpzZ/GOEqX9nBwk9KDuu+e8VEwuJf6A0+8JJLpRnNO54idwLuhoTrHmPkKYP0mYqS/2
 Hjj02TZfxg2ubeT0TN5EKy+esAkZtPTL8Vwsytyvkg6tokzYhK5P6De/aasXxftQeeAA
 POIacCGLqQbivekmPOuaKnXsMIIMuF9O1XfBVy/bjf6keS7CMNd8ui7fUUgJIAvRwJlz
 l7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yCs3NROrZCWzC+VF7Ed7Zg+CSfK98h/BzXS8h1Jj/QU=;
 b=bnaOz9RPlevryVfkVg6rxVjzbinI69s8NE2d+UcEpFwNb3dVy+1yYSeHUebIuTphJb
 Vea4z83Ff1ClPZcY6dIOcdvtaXrAnrmKqUd9IFPTpFuGb8d9Dw3/WuYa0hBU/VieVZYp
 YymGtIjCeECTqPd0iPLp+ftpbW/+z/n9UpKI6mL02wjEFW30LbsY+qEkkRAbC+2/WZTX
 XPk37mllo7LvDICPmjVBTxBQLaTH0CJfuJdJUBDMgg1Gj98WdzPK4B92kyxtaFDiwxG5
 gVgoOHa5S7o2nfx2XT0CUd9OLjQhAn52jwfYsR7rdaODhY79g84N5eqTjdU9PmTiPAjD
 XZ5A==
X-Gm-Message-State: AOAM530z0ypXE44bHVHffYu5L++3+KCQHPCrJJksyZuSmYEcovxi+ZGP
 sxQ6vnAswZGiLC30xv3yBrwlyA==
X-Google-Smtp-Source: ABdhPJy1iaXxai6Hx51lIotwF5rZjJLBc7BtWiAI4hGPo3ic5xutU6PRA6Srkqgz+SwhbQy8b//Xog==
X-Received: by 2002:a05:600c:3b23:: with SMTP id
 m35mr10450305wms.185.1624006522221; 
 Fri, 18 Jun 2021 01:55:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z10sm7026080wmp.39.2021.06.18.01.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 01:55:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89DD81FF7E;
 Fri, 18 Jun 2021 09:55:20 +0100 (BST)
References: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] i386: load kernel on xen using DMA
Date: Fri, 18 Jun 2021 09:54:14 +0100
In-reply-to: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
Message-ID: <87sg1feemf.fsf@linaro.org>
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
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> writes:

> Kernel on Xen is loaded via fw_cfg. Previously it used non-DMA version,
> which loaded the kernel (and initramfs) byte by byte. Change this
> to DMA, to load in bigger chunks.
> This change alone reduces load time of a (big) kernel+initramfs from
> ~10s down to below 1s.
>
> This change was suggested initially here:
> https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
> Apparently this alone is already enough to get massive speedup.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  hw/i386/pc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25a03..14e43d4da4 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -839,7 +839,8 @@ void xen_load_linux(PCMachineState *pcms)
>=20=20
>      assert(MACHINE(pcms)->kernel_filename !=3D NULL);
>=20=20
> -    fw_cfg =3D fw_cfg_init_io(FW_CFG_IO_BASE);
> +    fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
> +                                &address_space_memory);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
>      rom_set_fw(fw_cfg);

Gentle ping. The fix looks perfectly sane to me but I don't have any x86
Xen HW to test this one. Are the x86 maintainers happy to take this on?

FWIW:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

