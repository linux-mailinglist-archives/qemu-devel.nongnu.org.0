Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9405359612E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:30:50 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0Ou-0002Jk-5B
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0M6-0000Vr-EJ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:27:54 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=22053a6f0=damien.lemoal@opensource.wdc.com>)
 id 1oO0M4-0001IZ-JF
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 13:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660670872; x=1692206872;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cpCo9qwXnZ638G3E79CMqbo6dXy+i3VrJo5mqqz2gOo=;
 b=m3uw0XiWzVkoS+zGpzyzxQAodJLPnS/P5BdIG+P3eEolOKe7d2k1uf5C
 F6db/NdmmZdl0n0vc9EXbNPMEd3IJGwU8eSnQCTtRYlVj78YeQAzaVjYa
 J0G+pJf1nEN8YEjeh64GjUgJdd8z1mqi7tE5s7XQb2aCIpgkFZa+IPZeu
 JAw2HuwuIbBgKSksWDu8z/kZOiGQbLUppJ7bJTwJ26Hod2ZqpFoPPM5bs
 zqTEk4erzpVxt2oV1q9AXYM2UuZVXVpgBtsPa5inC5Ph5BW8e8L6U7hWR
 FpUbMjyRluEiBIhLIMozbShs0e9DvRuQTmRms7rxJc5CmwKxDN9Dw8fyA g==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654531200"; d="scan'208";a="209390387"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Aug 2022 01:27:36 +0800
IronPort-SDR: zzRsUK9uKW4UVif1pC4HlapjdfN7N0DOG00Fe3cRcHAlUbAhSQX2+7FMrzFR+m4Oy32mcUU4fv
 RU5a9m6TNqD25RKGyIMnXslHTQwDlfOgd4OSOGwTBOHTu2KTbvKivt9QmNN+hOnXHfaw36prP6
 rfIWAZzhdE/DY2THT+W/WxXxYF/QXRot0yj+mdV9oTJZwb7GBb3PdCllmxo1LQVQyNK26HhPJk
 y2U0o2Y6kfCfDlPbqJM5bpkoVKdPE5VwfHuped5GHXFN+QynE/ss4YNz4zKuq1x5Nb/yDcjCYM
 Ho8cXn3NocEup6Gi2jOiYekg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 09:43:04 -0700
IronPort-SDR: kBCf+wSlmxD6r7Xq6GsWQ86kg4YNK3NGAgXDwZ7xXceph3XYbx8+pqQ2ss8Hc8uFb8ebQn4i8d
 rNsJXH00Pj07c35sWSNjT0KUln6Z9Sr1FAparqgbl4p2in1rvcsWaRLdBst2kTc8xHaj+dGAOr
 ylHv3LPEfjzVg90pXD9pMpfRq+oR5TubwxJp4wtrkOMXSKQ+DFgb1ylIG5SSDku9SqMUlqttXQ
 I1Zj93NaZm/+AUShNfCKzIkdjtUGST0czIToq7aCYy6SUsiGfX3MAn18SPAY8pdqFj7v3o7TAw
 Re4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Aug 2022 10:27:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M6dPz6BSPz1Rws6
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 10:27:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1660670855; x=1663262856; bh=cpCo9qwXnZ638G3E79CMqbo6dXy+i3VrJo5
 mqqz2gOo=; b=TGxe6DcC8VslB5sjJE6gjTgsNrp2TO1pCQ31KSxy1qr+zJRhmv8
 9MP30wYGotmhBG+OgHbSz8R/rPHDIXmXSCCVLDV5ie4qofjLxzcdkSZ5yMcvpJQ5
 FE2DPHydCwP+vLkVFnwwZnBA0tOif06dx2Epin/+CIQmS4XpHWXI3TjDMQSHxZcq
 4fw8jiEVGsS67xXl9r2H2fWzVcgIHxBXITkSnJvh4c/Z2cSxTSOtjFWod7OhkD9z
 RUyZeWLdNnEVHbZ4vOZ2kt3GAzViMnQGcw+LO0JwNyahwT3SGmY4pFpYdYa5rPuS
 bZa/BMwE7fdC1KBKeOEOqc3yQ7XQwjI/rJg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Auyu6WMmvpGH for <qemu-devel@nongnu.org>;
 Tue, 16 Aug 2022 10:27:35 -0700 (PDT)
Received: from [10.111.64.29] (c02drav6md6t.sdcorp.global.sandisk.com
 [10.111.64.29])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M6dPy37zCz1RtVk;
 Tue, 16 Aug 2022 10:27:34 -0700 (PDT)
Message-ID: <7125e549-d492-2f23-d779-b4123e5fd783@opensource.wdc.com>
Date: Tue, 16 Aug 2022 10:27:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v7 1/8] include: add zoned device structs
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-2-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220816062522.85714-2-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=22053a6f0=damien.lemoal@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 2022/08/15 23:25, Sam Li wrote:
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index fdb7306e78..36bd0e480e 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
>  typedef struct BdrvChild BdrvChild;
>  typedef struct BdrvChildClass BdrvChildClass;
>  
> +typedef enum BlockZoneOp {
> +    BLK_ZO_OPEN,
> +    BLK_ZO_CLOSE,
> +    BLK_ZO_FINISH,
> +    BLK_ZO_RESET,
> +} BlockZoneOp;
> +
> +typedef enum BlockZoneModel {
> +    BLK_Z_NONE = 0x0, /* Regular block device */
> +    BLK_Z_HM = 0x1, /* Host-managed zoned block device */
> +    BLK_Z_HA = 0x2, /* Host-aware zoned block device */
> +} BlockZoneModel;
> +
> +typedef enum BlockZoneCondition {
> +    BLK_ZS_NOT_WP = 0x0,
> +    BLK_ZS_EMPTY = 0x1,
> +    BLK_ZS_IOPEN = 0x2,
> +    BLK_ZS_EOPEN = 0x3,
> +    BLK_ZS_CLOSED = 0x4,
> +    BLK_ZS_RDONLY = 0xD,
> +    BLK_ZS_FULL = 0xE,
> +    BLK_ZS_OFFLINE = 0xF,
> +} BlockZoneCondition;
> +
> +typedef enum BlockZoneType {
> +    BLK_ZT_CONV = 0x1, /* Conventional random writes supported */
> +    BLK_ZT_SWR = 0x2, /* Sequential writes required */
> +    BLK_ZT_SWP = 0x3, /* Sequential writes preferred */
> +} BlockZoneType;
> +
> +/*
> + * Zone descriptor data structure.
> + * Provides information on a zone with all position and size values in bytes.
> + */
> +typedef struct BlockZoneDescriptor {
> +    uint64_t start;
> +    uint64_t length;
> +    uint64_t cap;
> +    uint64_t wp;
> +    BlockZoneType type;
> +    BlockZoneCondition cond;
> +} BlockZoneDescriptor;
> +
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
>      int cluster_size;


-- 
Damien Le Moal
Western Digital Research

