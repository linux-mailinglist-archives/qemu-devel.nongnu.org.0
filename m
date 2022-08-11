Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6858FD1B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:10:57 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7xf-00040g-TM
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HF-0002fN-Ro; Thu, 11 Aug 2022 08:27:06 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HB-0002Xr-Fg; Thu, 11 Aug 2022 08:27:05 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCMwL2007995;
 Thu, 11 Aug 2022 12:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2022-7-12;
 bh=Xxsqk/xDQZ+ShBcWAvgEqQr6KEYIDwFDna6YBQa2iF0=;
 b=cxv23WMqE7P/6gbAXkXHUUY3udQPg0bDVOLV0sVQTbOVonld7ySf2sspd0l+OWA2obJl
 hnNB/aJIRDvpmlwzxrZbfMN6lbK66PTCvhWaNDlhbh2TeaN/sGbIKegWEGsY1m1wWPzb
 iS3MBz9hQ4DPPuejaZHtOFYW7fzh7uPxPor881FrWjGmBrSgxl31vvY9mv7Xv7zEmM8M
 YRmVzR68AxXn/HgjM6V5U2CvlOkhuccDF/qgXVf9BZ54bqvB2NWx0qVMZWG/W1FtamXe
 P7JxOjz8Ah2qgdXDwqD9P582yoI6/owdVc8M1SKapeUEta8CwkxvWYMf76OxjZIctDdf GA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqj4fub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:41 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B9NVFl020666; Thu, 11 Aug 2022 12:26:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqjk06r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6jjlXYc5kkpXuUdzVjPL7VWBaTpzfuG50jcuPknAoyQmn4vWTD4q8CVDAUunu4jBOij/xc2/RUPgzQjOqZvULdjXwHqV03AHBSsAQjF1VThLVz3+kcfpzzgPRfmRKfKMw8E6vU3Q9j2J5Tpu10JL1eiO2GA1nNintgod3zQKCg1mTmUOi195lkq+WAiShHgGttPwVqGtN+P6Hy0Ra8WxMf7/LhvcFxzryyTHDYsLdRE70W7XUYqXf3yEVLD0zSEWusG8lFrwb+nx0OSREq/ANuqaM2zQvIrL885KejET/TC9WhUNUBgIg62t6GR4hm0i4XE/XMbvpOJAKKsem4MNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xxsqk/xDQZ+ShBcWAvgEqQr6KEYIDwFDna6YBQa2iF0=;
 b=GeyuzB1JmTGOBUKoDNmrF12iQ2l4OYWXBsSqzldqZeRbYxwLVTkCttAaYcLOppOhGDnVW7UxahagJ9bafNo3YIZCXuhZQvi6Mh8Bs6+4wi1s2ulOFvEjFgX9Eug+930zo3yLM9i+Reyl5siTYleeAVyJfNKk8VYIIuyTy/2N5UobhxctuXnLeqnJQsg0DaPgq+yOv0TDzfb/yiQP7vFA+LxERaYN0OjkUWtGNhp7sJERt26ej5/DKeMod+SUWGMwIeLmZip2PjLvzBLMHwS1hae3RZd3PRXlWGT9EVdh8KWnskiruKPKbuPU+Bp/hS/d12WVQd9ya4axypJaZec4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxsqk/xDQZ+ShBcWAvgEqQr6KEYIDwFDna6YBQa2iF0=;
 b=GmtLmjkH70ASDV4Je39NCiVhRc0b/l1ycfvFe8c4NpLGqWXQLs279oTXtPKwfvYh6+6YpGgCHXMAJLW8Om4LRKIyzhwoMSm44Ij26WtzQQ6y6sK0+tXW9CUpqUNI1RBNn18mVa0bmDugK1G7AaE5fx8bCJS3EO9teMHbu+qCHJ0=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM5PR10MB1770.namprd10.prod.outlook.com (2603:10b6:4:c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Thu, 11 Aug 2022 12:26:36 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:36 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 lvivier@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: [PATCH v15 3/6] qmp: decode feature & status bits in virtio-status
Date: Thu, 11 Aug 2022 08:24:41 -0400
Message-Id: <1660220684-24909-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37071b82-1b49-4c4d-bb12-08da7b94bb4c
X-MS-TrafficTypeDiagnostic: DM5PR10MB1770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iw3Lmv/7NqqAP+muWpcGAlqxxZCx4ckNgbfXOMz1Zju1OjE9eG+pPmhw4bZniMH6MA3rXJqoX9sj2lTHYxzCFv9rhkGujQ3Npeb+xm5YlD2QeC2iI1LYdFAEorRZtG3suElgSn4+Jo2s2g3UBQMcXThXhSNXDDtsZeCFsbra8FioNeWzlLwawVShYrVZIM3kIlZEjTeB1kp244Es4QaUJn38g2KUj3dOb9MYfjpvjAIUru3Hp6GmiuBLIeH1Jw2Nz9TqLHW0oRQc/5jQRRwgDRCLaHSmAZQ8wzM7GrnvvrZzGoGaqaoiYdbNDo3s+vhXK8K2wan1FWTS5+4jy/OhjOuMIsEGd4v5WAUV+DivtcsoodRbC6G+DarNS7451ZwIUF2wwINz7LgACOozKqNt900Tpez1LoplqwjVI+f18Q+WyIxHLHLj1hkvN3yKPnCDUXQRPaDFMYxW1ZSWokZoFWiuzNs1y0SG+e4gimrDUUlF4l95rPZpklBqHJesF8HkzmVhcHPUkZIa28AmzNPxyZj5C/alozsevr1yrWMkBZ/UHmQGzB1w5iEQtwJiVdobKwgepdvAE/DjHhAx9YQbfoB3LQRhfeZ/nKrwE+ar+INpEWlwDJEWWDhRI+LiMEKGKPcHFe/8XUkT/PH35tVax1Jk7n9BsC+rAc2kFPttyX97uEGGwt1+Brm2uaL5A6q7F/X6SdfNRS40QOxETDL5yAm4GHuKMlOle8s1dmSO8A0xNmhNdMuYjwUAjq29jPgQTZz7tvs9e3jxARaObqQMqugc59l4jlGusj0qfjx+Exc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(366004)(396003)(39860400002)(6916009)(8936002)(2906002)(186003)(7416002)(44832011)(316002)(30864003)(66556008)(8676002)(4326008)(2616005)(66476007)(5660300002)(66946007)(478600001)(38100700002)(6486002)(6666004)(38350700002)(36756003)(41300700001)(26005)(6512007)(86362001)(6506007)(52116002)(83380400001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?psp83cV0eBRoxNWg37Ob+w7a2J9/7AK4gARvrJa+YZBl2kTk0fGFCTZKKLOE?=
 =?us-ascii?Q?H16oN9LPGA1f27sYYO5dJeot/BsllSFX0t06TMQNfafgnGMGkp/6io7pVvPt?=
 =?us-ascii?Q?N7wUTc/8n2YMKKhAgpXAhYLHr177s2l3XawVyVP2d+9c+NSVPIoQJpPqyaXe?=
 =?us-ascii?Q?RogVSeuHiQho8MiCY2LBJkkNdCDwCzgvj+UnJSdUms/omYO+K0OZTT3DZZdb?=
 =?us-ascii?Q?sBFIFrU+oPDvL/nP0J9ESBmzYmdreG/wp0jmr2u+js1R+AoxTwBhdCYZECGK?=
 =?us-ascii?Q?Ma3bwRULHwK98IWaXwUIboWsowvXJwAPVu7GUvWhlk/ffz+1CSajnRW8SBA6?=
 =?us-ascii?Q?fQ9480AcNdClFq0EgRndfdNGPzZfcVsr7Gy8dbndropYX7GDtNDIJV3TH/aR?=
 =?us-ascii?Q?l46ReJfTUYWRjukJTSn59+FVBv7I40xa2GZND/7J2i/vHfJQUZW5I73nW4c9?=
 =?us-ascii?Q?jFmFziguRjKJbYm9CBJRi63v86kC+XV1BurPKp4qko/LQGZ53jXNqEAzLhtc?=
 =?us-ascii?Q?U6TabZNCpF05OV8xL/NOKfSQS7JSWxw93gGLN144fYYh2i5/hlMu1EaQQqxQ?=
 =?us-ascii?Q?9XsQ+Vmlsb4+K4lx89juxsYCtOjgRDRHz4Dw6SeKUu8ckjqwdWPzJ8PyqpBG?=
 =?us-ascii?Q?Efm2z/liL+Q0khxHO45MrDyK7i3SHUFYdq7Ahx4VTRfYwkN5bwndXJ2yYzUX?=
 =?us-ascii?Q?lnnBDeWTjZZlo0XS434eFlib95y7W5P87/uXEmeMN5U5mJ6NGCPRxR/ETwFp?=
 =?us-ascii?Q?ln96PBsAjy6CeXWzTxnbL14Injv1+tynbIJ4/A1xuwuWH2RnUCmVDrC9Zsu5?=
 =?us-ascii?Q?1gdj+v0FXUONH5qlpi25+igIHN1GuLjfpcG314GbeVfMgCmqOB445sGAAAOt?=
 =?us-ascii?Q?ybm0jQsm8FXiFspB4g5rLA/sKnZZlRzL+HdFElXEOJS6eayYWjICxDmR7CBq?=
 =?us-ascii?Q?xQskZN7uxwXvdjtrpIJyG66o9viHtnpZ/D4/2HK2tSD2kmZti+FvArkDugIu?=
 =?us-ascii?Q?Z9NpYkVuMXkAdrQ6BVpLOA3cmjzVY8zm5juXh6UGOQMp90VXP7wyFPpGCnSE?=
 =?us-ascii?Q?aEjw0DXfE2PJ0/AVH13JBvUJINNugVneHMY4zwCir+AuyrbqCKhFQxeUUqLI?=
 =?us-ascii?Q?64X9mVE3pnjYBITdwqGuaIEjvf5m21ecLEKenuFrkR68RgnUYkOw+FLCkeeq?=
 =?us-ascii?Q?JMdQYxrJ0+exhFXBolz7P9T/9mdesdMP05+X8immadomI3XFuYQBihc/L+ct?=
 =?us-ascii?Q?8MaEbrv+nQc7f7QaUXOBGwb776OG9aUeRIYoC0t3GPJHfjgj2evTwPgCsm46?=
 =?us-ascii?Q?MVENeUolott25EnbiuVpCf+c82813BlO8zmJ2D1bM2TmDuIpPvJLwpeGZBAw?=
 =?us-ascii?Q?giMbs8/225t3WXnqXqJ/huWzURrXP4T28P+7qjP/NwhDa4ddiplr5ZSQZbLD?=
 =?us-ascii?Q?KH/snkW6XbZnGqRervmPz6ILet1DnCmHKsr3j1PjJedGlEOU/Y2L0JdFKUJ0?=
 =?us-ascii?Q?rWcsB8GhNlF3iljKA1W422EmDVjZYJyb0MxD60IM9lnPcqaAuj2ClSH6zkSZ?=
 =?us-ascii?Q?lUIf283tN1ngZFeclxEH2U2+lzfRBGlRc4qkEVPk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37071b82-1b49-4c4d-bb12-08da7b94bb4c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:35.9725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkgCyGtY0gRDptFo053uONsN2HneqVa7A9OVhMZIpN2C++5YAc3Eui0G9aGp1Fv5gPwgZsSTIrLm9h9HfOFIXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1770
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110038
X-Proofpoint-ORIG-GUID: ePgeMYNjUcZpv6SOwbsEXXog0X-rdN21
X-Proofpoint-GUID: ePgeMYNjUcZpv6SOwbsEXXog0X-rdN21
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Laurent Vivier <lvivier@redhat.com>

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevices.

Display status names instead of bitmaps for VirtIODevices.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev->features) for vhost devices.

Decode features according to device ID. Decode statuses
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits (if
any) are stored in a separate field.

[Jonah: Several changes made to this patch from prev. version (v14):
 - Moved all device features mappings to hw/virtio/virtio.c
 - Renamed device features mappings (less generic)
 - Generalized @FEATURE_ENTRY macro for all device mappings
 - Virtio device feature map definitions include descriptions of
   feature bits
 - Moved @VHOST_USER_F_PROTOCOL_FEATURES feature bit from transport
   feature map to vhost-user-supported device feature mappings
   (blk, fs, i2c, rng, net, gpu, input, scsi, vsock)
 - New feature bit added for virtio-vsock: @VIRTIO_VSOCK_F_SEQPACKET
 - New feature bit added for virtio-iommu: @VIRTIO_IOMMU_F_BYPASS_CONFIG
 - New feature bit added for virtio-mem: @VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
 - New virtio transport feature bit added: @VIRTIO_F_IN_ORDER
 - Added device feature map definition for virtio-rng
]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---

 As mentioned in the cover letter, there's a bit of confusion for me here
 regarding a 30 feature bit that I've been seeing in all of the PCI virtio
 devices that I've defined when bringing up a guest. The only 30 feature
 bits that are defined are @VHOST_USER_F_PROTOCOL_FEATURES &
 @VIRTIO_F_BAD_FEATURE.

 Initially, I thought that this must be the vhost-user 'protocol-features'
 feature bit (since the 'bad-feature' bit would mean negotiation is broken),
 but I noticed that this bit was still being set on devices that don't even
 have vhost-user support (e.g. virtio-serial), nor was I using vhost-user on
 any of my virtio devices.

 On closer inspection, with a little printf debugging, I confirmed my
 suspicion that every PCI virtio device *is* in fact having this 'bad-feature'
 feature set. Futhermore, *none* of my devices actually set the
 'protocol-features' feature (which makes sense since I wasn't using
 vhost-user).

 What doesn't make sense to me though is why this 'bad-feature' bit is
 being set at all, as it implies that negotiation has failed for the device.

 In short, I've left out defining the 'bad-feature' feature bit in the
 transport features map to avoid confusion. However, I'm afraid that this may
 cause even more confusion since (1) non-vhost-user-supported devices will
 show 'unknown-dev-features' (e.g. virtio-serial) and (2) vhost-user-supported
 devices (e.g. virtio-net) *not* using vhost-user will show
 @VHOST_USER_F_PROTOCOL_FEATURES when in reality it's
 @VIRTIO_F_BAD_FEATURE.

 Please let me know how you would like me to address this. Thanks.

 hw/virtio/virtio.c         | 643 ++++++++++++++++++++++++++++++++++++-
 include/hw/virtio/vhost.h  |   3 +
 include/hw/virtio/virtio.h |   5 +
 qapi/virtio.json           | 251 +++++++++++++--
 4 files changed, 874 insertions(+), 28 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 3e0a484660..23bdc77a95 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -34,10 +34,433 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
+#include "standard-headers/linux/virtio_blk.h"
+#include "standard-headers/linux/virtio_console.h"
+#include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_net.h"
+#include "standard-headers/linux/virtio_scsi.h"
+#include "standard-headers/linux/virtio_i2c.h"
+#include "standard-headers/linux/virtio_balloon.h"
+#include "standard-headers/linux/virtio_iommu.h"
+#include "standard-headers/linux/virtio_mem.h"
+#include "standard-headers/linux/virtio_vsock.h"
+#include CONFIG_DEVICES
 
 /* QAPI list of realized VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
+/*
+ * Maximum size of virtio device config space
+ */
+#define VHOST_USER_MAX_CONFIG_SIZE 256
+
+#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
+    { .virtio_bit = name, .feature_desc = desc }
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+/* Virtio transport features mapping */
+static qmp_virtio_feature_map_t virtio_transport_map[] = {
+    /* Virtio device transport features */
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
+            "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. "
+            "descs. on VQ"),
+    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
+            "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts"),
+#endif /* !VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
+            "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"),
+    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
+            "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform"),
+    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
+            "VIRTIO_F_RING_PACKED: Device supports packed VQ layout"),
+    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
+            "VIRTIO_F_IN_ORDER: Device uses buffers in same order as made "
+            "available by driver"),
+    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
+            "VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform"),
+    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
+            "VIRTIO_F_SR_IOV: Device supports single root I/O virtualization"),
+    /* Virtio ring transport features */
+    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
+            "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported"),
+    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
+            "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled"),
+    { -1, "" }
+};
+
+/* Vhost-user protocol features mapping */
+static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
+            "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
+            "VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
+            "VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
+            "VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
+            "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
+            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
+            "requests supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
+            "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
+            "devices supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
+            "VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto "
+            "operations supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
+            "VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd "
+            "for accessed pages supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
+            "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
+            "device configuration space supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
+            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
+            "channel supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
+            "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
+            "VQs supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
+            "VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
+            "VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and "
+            "resetting internal device state supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
+            "VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
+            "VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for "
+            "memory slots supported"),
+    { -1, "" }
+};
+
+/* virtio device configuration statuses */
+static qmp_virtio_feature_map_t virtio_config_status_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
+            "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
+            "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
+            "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
+            "VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs "
+            "reset"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
+            "VIRTIO_CONFIG_S_FAILED: Error in guest, device failed"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
+            "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found"),
+    { -1, "" }
+};
+
+/* virtio-blk features mapping */
+qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
+            "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
+            "VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
+            "VIRTIO_BLK_F_GEOMETRY: Legacy geometry available"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
+            "VIRTIO_BLK_F_RO: Device is read-only"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
+            "VIRTIO_BLK_F_BLK_SIZE: Block size of disk available"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
+            "VIRTIO_BLK_F_TOPOLOGY: Topology information available"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
+            "VIRTIO_BLK_F_MQ: Multiqueue supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
+            "VIRTIO_BLK_F_DISCARD: Discard command supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
+            "VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported"),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
+            "VIRTIO_BLK_F_BARRIER: Request barriers supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
+            "VIRTIO_BLK_F_SCSI: SCSI packet commands supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
+            "VIRTIO_BLK_F_FLUSH: Flush command supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
+            "VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes "
+            "supported"),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-serial features mapping */
+qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
+            "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
+            "VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported"),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
+            "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
+    { -1, "" }
+};
+
+/* virtio-gpu features mapping */
+qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
+            "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
+            "VIRTIO_GPU_F_EDID: EDID metadata supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
+            "VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
+            "VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
+            "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
+            "timelines supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-input features mapping */
+qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-net features mapping */
+qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
+            "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
+            "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial "
+            "checksum supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
+            "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading "
+            "reconfig. supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
+            "VIRTIO_NET_F_MTU: Device max MTU reporting supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
+            "VIRTIO_NET_F_MAC: Device has given MAC address"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
+            "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
+            "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
+            "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
+            "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
+            "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
+            "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
+            "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
+            "VIRTIO_NET_F_HOST_UFO: Device can receive UFO"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
+            "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"),
+    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
+            "VIRTIO_NET_F_STATUS: Configuration status field available"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
+            "VIRTIO_NET_F_CTRL_VQ: Control channel available"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
+            "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
+            "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
+            "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
+            "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
+            "VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
+            "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control "
+            "channel"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
+            "VIRTIO_NET_F_HASH_REPORT: Hash reporting supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
+            "VIRTIO_NET_F_RSS: RSS RX steering supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
+            "VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
+            "VIRTIO_NET_F_STANDBY: Device acting as standby for primary "
+            "device with same MAC addr. supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
+            "VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex"),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
+            "VIRTIO_NET_F_GSO: Handling GSO-type packets supported"),
+#endif /* !VIRTIO_NET_NO_LEGACY */
+    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
+            "VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX "
+            "packets supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-scsi features mapping */
+qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
+            "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
+            "buffers suppoted"),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
+            "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
+            "VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
+            "VIRTIO_SCSI_F_T10_PI: T10 info included in request header"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio/vhost-user-fs features mapping */
+qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio/vhost-user-i2c features mapping */
+qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
+            "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio/vhost-vsock features mapping */
+qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
+            "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-balloon features mapping */
+qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
+            "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
+            "pages"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
+            "VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
+            "VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
+            "VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
+            "VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
+            "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
+    { -1, "" }
+};
+
+/* virtio-crypto features mapping */
+qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    { -1, "" }
+};
+
+/* virtio-iommu features mapping */
+qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
+            "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
+            "available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
+            "VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains "
+            "available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
+            "VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
+            "VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in "
+            "bypass mode"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
+            "VIRTIO_IOMMU_F_PROBE: Probe requests available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
+            "VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
+            "VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config "
+            "available"),
+    { -1, "" }
+};
+
+/* virtio-mem features mapping */
+qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifndef CONFIG_ACPI
+    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
+            "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
+#endif /* !CONFIG_ACPI */
+    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
+            "VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be "
+            "accessed"),
+    { -1, "" }
+};
+
+/* virtio-rng features mapping */
+qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3975,6 +4398,203 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
+    ({                                                   \
+        type *list = NULL;                               \
+        type *node;                                      \
+        for (i = 0; map[i].virtio_bit != -1; i++) {      \
+            if (is_status) {                             \
+                bit = map[i].virtio_bit;                 \
+            }                                            \
+            else {                                       \
+                bit = 1ULL << map[i].virtio_bit;         \
+            }                                            \
+            if ((bitmap & bit) == 0) {                   \
+                continue;                                \
+            }                                            \
+            node = g_new0(type, 1);                      \
+            node->value = g_strdup(map[i].feature_desc); \
+            node->next = list;                           \
+            list = node;                                 \
+            bitmap ^= bit;                               \
+        }                                                \
+        list;                                            \
+    })
+
+static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status->statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
+                                        1, bitmap);
+    status->has_unknown_statuses = bitmap != 0;
+    if (status->has_unknown_statuses) {
+        status->unknown_statuses = bitmap;
+    }
+
+    return status;
+}
+
+static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
+{
+    VhostDeviceProtocols *vhu_protocols;
+    uint64_t bit;
+    int i;
+
+    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
+    vhu_protocols->protocols =
+                    CONVERT_FEATURES(strList,
+                                     vhost_user_protocol_map, 0, bitmap);
+    vhu_protocols->has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols->has_unknown_protocols) {
+        vhu_protocols->unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+    features->has_dev_features = true;
+
+    /* transport features */
+    features->transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
+                                            bitmap);
+
+    /* device features */
+    switch (device_id) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_ID_CONSOLE:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_ID_BLOCK:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_ID_GPU:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_ID_NET:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_ID_SCSI:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_ID_BALLOON:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_ID_IOMMU:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_ID_INPUT:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_ID_FS:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_ID_VSOCK:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_ID_CRYPTO:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_MEM
+    case VIRTIO_ID_MEM:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+    case VIRTIO_ID_I2C_ADAPTER:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_RNG
+    case VIRTIO_ID_RNG:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_ID_9P:
+    case VIRTIO_ID_PMEM:
+    case VIRTIO_ID_IOMEM:
+    case VIRTIO_ID_RPMSG:
+    case VIRTIO_ID_CLOCK:
+    case VIRTIO_ID_MAC80211_WLAN:
+    case VIRTIO_ID_MAC80211_HWSIM:
+    case VIRTIO_ID_RPROC_SERIAL:
+    case VIRTIO_ID_MEMORY_BALLOON:
+    case VIRTIO_ID_CAIF:
+    case VIRTIO_ID_SIGNAL_DIST:
+    case VIRTIO_ID_PSTORE:
+    case VIRTIO_ID_SOUND:
+    case VIRTIO_ID_BT:
+    case VIRTIO_ID_RPMB:
+    case VIRTIO_ID_VIDEO_ENCODER:
+    case VIRTIO_ID_VIDEO_DECODER:
+    case VIRTIO_ID_SCMI:
+    case VIRTIO_ID_NITRO_SEC_MOD:
+    case VIRTIO_ID_WATCHDOG:
+    case VIRTIO_ID_CAN:
+    case VIRTIO_ID_DMABUF:
+    case VIRTIO_ID_PARAM_SERV:
+    case VIRTIO_ID_AUDIO_POLICY:
+    case VIRTIO_ID_GPIO:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features->has_unknown_dev_features = bitmap != 0;
+    if (features->has_unknown_dev_features) {
+        features->unknown_dev_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3990,9 +4610,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->name = g_strdup(vdev->name);
     status->device_id = vdev->device_id;
     status->vhost_started = vdev->vhost_started;
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->device_id,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->device_id,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->device_id,
+                                                   vdev->backend_features);
 
     switch (vdev->device_endian) {
     case VIRTIO_DEVICE_ENDIAN_LITTLE:
@@ -4007,7 +4630,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     }
 
     status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = vdev->status;
