Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657E327C74
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 11:43:46 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGg1h-0001ps-3a
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 05:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lGg0n-0001Jb-3R
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lGg0j-0006fq-Gm
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 05:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614595363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P3X6PoqG8NM2A7dCHZxprfx325/QKWSjCtCD5CsCL/w=;
 b=CjVl71FZEWH6JLWN8h3IaoVjVy2O9epzSkgKTOGfg5YCc7eASOPDkzdj4NO4N+hbXrZY3k
 M6ycMeMPo4VyPcKSTEh5VS3OPpzGtPdRPASyIOB4Ry47AUeuYeVBl3opVLzOHAYtHMva8y
 OouCFfYH9g0KqDLXFi3chTdHKnalkwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-PtftwJhAPUyCM8qNIYBugQ-1; Mon, 01 Mar 2021 05:42:42 -0500
X-MC-Unique: PtftwJhAPUyCM8qNIYBugQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF8F1009617;
 Mon,  1 Mar 2021 10:42:38 +0000 (UTC)
Received: from work-vm (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C0266EF51;
 Mon,  1 Mar 2021 10:42:28 +0000 (UTC)
Date: Mon, 1 Mar 2021 10:42:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
Message-ID: <YDzFEZvgF5aj4qrw@work-vm>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-13-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-13-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, saipava@xilinx.com,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sai Pavan Boddu (sai.pavan.boddu@xilinx.com) wrote:
> eMMC cards support tuning sequence for entering HS200 mode.
> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/sd/sd.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index bf963ec..174c28e 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1386,6 +1386,14 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          }
>          break;
>  
> +    case 21:    /* CMD21: mmc SEND TUNING_BLOCK */
> +        if (sd->emmc && (sd->state == sd_transfer_state)) {
> +            sd->state = sd_sendingdata_state;
> +            sd->data_offset = 0;
> +            return sd_r1;
> +        }
> +        break;
> +
>      case 23:    /* CMD23: SET_BLOCK_COUNT */
>          if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
>              break;
> @@ -2120,6 +2128,30 @@ static const uint8_t sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] = {
>      0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
>  };
>  
> +#define EXCSD_BUS_WIDTH_OFFSET 183
> +#define BUS_WIDTH_8_MASK    0x4
> +#define BUS_WIDTH_4_MASK    0x2
> +#define MMC_TUNING_BLOCK_SIZE   128
> +
> +static const uint8_t mmc_tunning_block_pattern[128] = {
> +       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
> +       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
> +       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
> +       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
> +       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
> +       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
> +       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
> +       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
> +       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
> +       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
> +       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
> +       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
> +       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
> +       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
> +       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
> +       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,

Where does this magic pattern come from?  Is it part of some spec?

Dave

> +};
> +
>  uint8_t sd_read_byte(SDState *sd)
>  {
>      /* TODO: Append CRCs */
> @@ -2213,6 +2245,21 @@ uint8_t sd_read_byte(SDState *sd)
>          ret = sd_tuning_block_pattern[sd->data_offset++];
>          break;
>  
> +    case 21:    /* CMD21: SEND_TUNNING_BLOCK (MMC) */
> +        if (sd->data_offset >= MMC_TUNING_BLOCK_SIZE - 1) {
> +            sd->state = sd_transfer_state;
> +        }
> +        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
> +            ret = mmc_tunning_block_pattern[sd->data_offset++];
> +        } else {
> +            /* Return LSB Nibbles of two byte from the 8bit tuning block
> +             * for 4bit mode
> +             */
> +            ret = mmc_tunning_block_pattern[sd->data_offset++] & 0x0F;
> +            ret |= (mmc_tunning_block_pattern[sd->data_offset++] & 0x0F) << 4;
> +        }
> +        break;
> +
>      case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
>          ret = sd->data[sd->data_offset ++];
>  
> -- 
> 2.7.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


