Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C4600520
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 04:15:01 +0200 (CEST)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okFee-00008c-56
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 22:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okFcE-00073c-Qc
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 22:12:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:14942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2824960c0=damien.lemoal@opensource.wdc.com>)
 id 1okFcC-0006Ti-QR
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 22:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665972748; x=1697508748;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dd/IIweoE3iczOIkJaaWazn6qviJPaGu6tyyFLQJQnE=;
 b=fyd6pMJc5MhbEQoAKP/VMkm0RdGOhjoADsQyw+07bwGM58xhw2u1Pxca
 URYKsAlhiHZKoCy9h5i5a3THKbcMmKXucbNuhSEI7BUcaee9hP+ysLppg
 NzLODRbFjsqxJY/ks/cn+53LTogR+IKvUU6jzZT9K1pEj5L5zqGkUgHgN
 uB6v2disVc6THa4BPJ1xQWodhEhT/pAU7ui2o/PW/6vgOYC3EzpOaQ9wC
 9ItTFNs3BlG31/KXW3M61HZma2R06+f3p25CsSy9uaHfO3Co64VkyqWqp
 bH9AAu+6kfvftsoLRaiNR9CQ8Aas1hnKmMohnlHr2DNexDZtmCggEjPXO w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="213969573"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 10:12:22 +0800
IronPort-SDR: kiiq2zHj0S6ODCBvWyJgAYgcZZ1XJGSwEsdJ2X9CisOq9tbNNb4dc0V5kS6zBcNbfVLi9hKeXz
 fu18kZqbl68OBQ50EAKQpdiNlhirLazzNzJRsxsULtlPeMl9xebiF9LWtCPh7TfRiz1oC/N6CG
 uz5nUMx78BTNAEWMkb19Q4NATkJEH/IYAv3TMFHj4T5Od/KZZSsaRs1mJXyDUXac8gbpS81N4k
 pLQq3AlpAvHWga2gLV/IgG9Uoa2HuNsaAPUUofF8O43c5V1fkSvYVhYFbzXzAKGR3ZRvsIzii4
 XnzzJywt1jr2z47VvbHH0taf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 18:31:55 -0700
IronPort-SDR: DK9HAxeYAu2wgdIW2pFztcO5k+58NKMhUkL5JJisOYPch+6i9quSUU+kkJYe58vFKPKzBhqPBY
 39BQBecA/Ua3qVQkCQk6GD9zQshr0I8WekSsc8I0djITe+8v0sYJdxkg9lG5q/Y0utcrIUukH+
 dp2phjIQxzXaByKEGAgEJlYF6XT9FyUFtBYnUxgWqt6WvmySJeniVtoITpYw4W4q5vOsVQ1nmx
 HWU4MA/PCIggF63d+hEv9Xa7e9nNHhBZxSj2ZgzhiWGIEzoVPsGR+WYSKqpHOz9s2MXp7/e8J4
 7e8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Oct 2022 19:12:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrL9K4PSJz1RwtC
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 19:12:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665972740; x=1668564741; bh=Dd/IIweoE3iczOIkJaaWazn6qviJPaGu6ty
 yFLQJQnE=; b=fducGkEgwn/OWI2w0GVtMlFA3LPwjexxk5TYu6Mws8NA6l9cyvN
 PtjlQ4UazUOdAKTyKFwBdIExKXm/w4+6p/0yIu+kxSaj9QzZdyGKSZGho25KWU5j
 K8cNe0pabUpFCsWS+aYvcQtknNAV0B9qrdMDiUUXQRoao9tByGLsblFX5/aXBWAS
 /gioi6OBANFsUe7BNq2+tms1rgbyBnV4PsxukGYN1WaVLWXj+gkVob8jwechiLyZ
 Xy5HG+zPagIJxHkhb3iqOrmft438Hbkc+tDTRKeNyNcqaN+OLIcpi1ifGCl+lMHE
 OuqHxWAGdoeZkujzsSp5sy3MPXLrajeSkzg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6LzlYmgyybs2 for <qemu-devel@nongnu.org>;
 Sun, 16 Oct 2022 19:12:20 -0700 (PDT)
Received: from [10.225.163.121] (unknown [10.225.163.121])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrL9G59Qcz1RvLy;
 Sun, 16 Oct 2022 19:12:18 -0700 (PDT)
