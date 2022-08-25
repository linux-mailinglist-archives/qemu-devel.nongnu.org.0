Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB75A0758
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 04:41:37 +0200 (CEST)
Received: from localhost ([::1]:34618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR2oK-0002FW-Ht
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 22:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR2kZ-0008DN-NQ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 22:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR2kV-0008SE-L9
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 22:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661395044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YsTgF/+/hRIthgFGq+WHZVlEWBhFzENGyfx5ue8QUuk=;
 b=Cw16ftQpLR8Oh8cQpVjPjx/dDrDHicgv37eE8M0trm0aHyNZ9mSTANrO9EmhvDh2YhG9l/
 AzA/RIfPn90JoQRdnS94tbQdBSOp25PIJMS1AX4lbL2hqiO3zwq5Nw1DPMQSFOqxdnpPhg
 +R/f9zT2e1uYJ0cRmGIwe+fybWXQrwo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-Hi9hAadKMOe3VOkh7ZAwXA-1; Wed, 24 Aug 2022 22:37:22 -0400
X-MC-Unique: Hi9hAadKMOe3VOkh7ZAwXA-1
Received: by mail-lf1-f71.google.com with SMTP id
 j9-20020ac24549000000b00492b0d1dea9so5782901lfm.16
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 19:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YsTgF/+/hRIthgFGq+WHZVlEWBhFzENGyfx5ue8QUuk=;
 b=hoga0mqoPef7UDCCt9Hx1ESusaQmuABCsicGB4xdpYLQVUKVi1qzjYith3O7568TKf
 FT/PFwqjFkrFwNENZ3weoXf6jtUwe0QhLDDlFLRAxs+7w/7TpyvaEkXSNWQxckRC170Z
 7lKniTZDmQlHcPG3MQa1E5NakNNqg4jYEgp1UN5z/8UMZVsR2c4LUp+b7GJLadMoCw8W
 PNSCt7uVZopJTWA65Z55EbotEM7z52Dre87dvbJ0oR2Ws363pPdIXiQQz+FkZCla1DXW
 YnzM6r9EFYaVVwQXkga0we1LS3zz8Phz2QV1AE8yV2HPh+2h35eK5+qSc5hddoqaV+pf
 MAtg==
X-Gm-Message-State: ACgBeo1OhG1l97GUm1THfihVxca6pA4RdPdr3zGi4exyZJe4XTNS7mQC
 cQMxupWHJ/TzpOzeeVdlahBL//JPypHBGinQUtFJetpBBdHz/6Jrks63f7AVgk3hHYA3AI6pQSd
 rSVCvd104mdCS3ONp+zGlTDYetrs4chk=
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id
 k33-20020a0565123da100b0048fcad0195amr485268lfv.397.1661395041624; 
 Wed, 24 Aug 2022 19:37:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6qU/ivbjj0UgyryehJiZYPbM4CzQxTLNbIHc8LBERlVI7LPQJacRHcorc8XUdpm1ZxMComwqIRFatjVlU/Rm8=
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id
 k33-20020a0565123da100b0048fcad0195amr485260lfv.397.1661395041352; Wed, 24
 Aug 2022 19:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220824110845.353435-1-f.ebner@proxmox.com>
In-Reply-To: <20220824110845.353435-1-f.ebner@proxmox.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 10:37:10 +0800
Message-ID: <CACGkMEsgsnnj6uSmYu7qB3tNvf0s6_xJNKMyV6Fk3F_8L1v4bg@mail.gmail.com>
Subject: Re: [RFC] hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, pjp@fedoraproject.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 7:17 PM Fiona Ebner <f.ebner@proxmox.com> wrote:
>
> Fixes: d05dcd94ae ("net: vmxnet3: validate configuration values during activate (CVE-2021-20203)")
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>
> I'm not familiar with this code, so really I'm asking: is the change
> justified?

Patch looks good, but please re-submit with a formal one with
rationals via changelog.

Thanks

>
> I tested the change and it seems to work, but I only have some rough
> rationale for it, which is also why there's no commit message yet.
>
> In the Linux kernel's net/core/dev.c, in dev_validate_mtu(), the upper
> limit itself is a valid value:
>     if (dev->max_mtu > 0 && new_mtu > dev->max_mtu) {
>         NL_SET_ERR_MSG(extack, "mtu greater than device maximum");
>         return -EINVAL;
>     }
> and AFAICT in the case of the vmxnet3 driver, max_mtu is set to
> VMXNET3_MAX_MTU (as defined in the kernel, which is 9000, same as in
> QEMU).
>
> Reported by one of our users running into the failing assert():
> https://forum.proxmox.com/threads/114011/#post-492916
>
>  hw/net/vmxnet3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 0b7acf7f89..a2037583bf 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1441,7 +1441,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>      vmxnet3_setup_rx_filtering(s);
>      /* Cache fields from shared memory */
>      s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
> -    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
> +    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu <= VMXNET3_MAX_MTU);
>      VMW_CFPRN("MTU is %u", s->mtu);
>
>      s->max_rx_frags =
> --
> 2.30.2
>
>


