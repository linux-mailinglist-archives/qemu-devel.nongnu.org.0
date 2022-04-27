Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A375113B5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:44:07 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdHK-0003w6-5e
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4V-0005Ha-US
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4R-0005vl-1u
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:49 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R63tYk018591;
 Wed, 27 Apr 2022 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=DspXsKZNXmo2/rCGCBj6kmSyCTVknJ40KrJIjBAAXjI=;
 b=B+5TsiZb4RYHS2uI/KKKgT6qONQZxmgdI863G6XO5L0llTcPrufAlE1v3UVp/8cRWmdI
 rtWQrAxUOBlod0h/ho6W0BnPSaNReODM1gi6WE2c8dlbakjrJtXuwnFWS3Ykzbaw19XZ
 XScC/D6+rghNy/2ltbcWvyDvYQs2JqKfP8nZ4c/MuTOhVUNd9YmFy5mTJqo/LBNW5pe+
 HBQnsAlE79PSiKTRQ8umpMTLaemM+KpRso8xH2Xk44yFcwv1pHC0g5XvTezBFJqt5QOW
 J0d+5AH8/dKFUIlRVyjZZf3+KULMcyqsz61M9LRW4A5kSfGsXI/89AgFW0jnHGf+Qsi8 Rg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb5k0b0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:42 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8UfWA030459; Wed, 27 Apr 2022 08:30:42 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ykf12n-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1EfaISOhHI/psgPO0uQngeBiZBiXxmGzsJnRpJ1vNmiX8Alxz/im+TTAuVg6kEgzkiI6hEThB4dB9lwprKSsCbzy/1KLWMhcJLnEtGQjMiiIttfAvwBtWRFyXryxetL46XwbbzZomZpwUpT72XRtVp9vVfwKwyX8jgyVo/7fcxiFQKSdvAQHCQ4tlhGe8jFQFSc3MEazxcpNuF+xDykTVPdGtedDPR2/o9VlqHDCq3gEhcKloq+XM1z8+OlRftuUwadcLo/Jqdv4KNpjy95tYmYjyn0o1Jig0tajUIGVAY1tSZUDAVjm4g6ef7dbYWhcvPBL71AGiTOQolRzTOiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DspXsKZNXmo2/rCGCBj6kmSyCTVknJ40KrJIjBAAXjI=;
 b=WqOMzdfGjN0vg15CkZjhcoOwziq9d98jRmVIWCN9FxhkO72KLW0Jhr47ege5Z+ufBEwSVrV4gOh/20/ZGBz9i9XqfUGkt4bI3y1EDl1zt42EVfmUrpBvT97IpNW1TjRNsgKHohnPhZNaoEcIgu8lHAerU7o2RDGRPl/j3S3av1oCsEV7mLWcZOIJsPwkOTpa1XwgHvHhXeCsxrzT/AiFgWgzwGkaF5hptramnWhYgCIMTCv4m+O06EQXYF1xeJirEnXIMs2iQj6kdwm9/zCVt5P8vBFUSLfpwuB9ZAYRROff5hqGfrTagQO6dZvFAj4C+tLputBBeGt++PeVyozJtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DspXsKZNXmo2/rCGCBj6kmSyCTVknJ40KrJIjBAAXjI=;
 b=gFb/JoyzP6Kb7QyfuavtMn7ZnJeJCt02P+oBLG5dXBcc9lR3Qo6vbGlpNRCTYWZCz/xSsg5/3FVjctDXzD9s5ZK6rRt+ajylvAk40HNnMbcQSDleySbWWTS3qsSQ1/zBARCRe9bY96m93+iYNHLEIU9bgppeWFQA70UhpyaXPds=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:35 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:35 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Date: Wed, 27 Apr 2022 01:30:13 -0700
