Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9B48BC15
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 01:57:27 +0100 (CET)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Rx9-0003gB-17
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 19:57:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdg-0000pQ-Tk
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7RdW-0005fi-Ik
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:20 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMTaJU005856
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=4Dl7my6j5h8upH95io0IVNSqX5mCejyX9FCYVtdG4Ko=;
 b=yjpAJQ3mDMsnuNciTfLaWldhRuUt20qJceXvkSJTSIpYcyCcGiFIQ1iwLH3GFGbSijhm
 Xi8vHx4f/FiCvJEf/0NBnCj0YAnz06zwsUTrWjwaC0Ny0TvPtfX6+juSnMqvLXIZazYQ
 BMCLK8Rq7SSFwJlbkc5paUPPaajeu3fEjzf5yLiY/pBfUTFnYT+FVBP+5hvtxrF9kq1r
 5/PEVGRvFc7rSjVd+bNyirM5vVQaVPKd6RRJ1mmR5zi11ZFkOvIWWw7gK2alOke7pYpD
 vMcBmV9rGtkFfvG0htynY6BKPFdjMGBWhdOB1frZTjW229PXVlwE7+nlMtIiEFxdL3sO tg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgd1tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KATY069271
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by userp3030.oracle.com with ESMTP id 3deyqy1gju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWV+St0frL7vlECIT+cGEaRYxKZDl51dLQUGEHWFF519mvwkHEVcpa1KR7/q7VVPLqGYK9YvCoY9ie6rnxckF2M2DGGvRBz/++5ytNiB5i48D0Tt7GIr4mDJjFHcALguX57QdBcBR2jbPSrFvEMJpYBqJSjkf+rqjn+dW6etQUCfDeQInC7gaVsiIhLf6oPH0MxBUvp7yZOrV0UxGUzPgsv2o41/9HmJLPY+RNMmd2vLjQ4IvcrmEVc7tnQ5rLu3+j5+jjCa18We6/Ikezs4qFukCZpBOEse3aEPZ0N/TzLZ5gWKhc+HJnPl7xDMtAQsWnO/vJfpLvoMIl0aDL03tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Dl7my6j5h8upH95io0IVNSqX5mCejyX9FCYVtdG4Ko=;
 b=TTrhoiujDZEHNfT1WH7Da3nAI3GwIGWYx9HVVZvQ8OO2QSGLkqcegkQGATcqVbWtzTcaGrnH/+FhQoDaBYVbOQR/8h9X4Gc7xslE7iyA0HkVVXleymACCAZO7K+Zlu6AFJ6UfddNmoEjvMTBWnIQjHAdR95HaoapuNrHLSlTR2COiVWl92/a9ND2gtu7d1WpzNrtBiGTNkuV9lp/KQmH8IJT/gwML73dFvoQ446WxQHuZgbUE2xeW7S/qHALquDH6Wh/t8dmMgjRTiXArLjGXcH5oJaCl1DCpIUKKCToCwBnZOEYXVOIZMRbubyqZVNaLkMld6Sc7fEmhvnHd4C9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dl7my6j5h8upH95io0IVNSqX5mCejyX9FCYVtdG4Ko=;
 b=EbEqIZyDdUISGVAlQHX1sBjUYH383osEphp33JgN5R1GOPilRJZx4Bt3SPBHi+mJSa5v99SZ0MwR/XhrTOcz6XcnNUUD6bhtxmXJEfDN58m9ySL5this1mWG+GileF20+nBkEGlCj0lCGqiJtqqkgu9bOwd0IOboJXAi2o25m+s=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 12 Jan
 2022 00:37:03 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:02 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 00/21] vfio-user client