Message-ID: <81366093-6f3c-2972-d97a-9f59abd0dfbe@opensource.wdc.com>
Date: Mon, 17 Oct 2022 11:12:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC v3 1/2] include: update virtio_blk headers from Linux
 5.19-rc2+
Content-Language: en-US
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>
References: <20221016150506.172675-1-faithilikerun@gmail.com>
 <20221016150506.172675-2-faithilikerun@gmail.com>
 <e5ee5de51ec437cc97b71ad2a7e2a969e21cbcce.camel@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <e5ee5de51ec437cc97b71ad2a7e2a969e21cbcce.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2824960c0=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/17/22 09:53, Dmitry Fomichev wrote:
> On Sun, 2022-10-16 at 23:05 +0800, Sam Li wrote:
>> Use scripts/update-linux-headers.sh to update virtio-blk headers
>> from Dmitry's "virtio-blk:add support for zoned block devices"
>> linux patch. There is a link for more information:
>> https://github.com/dmitry-fomichev/virtblk-zbd
>>
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>=20
> the duplicate sign-off is not needed. With this,
>=20
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

The mention of the linux kernel version should be removed from the patch
title as the changes are not included in any upstream kernel yet.

>=20
>> ---
>> =C2=A0include/standard-headers/linux/virtio_blk.h | 109 ++++++++++++++=
++++++
>> =C2=A01 file changed, 109 insertions(+)
>>
>> diff --git a/include/standard-headers/linux/virtio_blk.h b/include/sta=
ndard-
>> headers/linux/virtio_blk.h
>> index 2dcc90826a..490bd21c76 100644
>> --- a/include/standard-headers/linux/virtio_blk.h
>> +++ b/include/standard-headers/linux/virtio_blk.h
>> @@ -40,6 +40,7 @@
>> =C2=A0#define VIRTIO_BLK_F_MQ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A012=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0/* support more than one vq */
>> =C2=A0#define VIRTIO_BLK_F_DISCARD=C2=A0=C2=A0=C2=A013=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0/* DISCARD is supported */
>> =C2=A0#define VIRTIO_BLK_F_WRITE_ZEROES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A014=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* WRITE ZEROES is supported */
>> +#define VIRTIO_BLK_F_ZONED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A017=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*=
 Zoned block device */
