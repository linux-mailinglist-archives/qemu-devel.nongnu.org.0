Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC982231BE0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 11:15:54 +0200 (CEST)
Received: from localhost ([::1]:40078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0iBl-0008IX-Fg
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 05:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0iAd-0007hD-86
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:14:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:26825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1k0iAa-0007y1-Ay
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 05:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596014078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S0wYc4/LcohKZOXFczZ4OthMXa1CAhR8XwV9mi1xZug=;
 b=R8Y9tgfvT4ksPlzNP+xoLmjuhCFnmTs1Oanrqu4YOH+Fn9J3jXoaKbl7QJRwM+kddvWmPi
 XijIGzrBphhL5fbWBz2epuxerPCe0x+7Lh+IRkZX8hziXtpOeD4QftPEa7fho8AcfLQbo4
 RttuBYur/4/y9c6ZGAMU7MYAz13ctaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-sHLvp8g0O5C_0B2ysRrwQQ-1; Wed, 29 Jul 2020 05:14:36 -0400
X-MC-Unique: sHLvp8g0O5C_0B2ysRrwQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BCBB8015CE;
 Wed, 29 Jul 2020 09:14:35 +0000 (UTC)
Received: from starship (unknown [10.35.206.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 531EA7191D;
 Wed, 29 Jul 2020 09:14:31 +0000 (UTC)
Message-ID: <f91f8732ffb3f0dc8862005da8339fd1c416cde8.camel@redhat.com>
Subject: Re: [PATCH v3 06/18] hw/block/nvme: mark fw slot 1 as read-only
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Wed, 29 Jul 2020 12:14:30 +0300
In-Reply-To: <20200706061303.246057-7-its@irrelevant.dk>
References: <20200706061303.246057-1-its@irrelevant.dk>
 <20200706061303.246057-7-its@irrelevant.dk>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.74; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 01:09:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-07-06 at 08:12 +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Mark firmware slot 1 as read-only and only support that slot.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.c      | 3 ++-
>  include/block/nvme.h | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index a330ccf91620..b6bc75eb61a2 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -62,6 +62,7 @@
>  #define NVME_TEMPERATURE 0x143
>  #define NVME_TEMPERATURE_WARNING 0x157
>  #define NVME_TEMPERATURE_CRITICAL 0x175
> +#define NVME_NUM_FW_SLOTS 1
>  
>  #define NVME_GUEST_ERR(trace, fmt, ...) \
>      do { \
> @@ -1666,7 +1667,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
>       * inconsequential.
>       */
>      id->acl = 3;
> -    id->frmw = 7 << 1;
> +    id->frmw = (NVME_NUM_FW_SLOTS << 1) | NVME_FRMW_SLOT1_RO;

Offtopic:
They didn't make this one 0 based value, and yet ask for at least 1 slot. 
Just to keep us entertained I guess :-)

>      id->lpa = 1 << 0;
>  
>      /* recommended default value (~70 C) */
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index d2c457695b38..d639e8bbee92 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -842,6 +842,10 @@ enum NvmeIdCtrlOncs {
>      NVME_ONCS_TIMESTAMP     = 1 << 6,
>  };
>  
> +enum NvmeIdCtrlFrmw {
> +    NVME_FRMW_SLOT1_RO = 1 << 0,
> +};
> +
>  #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
>  #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
>  #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)

Looks good,

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


