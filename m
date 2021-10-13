Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65A42BA3B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:28:20 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZcZ-0006pR-Cm
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1maZZz-0004oy-4a
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:25:39 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:36574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1maZZv-0007bK-MN
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 04:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1634113531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rWsE8jYHcXubvmuAX7G6GW8YGQcvh4/8PsI7AV1nJ3Q=;
 b=Xqn3v4I0zz5xW2vFML/U89w+k7wgRIwAgg0/TvHcgyz+OsyChuHu9vLM6HcFMqOhQ6gj8P
 DPwhwTYJBCHN9J/jtlolrHCPGRIXMZKSCBd970Z3WP/W70JQVhlceWXTqXGdExxpnFcdQ5
 eEw0mX0Zm5X3TxHolPQBuCuF3wia63k=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-xJzkL4ajPFe3seHNzfNSzg-1; Wed, 13 Oct 2021 10:25:30 +0200
X-MC-Unique: xJzkL4ajPFe3seHNzfNSzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ES4MNMCrA3vqXhVggLuFgwfMfs05EwdsM8aayY6ZVCd63GxLwjzUdopMSxGodzOf0FxyVzLNzxcKeC8kWQO1+NjiLekusGZhHgmcDOFGpT+ExOR2Up+GjdHhWtjdGEkk67Oqye/7xuhOnkuQ+GNrzOP3Nqe8WB/5R1vQCSyqoq7EKa+nAVlwtyFRju/ImLH2nfbIJFFmhY5CTAGbmglzNkg+jdgvPYYqL/QFnm1cdulF7XzgaRCiOa1Hv8GhUGwUvGOrT+rguasYBItUV9SoOD7kw/UaioS483caiNuffmzLh1W1NYz1efw+etz0+iv9rjx4yULkj2gAxxIfAPTuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWsE8jYHcXubvmuAX7G6GW8YGQcvh4/8PsI7AV1nJ3Q=;
 b=LEi/NOZ+7cHpuAtibXAjmxXq4cUU3LUhY9z3NaMamJPGXRVVlvTsSRY0Ezygb2zJj5+QwzVGOI+nlcmSy1+CWJ/XS1KneOqlMIe0OJDR3iYoKX1cbTOSHOP2RL5PCTR8yPHB5Bc/QzhpzmXADP/vbTlPCfqX4KvbTLPB4ombtiiLVRwwwpvMovficre6CZgVUZ7ua4zJxC0G5sQG+mNPQoBd+L+tTpOdEI+XhCMOF9g12PsVZvnPYORN09YD0DU4eYBPU8dIgb1W7dSNTYA03jJKNG9vYRbUmsEYraf+KBuW7agHhEXpQ482XtLhGjcqGjmOS7ogKthQIIBlMnWYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8553.eurprd04.prod.outlook.com (2603:10a6:20b:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 08:25:29 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f%8]) with mapi id 15.20.4587.029; Wed, 13 Oct 2021
 08:25:29 +0000
