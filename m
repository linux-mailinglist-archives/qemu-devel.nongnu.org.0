Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3A16A8190
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:52:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhTS-0005cE-76; Thu, 02 Mar 2023 06:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pXhTQ-0005bp-OU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:51:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pXhTP-0006sQ-8x
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:51:48 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322AwvSB026820; Thu, 2 Mar 2023 11:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=references : from :
 to : cc : subject : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=3h3u9m/QYYbbMkI1SIlx27XAFRSW0ubk00VwCUjk0Ew=;
 b=rzGLax32IShINQsOAwGLuXtPG0DEgRfdllyEh5W/zxaudoaotzyS8OaY4Zdjprc4j0tF
 XNOVIwu4pzq2nxFFTKygs04Whx/P6YPjr3SVpiRweNFB7P9ktjDjrAOZxjEzTGKg9oYZ
 b6heR+C5uKs+ozYJGjNjNdAP1lS97iH9Yd8Z3GPwV4CUbpSNX2ZTe98DRymrmWNFnH3o
 sVjgZPqVOMAjZn1oAD8xUCi3rIY6ELD31Rr27Q7pI209iZkgMUuSwQb7/HYA5OcZcSsL
 J1T5N7mUAVOebZiSOx3X8aROi5oXuYaXSIBolzFpUlenMchsFaeMo8KBG+cCibm3Dien UQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybakuqj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 11:51:45 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 322BUEbe013169; Thu, 2 Mar 2023 11:51:45 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s9xd1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 11:51:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGNTH/tPBO3yTx/2Q2jN7/yjajmhX39y9ymXtafOKRPBaFUb715F8N6pY8+oSQl2hCveF80QbPI5Ak9wAI10MfKALc35F2V3cyoLrRbGaN2XWGn7V7CBxT2Z12NQBYKSDvLFM+frKYHmD4TXR7CkOu6G+Ycs9kbEXdRFWNj9oxunL2tHq3QtQl6K4ejIHaOIRTZP/JIVQyv7OkCuUvgrWzhKzIMMpaHLGB2bVHP6c1QzO7O6WioxrLt/hCOV9aD85Rqo/LRKLZgUhWX1KQdRy87XO+GgaQxdIzMvJy+I9r5mk5M9u+qWVN/+e3Nn13Xj4QvFShXAeTELry1yJLCS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h3u9m/QYYbbMkI1SIlx27XAFRSW0ubk00VwCUjk0Ew=;
 b=enP1nz5VxmlZVC1xyjdC3TmUBB/X2Zrrf1mA2YoVU4RiUjZvhZ5bngiAtpM/IdBWvryrhBzZVqlbKe//0kiZFqjPVVlXUNGZXaFK/86/lNbtcgSmBu8XJ92gujVWiRismif8qJvLU9BInuohqZTBzlifFdAvZAGMNjmDO11lblp+YttGc0C5aOWkPxnJhozeJLUz91qfRJBDmyb85BJp9OzXKi1q59gDYKcJ8cu+ny9Bxmv/AHUbmdM0Lmz/bsrPjp3dqsYHwZ5SvfKhe3WLphR6qu0KlmOMm7eyBPrjF7JGdRygD3rOsK1gwJQH+MmU27DMnikZF+9VSSt5+wfAAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h3u9m/QYYbbMkI1SIlx27XAFRSW0ubk00VwCUjk0Ew=;
 b=uYY3N7Km1wgkar8tVCWWiRMu+ikDVSLGPhxSPKTam3Vs0YDsXFm+EY6+hgGIGQf9PbKmKaHvA1ciDG2Kza2Z993DN26rFp2A0wWAe4GkzZxJ93y45zQgiEGrE2gxSxE66ab+oYdRWfsh+nYOlwTfSAxPwk/gdkxCY66ged4/PsI=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by IA1PR10MB7198.namprd10.prod.outlook.com (2603:10b6:208:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 11:51:42 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b%2]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 11:51:42 +0000
References: <20230301124026.2930-1-quintela@redhat.com>
 <20230301124026.2930-3-quintela@redhat.com>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/3] migration: Update atomic stats out of the mutex
