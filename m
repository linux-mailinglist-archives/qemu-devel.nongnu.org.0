Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360323B09BA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:59:49 +0200 (CEST)
Received: from localhost ([::1]:49040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvioW-0004AO-5P
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lviea-0006pS-KM
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lvieX-0005rZ-Ed
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:49:32 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MFfTj3009992; Tue, 22 Jun 2021 15:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=pjHExYd81U4hDRzZ6U/5fwMZJaQ2SKzC5J1Ds7U4kCw=;
 b=GjVZMzjZx5HNoHA3DGYTJii16t4KImW1w3hEGIGRJ1Iz/7UcFHBz8oTiNV8WQj0g0Qme
 KK/+V8+FALs/D0Z6LhLaunEk27upoTouHdRi5rfKGNm4b2eo6yH0n0AnQNNlYRZKmk3t
 a2BXhpRqNlL97r4N/U6WGtp6bqq19KUXFVdA+qHfWb4Vc1la5HVRh/HL1vmiXSEcehvB
 pIzr/UlHKDeNARJPvmcPtsnDPYdPeOpwz0k7Zgbn+C1Yv58dQlBuV46K45zG7Vf1TSiN
 BdwQmVQwd5mSiN423oftfA+9McfNiLEq4b48rYEz4kmfi8hHW4U86yO7q4P+x8J5ho2U SA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39aqqvuk1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:22 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MFl46f031235;
 Tue, 22 Jun 2021 15:49:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by userp3020.oracle.com with ESMTP id 399tbsy2dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 15:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGNnK5EabfLR3fjcvcFVn3A4QvIzlqyeJ451Sh6SiVUO4vl5t3ldw9nwlhqUy5o9omvtNhu3R2X6VySl9m8Fdr0eDuQy2BUAuY84oe9pHHG5PEsQaOBeVNZvg+pAhMdh0W4gHUUhHsCTZfayJQG/d0Sc8cPe+ZplWTwZdIIe4ZLxh3SmiJx2iO5CgV8BHXM9TsSW9JJA0J5+bh5PsifnK4BZdZqOMjMyJdmAKuixP/hnycW9gE94GKLCMyHlL2R35ycgXBdvPABuUrDb2cGokEpswoEKj3PTJei9nkAW2Y6jKw9hxQYvUCq49gX/rmb2fRK1166hLiQTUxaeUTZVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjHExYd81U4hDRzZ6U/5fwMZJaQ2SKzC5J1Ds7U4kCw=;
 b=IfrCGJU5xyFDiP77ATWrq49GtLBHAYlf3yhmBM2RHHGUE8zZ95hzZCKE3cfATQyRskR1LJoXaizOnscafdNhof/H60Q5N8gSgETGm3XEB7hwOjCTRzulZCEgKvRx8ICiRWx38nBAQNaakoNSiaE1qobPR6V5BzgprJUL9p5BCqnscK/4ESV4p7B6K4jpRe3vWl9DqSqQL+KDoszoK0hyettZtvGXk0lg1IFhnxtbgnU7U5J/pwINMJ7V7YHgpEEW5m56enlQrLQBxp2mGVbDhliQiX6I+NpKDLv3zsFhPjUjV5J7FcvC8t42livhe5HUZmqsbBue0mSjBwQOBDBNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjHExYd81U4hDRzZ6U/5fwMZJaQ2SKzC5J1Ds7U4kCw=;
 b=mJS+D3y3WyZxdfHLqPwq3ohGEUAVCnJD2/igUGHsC86rAMvjIXsTcqgtQtuqI9Q+SEFInzrRGZGFdCobLUdG+qW8jMLSVtgcl9grXScQho/9ck2P6oBGc45XMfXYr0tST5O5LJBv/waxuu42t512+QoTIr7Rx/t53SRQJHYR+GM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4078.namprd10.prod.outlook.com (2603:10b6:208:180::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 15:49:18 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:49:18 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD systems
 with IOMMU
Date: Tue, 22 Jun 2021 16:48:59 +0100
Message-Id: <20210622154905.30858-1-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
Content-Type: text/plain
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from paddy.uk.oracle.com (94.61.1.144) by
 LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 15:49:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c23dae28-4924-4baa-cd47-08d935954bac
X-MS-TrafficTypeDiagnostic: MN2PR10MB4078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB40788F087B7ADF4156712B62BB099@MN2PR10MB4078.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EmLaL0CXXAPNiPr4wjbixkI19k+zYQ9b65p512gysQASxVvzmIu9FHaICvbCIC4VtJp5Vb7rl5h40Rdt0dl2ERmzl0MuJaZt6v9ZEYSq3hzXQQSn0MVajVpzo4ifGhIXjgwjH8qtrqy9/aLwJ5HuiEYLmJxNhk2ONmQyZUzHXwNgZw9EMx0C1FDxyuQuBSQDdHu6BZlQtlgm5nrxDksXRWG64gm8VSuNpMQkvpraAj4xEv3HnPZY+Wc6fJQZ5QDjCUuXLY4BjrHkRAYhG0BYflehRSN9ViVXzWu+2MbHOBJwrYwpnN9YRqPilgRje1yM3TS+z49Ej4pTLqZZtbmjKurPK+U+ginWyO9kga2f9gT13BxiTslfDKdvcNK/H96AQdPhYhZUzlcJfWwWTncdsgciavd8UrHL9eH4s0gMqrXVFXjbnBbgfgrKtsAjyTN6iXcCF4Sv5VzLcwejedrWXPxPQjQ9k3DAXEQASFSToU2CAx3Fr3OMJ+4Z2gWtMm4JP0CSVYK38T3+RKOe8kdRR9vdgXmU29mNzudm6zuH99k+4PbTKWEAvzr9yNQLuydADTHx0gEedA++WRR+0jYnoL11im8AVDAPRDCp0nAsb0AeeogjciezvMGlZW94rzK3Z3r6WLt+RNHXnS5p0BDWqs0+hqaHpyVmlO/Q77pIus4WyJhpS0vAD3iC8qhlP+krXmOmX3I9+0ecjMn2bl1dVDg+YKqDCDIEVVNdyroiuyf7m3zohvJj8b7i3SJYqRw78BahvFx98rYeFJw/Kz93oCfWNfXJSuTX3GIFpUq2hPn3vvh3OFOmwYuQWV+g8DtnlTuhce1lFxeyVw7yn0cPD8KDZj1YNb2B+xe3iImyTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(346002)(376002)(136003)(6916009)(8936002)(103116003)(2616005)(54906003)(1076003)(38350700002)(956004)(6666004)(66556008)(66946007)(52116002)(8676002)(83380400001)(107886003)(66476007)(5660300002)(7696005)(38100700002)(36756003)(2906002)(86362001)(186003)(478600001)(316002)(26005)(4326008)(6486002)(16526019)(966005)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eklFaBYZ8Z3H0n9ua/Lyas/MQ1DTetGir0QCZXBXQpeB7gMOi8VhozCPoTfP?=
 =?us-ascii?Q?5A1YByksuzZ+ZAf0biHl6qfrNlo4iDTs8kwsaIePkGGr6IyYPJUu1x9kmEyc?=
 =?us-ascii?Q?0+ehpp+T2FZhPg0zRj4kbxZzetYAJkDCI27WLHcBrVHdzKQExmNoh807uLsZ?=
 =?us-ascii?Q?mVojf1m+qLj5cV7WVpWJkPs1UBsc/O9Kiotax8JtifXlTpsLfyAY6hd2OrDh?=
 =?us-ascii?Q?+VwpUzwvn1G52aQ89ejxITWkMdqyam2u0baG7uiJZnwhrxeLALYJWN0MIsyA?=
 =?us-ascii?Q?BkzFLGW6PaLudimLSFPRsb5JxRsimQHD4sz4HfW9sgFgfMbMqXPO1et4U3uh?=
 =?us-ascii?Q?bsi/uJyOlU5nb+MR30QgChOIFA5LNTxUjgYeB4aWwVqrPWe0odeFshGZSfq9?=
 =?us-ascii?Q?7YutTHn/MrfUgFU3H0Jz1H9Q7PoAOt2ZyN7+08q9iOh0PmDgUPbuO2/97vZi?=
 =?us-ascii?Q?vb6VuOpz7Q2uCq6RAUL6n1/6O+8ioVwkFc/tJHDVRJXT1KxAlaiDhgA0ZgEC?=
 =?us-ascii?Q?6zs+F4wpKqF6vCll25Td1EElbuvq/E8EVmnufCL08Avbxj+Fl4aIc7odUmxW?=
 =?us-ascii?Q?u31nYjhx+/zHQnuAcvmLz5L1dEjpVOBZUv94F21K1peFFwkf0GoK33M0loCJ?=
 =?us-ascii?Q?P+DiSFLMPiKiS7h6yYYRuvILuV/EQ00NlmSpZClg6QtOkxDkYUT8CtQ4c6hw?=
 =?us-ascii?Q?v+NZE28YD20UJafI9LvwqY0vc1lWZuJpVu0Dz8a95nxMVzdB3p4LMl8F+dcV?=
 =?us-ascii?Q?Ll8Uwevar3Ngnv+IXxNh3MBv+nEsaW253kuObFjG2Dj1qiBjbLgyWBSMBp3L?=
 =?us-ascii?Q?irS+M0MJGPnYwemBtfn+F7AGGHYHafXvO3SLDF4vtJ57BF0jnDqehqHsYZYt?=
 =?us-ascii?Q?z8qyDtvfbY09TRh3eV7yh/S6OzfO7CcoOag8wXLr5RpXD+BDyRxaiT49GnB1?=
 =?us-ascii?Q?yxcjSaJydCyHZHdQV1/2MjZ52qtT+YiH92+yQo0nhKVaJ3w5dATI02OUfgBv?=
 =?us-ascii?Q?vU/5XOMHSws7Edro2iaZBA2ToNHP8OxcYCcVuAk+PzGHqq76e7fLpB9QO7CE?=
 =?us-ascii?Q?T7TzXBF4Fc/MG5x9H1VbRAdG9jLMt722agQx1ZpEn1mFh+wDndPcuZQYasdc?=
 =?us-ascii?Q?b7eU/xxezJyECOjhwOnx4h4bkZUJYqrgCSO5Zdq9hJGRNaQGJNwfXqk+f7tq?=
 =?us-ascii?Q?UfJs6nLSyEIZujx9yePOfUBc+LH5Wcno5RLpZ6iGqfFXITm3qlvaWgoSor2w?=
 =?us-ascii?Q?TE996K6guoYsPUATg35eWAJkQhztY91Ct1WxOIzNPyIvGj+HX0IGxFnOzcbb?=
 =?us-ascii?Q?0poDY2+K02yFbySNxe9HqX3o?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23dae28-4924-4baa-cd47-08d935954bac
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:49:18.7303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRctl1qnsWs0gMdbJabxNPhMNlpfwPPopIJvG3m9r8Ham+7JgKy5rFejuFVBUzsZn7bRj+jyh+1RdUGSC+8RIL3i2KbSdy1rxAXiy1aKwV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4078
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=949 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220098
X-Proofpoint-ORIG-GUID: A6Kf7EpeGX9HmEbnKA9D7Op_3VxG2z0T
X-Proofpoint-GUID: A6Kf7EpeGX9HmEbnKA9D7Op_3VxG2z0T
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

This series lets Qemu properly spawn i386 guests with >= 1Tb with VFIO, particularly
when running on AMD systems with an IOMMU.

Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
affected by this extra validation. But AMD systems with IOMMU have a hole in
the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
here  FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.

VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
 -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
of the failure:

qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
	failed to setup container for group 258: memory listener initialization failed:
		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)

Prior to v5.4, we could map using these IOVAs *but* that's still not the right thing
to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
as documented on the links down below.

This series tries to address that by dealing with this AMD-specific 1Tb hole,
similarly to how we deal with the 4G hole today in x86 in general. It is splitted
as following:

* patch 1: initialize the valid IOVA ranges above 4G, adding an iterator
           which gets used too in other parts of pc/acpi besides MR creation. The
	   allowed IOVA *only* changes if it's an AMD host, so no change for
	   Intel. We walk the allowed ranges for memory above 4G, and
	   add a E820_RESERVED type everytime we find a hole (which is at the
	   1TB boundary).
	   
	   NOTE: For purposes of this RFC, I rely on cpuid in hw/i386/pc.c but I
	   understand that it doesn't cover the non-x86 host case running TCG.

	   Additionally, an alternative to hardcoded ranges as we do today,
	   VFIO could advertise the platform valid IOVA ranges without necessarily
	   requiring to have a PCI device added in the vfio container. That would
	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
	   ranges as we do today. But sadly, wouldn't work for older hypervisors.

* patch 2 - 5: cover the remaining parts of the surrounding the mem map, particularly
	       ACPI SRAT ranges, CMOS, hotplug as well as the PCI 64-bit hole.

* patch 6: Add a machine property which is disabled for older machine types (<=6.0)
	   to keep things as is.

The 'consequence' of this approach is that we may need more than the default
phys-bits e.g. a guest with 1024G, will have ~13G be put after the 1TB
address, consequently needing 41 phys-bits as opposed to the default of 40.
I can't figure a reasonable way to establish the required phys-bits we
need for the memory map in a dynamic way, especially considering that
today there's already a precedent to depend on the user to pick the right value
of phys-bits (regardless of this series).

Additionally, the reserved region is always added regardless of whether we have
VFIO devices to cover the VFIO device hotplug case.

Other options considered:

a) Consider the reserved range part of RAM, and just marking it as
E820_RESERVED without SPA allocated for it. So a -m 1024G guest would
only allocate 1010G of RAM and the remaining would be marked reserved.
This is not how what we do today for the 4G hole i.e. the RAM
actually allocated is the value specified by the user and thus RAM available
to the guest (IIUC).