Date: Tue, 11 Jan 2022 16:43:36 -0800
Message-Id: <cover.1641584316.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d97a88ae-c6a3-449f-6022-08d9d563a6dc
X-MS-TrafficTypeDiagnostic: PH7PR10MB5813:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB581392662D053B572AFB605FB6529@PH7PR10MB5813.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sfZqqENcUO56zXrLHwZiemv10wuo7X3wyzShVKvziEr/CCC91mYKYosCGJ8Sy/iU8cBN6+Vh2K3YGjcIxMTzf9SGZmAiYWIGf7qsYNfDQGlSo7kDD6b6hubFRGAvzlCmZeb9z9rF2B0ZuhsDeZi+wbyzAq1yTNtqR42CoM1BzyvpxqiXVPWeUrHiWRyEZkRKBL+lcrRYa1tNBUyIxfVQTVFL/iesfdhrQdzxQXzJTkO7QcjT26muIcVVsTWEJ/UhIqPKFFxghxLystdHmA73/R/Y/Enjxf2hqSVMaLXurnkB5hPEb1Qy0Tb43EHE6BFj1GWyO1fJErsDk46ZiX34R4jE0ZcRS5y74T8eU5FqgftB+MulV4TJjI8FWPUcua++tp22YN5gIS/MLzdd+OUnzv4Lw5aJ+vxqA6lZkp6E4fgyh4QsJxGdf+1DKUqeZXKRsdg+9E8bJ2W4fGbGAFUqUZa6j76Oluj7WDJzEX7YMaPBETDhl3ZUhvkhY/wKcn1QFvj9nx8nfuS/1DPDqDMPinoMnszOuhCOgEgejC4GTdroaAylGdAJW9doF8skhfdlsWs0lDIUZblPuw0zlzzCXzqpSVReFNz2vtOAHZXAF6x9NcZOqvyhwu0mZBDZCub8mF+kPqXDsLPw0UDrKRMovTGrj2DA+mv4xxOKT8G+E//60lHKCFevfDqRoy037PeExjdeBxvpfM8dbum5vqPyV6nfaXnnx8GSQkRTA6TTAV29K2dbDB0X+XXKOHa9eK0rugGj0j8L87bu/Jf/FI90lO1ZCNOX6RXfZIdxXEFF7DA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6506007)(8936002)(26005)(6512007)(36756003)(186003)(8676002)(52116002)(6666004)(86362001)(6916009)(6486002)(316002)(508600001)(2616005)(83380400001)(66946007)(5660300002)(38100700002)(66556008)(38350700002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N54Ni9+ktOL+A7iO4xXq+X9E3HjpvnUG0Yxwg1w5T33LLAxs27CS29kJlQD6?=
 =?us-ascii?Q?QCYlsFA2sluXG//izgm9fooHSD6mgZC6L2uYN1V4rM0qlYmxKUT95w/ZPwya?=
 =?us-ascii?Q?V9wK6P9ZBfvP2x/e/H5LhpYEkKKoLMH7R2i83j1/lZYEyE2TjX1pFbn4/z9O?=
 =?us-ascii?Q?cfopxSOyjdPLjKEZMYNrQXig8APAGkPiV3Xjzaf59rygEfAGlU1ZAJX1/Tu9?=
 =?us-ascii?Q?mlfTRK6F22oAi3H4oPmh8xATX427F4DxiaooXFk5VjTF/2P+N3CvPYLHDZJg?=
 =?us-ascii?Q?s23eL+8OB5lnsGb1SoWNTgx2+z8DAfZeWm5KeFtK1bQemQZ74O56BvtiirKS?=
 =?us-ascii?Q?uNYdANNY0liqKh7ZJngbApt1C5zUrRZjhOQl5CUyBqAzUiiyq4Ck5N3uuotU?=
 =?us-ascii?Q?hnKOiwbIZy7Fe8TMD6jnJiq4e6uR10yvywFvKml7B2H35N3BdUSYuAvRY4jM?=
 =?us-ascii?Q?1ZkSlEwbNGyeTKa7spwnaUnhqdwQ2SJewGh5F7BMEgbd4VS60ctv1SGxBLX7?=
 =?us-ascii?Q?rCIBd+LKIVGTgB0GcXRqlb3iknQ/BXOsHvbLwEdeLpRqqJ8kzLhgILy7XEFu?=
 =?us-ascii?Q?nDCN74GbzrQWPbMnGBw7ScN0Fq00wIMmLefDCMcM/GxqrOKdU8BZ1BqMr52N?=
 =?us-ascii?Q?O//q5VpxaCGxFRHS55Vzdr5QiWiF0eybvAnlnuhyQdItgDUvqyqGwQ8JyQNm?=
 =?us-ascii?Q?yFwlzscho4iLHoTCXHdAUb2lSCjZvT/O0Ro6QU/Ifc5UL9I44E4EcUU/lVg1?=
 =?us-ascii?Q?/67H5ULW956EOTk6fgg7fIe4O9H2vaIRZDZ7nziDUh30REBMTJXIGgXuteIX?=
 =?us-ascii?Q?XU8XLLp7WQt2S/dCL1A52zwJE9o4xlBXwGxAz5miIzlf3rFEL30D+kvf5wJm?=
 =?us-ascii?Q?+21/njbKtqxHwhi9t9wnCKvqb6sxcjxGgtietntTdwtepKkRDFdBav1mOgaF?=
 =?us-ascii?Q?aOmF5rKPXu5UaDMSr32Zgzly9H9EWD/SkmOfHS4d2RNmTp/L8kwXqC4OIS2e?=
 =?us-ascii?Q?baIcnxK16QTbkmPXBWtAO0C+/R8RmXITEoDeYPYTjCfeKhprZYVq6FOK/fe4?=
 =?us-ascii?Q?ua3MLP54FyUAYEV+DbMuZZnDytMOSeFM+N5Su7y8on9MA8+u76/sAPEAseqW?=
 =?us-ascii?Q?eMmolnwbZA1P1IstwpC5DRzPvWBdjqIPZhv88bKoAa6xE7kMz1om3XHQq8UC?=
 =?us-ascii?Q?rJUs4UHdsPH8r7nzJRoMecm6ZooKGQo+Vhmf1fmkHqeTf3nCjgPdnj36MDbP?=
 =?us-ascii?Q?KT0sreG/CC+uf3uA56MpP53/TdGA6V9n665yFrHnQlx8hXDpMMAAEiJr7ujr?=
 =?us-ascii?Q?q6JR9Y/NAzlQFOpmbF6MuNByXR3T1nLLXve5xRACj1I46RXnsp4Qi9qoS7si?=
 =?us-ascii?Q?+EY3r5YVKSvrRG/yDa3/eZkIy0kjK34+tCpRq/V3Upe/WOD55XC050g7l/nF?=
 =?us-ascii?Q?T6XVQERfv9RVEkxYmkkwisYCezvDjmlGEbnBvNlEfAFPv54PoPwzykNmOmEm?=
 =?us-ascii?Q?47Etdj9l0e015KYUg6zdTYLtITEW6vrObXgpGROqNAWXIqAJgqEIDo7pmRVZ?=
 =?us-ascii?Q?ar7FpskvD6Ee15NzS6imn1Dz8BkRUyLwjlLhhbnT2vNHB/du8bNTZBqj2rqI?=
 =?us-ascii?Q?c7quRplNFhk//HUMy8V6nEV1MAZlVXWHzQLXLc9h7+8UZs3kulggvt0i+14Z?=
 =?us-ascii?Q?Ju9vYw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97a88ae-c6a3-449f-6022-08d9d563a6dc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:02.8355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fsgjFp9uKmMKikG/VI/U2H/HyMUFpAgVvRk3xMer+UslFi5LFImcZKrTPqOqXqcjjoBHw2aZv5EzaW78pxEqbrpE7nWjRjl8+WGaxlOiZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: wCVejeSgTOXLvTCONqQUcXOtq7papC5V
