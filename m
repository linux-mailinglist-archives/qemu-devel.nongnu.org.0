Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310383B2B43
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:20:27 +0200 (CEST)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLX8-0005qV-8q
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lwLVt-0004zy-Ol
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:19:09 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lwLVr-0006Uk-Iw
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:19:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O9CX0U009271; Thu, 24 Jun 2021 09:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=JFmw1jMoXMX7bszM+1+wltfouc7Kdg12mBzTeLGbMBE=;
 b=nhTEad1rSqk+FTbsM1/OALxwhp77TeDAwINILMOs2U+oxqiB9WEFYrSPvzyWhGmSu1qQ
 UgJy/4QWUXgM4qO5+UWiOJ3kqtHmPtTUtshSj0RAH5GA3uBrL6klOspMN0dMCLtAiLDm
 Qpz1kg4lyCqxq+mCKGP9HkcuDdZ850sf1OF2ginVW45zpgU4AioE37gA718qan8a+lKF
 hEKWkcsxK/fMn+eGwzMfaYcAw5CAxZiVmAzUk9oj0tfjaRdvMPCw4+lVqIFcX0U4Nxy+
 bnKmwsWj9BoyBbazvG13/i9KYlpJC3dX2lUb5IcEpW5XhRGCq1Quu9/cYjbahNnBmYQR /w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39cmpxgcq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 09:18:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15O9FkjA010426;
 Thu, 24 Jun 2021 09:18:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3996mgafja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 09:18:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE4JzQs9d2Hw63ZX9UMHv/GbojfJlHZQYncxuYgoe8OG68qbsoDJ3mExdiIud/ABnDHNL5lUdOpBBHVvW72C5V/hDFBaSwACYFQARzNVzsFLFE/SJBsR1dzD1pXS7ujYVCEGrXkI6pF8Rw/3J62DpwZ1JyGnd4GvC1QpkqtjCm0gLyMAigxTTA812jM5Zy2ZBgo9jNq32o1PW3yHh4uqA5ngO0bF6xS7E/VaoTjP6aDHe9WVlCUXZNqbg7g/kQTtaBTb0+J/v3gwAFyG6mJom9NbuEkHTFm9A0r6On2yUiM7OtNeb2jgNAflozKNMvy6oYu5rTXP2KtAl8YLzWE8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFmw1jMoXMX7bszM+1+wltfouc7Kdg12mBzTeLGbMBE=;
 b=Pa93Bs5hub6UVHeBqnyYwoNQ5ZbO7FjJLCF6P394AGAF1dUQltgJfEt2RUdYzmpbWTVvrGSm+H3HWNzNH6O904L50CNPAO2XjuDgOa3hyGfRimvBXQmwK+OAI/X8B0AAaCc58NhB/1MHbV8ADm9eBPQHYtE2aOb7VOUk8iQRO/YvMvmBCf9UuPZpsijrrIqIqVyKoX+MpUSh6X3BVhYkEFec1piyl9u0QXudLqG2sjsY9A5yzOg81uy8MoGT23OEG/cSQL0eAf5AFeHUX/uhzwN8CHzefgtT2SfvHhJgft1MJziQpLkk4sc/nBZc4cWl8w0S6vEr3ord3wKFVgCdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFmw1jMoXMX7bszM+1+wltfouc7Kdg12mBzTeLGbMBE=;
 b=krubwdtEH+LhYKzRoJ3XC+TlcW3dTm4phH5kB3N1Y6Nbx4RxP1VBTWAmLgB+co8xsNJO9tHEbLC+auf3UJGWsOojQPEqDnSuPKso0NTtwPuk3P7nTaq1MneUWG4GBkSqUfXMXfKFYU+W0ukO0W27kf5rhrQUAGlxnhlp1NPTvbg=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB4834.namprd10.prod.outlook.com (2603:10b6:208:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 09:18:46 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676%9]) with mapi id 15.20.4264.019; Thu, 24 Jun 2021
 09:18:46 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/4] fuzz: fix the AC97 generic-fuzzer config.
