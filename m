Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B26056AF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 07:19:27 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNxl-0006CJ-MP
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 01:19:25 -0400
Received: from [::1] (port=41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNxl-00062b-Ha
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 01:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1olNvw-0001rH-2M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 01:17:32 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1olNvu-0005oL-IT
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 01:17:31 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1321a1e94b3so23327996fac.1
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 22:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hG1GymV552gEM804Oj5tZuQDS27QnOWcXwnI7+fp3dg=;
 b=PFF4WA+Q6qLwpQUnpnSmnUGbC/sdYJUJWTJWlQpIjEqV7JfcfAfeXlwbCOvS/LoDj7
 aLc6Xdk+RbCyscL7yD+I+y6xbyEeh/agv+aGklOlZyu59qYl2ZKvDgpyHLRmCztcdgo7
 LB32Ox2MGYx/PCiHrtWmDJQKHOHBGt8bnIrxXvMGFeRqhp/s9oT8749BbBqs2/McV40G
 3WDXOeE+ZEcLK9ongVHHfVk1nWiBaiJWYlX/stUA/aM2QV//LjWmAkTdcuaEQNbKp6tT
 +EUk7FUnGIxR6DJqMSXRIYHLNSFWEkbdcv+9KuFJKaUnvkSaUx+NAeDGUnxoDA67n8jT
 nxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hG1GymV552gEM804Oj5tZuQDS27QnOWcXwnI7+fp3dg=;
 b=uSCOHPPj9W8AnlXr5hHaCAEP5yJCBidLXwLPwvvtF/YjqeB5NjXi/iPD4Tu5NJNeaK
 TdJnjwgbQ02Z1pr4iy5ta1Vz7ilAS29pPgbDB3d7Yc2VAEYqs2ukEoVTcbc7QyuDdsn8
 v8Oz6P8l0YafsUXjDCFcVIS1CqSUKDjvjz0szionZFC2VUnKtww1VBFUprqC+qOcK5uT
 5mGIwYMRLzYKAjUGect4/IVttlt6lIYPCdFF4DKLny1oy8WBXl0OrtKyU9rcOqMeDD7o
 QkuZUJ5ZT/wspXSK9SGcf5ojst+ZwIiwWnFjjhdp8iPlfu4XulLZKegSGkpsS07rPD3S
 AcSA==
X-Gm-Message-State: ACrzQf3hFSttXVScLAzDyVWNLKPnaHzH3cdiCGemRMGETbnEEPknBDP1
 DyRehVMsc6wt0ob0nbDimm7OnkVFF9pjwqAs+lQ=
X-Google-Smtp-Source: AMsMyM7NVsvEpGHdoXW3/Mhqk5W6jR8gFyClqezYpmDOnUXBJii3/XVms7ZBjQ9TBG59yXq4lEqIIlU7MHElJC82+ss=
X-Received: by 2002:a05:6871:7a7:b0:125:5c0d:de5d with SMTP id
 o39-20020a05687107a700b001255c0dde5dmr7653279oap.297.1666243049156; Wed, 19
 Oct 2022 22:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221018152524.137598-1-jusual@redhat.com>
In-Reply-To: <20221018152524.137598-1-jusual@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 20 Oct 2022 07:17:20 +0200
Message-ID: <CAM9Jb+ipgwytqD+2bKHS_GfECy0mvfjNkM=fXuta2cETox+yBA@mail.gmail.com>
Subject: Re: [RESEND PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> In the ACPI specification [1], the 'unarmed' bit is set when a device
> cannot accept a persistent write. This means that when a memdev is
> read-only, the 'unarmed' flag must be turned on. The logic is correct,
> just changing the error message.
>
> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
>
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/mem/nvdimm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7c7d777781..bfb76818c1 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -149,7 +149,7 @@ static void nvdimm_prepare_memory_region(NVDIMMDevice *nvdimm, Error **errp)
>      if (!nvdimm->unarmed && memory_region_is_rom(mr)) {
>          HostMemoryBackend *hostmem = dimm->hostmem;
>
> -        error_setg(errp, "'unarmed' property must be off since memdev %s "
> +        error_setg(errp, "'unarmed' property must be on since memdev %s "
>                     "is read-only",
>                     object_get_canonical_path_component(OBJECT(hostmem)));
>          return;

With the suggested minor change.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