X-Proofpoint-ORIG-GUID: wCVejeSgTOXLvTCONqQUcXOtq7papC5V
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hello,

This is the 4th revision of the vfio-user client implementation.

First of all, thank you for your time reviewing the previous versions.

The vfio-user framework consists of 3 parts:
 1) The VFIO user protocol specification.
 2) A client - the VFIO device in QEMU that encapsulates VFIO messages
    and sends them to the server.
 3) A server - a remote process that emulates a device.

This patchset implements parts 1 and 2.

The libvfio-user project (https://github.com/nutanix/libvfio-user)
can be used by a remote process to handle the protocol to implement the third part.
We also have sent a patch series that implement a server using QEMU.


Contributors:

John G Johnson <john.g.johnson@oracle.com>
John Levon <john.levon@nutanix.com>
Thanos Makatos <thanos.makatos@nutanix.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
Jagannathan Raman <jag.raman@oracle.com>


Changes from v3->v4:

 vfio-user: introduce vfio-user protocol specification
   No v4 specific changess

 vfio-user: add VFIO base abstract class
   Put all properties except those specific to the ioctl() implementation in the base class 

 vfio-user: add container IO ops vector
   Move will_commit support to dma map/unmap patch below
   Use ternary return expression in IO ops vectors

 vfio-user: add region cache
   New patch with only region cache support
   Make vfio_get_region_info return region reference instead of a copy

 vfio-user: add device IO ops vector
   Move posted write support to region read/write patch below
   Move FD receiving code to get region info patch below
   Add VDEV_CONFIG_READ/WRITE macros to pci.c for convenient access to PCI config space
   Use ternary return expression in IO ops vectors

 vfio-user: Define type vfio_user_pci_dev_info
   Move secure DMA support to separate patch below
   Remove dummy function for vfio_hot_reset_multi ops vector
   Add vfio_user_instance_finalize code from connect proxy patch below

 vfio-user: connect vfio proxy to remote server
   Move vfio_user_instance_finalize code to define type patch above

 vfio-user: define socket receive functions
   Handle kernel splitting message from server into multiple read()s
   Fix incoming message queue handling in vfio_user_request()
   Move secure DMA support to separate patch below
   Move MAX_FDS and MAX_XFER defines to socket send patch below

 vfio-user: define socket send functions
   Free pending messages when the reply times out
   Add MAX_FDS and MAX_XFER defines from socket recv patch above
   Don't set error twice on a capabilities parsing error

 vfio-user: get device info
   Add vfio_get_all_regions() call
   Validate device info return values from server

 vfio-user: get region info
   Add FD receiving code from device IO ops patch above
   Add a generic FD to VFIORegion for mapping device regions
   Validate region info return values from server

 vfio-user: region read/write
   Add posted write support from device IO ops patch above
   Check region read/write count against max_xfer

 vfio-user: pci_user_realize PCI setup
    Refactor realize functions to use common setup functions

 vfio-user: get and set IRQs
   Validate irq return values from server

 vfio-user: proxy container connect/disconnect
   No v4 specific changes

 vfio-user: dma map/unmap operations
   Add wlll_commit support from container IO ops patch above
   Rename will_commit to async_ops to describe its operation better
   Pass memory region to dma_map op so only vfio-user needs to look up FD
   Free pending messages when the reply times out
   Move secure DMA support to separate patch below
   Set argz in dma_unmap message according to spec

 vfio-user: secure DMA support
   New patch consolidating all secure DMA support

 vfio-user: dma read/write operations
 vfio-user: pci reset
   No v4 specific changes

 vfio-user: migration support
   Move qemu file errors fix to its own patch below
   Set argz in get_dirty_bitmap message according to spec

 Only set qemu file error if saving state if the file exists
   New patch with just this fix found during vfio-user development

Removed from v4:

 Add validation ops vector
   Generic checking moved to the corresponding vfio-user function


Changes from v2->v3:

John Johnson (18):
  vfio-user: add VFIO base abstract class
    Moved common vfio pci cli options to base class

  Add container IO ops vector
    Added ops vectors to decide to use ioctl() or socket implementation

  Add device IO ops vector
    Added ops vectors to decide to use ioctl() or socket implementation

  Add validation ops vector
    Added validation vector to check user replies

  vfio-user: Define type vfio_user_pci_dev_info
    Added separate VFIO_USER_PCI config element to control whether vfio-user is compiled
    Fix scalar spelling

  vfio-user: connect vfio proxy to remote server
    Made socket IO non-blocking
    Use g_strdup_printf to save socket name

  vfio-user: define socket receive functions
    Made socket IO non-blocking
    Process inbound commands in main loop thread to avoid BQL interactions with recv
    Added comment describing inbound command callback usage
    Use true/false instead of 1/0 for booleans

  vfio-user: define socket send functions
    Made socket IO non-blocking
    Added version string NULL termination check

  vfio-user: get device info
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies

  vfio-user: get region info
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Remove merge bug that filled region cache twice

  vfio-user: region read/write
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Made posted write conditional on region not mapped

  vfio-user: pci_user_realize PCI setup
    Moved common vfio pci cli options to base class

  vfio-user: get and set IRQs
    Added ops vectors to decide to use ioctl() or socket implementation
    Added validation vector to check user replies
    Fixed %m usage when not using syscall

  vfio-user: proxy container connect/disconnect
    Added separate VFIO_USER_PCI config element to control whether vfio-user is compiled
    Use true/false instead of 1/0 for booleans

  vfio-user: dma map/unmap operations
    Added ops vectors to decide to use ioctl() or socket implementation
    Use BQL instead of iolock in comments
    Fixed %m usage when not using syscall

  vfio-user: dma read/write operations
    Added header checking before loading DMA message content
    Added error handling if DMA fails

  vfio-user: pci reset
    no r3-specific changes

  vfio-user: migration support
    generic fix: only set qemu file error if there is a file

Thanos Makatos (1):
  vfio-user: introduce vfio-user protocol specification
    Spec specifies host endiannes instead of always LE
    Fixed grammar error




 docs/devel/index.rst          |    1 +
 docs/devel/vfio-user.rst      | 1810 +++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.h                 |   27 +-
 hw/vfio/user-protocol.h       |  221 +++++
 hw/vfio/user.h                |   96 +++
 include/hw/vfio/vfio-common.h |   73 ++
 hw/vfio/ccw.c                 |    5 -
 hw/vfio/common.c              |  477 +++++++++--
 hw/vfio/migration.c           |   34 +-
 hw/vfio/pci-quirks.c          |   19 +-
 hw/vfio/pci.c                 |  856 ++++++++++++++-----
 hw/vfio/user.c                | 1596 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   11 +
 hw/vfio/Kconfig               |   10 +
 hw/vfio/meson.build           |    1 +
 15 files changed, 4919 insertions(+), 318 deletions(-)
 create mode 100644 docs/devel/vfio-user.rst
 create mode 100644 hw/vfio/user-protocol.h
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

-- 
1.8.3.1


