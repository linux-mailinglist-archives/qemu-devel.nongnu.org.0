Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B32FDAAC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:21:32 +0100 (CET)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Jys-0005TM-L9
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l2JxG-0004o4-4O
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:19:50 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:54842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l2JxD-0002vI-CA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:19:49 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KJwaMq181381;
 Wed, 20 Jan 2021 20:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : from : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mlZKcRl9q6EgvuON6yxDUZKwqmxNLbfj/ITn1hLegpc=;
 b=WT4o+yITBZwuTstJ23+gaZr33jQSiG8aApRjk4s/Y0/R3/Z3j37f4OsxaCeUFj7wbu/9
 sPRxObnGRTf1c620i8suHCjORPGUOXXQkRTfXHNJhauiwih7ZIVb00mmfw739v04po8E
 1k27iVQS1Wgctr0y4uYBfZqpnXbI5v4duarA99kiuKSG9EklgoFFu4LPfa/Zj7QVqZND
 O0D8KywH/eUCtk3BCDktxI0AAG0mOCHcT84qjFg2uGw5Y/jRPf7Hc9TZvKu4d7QxAKzB
 KB3biBOr0aOaC2ezsBTokBlo1dtfjJYevL72FtBwbK2PzPofnUXqI6Z43X1Ei2lzjfol jw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 3668qrc9u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 20:19:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KJxpaC010453;
 Wed, 20 Jan 2021 20:19:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3668rejsym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 20:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYf16GOwasQBo072KqAM0ggpsi8kg0LrGn0e4gmrDV1O8IOtyNHsn0mOmTTzVCgalcCQbGMd0NlVt60Lk0w7sx+uVTcj4mJIE+GxpFkvgFsnB9lauPeA/ZIsj+M8p2zknb3y+GxERQGqoBhawYKxCBxPvZa2dC+A9lQY6LoyON4aikDRSMcGDePxO95NUwcO1NYXuTjmrfuy0FWWtzlK8CLikoPkvCYw7rSskvjRoV2erGdrNFiuPq5wYquGXjGbdD6pnyGKopPjCkP/nlylRAgojXpfDzUlCWVm/eJymRsCmQ8qSBzFdj0/4bT9UYzcVOfAiTf9DRx1uPVcEoXWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlZKcRl9q6EgvuON6yxDUZKwqmxNLbfj/ITn1hLegpc=;
 b=HW5xY8ZlMOm5zNgzNrXxZhek1/bx1hZo6Hte758GSHkYfc3Y3ZglkE9ExdWX8CThb01uWIgfHr3IyRUicv6gJITCzyvIB0IAL/99JN/nWpQzg6k6/ME0IBtE2ingUAfxS0IqpbVV1q9o2/O0IrMhQT/BKxNdahxT+cT1rkJttaCiYNN4emDj1+946Yy/iWL3jMciCCR3Kjm/ie0TZ6FSEXGfNj1v6UDCIzyCpgq0VGs1OtIfk+udxqiaTNqoxxCwo3S14kJmVlMcRTfx+nYKPIWkoYy8TN5cAUpU6Q09fU3UA/ECVtGkJVWJY/pRIrp5LJr3QQ53u4/9uahnouZk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlZKcRl9q6EgvuON6yxDUZKwqmxNLbfj/ITn1hLegpc=;
 b=Q4rNzQk5RHtO54yUgditt/vzX9e9fclUGCV5+NmuGSFcnFfUw+VrBcKGTHqpX9wWIP2+m/x00HECr8lKxPqk15Q4RHyKBhUxu0u1n0j/zBg3CO1Y34RBfGaX0JswUVz16yYPCObeSG5ZtWSNNt7+5BiaQrwpG91pNhEuVJu7ygI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR10MB2048.namprd10.prod.outlook.com (2603:10b6:300:10d::19)
 by MWHPR10MB2047.namprd10.prod.outlook.com (2603:10b6:300:10b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 20:19:40 +0000
Received: from MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52]) by MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52%3]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 20:19:40 +0000
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/system: Deprecate `-cpu ..., +feature,
 -feature` syntax
In-Reply-To: <20210120201241.GR1227584@habkost.net>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120100803.GF3015589@redhat.com> <cuny2gn7vzz.fsf@dme.org>
 <20210120161801.GP1227584@habkost.net>
 <20210120202134.4e0c4523@redhat.com>
 <20210120201241.GR1227584@habkost.net>