Message-Id: <1651048216-3365-3-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00f08e0c-700a-4f98-b067-08da2828333b
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB20072D3765238F9CBD9995F4B1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZo36sGY8siID90RjelqvuknT8fAjQmhewgPP25WpaYp17RlmbAjQ7rqVsW/HVPrvRmI/HF7JU55w7cYw4/f7QgvBv6Q4YEeyctsK8TqVk9OzQRj4Fnnz3FRhrrN7Iy2qUwyU/mWTdosV22XOmZsX23j1Fnz1DAzrhdvBnh0w2xMTJvHOHzbgQq+QKnBSwOfmrzziAKVidtNdrUqBbNVN05w1AhUzXdQdbSJz7VO66/rAyPVav7pQoOlx3vznCPpim+b21+DVVq47r+G+F/99vppSEnO7OSwEfJq25O0aBlNMV2IZ5SG0m1rOq5SIQmDnkNf3ftIEXn7K+Wm6GLvbdrf4ztWURx3N5WJaS9qqg/CgXbQBhexm49y5cNVDeLSBskVxFtXmJ6mBu5W8RjkMnrGDQQRUVACNjFw9QJMlSKoho29tWI/XhJ2XS6i5Gqyxvt5kxkKTqnbuI+yDzU/GPDNGTWdihhEKu7Dy214TEJ9ZOLd6YMOlHITTjhAvi4hD+4CCTmoETStlhVDY9XxEWr98sOD57EsUjYy8OsMVCO0AD25xUvG0iCR6m3QFN2GFwrza9WlLB2Zm2qRwWMpZKFE/XqxCklqp8+F5n/z3FyBPtGhSL7F5xTrrIMbiwky5W+t5CeVRm9Y+rsHOb5icc0zzqueNLBhWqndHnY6R/sUm18wPsTDECwe5i3IXTETDDLVtCTE8+CP7qIbkjEB6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(36756003)(2906002)(316002)(508600001)(38100700002)(107886003)(4326008)(6666004)(6506007)(6512007)(52116002)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(6916009)(86362001)(5660300002)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WN8wkuGV1a0e79fHlgbmzd/3es3zR5UwT91GQk+UeFdw8Qpw5+w52+y0hy/a?=
 =?us-ascii?Q?WIn0PGtm2MJBetNf31n443tUYG1VL5WmWD6Q4wA7g+dLozdqvgGI9MBUtq08?=
 =?us-ascii?Q?QuIFzNl1pKFypalOlCqgwjQelyJeGrL5GsN6q0sLfQ9VJLENzgEebdoA679d?=
 =?us-ascii?Q?U+Htl/+uHPvi7FafECV1BU5Trqfu57LhO3Y/9M2vd8U0bXufTqQ6mx0lkmsI?=
 =?us-ascii?Q?7pIYFw5clhpml/b9zyBQfMjobgrBwwec0mk4rjpU7dycQkw/v1eBL7HNmDMW?=
 =?us-ascii?Q?ATU0pqYt4baao+P8cN53ZZePANEpqRUkHxJ8HzydH9EM+A/rR6Q2eLqRVgpm?=
 =?us-ascii?Q?6NgneIdZGnw6dO/srUBfhSlc88U7yF1g7veMADJpl2SuRnI1hwSr9gmFHgyq?=
 =?us-ascii?Q?MVVf1MUr3MLmfKY6TgKkQvZWqJxHQCQYABhl/HnDDLRseQl0l0prYyBIci5D?=
 =?us-ascii?Q?w3B5/U71RJfOnUlg+tP8MT5iUEQ7UKeYxhlp8xWjYexq21MwNrntLgk+V9M7?=
 =?us-ascii?Q?1B037pQ4KWXxxWsPAk7DGWk6tekJnSkgsEGP4lQ4OGLDxoI01jtToaCpsU6K?=
 =?us-ascii?Q?kjs0JFBEIUrTfWF/B9vAOKYenbNp/akC1BtH4XjJ5c49nCWoRofa8kyAYrT0?=
 =?us-ascii?Q?kkIkBB98NRd+e+td0u/23Pm9swBEoG9tAso1emI5EBA4F597HqGOlT3lItzU?=
 =?us-ascii?Q?jrXQJ5NYK1bQUaz22w5EPqNjfOMznG7q8C+zyqYvXXtgGywKx+NSSQ7C/Cp9?=
 =?us-ascii?Q?yvORziCjz5IFRvMivHtO234JdjXPcJ1yFtfpivW8/YudJR7tdG5miSisy5kB?=
 =?us-ascii?Q?a7HIg8W74CAiuGnFB3Ob7eL4NrI1dJWGL4viFdHQstaEs1EaSqyp0qQVON2W?=
 =?us-ascii?Q?i6CXfo8x+d5tyIRxChScTT2ByXOJT2GzdxeG3MY9yhQC950xM0UpIIwCG9ti?=
 =?us-ascii?Q?42qhKBoOlhoLCl13Ec/Fjvf3rGZlts7LJbBacxUwd4Z+KXgn9LJkLUsmzMDD?=
 =?us-ascii?Q?0T+DtHWNYQvXfw0001n2IoyWiKoKzGPEez0PRZofhxsuEewL9kcUMFEdkXGH?=
 =?us-ascii?Q?FOrqXJOgBhcvDpeKJ27Vze6z6GUXRBd3d60O5yiFo1LVFpVDRzN2v7Hf2rNw?=
 =?us-ascii?Q?BLIaj0+kXshXpJqFEpy2mZWx/350nGLZavxfvDfxbyPoxG9Vu7IBL5jcW0NS?=
 =?us-ascii?Q?Q9BuVhoxFtSdcLHjD4RoJxrN6gI9WVDaInesdcg3kNZ/fA119YbTGbafK8cO?=
 =?us-ascii?Q?ZA2Z6Ti0JBGMZAGq8JyVBu+AEXvPBpXeQURhtYp2ChfpxWmI67kDYNIXkI/B?=
 =?us-ascii?Q?2mjKRNXXqg4Hz2jUAuegWZr64dYtCgunaCx0i9dshSDnR7gINstY2zpkf7wO?=
 =?us-ascii?Q?hiU3kN40UwoNkJEsxC98bfhyo3d6TJh9yIUEllKSDPW7J2b8n9RONf2FnDnZ?=
 =?us-ascii?Q?aIDTMtu18vb9Y0nb4+OGFjnoyYeaxnfCq4/UnP70/bkGYPiUc5qjfxGFi9e0?=
 =?us-ascii?Q?aPbUanbxjaZE975tatWy5F6x6dHPqjFdxl6IgVghmYSwNyFZ45HWzlEUi4TX?=
 =?us-ascii?Q?Yiqt78s4oJG3gm5uGrV4ko84jy6XS34nkmursZfpgT5GFeBmOPicr/i+zx+J?=
 =?us-ascii?Q?O1ZHEoG0K1q5eK4M1qPBfdknY5WW8QP9Ap3s8rq4BXP9bQR8UmeMy2Fuxkhl?=
 =?us-ascii?Q?GpL5GhhnULCG7bXFY2hIfRlFRh+yjdXVXHwHTsA/AY7XDg5rgE6GLi4jX9Np?=
 =?us-ascii?Q?ugtj34qRy0gwhj0gG6qhtlzFvtXwo5E=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f08e0c-700a-4f98-b067-08da2828333b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:35.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XW4Kbkw14CTh2t05G5aQ4i972m999ja1JmxkJOaQ3TQM6Wqk0cq8p0P+9bpN7C6MBsv4nDzm9ct5qGrcb1RIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270056
