Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2342FA530
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:52:29 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WpQ-0003HK-Ig
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1l1Wmp-0002Eo-8W; Mon, 18 Jan 2021 10:49:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1l1Wmm-0000kB-VB; Mon, 18 Jan 2021 10:49:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id a12so16895462wrv.8;
 Mon, 18 Jan 2021 07:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=bueLRhGnMFSaD5BV6OB46NiQT5MIKIabH3Mj8UAiQbk=;
 b=KC6DuXLelzuof+WkJU5Uk/ENpVF62l3gZLtnvRvejynd67fvkZSeF/FAfFXG3viYJb
 4K+QuzI2u3D6KNaklkyNpCQj+X6GGJ5Nr9mKjF9LWu9n78t1LJu6zJG5+RIeFHyDtQoF
 v6BTM4vjArWMELLWinc90nnnVzha4M6xRb5eAzgAtJCp8GTM+1L04GkW0thymWZGqdKR
 TooM0GKVkBkwG+QjUPOZIZkkPq0sLnm5i4U66lEBinBBZ8XJnGNE/2oZQbJUuIcEz9Dr
 lp/vQGAj8PwzmCfAg9euH7RwDrqk2yw/Qlrh3AfLD0W6NXCd4SjjrhThoXMqtlAYo20A
 i2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=bueLRhGnMFSaD5BV6OB46NiQT5MIKIabH3Mj8UAiQbk=;
 b=T57uX/TG8HgISyq9ECriAWWF8ILwv6V6CG7oYjkVn+U8Xi5DyhLrKKYCisy4VTPR1z
 BFHVC5IK38Fg5s+saWoQ07Seaf3K9vIUtJRzgbV7mfqTsfxIIgK00vMh2T8eceyvx6JR
 DVt2OVH3yRQEcnKID2dK7mi4Baq/et1SHdnftDG/2qS7amqH0Lo4jpM7GlMT0Zlvsvfc
 LrHslQCZjJgG/EJVC6RbF+6bs/3mh0oDgNXi1u/cpmAHb0bBcaJljmIovtqJduCC0CtI
 uDkZ6QvunFnfR7y59wwvhQvUo9FHLr7lwO/K4eDo6WlYG2mn5QjwuV/Lf4L7hfCjlCOI
 HRig==
X-Gm-Message-State: AOAM5336dnuKqc2Bb4BiXA8o3+qPkTF1NGt0toyO+y0kbwH0X6qI9E/w
 ejwKsNfcpyxWMdLhGrTfcJI=
X-Google-Smtp-Source: ABdhPJxiPC2OChaveXMqD0rIthafoYXmtdcNoEYh9vEMEVKUJD26R+IXQm6fjLZmNOUugiqBSkMK1A==
X-Received: by 2002:adf:f681:: with SMTP id v1mr97027wrp.133.1610984982739;
 Mon, 18 Jan 2021 07:49:42 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id r126sm12606693wma.48.2021.01.18.07.49.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 07:49:42 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roger Pau Monne'" <roger.pau@citrix.com>,
	<qemu-devel@nongnu.org>
References: <20210118153330.82324-1-roger.pau@citrix.com>
In-Reply-To: <20210118153330.82324-1-roger.pau@citrix.com>
Subject: RE: [PATCH] xen-block: fix reporting of discard feature
Date: Mon, 18 Jan 2021 15:49:41 -0000
Message-ID: <00d701d6edb1$894122f0$9bc368d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKr9v/Nt+LMBjUs9/3Ji6x60nJqgaiDdLPw
Content-Language: en-gb
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x433.google.com
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
Reply-To: paul@xen.org
Cc: 'Kevin Wolf' <kwolf@redhat.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, qemu-block@nongnu.org,
 'Arthur Borsboom' <arthurborsboom@gmail.com>, 'Max Reitz' <mreitz@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Roger Pau Monne <roger.pau@citrix.com>
> Sent: 18 January 2021 15:34
> To: qemu-devel@nongnu.org
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Arthur Borsboom =
<arthurborsboom@gmail.com>; Stefano
> Stabellini <sstabellini@kernel.org>; Anthony Perard =
<anthony.perard@citrix.com>; Paul Durrant
> <paul@xen.org>; Kevin Wolf <kwolf@redhat.com>; Max Reitz =
<mreitz@redhat.com>; xen-
> devel@lists.xenproject.org; qemu-block@nongnu.org
> Subject: [PATCH] xen-block: fix reporting of discard feature
>=20
> Linux blkfront expects both "discard-granularity" and
> "discard-alignment" present on xenbus in order to properly enable the
> feature, not exposing "discard-alignment" left some Linux blkfront
> versions with a broken discard setup. This has also been addressed in
> Linux with:
>=20
> =
https://lore.kernel.org/lkml/20210118151528.81668-1-roger.pau@citrix.com/=
T/#u
>=20
> Fix QEMU to report a "discard-alignment" of 0, in order for it to work
> with older Linux frontends.
>=20
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> ---
>  hw/block/xen-block.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 718d886e5c..246d9c23a2 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -253,6 +253,7 @@ static void xen_block_realize(XenDevice *xendev, =
Error **errp)
>          xen_device_backend_printf(xendev, "feature-discard", "%u", =
1);
>          xen_device_backend_printf(xendev, "discard-granularity", =
"%u",
>                                    conf->discard_granularity);
> +        xen_device_backend_printf(xendev, "discard-alignment", "%u", =
0);
>      }
>=20
>      xen_device_backend_printf(xendev, "feature-flush-cache", "%u", =
1);
> --
> 2.29.2