+    status->status = qmp_decode_status(vdev->status);
     status->isr = vdev->isr;
     status->queue_sel = vdev->queue_sel;
     status->vm_running = vdev->vm_running;
@@ -4030,10 +4653,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
         status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
         status->vhost_dev->nvqs = hdev->nvqs;
         status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features = hdev->features;
-        status->vhost_dev->acked_features = hdev->acked_features;
-        status->vhost_dev->backend_features = hdev->backend_features;
-        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->device_id, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->device_id, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->device_id, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
         status->vhost_dev->max_queues = hdev->max_queues;
         status->vhost_dev->backend_cap = hdev->backend_cap;
         status->vhost_dev->log_enabled = hdev->log_enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a346f23d13..1f6655e149 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -5,6 +5,9 @@
 #include "hw/virtio/virtio.h"
 #include "exec/memory.h"
 
+#define VHOST_F_DEVICE_IOTLB 63
+#define VHOST_USER_F_PROTOCOL_FEATURES 30
+
 /* Generic structures common for any vhost based device. */
 
 struct vhost_inflight {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 375eb5671b..69025f2914 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -71,6 +71,11 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+typedef struct {
+    int virtio_bit;
+    const char *feature_desc;
+} qmp_virtio_feature_map_t;
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index c86b3bc635..c9c8201e66 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -106,10 +106,10 @@
             'n-tmp-sections': 'int',
             'nvqs': 'uint32',
             'vq-index': 'int',
-            'features': 'uint64',
-            'acked-features': 'uint64',
-            'backend-features': 'uint64',
-            'protocol-features': 'uint64',
+            'features': 'VirtioDeviceFeatures',
+            'acked-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
+            'protocol-features': 'VhostDeviceProtocols',
             'max-queues': 'uint64',
             'backend-cap': 'uint64',
             'log-enabled': 'bool',
@@ -176,11 +176,11 @@
             'device-id': 'uint16',
             'vhost-started': 'bool',
             'device-endian': 'str',
-            'guest-features': 'uint64',
-            'host-features': 'uint64',
-            'backend-features': 'uint64',
+            'guest-features': 'VirtioDeviceFeatures',
+            'host-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
             'num-vqs': 'int',
-            'status': 'uint8',
+            'status': 'VirtioDeviceStatus',
             'isr': 'uint8',
             'queue-sel': 'uint16',
             'vm-running': 'bool',
@@ -222,14 +222,41 @@
 #          "name": "virtio-crypto",
 #          "started": true,
 #          "device-id": 20,
-#          "backend-features": 0,
+#          "backend-features": {
+#              "transports": [],
+#              "dev-features": []
+#          },
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#              "statuses": [
+#                  "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found",
+#                  "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device",
+#                  "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete",
+#                  "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"
+#              ]
+#          },
 #          "num-vqs": 2,
-#          "guest-features": 5100273664,
-#          "host-features": 6325010432,
+#          "guest-features": {
+#              "dev-features": [],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
+#              ]
+#          },
+#          "host-features": {
+#              "unknown-dev-features": 1073741824,
+#              "dev-features": [],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                  "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                  "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#              ]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 1,
@@ -257,22 +284,147 @@
 #              "max-queues": 1,
 #              "backend-cap": 2,
 #              "log-size": 0,
-#              "backend-features": 0,
+#              "backend-features": {
+#                  "dev-features": [],
+#                  "transports": []
+#              },
 #              "nvqs": 2,
-#              "protocol-features": 0,
+#              "protocol-features": {
+#                  "protocols": []
+#              },
 #              "vq-index": 0,
 #              "log-enabled": false,
-#              "acked-features": 5100306432,
-#              "features": 13908344832
+#              "acked-features": {
+#                  "dev-features": [
+#                      "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"
+#                  ],
+#                  "transports": [
+#                      "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                      "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                      "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
+#                  ]
+#              },
+#              "features": {
+#                  "dev-features": [
+#                      "VHOST_F_LOG_ALL: Logging write descriptors supported",
+#                      "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"
+#                  ],
+#                  "transports": [
+#                      "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                      "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                      "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform",
+#                      "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                      "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                      "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#                  ]
+#              }
+#          },
+#          "backend-features": {
+#              "dev-features": [
+#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
+#                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
+#                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
+#                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
+#                  "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported",
+#                  "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported",
+#                  "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported",
+#                  "VIRTIO_NET_F_CTRL_VQ: Control channel available",
+#                  "VIRTIO_NET_F_STATUS: Configuration status field available",
+#                  "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers",
+#                  "VIRTIO_NET_F_HOST_UFO: Device can receive UFO",
+#                  "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN",
+#                  "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6",
+#                  "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4",
+#                  "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO",
+#                  "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN",
+#                  "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6",
+#                  "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4",
+#                  "VIRTIO_NET_F_MAC: Device has given MAC address",
+#                  "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading reconfig. supported",
+#                  "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial checksum supported",
+#                  "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum supported"
+#              ],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                  "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                  "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#              ]
 #          },
-#          "backend-features": 6337593319,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#              "statuses": [
+#                  "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found",
+#                  "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device",
+#                  "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete",
+#                  "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"
+#              ]
+#          },
 #          "num-vqs": 3,
-#          "guest-features": 5111807911,
-#          "host-features": 6337593319,
+#          "guest-features": {
+#              "dev-features": [
+#                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
+#                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
+#                  "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported",
+#                  "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported",
+#                  "VIRTIO_NET_F_CTRL_VQ: Control channel available",
+#                  "VIRTIO_NET_F_STATUS: Configuration status field available",
+#                  "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers",
+#                  "VIRTIO_NET_F_HOST_UFO: Device can receive UFO",
+#                  "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN",
+#                  "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6",
+#                  "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4",
+#                  "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO",
+#                  "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN",
+#                  "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6",
+#                  "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4",
+#                  "VIRTIO_NET_F_MAC: Device has given MAC address",
+#                  "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading reconfig. supported",
+#                  "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial checksum supported",
+#                  "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum supported"
+#              ],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
+#             ]
+#          },
+#          "host-features": {
+#              "dev-features": [
+#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
+#                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
+#                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
+#                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
+#                  "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported",
+#                  "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported",
+#                  "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported",
+#                  "VIRTIO_NET_F_CTRL_VQ: Control channel available",
+#                  "VIRTIO_NET_F_STATUS: Configuration status field available",
+#                  "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers",
+#                  "VIRTIO_NET_F_HOST_UFO: Device can receive UFO",
+#                  "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN",
+#                  "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6",
+#                  "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4",
+#                  "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO",
+#                  "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN",
+#                  "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6",
+#                  "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4",
+#                  "VIRTIO_NET_F_MAC: Device has given MAC address",
+#                  "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading reconfig. supported",
+#                  "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial checksum supported",
+#                  "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum supported"
+#              ],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                  "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                  "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#             ]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 2,
@@ -288,3 +440,62 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the configuration statuses of a virtio
+# device
+#
+# @statuses: List of decoded configuration statuses of the virtio
+#            device
+#
+# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
+#
+# Since: 7.1
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': { 'statuses': [ 'str' ],
+            '*unknown-statuses': 'uint8' } }
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @protocols: List of decoded vhost user protocol features of a vhost
+#             user device
+#
+# @unknown-protocols: Vhost user device protocol features bitmap that
+#                     have not been decoded
+#
+# Since: 7.1
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+  'data': { 'protocols': [ 'str' ],
+            '*unknown-protocols': 'uint64' } }
+
+##
+# @VirtioDeviceFeatures:
+#
+# The common fields that apply to most Virtio devices. Some devices
+# may not have their own device-specific features (e.g. virtio-rng).
+#
+# @transports: List of transport features of the virtio device
+#
+# @dev-features: List of device-specific features (if the device has
+#                unique features)
+#
+# @unknown-dev-features: Virtio device features bitmap that have not
+#                        been decoded
+#
+# Since: 7.1
+##
+
+{ 'struct': 'VirtioDeviceFeatures',
+  'data': { 'transports': [ 'str' ],
+            '*dev-features': [ 'str' ],
+            '*unknown-dev-features': 'uint64' } }
-- 
2.31.1