From: Lin Ma <LMa@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: Question about virtio-scsi max_segments setting
Thread-Topic: Question about virtio-scsi max_segments setting
Thread-Index: AQHXwAsPey82NMxzj0y7gByNSWw5ZQ==
Date: Wed, 13 Oct 2021 08:25:29 +0000
Message-ID: <AM9PR04MB86024F9EC4F54A7A1DFDA47EC5B79@AM9PR04MB8602.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a5886416-8da0-44d2-bf3e-9284c440b6c4
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 823d52b1-0287-4e2d-8acb-08d98e2303ef
x-ms-traffictypediagnostic: AM9PR04MB8553:
x-microsoft-antispam-prvs: <AM9PR04MB85534BE1226CA4414AF21160C5B79@AM9PR04MB8553.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SWlg/UOxAV1qgKknJYEl2hyHIrzkgsfcQ2XeyByJb33dnRyBsafTPDtmFV/RyfZun9S9AERjX4V7O/+s/OBiHBjsQ8WGyzp+73m06vgeBjoRSdmto0glYSptBgYyFyw23xU/vktm17a84ZXLBzWr519T5xHPqC0eY7XGBFIB3b33Ouy/f5J8jbbOuLTMDSM2x8NTIXpzY6oTixAQxfCXU/S6j+afxvB8Ds8nDktoTaPJq2phajJYERvZ0rLlriwBDOtsXBvf96B+U0MqruHW6tuGad3h3qcqUXiOeCqp+sEy3rS5vjLAUTpE7gKumlV9qEeTwqLvObEQ81DPi6bWT0zb/DsnMs0isyMWR82T9hALn7245jKXCdS4cSvcT3QNnKMOq/ZNrRNK61Nx4GEcVe0vTD+211cSEOQaH5yLxA/bXkEzHNyKc5b7Ligb2Awyv/pUVjnEenPVBICFoSxmjOiruKCv+u2gbsA/0MxwoCDNbCa78lFPQdvDmSkJrC74EuAeoZkhy0s0AzerB6rmmtwTG4Byf4Eo9gYiJeF9F5j5jmH/imqVQSVEcGEpgMKNPrvOx/sGp+vPHIH5T3rFZE4e0NmNQLKabf+p5mI01skm2KuWdLsrdVq/8S++c2k1ToCjhtO6VkCHetOcLTplEIbmwd32Iw6hVzx+4NEHBS7AV992REi2V0QCpIDdGiPkKJTVWRRomMj6yiMXp3IPnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(52536014)(6506007)(4326008)(5660300002)(66476007)(38070700005)(508600001)(83380400001)(66946007)(2906002)(316002)(33656002)(55236004)(86362001)(38100700002)(55016002)(71200400001)(26005)(9686003)(91956017)(7696005)(66446008)(122000001)(64756008)(76116006)(8676002)(6916009)(66556008)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?YRZbfMFCWuhrHX0Z5bXvQ755RB8WQwUCAvKqAtOD6rL4EJopHdNDzgan7l?=
 =?iso-8859-1?Q?A7/UjoX5JJIXFSzfpswsaCyAoZ9/UylE6whX03MQWhtwvQS2JmLgSSpI1b?=
 =?iso-8859-1?Q?XjmxoODpuV7Wrynpm4FUkL1l/HE4hVYJ4MCqzhx3RQFsuEQiD87ZkX2+w4?=
 =?iso-8859-1?Q?QP+mumvZSW/C3J9QwmiuCWaQPHIyFZo1ZayBIav2ojD1rt/ak6RrTAO5BK?=
 =?iso-8859-1?Q?M200fP26WLoqeomxMb85RlfPyn+3cOwzZcbCrTJT5BNjBLvNOUQkNhwi4/?=
 =?iso-8859-1?Q?WYgF25uaXNFVLb9fu1X0IWZ0San9DorKoQpEqe39sfP2FN5tgc9PjfXMEZ?=
 =?iso-8859-1?Q?zu5jqgoZy/bIcyQZpAjvF5Ilu5euicnd+hkFoFwkQ83xiHH7D/eoSjadEK?=
 =?iso-8859-1?Q?X1e/uRZuBBPb/GI8zUnNWywnrkOLDi8QcDPa0tJZYlNulUSr6tULfo5hkT?=
 =?iso-8859-1?Q?umfeF50tfwtaIqRgyBwNBr2eF0SUpOPGiuCDKFFEXf0uC+HRkjV+iVPEvd?=
 =?iso-8859-1?Q?9UI1CewNe1Mrjsum+BQwzmJkzQTsbNHv2a9ZuNKphsa8QKLKydbgsZbs1l?=
 =?iso-8859-1?Q?qI0i0gjO5d2WvtizzuyPQhcnz0f4cb45c0x3640u9L9s0C8a9I0iydQy5m?=
 =?iso-8859-1?Q?VeZeuzsrU2oDQi5HSUvck1o4gwsuP0RpHwd06MzjnFUkQeDtH06nEFnw55?=
 =?iso-8859-1?Q?dOHHS8gvruIFWNuFAgkdCIcuAParVBn9z1xI1Uiz5FXMf8ukz2haWaYuao?=
 =?iso-8859-1?Q?USu//Y+bM/8AjftWp31AWCtFjaIv71NuQn8UPuP8C1f6rqAIFZx9yR2d1Y?=
 =?iso-8859-1?Q?JRYXKZIrqvO80Mq9vDExGsklNrJcBiIibzErboj9KlgX8z4s8kEWbu/rux?=
 =?iso-8859-1?Q?/t1hIRXruZSrrgn8Jcya9gDE2bgCy5pNdDDHOPGctDi1Tm4V5RVW55jLSs?=
 =?iso-8859-1?Q?eeQPpaaiGQugz2pYs9a1YXrEyxzZF5+y6WqhM/13vPIViPWgozhWmQ5W4p?=
 =?iso-8859-1?Q?kV5wquno6kHaumcRZsqbxBwBCPFA0IgHb7ENovnqZg8JwdutF7+0QhVcIv?=
 =?iso-8859-1?Q?AmWZkU1LdHjeVirT5S1VAz+iu6e0pnIrTE69FBUpOkG3eVzUJySzPVrNRV?=
 =?iso-8859-1?Q?qDjzVZjGonDGnCF7A4p2FKmllHNehtop5ibIbWYB2jHUAlEQwGoXL3QuEg?=
 =?iso-8859-1?Q?ub/FND3qCsLTEVU6aKBStZ/XFbEa6xi1B0Vh3xl2rNqAH0sG/0ejFZUBHC?=
 =?iso-8859-1?Q?E2IBvVvbOxsgWQrosZpyztxmWlbFMsZgnc4e1KMaGQ6qdY7+dRfqxhpaMJ?=
 =?iso-8859-1?Q?KvZTybApzMVqF76gsrBBGMkY2aHexN1haYvwC+I5jHtek6I=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823d52b1-0287-4e2d-8acb-08d98e2303ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 08:25:29.0327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92ekPkpRRhRs+hRY1cwlNsjojk070pxiApW+/8zW+/oyQTrggI1fS3JbViNCgzKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8553