In-Reply-To: <20210624034503.86256-4-alxndr@bu.edu>
References: <20210624034503.86256-1-alxndr@bu.edu>
 <20210624034503.86256-4-alxndr@bu.edu>
Date: Thu, 24 Jun 2021 10:18:41 +0100
Message-ID: <m2bl7vk4cu.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0176.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::31) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:10:2b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 09:18:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 995c1fad-278f-4489-6c7f-08d936f111a8
X-MS-TrafficTypeDiagnostic: BLAPR10MB4834:
X-Microsoft-Antispam-PRVS: <BLAPR10MB483478F0E6A92EAAF65C833BF4079@BLAPR10MB4834.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YnghZL1XbLpNGE6A0lTVA+pCBNJCti/PKYCDMPZNS7dw7RbFPAZEVBEvYaMSFx79+64mkQWI3hAtvD9NSZrieyIXIYdbUEhmTL0YGaSQFaviSmZ0Vkew+lhTQ6i5HGIY7moDXRDWCAOkn7sXcpHg177MN81Bk7lOUbMPl4l9VRXU8hSxsGtrlc6bBe9SW4/gXI1FZv/73UCe3bAF+OYdEZ9JannVTBFbgW8qi4pVg1fABCL0YxHAZm9VdMbj8rANwu5auChmxnAUWYWJMzn6WmmaKuF8mRwz8OWYzhxznZw5f4QcIKaCgAhoK5bitoGOH3BHUFfwrzbKwzsDYdPKUKm9osQWxz2DSMg0plEn5csYGyDrV8mzfOcVNHbp3wJ/3lrlZOV5UNMwypdPw3E5XpgbTBc3RNU/5z0atueqqCdcXbsR3Hi7viiz1MTVNVRXEYKxbM7fen/AoHX8G0KPboM2e8nEGBQ13zafrJevpVr7WwinYC1DypimqE4DRIVcAr50+J+u+XW6NSnRxIK+GgwlTphVuoQ/WtU7+xNWm1zLuYHbA76Qenl7z0Y4+YEbypvvuSDWZC3FZfkfkVZXtlApCkVKrGbdVBGns+IhyChK/uT1+rnVTalGIULx/yJm7VUoBW3/dWdnCuIPwsYtU2c/xV8ohYx572vb8kSUiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(136003)(396003)(376002)(26005)(36756003)(16526019)(54906003)(2616005)(55016002)(186003)(956004)(478600001)(38350700002)(38100700002)(316002)(4326008)(86362001)(83380400001)(7696005)(44832011)(2906002)(8676002)(6666004)(5660300002)(8936002)(66476007)(66556008)(8886007)(66946007)(52116002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mdrK/ezqy0ZQmoRM7B90qiEjYb6ybTGsvk9JofX6KqEux9YbpbPUVrkpUYHm?=
 =?us-ascii?Q?KpzOkdD1Oahp0qEZliexrgnoAaN9tkqRLs7iEaAc2rxjaC8FHkc5Y88rw/so?=
 =?us-ascii?Q?W1e26OO1jLv9usgXuOcJW51uX5H8ylG6/3I5TZ0NWsdKWeTAmI43PqwPL9p7?=
 =?us-ascii?Q?PBizHoqJBwV0sk7YVPJQNJ57WyoZVazbERsug9/fLZH4P4eiww+QQY2Dix+y?=
 =?us-ascii?Q?7wq6mZV9oJaSps9xQ4A4rrGitnLgWZD0jpqQhn8iDM4qhOvcIdIxXQTQXf9h?=
 =?us-ascii?Q?k3sv1bter5dpvfETTs5Oj3dTsrv0ly97BDNDn677JwBwwKPsLQ0z307i7ojs?=
 =?us-ascii?Q?UOAZISNTtPZid0UjJ2i4DVDkJaMpISWZ57/DM4NpDOt0OI6c1/iZhg9JSbo7?=
 =?us-ascii?Q?glj0Wu60T24N3e9YhsFaGjNV32eDeLOe1kHmDzf74EfG/8nGHZk7I3JO0l61?=
 =?us-ascii?Q?yFVQ9ZXPsjkikF1eobX7Dw2WbwhXNT2Gsw3ekEtww7eFsU5ngO7TzWzQz1NI?=
 =?us-ascii?Q?i/6h5TTBenYNrAFk4G7PJ3MPNFqDqqX52xvKYjl3tqI7t+WMjgm9X0TnNcMi?=
 =?us-ascii?Q?J+ai1h8opgAtZ6xJ/9jexvgdgKHpLMesw4iIN62Z0yUb8Eg706OoU9lpVhOZ?=
 =?us-ascii?Q?dMFO95cGI34+phpcd1lhYkTmcaWecGwRvfOSlwAvnwcLIjxs2XgUioQclSi9?=
 =?us-ascii?Q?1PhdgbbKkQToiM6H1ukLooGLQLrhwtk/r7v8Ux2Unh++z9Y5bNmmQmIlTbVd?=
 =?us-ascii?Q?eSAaSMK41QRkl8DzAq8xx4HnbAsLVLeJCumEmGnMDlEeltj8ujR4DzaZKUgz?=
 =?us-ascii?Q?kMw5KCdKI55kyrIStq87dnb5cjCR3dxo454kuOnPUksQ8jE/XwPlVPunT7Do?=
 =?us-ascii?Q?QpkIPcEaI+ff9DskinL5FLle/OjWH1MyyJM8rJQYw+YwT8aYuU5WvdbpW0sL?=
 =?us-ascii?Q?OTeTTmPYvhv5voPqZ26rPnZFtKQZ4Ny6KOB5P1SkhQ5a+EUpAUMHWRnAyBho?=
 =?us-ascii?Q?vSK8he59li2b4OENw6a/TFA9rHHjuvYzMYGEvNCWc/VLaZytD9lNUlizp3bI?=
 =?us-ascii?Q?w2wS9dhwm1rdEJilWnR0myXjyKxJMSlaoJlPiVXa3TI6v844VCXF8zOoLLos?=
 =?us-ascii?Q?45GCBBcA6HOYUS92ypjSD5TsPt3W2q/Wmm2bzDrsmP7NCKk5a+hROVT9XkAh?=
 =?us-ascii?Q?9aVB8uYv3qaMEkUbzTL1IiTWULOIBxkoUHwISJ3owoMCe+sfrC7hIMqtpug8?=
 =?us-ascii?Q?URB1Byv68WxRx3hZeH+E4TCS0IzKfk7Sn1HOOXG72FeIbDWfDOdGkfEu3QO+?=
 =?us-ascii?Q?7hEX3rIQ7FcMkC5VsXJDVN7W?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995c1fad-278f-4489-6c7f-08d936f111a8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 09:18:46.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nb2k6dZTK7yluhb3bOG++64IXMdGvQ0MghpodMZVc8XPTZKbwW2owgD4dV4+xzB2Qod+qzFTeewpcnjyRn3jsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4834
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10024
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240049
X-Proofpoint-ORIG-GUID: wrXrayz7Q425LXqHujUa5IRefNZ4nNx_
X-Proofpoint-GUID: wrXrayz7Q425LXqHujUa5IRefNZ4nNx_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Given that 2 of the patches here are simply adding a capitalized version
of the string, I wonder if this is something that should be case
insensitive, and thus the code should change instead?

Hypothetically, how likely is it that there are unrelated objects with
the same name but different case in the name?

Isn't it more likely to be that any object with the same name, despite
the case, is the same object?

Thanks,

Darren.

On Wednesday, 2021-06-23 at 23:45:02 -04, Alexander Bulekov wrote:
> TYPE_AC97 is "AC97", capitalized. Fix the config to account for that.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 004c701915..049697b974 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -218,7 +218,7 @@ const generic_fuzz_config predefined_configs[] = {
>          .name = "ac97",
>          .args = "-machine q35 -nodefaults "
>          "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
> -        .objects = "ac97*",
> +        .objects = "ac97* AC97",
>      },{
>          .name = "cs4231a",
>          .args = "-machine q35 -nodefaults "
> -- 
> 2.28.0

