Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195632FD6C2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:19:48 +0100 (CET)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2H91-0006Ly-6Y
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l2H1b-0000wa-Et
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:12:13 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1l2H1X-0006TI-HK
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:12:06 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KH8cAH040586;
 Wed, 20 Jan 2021 17:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Rf/QGehTm0fmia1JI/69wLHlxIzTq+We+0qcXW9gOYI=;
 b=S6Zw0M4b9hMUkyWpkUKGJEevcpXOcZtdSCeYNb84LJAZsLBdNTlkQ1TYj13vX5uI0zQt
 5iyeTELGd7CB8eUf+vMsKYErsnCVPcSqbiT0qqg/1kI0z8WTvNeOnH++73duHH9vOuih
 28q7luIOiK1CD5tdl9zmIlpVC20fjT51P3/mZ2KqSkdMNbtfE2RL+AZVNO+Je6Xh+DuU
 EsLyr2L4D7L+ejqghr695RJtwgsA9ZiY/qSRwX/EQLj7eoVeyp/4oybSFugPbdqiJzDA
 MTUYM1sfsZRQKpRKl5k68sCdWFkVnrhtLVCME5eR3A3/xjith87DwpzAHnZEmYayFm13 iA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qrbhmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 17:11:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KH8brJ069031;
 Wed, 20 Jan 2021 17:09:58 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by userp3020.oracle.com with ESMTP id 3668qwmaq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 17:09:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWlB3G8aA+x7McrnPwTl0tHcPNxVYwp0dX9LyaAHCKZeI0tmnIoapAOZtTp3X1I5A8X5B76gYhah/qB+9YCOej0Jc1AaFMpMI1XB/OQ91KqKKJsWsQD47oSd+mDRRGTMWbiRQNTAnI3rUvLqEqTXdv1sgnhQlTlEh4rSIjFQBxaZyLN6a/Uq+nlgFAZhYMmY2oY1XU0wdIZlNIhI0AtTej8+9HPZD/mCouMa/FhtVCbO5Rh5qOJ/MPHlDY9yNH/fc6XHxSLjbfvAIadHcp7ZQDlugaKshKuqcXZX90ojU/pxE0WrgxcZ9pgh96i/YJLARI5aSLVcsrHMPHltobllLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf/QGehTm0fmia1JI/69wLHlxIzTq+We+0qcXW9gOYI=;
 b=ctW1jwIDpf1U/AF60yd4MikiQz75m/tYfZ5AHK54f23zXKhWimZM2jOA8pMrEsWQKteAFZQSV2d200h6epoJJmxP9kaTPZgQTgTdSws1magrUY/M93dvWlJIbOv6ijgeVNmlYa1Uor0qs8etrWnKiVxUPcNsh/y549xgEpOPLrwdDYKH2oREJcpuYCdXnbCCSwB/BbEgYMW43gZ1Q6XrgzMJdIyUcX16p/h5yx4bRPRAqGBriDbeStfTTbSaFeREawvh8aK6sDnGci0Wuy1DQtHWHAzWsPq/U0A4UpqzzhbxqyUnlSiIASvfREg0gn41Vj9mlWzgPUulq39kCDrYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rf/QGehTm0fmia1JI/69wLHlxIzTq+We+0qcXW9gOYI=;
 b=uEbEvVCVKK1tq10WBQcrAFILi6ifWlDb+0oSSRbbGvxRKnxuOMiMIBf/OWIuuwS/NtO3Rn4k28sYzvBsIq1PNwXxEwInKG+Qv+5qliYE9qoS+wAAEjuoxUIRNUdR//cDxYbbZ2UQ7k4hFtTOCfiubPId/lvQNdU+E8N6z5ssSlY=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM6PR10MB3017.namprd10.prod.outlook.com (2603:10b6:5:65::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.14; Wed, 20 Jan 2021 17:09:55 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::940f:7f4:abd5:9a4%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 17:09:55 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] fuzz: refine the ide/ahci fuzzer configs