X-Proofpoint-GUID: F8TBjAg4OSyYiE8rUzYUh-y-ojQUGfCQ
X-Proofpoint-ORIG-GUID: F8TBjAg4OSyYiE8rUzYUh-y-ojQUGfCQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com, eli@mellanox.com,
 si-wei.liu@oracle.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With MQ enabled vdpa device and non-MQ supporting guest e.g.
booting vdpa with mq=on over OVMF of single vqp, below assert
failure is seen:

../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.

0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
   at ../hw/virtio/virtio-pci.c:974
8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
   at ../hw/net/vhost_net.c:361
10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
   at ../softmmu/memory.c:492
15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
   at ../softmmu/memory.c:1504
17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
   at ../softmmu/physmem.c:2914
20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
   attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6

The cause for the assert failure is due to that the vhost_dev index
for the ctrl vq was not aligned with actual one in use by the guest.
Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
if guest doesn't support multiqueue, the guest vq layout would shrink
to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
This results in ctrl_vq taking a different vhost_dev group index than
the default. We can map vq to the correct vhost_dev group by checking
if MQ is supported by guest and successfully negotiated. Since the
MQ feature is only present along with CTRL_VQ, we make sure the index
2 is only meant for the control vq while MQ is not supported by guest.

Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
---
 hw/net/virtio-net.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ffb3475..8ca0b80 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3171,8 +3171,17 @@ static NetClientInfo net_virtio_info = {
 static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
+           error_report("virtio-net: bogus vq index ignored");
+           return false;
+        }
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
 
@@ -3180,8 +3189,17 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
                                            bool mask)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    NetClientState *nc;
     assert(n->vhost_started);
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
+           error_report("virtio-net: bogus vq index ignored");
+           return;
+        }
+        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
+    } else {
+        nc = qemu_get_subqueue(n->nic, vq2q(idx));
+    }
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
                              vdev, idx, mask);
 }
-- 
1.8.3.1


