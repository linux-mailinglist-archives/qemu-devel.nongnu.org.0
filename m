Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B480932B5F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:38:49 +0100 (CET)
Received: from localhost ([::1]:46790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHN1s-0007Bh-Q2
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lHN0w-0006lh-1g
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:37:50 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:60192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lHN0t-00046i-Dj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:37:49 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1238ZWHY152243;
 Wed, 3 Mar 2021 08:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : date : message-id : content-type : from :
 mime-version; s=corp-2020-01-29;
 bh=d++5tmPOn5v6XbYxMYwqZ3i2anPHtWQ9r2HznAZtu6Q=;
 b=c8Zi1fVfHJ9qDwgbuBMoa+vzhA13WBhmkXoAlqX4PwFHMK6XD3+Edh1khpaIECKY9VYS
 dCF52KVjBWCg48nFtuj9RbEPbbs03z9nWxv4ei1Hqp7V8ALZHjsPWbOridG4PjQ85MCZ
 T9ZdQIHOWqaUQTVDtjYxnd+psLY8VvnF6U8oaqU6YPuxZk92dXJgtcTb2ss1EJGvlb57
 tOhpv/bZYRQJgUfrpvv3ckZU743niFSW4A9FLyYbcsdojFufPBcS8oA33TjJWsU28Dvg
 CIZyvGIXogtvOUKEMxuPia0vUm9kr8tB6X4wNTxDp8NL7sBy2OyQQCXyQeMngX5FEf90 5A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36ybkbam7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 08:37:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1238V14r120474;
 Wed, 3 Mar 2021 08:37:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by aserp3030.oracle.com with ESMTP id 36yynq8n2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Mar 2021 08:37:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3X64vemJ3zhL6ZQd+KfxLkGdzqYMWGQzhwdFNibD0MiI+wj9yqz8fodJRu8bZTUazQU2yLd+i/7k4w+d+Wz0uobU+ifr14Fi1Z0EtmIU8bZuvHYKy9yt3N51EKTqvY3PgyjJOuuSb/RHriFYzPNQ/N/3tub4Dy8rmRee1jHCQJOKlgoYcijtQPFkUzVsJ0mr+9m41xlUsgklqyvJIRPuZVsCi4WdkoUH/CKGoVun/ROZB2OJlZHCdD/wEOnIvhQZ9LUmOp40y9MKI3Zj/bncFUtuJroVILvoGtx7HpH3vnW7pwqvLAhAGzizGYa7MhlcC7rwXHJaxwZIBHDbPDhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d++5tmPOn5v6XbYxMYwqZ3i2anPHtWQ9r2HznAZtu6Q=;
 b=oK3jKepcRR5uXD7g1epVXxjfUhChjAzz0ZC73dwFC2Vvkq2c3GVuUqg0KZKc9KhpRkTtGrMHP9ftVYhV4zyMKnUwzkM71URQ5XXksue+9y+JS2vwPxQl8FGKZAih4/fzQYQhsqgrJIloaJb2EW/09TXfWaHKp42X+w+ue8r8YGzgzbtTFqubVMXmqkjp4IL8HDkuN6OxlEvx6SagFuvXB7Wosd7JhVtkCyxhoJLpIbn28UdIVOOkXo2pqaxh49SDnS7gXhI+qTiaRc/8lAawReA+nuwVbDeSh/6CkiYAvTQiwuiqZ/SLvdTo7Y29KmcMQU4u20+g2tipCvOFOVG59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d++5tmPOn5v6XbYxMYwqZ3i2anPHtWQ9r2HznAZtu6Q=;
 b=cn1UL2Ppd/QRSY6y0f3GtsRosk3RJWCKH46zKISBSiBgQ1m0BWUg0aCG8r6/h92u2HSSLGLu+O4jwnPUTjLmgsBU/OAohUnpLG2GpbLUBW4NCeZRQXkRpLg72edOitrm7ym0iJRJ8MJZdMINPPGZli4J7NyB7RxMp8AR4JsXnEM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1593.namprd10.prod.outlook.com (2603:10b6:3:e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.28; Wed, 3 Mar 2021 08:37:34 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 08:37:34 +0000
To: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 2/3] migration/ram: Modify ram_save_host_page() to
 match the comment
In-Reply-To: <20210301082132.1107-3-jiangkunkun@huawei.com>
References: <20210301082132.1107-1-jiangkunkun@huawei.com>
 <20210301082132.1107-3-jiangkunkun@huawei.com>
X-HGTTG: heart-of-gold
Date: Wed, 03 Mar 2021 08:37:27 +0000
Message-ID: <m2pn0gljjs.fsf@oracle.com>
Content-Type: text/plain
From: <david.edmondson@oracle.com>
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.24 via Frontend Transport; Wed, 3 Mar 2021 08:37:32 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 3daaa643;
 Wed, 3 Mar 2021 08:37:27 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e2a870a-eadc-484e-c9b6-08d8de1f974c
X-MS-TrafficTypeDiagnostic: DM5PR10MB1593:
X-Microsoft-Antispam-PRVS: <DM5PR10MB1593B2970FA7C1EC19FC7A2588989@DM5PR10MB1593.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnmTYs5w8rRguehsP66wjf53XCHwkkR9MimmaKKNGLFE/lVOCT3Vzh041fxCt2Osi6B7w3IOYrrlX064FUmo5g+plQmAqMC0APbfrj52VmEkSacBTPbQVEmKWimuqrCpOY88tMjeN7zsuE/ZDdvzsVtQ+Z/0SuyrjwyxUg7ggx512Stco2CJ6gdNYeh1l7nu/Zw93wZMxNKTRrvq94GYWJKvy5oLs60eIuED6jZJpMg3lCCdkKYk9+rMV3K4suz9LUelTrs9xxnFIvm2z+65RV6eBkGDRK4faPURW7vUMpaK/YVByh96zwj/9fOZsJPif1HnbK6dmwEXmCWs61uS87EKc0675Q7bQqRkgZ2WLOLQU0Gky3nu0Wb/R8Z/cB83iS5TcX/UNHv1dQNi5dNoq5+6IyOzDTmaTPZShOS0/U7DeKRMVyEKQYgSCNSeFJFjaxt1zGeMR5CuioAfRpiY4g+R+vfoD5A5yfb8v7KZ4z89/v+cV5cFp0lD//OcxfrBQDXE7VWuwAkarRclJ1+a2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(136003)(346002)(376002)(366004)(52116002)(36756003)(66556008)(66946007)(2876002)(110136005)(86362001)(66476007)(54906003)(2616005)(8676002)(5660300002)(316002)(478600001)(186003)(4326008)(2906002)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fc1I78YuCNqFsGRGJRCZ984jQLGLx/Cn0PHGUciI/M14EVfVHB/7srwnqs0I?=
 =?us-ascii?Q?cY1V+pYLgp1CAGitrBNHJz7cXIh6IEPC2/RpnwVceZi60uQIZT61sTkYbJFU?=
 =?us-ascii?Q?IGcxlDm2oro8UJLfPCAL+dY93o1dLAToQsKDU5TKf5LUa8Sk/JVqfPVxn0z1?=
 =?us-ascii?Q?kB+QfuEINgpMzFJGqFwVr5mlJEG1UIveLiw0DzVH/0zpkanGBUS1Qo+g9vr5?=
 =?us-ascii?Q?5putDapF6XrnJFUWOaOuldlvAR1N7T4TyhgIRsN3Gn1vO0CtlsaPvzv4l7JS?=
 =?us-ascii?Q?yIfynVAGBwnEC0crB+G71QLxPlDUmEeZjcYFjXJkt98Jr/jvGH8/JiOENK05?=
 =?us-ascii?Q?lL9vjDaflw0X7NCrx8SwjWDcYjAnc5u6iHnSYv26vCe/HN7l0Bqwtk2kHNZS?=
 =?us-ascii?Q?rFmTGWGKqEIRpNsclRxM3emSLxMz/Y89MGqekgkIaoPJNK4e+nyomnZmQkUu?=
 =?us-ascii?Q?y7NW67/V88mTFqJOfnUPur2xqSPe+3/wZccT39iD/RKex9WP1BesUPrpz/VL?=
 =?us-ascii?Q?NJh6rw7S/KlklO8Y3A7G3WzUEy3c1Dr1IuZv++X7cQ3LYwpGeVDfHi1BdtlJ?=
 =?us-ascii?Q?+yPisd0X7oEfGOXEetflyY4FlQv/j8E8RDYrT74YjY2b6pXRNX59P7M6V9HC?=
 =?us-ascii?Q?Jy5cOqLq8CihfnaG5+OAcOK89aiBSvF7plkJBT/dmT3S/BG01+q/oGIDtoei?=
 =?us-ascii?Q?dFVrInlQDvmYnRn6s0RM5X+mui6RtXHdy2WYN6tqVR5oSxCk4UgEcm2I18ZS?=
 =?us-ascii?Q?UmeW4m2l1vaXKj3lr7jswVQ1WF/ZELhC/Diz8MaJ2TkBi+Ay26KOqq3iWfu6?=
 =?us-ascii?Q?AnF9f7cVJNMe98d6qHDWM9crPHXK9xiH+YvjTdDcM1jteN5t8er0fUUvN7oD?=
 =?us-ascii?Q?LKSAWiUDzfx1QBaCyzWanzAVpyrguMcwqd9nY3BCSkf+sl9DQVSggQpbq2oj?=
 =?us-ascii?Q?D9DPIn2FdUK0Ze1bYLjLSMZ0Bh/oOYGkz1h6HLCXb3xRmsmmdnpzL987rmFO?=
 =?us-ascii?Q?Mh+t9qPVLEu2rd5tsofFhzGqgh4pD8RLFtMjdNB+WrE0mSJmahEGZQsn2nE+?=
 =?us-ascii?Q?E1s06HH+wsIgVX4XMB4YP9PB0exY2jLOpXhREJ9v/fL+/Klf8CqGdw9F/2Pr?=
 =?us-ascii?Q?RJCmaP5uJxfon/LejjmFqUpD3iayobi/ItDjp75zLPuRtekDkS2CVUINYop8?=
 =?us-ascii?Q?GAGNSGkDfkVX62v/OJwk7LJz0Oof5IgS1KP/2r96k0X1JxD52LbmTBnmBAND?=
 =?us-ascii?Q?PdDPWeOsOBnYCGGcwsE6iwKX5MKMSb7FLAlNT4/G18EhhWVTG/DgzDvbD7Bl?=
 =?us-ascii?Q?k1ilQuGor5rf2bO2JKZ9B9hYfE0aN6eKBqTlmAqb1OclhQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2a870a-eadc-484e-c9b6-08d8de1f974c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 08:37:34.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTTr7goCGkn4Y27HCYDFnNUiZmJIBDJAFlaqTu/jXw+hArx0RJ7EHLImOa0u+qKAN9mjLE70LAbDSc/t9EZM9MYPuAZZDU9SVRlF66PwCsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1593
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030065
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-03-01 at 16:21:31 +08, Kunkun Jiang wrote:

> According to the comment, when the host page is a huge page, the
> migration_rate_limit() should be executed. If not, this function
> can be omitted to save time.
>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/ram.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 24967cb970..3a9115b6dc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2014,7 +2014,9 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>          pages += tmppages;
>          pss->page++;
>          /* Allow rate limiting to happen in the middle of huge pages */
> -        migration_rate_limit();
> +        if (pagesize_bits > 1) {
> +            migration_rate_limit();
> +        }
>      } while ((pss->page & (pagesize_bits - 1)) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> -- 
> 2.23.0

dme.
-- 
Please don't stand so close to me.