Date: Thu, 02 Mar 2023 11:51:22 +0000
In-reply-to: <20230301124026.2930-3-quintela@redhat.com>
Message-ID: <m2cz5r1id1.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|IA1PR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afb9d44-4637-4e77-259e-08db1b147dc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJkI5M+4YIJtFPFiN/TViOtid1qamxauZSjW5110tZLT1Jra9XN+J4tBD7LwrxTu5EBcvODpSt3xN4KuQ1pHg8mdlLf+uuEZr3dcagkxQ0nNuM3Il4bWwLwq7smkZaTzqdFR+tI5LHOfx9s5gGoTfJhvt51tDrEtdIHwxGf0vx53sgT7kcgzpECQwrZRCod3N3K2RgNDDrntzeE1RmYMn5R/s1YGII05kfxKRS7PUNpGEwhCl8LTOpgIc2gnLVqqEz44EdY6WbsEDS92spwXGTvdjuBLN0Q+taneyErY6CkqPWjUSESB3yDfNTP47QwM/wK3Vy36mWGd+2vpzFF5P8D1pNp5ujDrnkXbDDV5A9OyZ13B2+eWmSab1/08PWCSK1L3TAgSRHPrIrZYDxXwi1HNxQGJY87ajjLiOA5WwjMFbrtVqoNj8sr5Ot15cmmx0TKJGckBAUe2Q5lBYzGA0TVdWam3erOUJooO7x8ioh1Bzi1bvbzH1X2CIo7SLwYzAdP+XIMQj52UYHHZeZDpFIDcWjns1Fn7AWQdUW8UjCkrRuXdQqmQvCu0tWPB+zU4vcmzeXEImfp1L0ek+mYoRWIQh/2ijX++dapUH01tWSrxCnRenc9KiJbvkmEM01d7Jds5N0GkeMkjcTkm4zrEvcDo0x19LnzSpnh/DuJgTQqe7aZ2iiK2+B/QDkpXeyIB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(86362001)(36756003)(38100700002)(66946007)(66556008)(66476007)(8676002)(41300700001)(6916009)(316002)(4326008)(8936002)(2906002)(44832011)(5660300002)(2616005)(83380400001)(478600001)(6486002)(6512007)(186003)(26005)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tsaS2H5VKnuzpx3D4G73OmJzDuaoie3UnvNFWzRJBEP0xsG2rW5QNnKbh1es?=
 =?us-ascii?Q?SDZsUSVlEGfDGARPVWUAVWBmCUWbY3VU+XzpXU6kJWhgOj0/acv/e7qmtMhQ?=
 =?us-ascii?Q?hP/l2V61Q4IEy7spliijWPhPDJvoPxsmMNsAmPNN5VdKE+i3mEgDVXfBMIk9?=
 =?us-ascii?Q?fsE6dOUw0Rzp1mrja7Gvha8FFxYAbLbUVgJ3PQ4r5Dt9eAaT1eDDalCqtVyd?=
 =?us-ascii?Q?8q2pcIq4ImNhUCdow7xdjIdZ/P6VLXzvzajIZcD0WriAIOWGMZD2fK+ml/dS?=
 =?us-ascii?Q?+fREIOoJiSzXa+xBhhZRrIkszelaBPSrUj3TAvf7bE9ytadFH5U4KLqbJhy+?=
 =?us-ascii?Q?twwtAvukHuo4vkrdTB74OrFSQfJSE0zFvVzLgL8eyIxKijyTlEnoc1QvuUR/?=
 =?us-ascii?Q?FO1h0/E1NXajMZGvzBZsOJb8N+RVa7m/b5ibTdwcmJ5+tleRmqiQqc3cR1PC?=
 =?us-ascii?Q?/WPirXWJB1eyfHtAuK7XXnr5cPln51Xe7ik6slxyYJIJe7NQyR60iYT+V/Xe?=
 =?us-ascii?Q?o0GA1zBy81L3yOzSAKT9+woIl3wz0Im2OplMC5wfq1Mj2A0pp2Us7DURxpjR?=
 =?us-ascii?Q?aRQm4b8Eiq6scZt9wOiq+b340g2PNKZl5IPqHPfAIdQOshnzvU3xuD+rKhU6?=
 =?us-ascii?Q?Ks0gxHQQA7WNpYPV4UheWmjZ5RIUz8wKU5Lyv8oAvsmbC5Mrzdg2KIRpMEGP?=
 =?us-ascii?Q?iD6aJQTK+PQ5vEhypLO0bk+q3cK2R2wWc/OYI+8RBpf+a27feqwXiZN9HmB/?=
 =?us-ascii?Q?3nBqqksWIZ08LlmBHIN028O7sFktUkmj6C3pfPR26eT+h9dRvmWqF3iAFsWd?=
 =?us-ascii?Q?swu3q9XwNvlSkapnpNEX++u9ER8KnFwQPShfa8x5Mt62T1BxKNbm0Te5R27i?=
 =?us-ascii?Q?XDROWlF6yIZMCpQbshmvOPsFF6d/BpJ5rprAj4q4/AxG7t5dhpV5NE9XOX+f?=
 =?us-ascii?Q?lUmaF+1XB78FBuCCd0LQ10VR34pNes3gktiX5lsPLR7HqEBABz/ilFPXhi4b?=
 =?us-ascii?Q?Fl0E5gEq1hwMa4ELkN7gU5jentk33LrkiY0GpYmjHl8T4pjoAAe7QnCWT+gd?=
 =?us-ascii?Q?qXyvmbsHIQD37CtKC7t+vLn3wD3o1ynHK81aeRxopvEStyXGORgngCAG3q2s?=
 =?us-ascii?Q?2/3o7KPomfeEZEvfe7PUV9yi1TAlnWogsogoTkHHnq7KwONdZjyGQMIz6aEv?=
 =?us-ascii?Q?yp3W/kDnK8j1sW76vDn+TJTZLM9xtoqd+/3SnNWKNVb72C90pQnqV0+qAWFo?=
 =?us-ascii?Q?6J5hTOTIyTPZFn6SWvDnvozYdEJ2eGn9NTqQ/L3oTyaAFdtjeZUqwtFvRUz0?=
 =?us-ascii?Q?ioZSEuxwKaS8OuaTKelnhS1am2Youkcw6msNUmlqsEgMQBV4TD9tvddk6Fbp?=
 =?us-ascii?Q?kXDTTe2ap0OspJJvbkzM1Num2hMRpGa8VyvSsb3x7ctSE7KZ90iQV2RjwFGZ?=
 =?us-ascii?Q?n2Xq/EFgghwaxtF4yuj+As1RtGn5MlX1jbocnPTpWck+cwwlLRu9axRhW6LT?=
 =?us-ascii?Q?tG8fBLa/s7N9bj9UmNbv/iwu9nXEn5lCW4TWeth7KF64TuBoJQiAUw77hoZm?=
 =?us-ascii?Q?CQVImE1Kz8rNDHvbQgj8PYRxbtfS1xVkmfqEoFZLX9XEs9/XAsLb9X5jw9xF?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Z0wfwrLDheNA/UZmW7bhMgyD7lXnR6FLrXABd4eOnNH8TzEByGlxNJlpRKSmpBp0vN9gY+64TlFrXoH/d8pPvaK2ihUrrptZlzakY5y8idh2G8CNlM9a6wP0FPta4qYiiDICwomVsBHx+fqiQwNXt3xopAIaf6QnSNDwa7pqV5C+8rRjCBaxsxPIkOqBa9G+JD1bm2HxFTgRFnQZETYjmdtl5BJExoJZ3flrCNsJQX533mjWMGOaeIBsstvbRoTH1nsLr4s3a1pxUpx71k2TcUbX+ZlOv9Fo+sOJ1NfIQOeCAK1+kyBYidQa2ebjA7zSzfKQqEfJ/fL/OzBWZ97VDtxDaP8itKWz71sNpRzs8ZuYE4OR1mZD7Scd4T2/7iK2IiCNFRsZx/2bJdMwUzD/4BMGY/o+ymfjqWg+VSk1XIEDsmUfGsjyZhH1k2vqcTRSSDMckth3lgVjAqbos+/EOKkjDjZxJM41FIL3s0Ov/Vi8E14wALGDBq9ilnRuO/fS/J4bvSALg9ND/BrazPbTxRqr9OoXeoqecwrdFLPq30VPW8JInjnctsKLxm4hs1gnoWwzkydj0sBDTDnqYApmOF2ZifKUK2yx38qq9Yz2qmniklyKaP/c2hz9x31eTCmf70GrH5MTkYRMYU37kqlIROIIKp6veuFunX2jmsyCOg6op18QNDPQ+mnpywM5RRR8bliK2fssIN7UGL0rJzUTQ6fL/kICyNqhrMSpsNobyZmpcXksb5BB/PRW3XMY4wKLXdUM3urq6hCiy46p6/sA/g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afb9d44-4637-4e77-259e-08db1b147dc7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 11:51:42.7192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XzjLlqjyfn0D7NennWtwp6HKleL7CoJ8KAWMAiR4J7Bz/QMO6MeET68TMZrrcMXJOuN7OJX2fL6GNgXmQN4VqThlV+FWwCD9u1irK4gSq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_06,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020103
X-Proofpoint-GUID: qwRrS7pRJsndjNfshezwym9NaA-494a1
X-Proofpoint-ORIG-GUID: qwRrS7pRJsndjNfshezwym9NaA-494a1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On Wednesday, 2023-03-01 at 13:40:25 +01, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/multifd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7cb2326d03..f558169e37 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -433,8 +433,8 @@ static int multifd_send_pages(QEMUFile *f)
>      transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
>      qemu_file_acct_rate_limit(f, transferred);
>      ram_counters.multifd_bytes += transferred;
> +    qemu_mutex_unlock(&p->mutex);
>      stat64_add(&ram_counters.transferred, transferred);
> -    qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
>  
>      return 1;
> @@ -628,8 +628,8 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->pending_job++;
>          qemu_file_acct_rate_limit(f, p->packet_len);
>          ram_counters.multifd_bytes += p->packet_len;
> +        qemu_mutex_unlock(&p->mutex);
>          stat64_add(&ram_counters.transferred, p->packet_len);
> -        qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
>      }
>      for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
I walk like a building, I never get wet.