b) Avoid VFIO DMA_MAP ioctl() calls to the reserved range. Similar to a) but done at a
later stage when RAM mrs are already allocated at the invalid GPAs. Albeit that
alone wouldn't fix the way MRs are laid out which is where fundamentally the
problem is.

The proposed approach in this series works regardless of the kernel, and
relevant for old and new Qemu.

Open to alternatives/comments/suggestions that I should pursue instead.

	Joao

[1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
[2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf

Joao Martins (6):
  i386/pc: Account IOVA reserved ranges above 4G boundary
  i386/pc: Round up the hotpluggable memory within valid IOVA ranges
  pc/cmos: Adjust CMOS above 4G memory size according to 1Tb boundary
  i386/pc: Keep PCI 64-bit hole within usable IOVA space
  i386/acpi: Fix SRAT ranges in accordance to usable IOVA
  i386/pc: Add a machine property for AMD-only enforcing of valid IOVAs

 hw/i386/acpi-build.c  |  22 ++++-
 hw/i386/pc.c          | 206 +++++++++++++++++++++++++++++++++++++++---
 hw/i386/pc_piix.c     |   2 +
 hw/i386/pc_q35.c      |   2 +
 hw/pci-host/i440fx.c  |   4 +-
 hw/pci-host/q35.c     |   4 +-
 include/hw/i386/pc.h  |  62 ++++++++++++-
 include/hw/i386/x86.h |   4 +
 target/i386/cpu.h     |   3 +
 9 files changed, 288 insertions(+), 21 deletions(-)

-- 
2.17.1