In-Reply-To: <20210120152211.109782-1-alxndr@bu.edu>
References: <20210120152211.109782-1-alxndr@bu.edu>
Date: Wed, 20 Jan 2021 17:09:51 +0000
Message-ID: <m28s8ncz6o.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:10:230::24) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:10:230::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 17:09:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c5b62e4-a601-4f93-ea7d-08d8bd66357f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3017:
X-Microsoft-Antispam-PRVS: <DM6PR10MB3017AF5D727FA385F7EA4FDBF4A20@DM6PR10MB3017.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMOt6XFTcahlQY8gr+W1B9f4mt3rRJTW5aqWe8AgYPzdxJ2fEHvMuVNievXQP9xOAVnk6pszQHfNJmJkols603nOoB23mOpB6NcorE4BW8G6+nh9yiO4Ip1Z/VcKkehB6cp6rtAHhnrTgDnXAyG2swoXU2KpL7GlYIxZpfPxSniM6l2pvVkPBETuagSd2u+JWPdcR/jsXopeK5ONHeqT6L9D0AcYu2QCoX2YctXqD0w6+GMnTG3QlxkhefCqgQfLBo+0nNZhei7ZhdsIqaFL1+1a1uOWtk1a3w3Tm0eMKexLu1jzIMKLB+7R/dYdXTx90nSBMKOOFWeBdnCvJ2NlHjVvUjiWQJNxg8elxZraf6st7B1Vb+W40/Y297Va8BlQNLdOkdd/QrcjWnM1LaEwGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(2906002)(8936002)(5660300002)(66556008)(66946007)(66476007)(55016002)(83380400001)(316002)(86362001)(956004)(2616005)(186003)(4326008)(54906003)(16526019)(44832011)(7696005)(52116002)(26005)(8676002)(8886007)(36756003)(6666004)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rco0owB22SVHnqN1046zBMHF0ddxHcHdnIiFfTOZfPcQwYH0jcHHScTcsblZ?=
 =?us-ascii?Q?UixdVT8qO6h7LWLfM0ds5eHCsg73IDSRrnuCjR4nMhK0/Bw+1rNABxZxuSeF?=
 =?us-ascii?Q?LgQk65oLydd8x6SaOUFCKD9LmD1MCYazas4dP/Ypc5kjqJmkMGXyzLe4Ae/u?=
 =?us-ascii?Q?3wY8jdRkOkQUO64bQetc14zIugy1FaK2afTs9Quy9Ezja2rwgyLAUKQjIPfi?=
 =?us-ascii?Q?uLO73/BAl0aZVg8Hi8vkqloA15JEDnZMjJ5LtTXY2nlnc6UuPUEL/p7jF8Ee?=
 =?us-ascii?Q?1OJglataw92O9QlQn/UhagasAapdngakQfG7YdIoRJh8WSHE7fGTsnTlHjBr?=
 =?us-ascii?Q?HQ0Ewt/O8EfredXQ+bk9B4Ksy3MrMY8qNxCq2xkR/7fe9FlJStfRlSAZy6Ez?=
 =?us-ascii?Q?cElkXaEF6BeceD3RO87W6T1wyvWZuudJ4zImaGkAB5GM1i6Lxpu/WkueZghD?=
 =?us-ascii?Q?0KG7sihazwuOH43lnyoSM7a7GqLwPCkFJcLkdxfuhGH8HG6Be6fWzFnkIHo7?=
 =?us-ascii?Q?fD835pYLNjT6f9TheaAW4YcGR47d7K7dtFHtxlk7x13MrRwtrVn9n0zaAK6s?=
 =?us-ascii?Q?rSfpnhOGBOjO4Y2ZrhrcR3QEPxc5GbstmqsNQV3wAEY7eOjZ8kVlTJMwuCKo?=
 =?us-ascii?Q?lfis3B/jCmgcdFi8P+PLTcktPGcrDQ9KBygURN21yZiPxMeSgHI8iS3r1955?=
 =?us-ascii?Q?UTwkrGBIgpgbX+vK2cBJknGhY4OjYYDfn5ZzPfL6oH1LjyzGbo4GK2MDxOfH?=
 =?us-ascii?Q?k+SoM5/4GiK8qxp7obFkpBvRDrEWmJt0sL+pTDE57DP0Jf/zZ449GIBMWOSN?=
 =?us-ascii?Q?oJWaJ2DOSTzNoTONdD3E2SH6xbUf1tEM2z/FOJS3Z7lWZiGlwkSUF6IyQT6p?=
 =?us-ascii?Q?gP2i9fnu3rff8/LgZtrU041nbNuM2OssYeun2ZOjVNuBXdueD+pjlhz97v6W?=
 =?us-ascii?Q?hKFLxb2nCi9OEfQlmhlfbJUhEqz/eiuaSn9GZvOXqDHP711VbJ5UiqcmMEw8?=
 =?us-ascii?Q?BW8aVZsam6HsadWIUxvF1bTz7VOO+0zYuWEvlMJvb6rMczex/6bjYFJK2WZ/?=
 =?us-ascii?Q?0YJhfgzu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5b62e4-a601-4f93-ea7d-08d8bd66357f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 17:09:55.8108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEKanA2pFXHeWTy6X0BPH7WpE/jJ76CKYRwTTBXAyCgYUsl1+dzqt9F0WrSpJGEmfQIDmHLjkp8xberWak7z3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=929 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200099
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

On Wednesday, 2021-01-20 at 10:22:11 -05, Alexander Bulekov wrote:
> Disks work differently depending on the x86 machine type (SATA vs PATA).
> Additionally, we should fuzz the atapi code paths, which might contain
> vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
> cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
> machine types.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>
> v2: Fix ide-hd -> ide-cd in the ahci-atapi config
>
>  tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 7fed035345..aa4c03f1ae 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
>          .objects = "intel-hda",
>      },{
>          .name = "ide-hd",
> +        .args = "-machine pc -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-hd,drive=disk0",
> +        .objects = "*ide*",
> +    },{
> +        .name = "ide-atapi",
> +        .args = "-machine pc -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-cd,drive=disk0",
> +        .objects = "*ide*",
> +    },{
> +        .name = "ahci-hd",
>          .args = "-machine q35 -nodefaults "
>          "-drive file=null-co://,if=none,format=raw,id=disk0 "
>          "-device ide-hd,drive=disk0",
> -        .objects = "ahci*",
> +        .objects = "*ahci*",
> +    },{
> +        .name = "ahci-atapi",
> +        .args = "-machine q35 -nodefaults "
> +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> +        "-device ide-cd,drive=disk0",
> +        .objects = "*ahci*",
>      },{
>          .name = "floppy",
>          .args = "-machine pc -nodefaults -device floppy,id=floppy0 "
> -- 
> 2.28.0