X-HGTTG: zarquon
From: David Edmondson <david.edmondson@oracle.com>
Date: Wed, 20 Jan 2021 20:19:34 +0000
Message-ID: <cunsg6vxsx5.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0485.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::22) To MWHPR10MB2048.namprd10.prod.outlook.com
 (2603:10b6:300:10d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0485.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 20:19:38 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 03ea2666;
 Wed, 20 Jan 2021 20:19:34 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1065eade-5c83-4714-cbd7-08d8bd80b74f
X-MS-TrafficTypeDiagnostic: MWHPR10MB2047:
X-Microsoft-Antispam-PRVS: <MWHPR10MB204760592F44D942925447C788A20@MWHPR10MB2047.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUBlQm50dDiN92Gi3tiyeeVymHSxCxQmLpr+R3UwuALGtmiVLYo+G+TVHAW9gXmzzLovvKOhP++C1ZgStYCx3+YWLFZHHKNUdLjjo4WPpS16y6tn1EbJkvfsKf3Qjw6mRL7+pNVLYv5x/jul9LSRptccqw2p/lqI/PsSvoCEIKF26OWug5ndnNToxFfDxjEV9TxghaIF1hD5666VkIBrIryak0xrn519LUTObe3E0NKB39uyOccGssb+GKa9RIfMW4TrRTaSYuHx7+q1QKuI9aCkeGgpNlGG2oTdNVB5TwP64NhTFeqXT3ISm01ZiI49rCdeF7PMRtil5RwyKcuK8GyaVtKlA+NR37t6jnAt5jy2ZNMezGlWrsAG2EsA8iWyXivWGLr5XttI9Xv0xs4BclFmbjo3dZavxS1Kke/B3JBqgNfYnuP4MM40q8+gm5z2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB2048.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(83380400001)(316002)(5660300002)(8936002)(508600001)(66476007)(186003)(54906003)(36756003)(52116002)(86362001)(66946007)(2906002)(44832011)(66556008)(8676002)(2616005)(4326008)(81973001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GFz/ELOYl3orn5JQ21X/Hs1DGT2WTuKx1I151NmXQ/CERKxoPtoRy3rRYoVE?=
 =?us-ascii?Q?LRdPS3IkkTXa959/3febfqGmbYjz9pBIzTRZT+cbUxrdTDbLEXO89/Sv4B1B?=
 =?us-ascii?Q?QaHyr3tP2rK0ab2N3YAF5NZT9dScgE1bCmdy9ICnSjPA1t+WpcokOLUYRZ0e?=
 =?us-ascii?Q?MfzlHlul/ukxeSAyi4slO7eqqhCdKYxgTW7QyVvO5T7keqczPOl+5BdsL33s?=
 =?us-ascii?Q?hy+dWvg1gP7mbQwWn+V2qeHKqtqYY62OS3xrfBiKysy1v+xl52l7Uxb6Ojhx?=
 =?us-ascii?Q?qYIZmKUlp8tdG8XsCGqhhf9icpifF9XHMWy2HwSZU6tXoAqh7syIDyxV0R0D?=
 =?us-ascii?Q?vB6qiKuKcnCFTmkORHM0gLzhs7NTbFdCQMREguho/3Bl3xUwsS/P3PW+hyG8?=
 =?us-ascii?Q?9pHkzKH6P2y8tFdcMl3hDBWkYM6jHYXxldeWNkl8PmD6IGk9Xu9iv2qeJdpu?=
 =?us-ascii?Q?Xo3jTc2hyGHXzw5B0cx2D3RyJP132HzgipkORVNu6o4/ABrGn8K+jBeBkl2M?=
 =?us-ascii?Q?efMH5blXUXLbifM/dIS1aMm1yZ3ncXklPkwTFT3u3hFU7yyE9qzk4lfLte2z?=
 =?us-ascii?Q?2sb4px0T1tmrMPeOVLWmU/Wvhme1p6LHRk1Ysf/uuvJ+bj4Hy7B3CXcrEoB1?=
 =?us-ascii?Q?D3iPIuJ6hNi3wk9isToFcbn+ZT2wvKPkzhy97ZZOwSIk9j6WbYdF1eCkLEPp?=
 =?us-ascii?Q?+cUXVSaZ5/v8w+uGuuOQhRjzN+541ZeGDT/8i2ylD5FQRfUUW4TbEjNwJyph?=
 =?us-ascii?Q?+T5eLIKQhim9sEZ/AZhlVbgNHYz69mnBpKK/rr4LwJbLXoRri7BO5MR0Bpdc?=
 =?us-ascii?Q?jEBfD4FcfqzDrIqpnj8M2v/7t5zYUy7N14P/klur3xJ1JaE2FeDCUtGjoBU7?=
 =?us-ascii?Q?myUYZZ0Rlw59sLzUytGTyrAibHI0jVkge/0lr43qRvoX2j5VqpP0f/laqYQF?=
 =?us-ascii?Q?1U6NU2m9/zGtie7/HHgvbyGzBKWsYJjbZXEg63bu6wX4CFVGGvh3PTtALCAA?=
 =?us-ascii?Q?N0wLkyRvx4qEfUm+qrDvXESlTg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1065eade-5c83-4714-cbd7-08d8bd80b74f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB2048.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 20:19:40.3957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LBjw4T/fJDg1RYS2XWZMX5vQJ43Gj/na7ySH7IORmn7xXSsKLZ9myDO7Zp/76uuQYFqghXF+1JoqYlcmBZmglGMid+7mlyQnIRkQF7sJl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2047
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200116
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-20 at 15:12:41 -05, Eduardo Habkost wrote:

> The ordering semantics of +feature/-feature is tricky and not
> obvious, and it requires a custom option parser.  Deprecate that
> syntax so we can eventually remove the custom -cpu option parser
> and plus_features/minus_features global variables in i386.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

With very minor wording comment...

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  docs/system/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index e20bfcb17a4..2c4b8d4b78b 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -127,6 +127,20 @@ Drives with interface types other than ``if=none`` are for onboard
>  devices.  It is possible to use drives the board doesn't pick up with
>  -device.  This usage is now deprecated.  Use ``if=none`` instead.
>  
> +``-cpu`` ``+feature`` and ``-feature`` syntax (since 6.0.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``-cpu ...,+feature`` and ``-cpu ...,-feature`` syntax for
> +enabling and disabling CPU features is deprecated.  The ``-cpu
> +...,feature=on`` or ``-cpu ...,feature=off`` should be used
> +instead.
> +
> +Note that the ordering semantics of ``-cpu ...,-feature,+feature``
> +is different from ``-cpu ...,feature=off,feature=on``.  With the
> +former, the feature got disabled because ``-feature`` had

s/got/was/

> +precedence, but with the latter the feature will be enabled
> +because options are applied in the order they appear.
> +
>  
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> -- 
> 2.28.0

dme.
-- 
I got a girlfriend that's better than that.

