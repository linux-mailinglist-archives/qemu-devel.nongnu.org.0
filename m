Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72B2FCDBE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:12:28 +0100 (CET)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ATT-00059W-Sf
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l2ASQ-0004hm-Ig
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:11:22 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l2ASK-0003BD-7n
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:11:21 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KA4rMx024062;
 Wed, 20 Jan 2021 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=g+ucYrcOlXRwDYQQX8Go56VoBm/KscAeRowGDVVwr7A=;
 b=sjaw+xsYmwNTli25muOpEr2WP3+bypvarA81k/6NMCR7/rrSa3tmuKNpvuRWFvi3OCRL
 BlckeGC9WrKMkjBqjdAmQ4ns1fRfawytpg0HNd45zZk1mliHoPsz5QYbUFuta1dlFC5V
 Jcp7ghXn9FCyQRF+rrOI0wSM5M9e6fT8CdHJmXspEWunL74d/cVsDn5xbLlhoT/2ka79
 7vyrJWlGA7PIMSJ/zNttqRLl9WA2sgq0MtxSksttXnpPZS5PdVO3SYoV7W4cMw3J6Vl8
 X2AhvlgSjVCA5cBTxpwub6UgAYE6JseIq5zkhEa1AqJklLm9iNFPazIt0PZ9I9q3RZ/1 +g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 3668qr9rpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 10:11:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KA5fRH019159;
 Wed, 20 Jan 2021 10:11:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by userp3030.oracle.com with ESMTP id 3668rcsyac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 10:11:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3zPOgEkm6XmoKn1ym+iLGFbmlZztvii0mBFWEwVTl0TMh4YmclY7//ny53dt2jfO2sqY9A3U9JUcxyIGV6R/G4ZJ9QshM6J1p8Tn0nexZdK5jkmpZMtMK1u1hYR1COH/7MrtZNyyHfaJfHxKDkDlMn73G5O/pjac3Shu0FJLT8JJxdNkMXS6vrX+kQJICgwkZjzxeZDmAm01EALpocsaTlKZ/3w+1Iu7dIu0hRdlatZi8GhpWx94aj7Yy3pz2I46MT+08GBDMQ0sX7gaqYskJ/5HTW8y5w6mRuQxKM7DEbzzY3It6gMc8ALe7yDV3YYnIG20uFp/yjzmKQdWgxDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+ucYrcOlXRwDYQQX8Go56VoBm/KscAeRowGDVVwr7A=;
 b=g+btdHffyB8PRwsXJVASrJ2BsDR+q1Xo1VcMvUohP+ztvZVC/SqxcGKYbEswdhVe2eJY7zNNIIXdc5J/q+zit5/qoae26ZNKXNg3ZS8yxRXKpE1mPCcNYA4qprXpOT8Jh5iybps2KFtW0E7bzoMQuv1ek/rSWA0nAzTIg7lMuttlBzZSKYqC4NLchftwr3CrNN86stu5f9Lf8BZGFOWXA/ub5f+3joyl3oZ2a7sVwtJjBGX2BRweTETDtWzIqDxJsIqqjH4cta4vT52GXXwRZmdy0ze6B/1Vo1MnEJgHStaxRVZ7+/q+fkdSumGoA0AjAtPAl41XMQbc/8UeZhONQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+ucYrcOlXRwDYQQX8Go56VoBm/KscAeRowGDVVwr7A=;
 b=pfHmTGVU+C4Ysa/3ft3KXVwmndylr17FrylD6TJTQVljaaCcSQSK/OPJiySGldYrpIT0/423ZqyxuOhVHTciYVyhMicj/TtyBkY2uQTIRlVZtwsiEELRaBtTYOtfGgNRPRdVj3SF9y1HZaAIqMbCaWYkEULAvZ+4lIT+dOJwLg4=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM5PR10MB1945.namprd10.prod.outlook.com (2603:10b6:3:114::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Wed, 20 Jan 2021 10:11:06 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 10:11:06 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: ignore address_space_map is_write flag
In-Reply-To: <20210120060255.558535-1-alxndr@bu.edu>
References: <20210120060255.558535-1-alxndr@bu.edu>
Date: Wed, 20 Jan 2021 10:11:02 +0000
Message-ID: <m2mtx3dikp.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB6PR0402CA0018.eurprd04.prod.outlook.com
 (2603:10a6:4:91::28) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB6PR0402CA0018.eurprd04.prod.outlook.com (2603:10a6:4:91::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 10:11:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0e92b27-0ac7-485f-44b0-08d8bd2bb361
X-MS-TrafficTypeDiagnostic: DM5PR10MB1945:
X-Microsoft-Antispam-PRVS: <DM5PR10MB19453667AC752BB627ACEEC7F4A29@DM5PR10MB1945.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfE+cJhZqB4/yFyVXA/hCtL4qjgyWfU3M0bamcsyGbhcqk3iDf4Yyh5lZyno5bUBbpp2XgPmXgPoRh3bBnxWSH+GcHa67CMMDV/g4BAUSx5PBKH6ELv6bHUDpF4tSP9/dDFlbYq+TzF9ZC1cUkccxFc1GrxKaxZoZCFhj8AIU8iCKOkGYvP4s9gkcDF6ra7rer+TycrkPUoGoMwUNzM89b9F8rQQnfNNk/hBhsppphgU5iBHCZlQT9Av8sxp2zxwZWWHKQKYWsJQzAb+VrwV61rPm0E73dCU0F2g9L23xfJXv4OAFhK9/xu6UUAcnwLy+VWD/ZLRh0X2jRSWgZxm9K7K4TZICuaczrgImf8bno08ScI/US5KTI5ydiY8h7yXvLOeZbyqSoq8UNdzI51uRt/eldycDeMsxUJ9RDsFAT/T+ntm99N7kRdT1DcdRHueI7BgVIIu3sxT+fNuK+tscQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(136003)(396003)(376002)(4744005)(26005)(956004)(186003)(66556008)(16526019)(316002)(36756003)(8936002)(8886007)(6666004)(55016002)(7696005)(4326008)(52116002)(2906002)(966005)(8676002)(478600001)(66946007)(66476007)(86362001)(54906003)(44832011)(5660300002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4bAm69lvz10hv80dvI3k0a5l/hZmS0AjqlnOuJtYxVA7FFXxYzLx4xKwBCLh?=
 =?us-ascii?Q?MDPvMMuspuDe1RzMDCWSJx+f8IjohDRUF5r/iE9MbARiW4dihYRZsq6fSVLx?=
 =?us-ascii?Q?fq3CLdnwmBpMVbO0uaWiZO2gmGKd/f/64pZQfGPaHlHzaf4mKddQeUR/rRQZ?=
 =?us-ascii?Q?nmMO0ry7KH8fkjym39iLE3ANdXSyhST51pIOoZeIFxQLWqz4slNNR0EqGgBK?=
 =?us-ascii?Q?XGua7rYcDWpkiDh3JRMSfsBJCM+hWapFKV14nXiq3EKQ/voidQoOIm9nCC3O?=
 =?us-ascii?Q?L+ETwXBs92JTC+60T39qWOqU8cUOsEfZf82/ao/rQTtOXzes1oAufOeUsgUb?=
 =?us-ascii?Q?GBu+nbqOBYOQC2x30KGtNfprjvu8b6+yr1URyhdUI/kABzqY7YRe5TbfS9MI?=
 =?us-ascii?Q?JMQ9NEnc1MObywVdcaVxmbEQyQTBjzixMTCmIcKPa+RWA5xRyrZrFiQMaTdy?=
 =?us-ascii?Q?Jpi3FC5JCfXJdL5Lp/aziPBrF5M2oXVE17S+nsgQr7gluGsbTEuWXSFF7uLB?=
 =?us-ascii?Q?ikTyWIFXbmZpLvKbkcYVWFKyIONIiEILMX6YSKk0n+pNt/sWBpTbBnAjBUq4?=
 =?us-ascii?Q?BeRpxdxtm4RgAsC5KlVexnq7g4zKAcFNrVXZE1XKGq7u/0sgVcduSh6+Jc+c?=
 =?us-ascii?Q?nxSNRQJS3GgSEn+u+/pnlR+5BS8AZLhEh6/S4hrsxHcegus1oW7aW+XJBfXS?=
 =?us-ascii?Q?eN91M/elJxoVBuL3Y/Sb7LFxLulmLL4Uynu5Dg8hN4Q6pKU1BIIXVTPmK3gj?=
 =?us-ascii?Q?73LBsKxLYjRCdoo2ykSINLrT7BvFugoFhHOfkqn2YCwgukREHPaWYOmjDUYP?=
 =?us-ascii?Q?2MSSjifDgHtwRvM7oXz32fsNfGGKl/nptEU7fl580jq+2ouMYlrvSUuJqBu5?=
 =?us-ascii?Q?MVzqIUscAh6syyq69EaKUsQy1AZQ1l7N/s4YCBdPEfDKxPIcExviFS8RPGYh?=
 =?us-ascii?Q?tlJQpljP+o6NtPDlFVQtfygr/RTvAA9AYkmOEaaScaL2/3Pq9b5siMEfqXHt?=
 =?us-ascii?Q?3D0nUMCTkay1D2CjJ2f+tRW9/em+wQLQncG55KU1UMQsWEvoFBv/GH6fuQUp?=
 =?us-ascii?Q?QuqUU0u4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e92b27-0ac7-485f-44b0-08d8bd2bb361
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 10:11:06.5686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZai5I3psWmyoFNaOFeAYxaOdWR6QPaaREBeQKBNLWwbSD4ao7XWWbR8lVttp+D0BHddTBoM9zXjKq0ntH0Jzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1945
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200057
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=darren.kenny@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-20 at 01:02:55 -05, Alexander Bulekov wrote:
> We passed an is_write flag to the fuzz_dma_read_cb function to
> differentiate between the mapped DMA regions that need to be populated
> with fuzzed data, and those that don't. We simply passed through the
> address_space_map is_write parameter. The goal was to cut down on
> unnecessarily populating mapped DMA regions, when they are not read
> from.
>
> Unfortunately, nothing precludes code from reading from regions mapped
> with is_write=true. For example, see:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04729.html
>
> This patch removes the is_write parameter to fuzz_dma_read_cb. As a
> result, we will fill all mapped DMA regions with fuzzed data, ignoring
> the specified transfer direction.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>