Received-SPF: pass client-ip=194.104.111.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,=0A=
=0A=
We know that the seg_max of virtio-scsi respects to virtqueue size:=0A=
scsiconf->seg_max is set to virtqueue size - 2.=0A=
=0A=
Some of my scsi HBAs have max_segments as low as 64 in host(max_sectors_kb =
is 256).=0A=
When I use scsi lun passthrough disk in guest, In case of default=0A=
virtqueue size(256), The max_segments of the disk in guest is 254.=0A=
=0A=
In this scenario:=0A=
host:~ # sg_vpd --page=3Dbl /dev/sdb=0A=
Block limits VPD page (SBC):=0A=
  Write same non-zero (WSNZ): 0=0A=
  Maximum compare and write length: 0 blocks [Command not implemented]=0A=
  Optimal transfer length granularity: 512 blocks=0A=
  Maximum transfer length: 512 blocks=0A=
  Optimal transfer length: 512 blocks=0A=
=0A=
host:~ # cat /sys/block/sdb/queue/max_sectors_kb=0A=
256=0A=
host:~ # cat /sys/block/sdb/queue/max_hw_sectors_kb=0A=
256=0A=
host:~ # cat /sys/block/sdb/queue/max_segments=0A=
64=0A=
host:~ # cat /sys/block/sdb/queue/max_hw_sectors_kb=0A=
256=0A=
=0A=
guest:~ # sg_vpd --page=3Dbl /dev/sdb=0A=
Block limits VPD page (SBC):=0A=
  Write same non-zero (WSNZ): 0=0A=
  Maximum compare and write length: 0 blocks [Command not implemented]=0A=
  Optimal transfer length granularity: 512 blocks=0A=
  Maximum transfer length: 512 blocks=0A=
  Optimal transfer length: 512 blocks=0A=
=0A=
guest:~ # cat /sys/block/sdb/queue/max_sectors_kb =0A=
256=0A=
guest:~ # cat /sys/block/sdb/queue/max_hw_sectors_kb=0A=
32767=0A=
guest:~ # cat /sys/block/sdb/queue/max_segments=0A=
254=0A=
guest:~ # cat /sys/block/sdb/queue/max_segment_size=0A=
65536=0A=
=0A=
Performing "mkfs.xfs -f /dev/sdb" in guest triggers I/O errors.=0A=
The error message in stdout:=0A=
mkfs.xfs: libxfs_device_zero write failed: Remote I/O error=0A=
=0A=
And the error message in dmesg:=0A=
[  887.867763] sd 6:0:0:2: [sdb] tag#147 FAILED Result: hostbyte=3DDID_OK d=
riverbyte=3DDRIVER_SENSE=0A=
[  887.867766] sd 6:0:0:2: [sdb] tag#147 Sense Key : Illegal Request [curre=
nt] =0A=
[  887.867773] sd 6:0:0:2: [sdb] tag#147 Add. Sense: Invalid field in cdb=
=0A=
[  887.867775] sd 6:0:0:2: [sdb] tag#147 CDB: Write(10) 2a 00 0f a3 00 40 0=
0 02 00 00=0A=
[  887.867778] blk_update_request: critical target error, dev sdb, sector 2=
62340672 op 0x1:(WRITE) flags 0x8800 phys_seg 65 prio class 0=0A=
=0A=
=0A=
I found 2 ways to workaround the I/O error:=0A=
* Reduce the max_sectors_kb value in guest. E.g: 256->255 or lower.=0A=
* Modify virtio-scsi code to assign scsiconf->seg_max =3D max_hw_iov - 2=0A=
  (in my scenario, the max_hw_iov is 64)=0A=
=0A=
I'm wondering that the seg_max always respects to virtqueue size, Is it=0A=
reasonable?=0A=
In case the max_segments of host scsi HBA is very low, say 64, Does the=0A=
max_segments=3D254 in guest make sense? Obviously the value exceed the=0A=
host limit, Does it cause I/O issue?=0A=
=0A=
Thanks,=0A=
Lin=