>> =C2=A0
>> =C2=A0/* Legacy feature bits */
>> =C2=A0#ifndef VIRTIO_BLK_NO_LEGACY
>> @@ -119,6 +120,20 @@ struct virtio_blk_config {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t write_zeroes_m=
ay_unmap;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t unused1[3];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Secure erase fields that=
 are defined in the virtio spec */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t sec_erase[12];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Zoned block device chara=
cteristics (if VIRTIO_BLK_F_ZONED) */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct virtio_blk_zoned_cha=
racteristics {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__virtio32 zone_sectors;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__virtio32 max_open_zones;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__virtio32 max_active_zones;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__virtio32 max_append_sectors;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0__virtio32 write_granularity;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0uint8_t model;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0uint8_t unused2[3];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} zoned;
>> =C2=A0} QEMU_PACKED;
>> =C2=A0
>> =C2=A0/*
>> @@ -153,6 +168,27 @@ struct virtio_blk_config {
>> =C2=A0/* Write zeroes command */
>> =C2=A0#define VIRTIO_BLK_T_WRITE_ZEROES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A013
>> =C2=A0
>> +/* Zone append command */
>> +#define VIRTIO_BLK_T_ZONE_APPEND=C2=A0=C2=A0=C2=A0 15
>> +
>> +/* Report zones command */
>> +#define VIRTIO_BLK_T_ZONE_REPORT=C2=A0=C2=A0=C2=A0 16
>> +
>> +/* Open zone command */
>> +#define VIRTIO_BLK_T_ZONE_OPEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 18
>> +
>> +/* Close zone command */
>> +#define VIRTIO_BLK_T_ZONE_CLOSE=C2=A0=C2=A0=C2=A0=C2=A0 20
>> +
>> +/* Finish zone command */
>> +#define VIRTIO_BLK_T_ZONE_FINISH=C2=A0=C2=A0=C2=A0 22
>> +
>> +/* Reset zone command */
>> +#define VIRTIO_BLK_T_ZONE_RESET=C2=A0=C2=A0=C2=A0=C2=A0 24
>> +
>> +/* Reset All zones command */
>> +#define VIRTIO_BLK_T_ZONE_RESET_ALL 26
>> +
>> =C2=A0#ifndef VIRTIO_BLK_NO_LEGACY
>> =C2=A0/* Barrier before this op. */
>> =C2=A0#define VIRTIO_BLK_T_BARRIER=C2=A0=C2=A0=C2=A00x80000000
>> @@ -172,6 +208,72 @@ struct virtio_blk_outhdr {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__virtio64 sector;
>> =C2=A0};
>> =C2=A0
>> +/*
>> + * Supported zoned device models.
>> + */
>> +
>> +/* Regular block device */
>> +#define VIRTIO_BLK_Z_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>> +/* Host-managed zoned device */
>> +#define VIRTIO_BLK_Z_HM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>> +/* Host-aware zoned device */
>> +#define VIRTIO_BLK_Z_HA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
>> +
>> +/*
>> + * Zone descriptor. A part of VIRTIO_BLK_T_ZONE_REPORT command reply.
>> + */
>> +struct virtio_blk_zone_descriptor {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Zone capacity */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__virtio64 z_cap;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The starting sector of t=
he zone */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__virtio64 z_start;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Zone write pointer posit=
ion in sectors */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__virtio64 z_wp;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Zone type */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t z_type;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Zone state */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t z_state;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t reserved[38];
>> +};
>> +
>> +struct virtio_blk_zone_report {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__virtio64 nr_zones;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t reserved[56];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct virtio_blk_zone_desc=
riptor zones[];
>> +};
>> +
>> +/*
>> + * Supported zone types.
>> + */
>> +
>> +/* Conventional zone */
>> +#define VIRTIO_BLK_ZT_CONV=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1
>> +/* Sequential Write Required zone */
>> +#define VIRTIO_BLK_ZT_SWR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 2
>> +/* Sequential Write Preferred zone */
>> +#define VIRTIO_BLK_ZT_SWP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 3
>> +
>> +/*
>> + * Zone states that are available for zones of all types.
>> + */
>> +
>> +/* Not a write pointer (conventional zones only) */
>> +#define VIRTIO_BLK_ZS_NOT_WP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
>> +/* Empty */
>> +#define VIRTIO_BLK_ZS_EMPTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1
>> +/* Implicitly Open */
>> +#define VIRTIO_BLK_ZS_IOPEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 2
>> +/* Explicitly Open */
>> +#define VIRTIO_BLK_ZS_EOPEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 3
>> +/* Closed */
>> +#define VIRTIO_BLK_ZS_CLOSED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4
>> +/* Read-Only */
>> +#define VIRTIO_BLK_ZS_RDONLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13
>> +/* Full */
>> +#define VIRTIO_BLK_ZS_FULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 14
>> +/* Offline */
>> +#define VIRTIO_BLK_ZS_OFFLINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15
>> +
>> =C2=A0/* Unmap this range (only valid for write zeroes command) */
>> =C2=A0#define VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x00000001
>> =C2=A0
>> @@ -198,4 +300,11 @@ struct virtio_scsi_inhdr {
>> =C2=A0#define VIRTIO_BLK_S_OK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00
>> =C2=A0#define VIRTIO_BLK_S_IOERR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01
>> =C2=A0#define VIRTIO_BLK_S_UNSUPP=C2=A0=C2=A0=C2=A0=C2=A02
>> +
>> +/* Error codes that are specific to zoned block devices */
>> +#define VIRTIO_BLK_S_ZONE_INVALID_CMD=C2=A0=C2=A0=C2=A0=C2=A0 3
>> +#define VIRTIO_BLK_S_ZONE_UNALIGNED_WP=C2=A0=C2=A0=C2=A0 4
>> +#define VIRTIO_BLK_S_ZONE_OPEN_RESOURCE=C2=A0=C2=A0 5
>> +#define VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE 6
>> +
>> =C2=A0#endif /* _LINUX_VIRTIO_BLK_H */
>=20

--=20
Damien Le Moal
Western Digital Research


