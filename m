Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C628F33B1A6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:46:18 +0100 (CET)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlft-0006Bo-R6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLleA-0004sG-JI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:44:30 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:54934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLle8-0004t6-Ox
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:44:30 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FBeZgJ081752;
 Mon, 15 Mar 2021 11:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=yhpH9BNd/QoOEV1xk8PCVInfHN7ipNOm5trqyiQk4Ng=;
 b=HIhuny4XdUrmwPXsrL8rWHQYsmQfSWWsrHdiS93XubOkVpqvBbfgZsvakWnb5K+5oYgG
 yfa9dDBuUWh1A1NPOQ9ESGRnhf9bA69td8XcS7tPsHnOQfn/viNchuvmJmAizzAjZDtP
 3wjt/BR1xTZrgwH/lF/CsW66ezEUP0pXwZb6aPxbZkdskhAmkecc6QBqTVOzzwlQ3nAv
 7zPQqBcXLl9TpCjbKku0SpUmuX70iDQ0TzFOgZYKUo+xJkL5sqg57pWqH8o8ntIA+2aB
 Lgufn3IFTVw68lFTrMmzERu8+y4vxlVAd/DUwaMGQItA8hhBN2oZo6YROqn6tt4T2wyi 4Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 378p1nkf1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:44:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FBdjPe110954;
 Mon, 15 Mar 2021 11:44:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3030.oracle.com with ESMTP id 3797axj8g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ1ItYmiqAioQMpuKLnJEq+thy4/8rle6z4jOzCzIb9RF6bfT9yFe21Upxd6mhYqWhRvkO6+HLkLS/7ktJBHYjXFu5tNRtXV/OrF8X4sdpRyMk83VEsrOczvwCC4F2n7kKdZaDdWl/Z19E9KcOTGtJZa7hmJLW31cf/WgSp77vQGmEqR9RPlqEdiaWETmkurtCjtl0hZWXdhs5aRJ/l3y1cZ+hfaJ8t6UwdURVayvixaUt5dFqZ9tuWiiZMOyhnUcI2NJ8aocF9kCPJG7B85w/+dUy4Jy18uFsKwsSXOcX6LXSpvswG2m5/HW91SkDRzQM/16RUX9hGM2o5/PlO4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhpH9BNd/QoOEV1xk8PCVInfHN7ipNOm5trqyiQk4Ng=;
 b=FoKmraVso3UHptyEFMf6PV+wZvk/qn1T6AanAydaMvzEmfscHLSFpKicWA0P7m8RtRx1QDInG0E3ymB9Dk4RY+MYgRxwCOpjlFKW+UtQVPW6XoYujIsTiFKxzSD47J1iDdiuaX9Us8zZjHbXQGFz0fNl8osWWlhg/K1ALvuPTsjSphd23CMQUH6T6sDP4RMwJIVKslAtgcVAceEpPp/E7UbwaQAMgnCTzOE3+/8mSkSe8w1t3PANtBik6HXuMOo4Ib2uvz/Dql/ackTES1+LM/+7JWPbvi5Yp3zOLs7uMZqBk5Sf63OR/I++xhy7XO5Q5cwHsF0x9xziHlX59Gd5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhpH9BNd/QoOEV1xk8PCVInfHN7ipNOm5trqyiQk4Ng=;
 b=LJ6Qm0txWQJRxIxOLV0glrxTB5jY866X9vp708Umz1lbOLHuLQilQ6iT4XcHIeyuXPbkklNS57NpWgSHMbD7ovZBaNHTstCOadertUHCuLcmzJEnCfp1M5oeI7nWmLcvkkE1v/G7UuzQ6fEqtl5iYYRVqJR4nRoMjT88wZYyPiY=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM6PR10MB3257.namprd10.prod.outlook.com (2603:10b6:5:1a1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Mon, 15 Mar 2021 11:44:17 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 11:44:17 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: add a am53c974 generic-fuzzer config
In-Reply-To: <20210314055637.5239-1-alxndr@bu.edu>
References: <20210314055637.5239-1-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 11:44:12 +0000
Message-ID: <m21rcgtzeb.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB6PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:4:29::18) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB6PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:4:29::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 11:44:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0d6d9a4-8b06-4858-e49a-08d8e7a7aa4f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3257:
X-Microsoft-Antispam-PRVS: <DM6PR10MB32575BBE10EAC6E2C842B29FF46C9@DM6PR10MB3257.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wWk5lTh+/ectUjFaGpjXYhNmL8GB1r/aUcIrj79uLCN7KFSotRF2vWcdboTFse0vspch3x/fULkTsK4bh3uecbrXlinnLOv0LFB9CKtklozqhjhJSylqVUle0iRSboqQZw5poT83b1z46AOm5fW/3YpHAmEsYAPajG1tZol80Hzt/GRsHoEbDNr5WP4K+3JrvHS+6Tb0TDUqB+Gqy4vnJRAcxQrXSMgkQ326jlvIr7/LZIKiUHAuP3X2i2RCwWHaApfCUS8EUt0bwcTMBNt7Lre90SakryzQshnYvn0WRe6VJJsdOJNzXkewn1bvwTtsxgJMiyO2t/2wgjn5OlK6O4AcGyUJl3mIuBNKmT3/YBqb5HXwAI9MxwTsqaFmMGNEranRcuA9BuLRgd4XkmpfASDrfqTZ0kwGrPtslrjcgY0ZZSnvmafAEdm/867C/oXZMfdiUZZ7d9p20YyVZfkR/y5cETM+PiUKR4XpU9hYd2O+PJXV2j6jpm2+A7E096QLdM8w6U05a9FLlTUhdM4AXMMg6p3yWEEdVhF8PY+jhw/a3UQj/pQKYTwc2xGcr3EqcXoc2HAo7IJiH/ggscDC+/P2G3HwSqb3PMoKFBbRF7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(66476007)(83380400001)(66946007)(26005)(4326008)(36756003)(478600001)(5660300002)(186003)(16526019)(86362001)(8676002)(956004)(2616005)(55016002)(8886007)(54906003)(66556008)(316002)(6666004)(52116002)(44832011)(2906002)(8936002)(7696005)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cI5WTw2gAISY+RJb6VWK6Y01Qtx7Mkw8v3g5iSQkjjChYYjW+1UAfHaUswbq?=
 =?us-ascii?Q?82AEjrUFSw+BCNupGsmfNFZueokv5u6DI9CdxE5ljJppGlNHvmCGKLbOHinB?=
 =?us-ascii?Q?4ET1btPDpZQcZ2FM7JLN1aKOiv+QewbD/v4uPg6R0RU3OpV3rXVqfXtuzxyu?=
 =?us-ascii?Q?YxHhO99kyF3D9vSN0rb/Kv869jOAvaGCZXdpa80tYO8mKSvTjHd4rrXHp/lP?=
 =?us-ascii?Q?eMmORDdUp9EDGVuFnGr62JWP+YcWf2hJ4rTLud/lVC2VxUAG8N4HM+QgkMWf?=
 =?us-ascii?Q?TlCF4qa2uCFoVrt87TNc6rsX2gi8QSpQnWzt5qFIZMrp5WIyV3E6y/7LPh4V?=
 =?us-ascii?Q?o3I1O3hQkyTYq/WjCM9E1hEq8R5Z//tS4w1GyzaNAU/Or/ZWo8lv309DGFuP?=
 =?us-ascii?Q?MzJF81K6uB10R4vSUUG6nYONVm9cd8dxoY2F+SSIkEHiyV8Qi22D0q+1p+3l?=
 =?us-ascii?Q?XVBKuxSfLXpudrHPzWXdbRwBD1tiPU7Qp6fX6ZmTj5bQZ5N6+TjRMk7qy3b5?=
 =?us-ascii?Q?7p1cw7ohNr7kS8CXOlFS7ddKUUtamdvFWdCY4ycPRkFIYRB9VoeW+QyrUrKV?=
 =?us-ascii?Q?9MiJBi2j15wWXYSilxTTlxM3nSQqvNiYmwKV2qhWZn3adsb60h4Tvoc7GgwU?=
 =?us-ascii?Q?6sBmgk9X1ncD2CYqFxP25wB51v2uKhptSFOSwEYvZCd4FszYWfeQ+yuIF1+Q?=
 =?us-ascii?Q?UUN+/tSIga+deV2ki0eiI8gr/Dzy7tMpburbkN6xq3aH6pdSU7nn9D8YsxOb?=
 =?us-ascii?Q?ZsSq0IS6n6unispt9zLMdVBChf2+MYc/5HYPkV3ZfuDtv81GRf+e8uQzo1wq?=
 =?us-ascii?Q?iyLd/NB2ahxkrDuLv9kn57O8z+hXsypg+DEzY2L6DbVqFzJnccE3BIYtslar?=
 =?us-ascii?Q?kfqlqd6Gvwu4ubbG6H1IZJbOQmrIgcvgl0vC9lUHodW9Jzg9jwQAQvySoSdO?=
 =?us-ascii?Q?Nh+EZ6s94MgqdgYwuYmrGcOzjAQAB2HwABwuqMMpPgAJHX8MGgeYab3jXbXV?=
 =?us-ascii?Q?49SE/QT1pcvK8kY9GRLgUJlWzQCd4fwAbdvNg2zKoKkZqvIKyVMB4t6o9v8p?=
 =?us-ascii?Q?K//uFUeHA4cJjEqukbkIuQsQqZPDnkvSMIEM7xjDjuR4RYqgHB756a+TvJ9p?=
 =?us-ascii?Q?vLkF7sk+KfliFeXS8Z3t/6CJALqxWhTExZKoeBtc3Nd7jBNHEzA+sQrB3KJG?=
 =?us-ascii?Q?vaqo83F7grHBOsLIgwXTiZWlGGrhSij7dyTU5q1Z+POIWwU86SO8YqCS2dg0?=
 =?us-ascii?Q?JSQVDODGlHZA4bMxUYGs+F/jh6o+/ylNmXuvrm6LFSQhrc8zIR1tRmfEtGqD?=
 =?us-ascii?Q?8YxcbHf7Rd1I/woyQWaNo9fP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d6d9a4-8b06-4858-e49a-08d8e7a7aa4f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 11:44:17.8191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6wcY4mbLgGZb5/lU82VBjEOPwG2A4psxDc+ehUC+VIQejubLvP/GZgUz+Wnh/Z186Xz6AeMGpNX3oU1DTnezg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3257
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150082
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150082
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=darren.kenny@oracle.com; helo=userp2120.oracle.com
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
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sunday, 2021-03-14 at 00:56:37 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Code-wise looks fine to me:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren

> ---
>
> Fuzzing this device might lead to better coverage over the general scsi
> code.
>
>  tests/qtest/fuzz/generic_fuzz_configs.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 5d599765c4..3f4f4d0ec5 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -208,6 +208,12 @@ const generic_fuzz_config predefined_configs[] = {
>          .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
>          "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
>          .objects = "megasas*",
> +    },{
> +        .name = "am53c974",
> +        .args = "-device am53c974,id=scsi -device scsi-hd,drive=disk0 "
> +                 "-drive id=disk0,if=none,file=null-co://,format=raw "
> +                 "-nodefaults",
> +        .objects = "*esp* *scsi* *am53c974*",
>      },{
>          .name = "ac97",
>          .args = "-machine q35 -nodefaults "
> -- 
> 2.27.0

