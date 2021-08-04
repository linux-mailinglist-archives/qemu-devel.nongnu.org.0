Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84E3E06DF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:42:08 +0200 (CEST)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKu6-0008Um-1A
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mBIu3-0006kA-N6
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:34:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mBIty-0004Hi-QB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:33:55 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174FQ755010345; Wed, 4 Aug 2021 15:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ylMNNG7m0yeCbpjwiiBnUSW70tGjkt3jdMx50dwiOxg=;
 b=dFqv/LdGEdEV+qoYb5wmZfRawASeoCXqzoYeo6MTaZG4urixuPOJYKcGqxNv/kk7YeW6
 vQXdpCZRdvsh+3hI+qcuzrzlzpug7dzLXOnSikf5sZll+NHxniLTsSR9HgpIeVenlLZw
 1FOlYNxqQAoQDTPsRUzVmVM2vIpR4OTO/4EPSUaBCbfyF0NC0QE0xw1NRtZgJmwypd4+
 wnuLGpLBJKcpMJ1OUiD0H2Hu09F8hx5FZAcnFoKy1RfGfmhfd2cjhWxbUKPrbWbjPOKM
 9ntzwxSSiYczHzEbZprZd4Gl1axNA27kvlTmdyU7lykPravairOHe6X/ttgW4GK9amWm Qw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ylMNNG7m0yeCbpjwiiBnUSW70tGjkt3jdMx50dwiOxg=;
 b=q6C7bxyrs9KBzuy8HWthimcs6xSostSudjBIIuFo6C4HixWQRSb+a0zWH9ubLV3nXmiI
 SGUL9wod3nIWtFjWmxRtfWS1NBHuN8x3bir78ipH1czfykPSgAkAoGExbvUYaVmRgKM9
 OxYPV6kV4EO5n3166GV6nJHRni10iniAj7rwRDlZ++qYKty8p1zJOJFzNYv7qbWr2f6X
 ShC83seqw1R5ZsDR4i5bY7O+vGuyP2b8YxOydnQAoNqCYcZg8uAUWtZAHbOGrGxLyArl
 E3sgD/wtIWHKAYfUP3xFSGd4hforyGa32nrEdzBzytM3qCjF9l/X9qQIWcEhSU6zq1Tu ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a70pjv5v4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 15:33:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174FQ3df107418;
 Wed, 4 Aug 2021 15:33:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3020.oracle.com with ESMTP id 3a7r4812dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 15:33:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJH/OEivpRS3pvmTG/JZTKzgVfRcb4yGqQVHciIhtZiZv8xpUx0xcFwPargU4iauMUyTI26zhGM38RJ2Ol1aZmTZ72DJbznaYCDWBZJ0unz1tuA26COVlnySyVAW0k66CPekUtc2K1rnGrbmHs8ifMncU+NGSeT54QUpxQfQQJZ8HcfLfsSO06B/C1p15OXoViKpeRHG2Lk38iqIj0v62CUQbY5WCDywd2tAVLHpASqmQ/2XHCBAM+uo4YKalnqNGldQvWLlNx3FzpOlGpMOY1aWuAu+o5mdobdOvcv7pDTEpTyHA38QXkP18p/xD2VzoIXEggyp7CuAk7hkv6NbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylMNNG7m0yeCbpjwiiBnUSW70tGjkt3jdMx50dwiOxg=;
 b=FLrt5S0L3NSpKczSPoLINjfxmkSX1Ei/fGENaDZtXsShG3a3xgW5uulKh2x9Q9YI+ipgXAZYQmFMGjfwHfZZwfukEk3NXpp1IU8rYwXup4MwK7Wybh1CIXcLsR9937NpeRqNYatoQxho+HCMmn0Dl5oNdcuQFyDu17Xg4LwdC4lwPP/CPgFD5fZ83qyWRZGo9xMChvoLYVdaHgg1SXbcNjA56576H8NK1bGS1MM5SshnPWQQu+chHy+ZOeJHV867EXf6LIDOU/yxIivhkwPR7nMN6Sc3WmmU4rFMXKtKUfeW9xP4a4CyAVYlvZbf1oCheHVMJ+WF6XivH8eoSYR9xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylMNNG7m0yeCbpjwiiBnUSW70tGjkt3jdMx50dwiOxg=;
 b=SOzTsSYpFfYLQl63EqhXAUZ7axNM6Aaaafiiqh8RJTra6NiRBvWmTZP7BnF4ye1o1jJ3s/0sXfto8O87K7J6njo9yv/iVuWbVc4D8EjRJB+Qeg5yFl/I0zpYFCDEMMKrsMJl6jLg29mTIBnZNApu3bv1E0gwwNnquu2uVg9LSgo=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB5250.namprd10.prod.outlook.com (2603:10b6:208:333::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 15:33:32 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 15:33:32 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] fuzz: unblock SIGALRM so the timeout works
In-Reply-To: <20210804135621.31455-3-alxndr@bu.edu>
References: <20210804135621.31455-1-alxndr@bu.edu>
 <20210804135621.31455-3-alxndr@bu.edu>
Date: Wed, 04 Aug 2021 16:33:22 +0100
Message-ID: <m2a6lxi5rx.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR07CA0104.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::18) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (46.7.162.180) by
 DB6PR07CA0104.eurprd07.prod.outlook.com (2603:10a6:6:2c::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Wed, 4 Aug 2021 15:33:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff0c2022-69b6-4e3f-ccf5-08d9575d370b
X-MS-TrafficTypeDiagnostic: BLAPR10MB5250:
X-Microsoft-Antispam-PRVS: <BLAPR10MB5250BB411F1831309B83CC88F4F19@BLAPR10MB5250.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxRHRNNQThA/gamMKoTzr6Z3NKj/9efFMKyq3DxmL9WNGvDMral5NQkeSXjDummYiUnAtUYuBdWnaexCs0/354nZ4MnvT31CTh88xe7V3JmdFelxoAEhutuZGjm1sB2WRuL9h21+qsG6143OP7ghrjBla09zhSrf1+Gq9/9B012BJUDFzHlpAt233bF+0Fu6ARWiM4y4wQvYix8BvG4RNnTAufbOdKp1gSLNvWSSIqvNybmd6nEiU7H6LOurAbppzwm1wDHIEZ6GqrjJR8BCOLHd7e05rElYl7ya3nsww9i3n9iVQNADkZqq2PKjJfnpcafXdPEIwmCFwuCBZO3BQv/89jjCUo06Ryf1DIZKlZ76kKwZLoAXDBVc9eOXUQOfNGulRlvA4JPzpjcuJZBMjlY1rYQAJY6YmDcNmzd7RG8D6h6NyMSZN1bftMIUQRAlUsZgrwX09XVqBQhnDwVJiWe9d4ePFNmQAzQfNAR1sAVrHyD/ypvcymfZkxmkyDyau+O5lBLz7mCJRDSnVIVipU+Wqb2U4rYN1gSF0czzDSW2xmjrXmChObO9MJqqW6sNFSTSyPTOvFPcIgvKAw/TM/2LqcN8Rp01/0+brIJuoJZGhu5Hwe1883oZtTTecUjJT0fSx3iOGQwWueVVOi5f5vXDZa+aDx6AMD3QezScd7dNZnxHp1GjtsNxD/RT43aYTEEmQofzhvQrj4LXMJLdBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(396003)(346002)(136003)(86362001)(478600001)(44832011)(186003)(36756003)(2906002)(6666004)(26005)(38100700002)(316002)(8936002)(2616005)(54906003)(8886007)(956004)(7696005)(66476007)(66946007)(52116002)(55016002)(66556008)(5660300002)(4326008)(38350700002)(8676002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZfc6Qewan7bBUIUhrTSdpCcsIL82aJSNlTKHw9/GnxULYO/NKhI/kPPEm1O?=
 =?us-ascii?Q?gs3rQSnCmXIhb/KOZxaqquPvz7u6Qg4blJ93hXvzA3jI1OoZEtMrRXVrl/1u?=
 =?us-ascii?Q?5RMQEzsoxUyPNXuyvxZ2fUdpR+Cjnn4hNcHPq0n1LS6HB1Feynu9WLlQZqbt?=
 =?us-ascii?Q?wX1D8w3mB6xAv9wmOnS2e9zCq8BCSkp/mHVDPw7IXYYi5tjr7DIQwkPcW0O+?=
 =?us-ascii?Q?RmSyZl5i4SD67FSo5sIXsPv4BAaCVo1rcRrsJsJLE/7Fz4glw1iqQYJZSI9p?=
 =?us-ascii?Q?h2jVK97IL0VN1IHr943ALVT0aEvlHoFE2f8YnZLP3BcPrI6t6lnaihcztlzh?=
 =?us-ascii?Q?mjZsjcPtJ5GnO0BfPhXfrEHKMbYBKbW2D9gkyr0PcWWHI4fYMPQEEXmRvsXS?=
 =?us-ascii?Q?RF1Ba22Bwn3HzBMbtzAsdiOIA/nkueSDOJtoRs/XSn0f81DHrV99SZ0G67ul?=
 =?us-ascii?Q?DiBWbckAFA7iLB35yUu8eX3aTUCjCFmb1/Q80thzrMAtWfvwix8NnGsmSkrm?=
 =?us-ascii?Q?kr1uu5d2ERJQ1E1vJZjw0liP5GnL3bBOBZJ8zQxQ91Hs+WEypvtpbjWyB6Jq?=
 =?us-ascii?Q?AnGhB5CBcrWI0rNdMqv67vwGyqPpAjpxQmGnQmHtJd0nujUOF7wM8PQNEi3q?=
 =?us-ascii?Q?qc4fTj2JmQehtdTENOqJkeUMqBh5LM1+7H+szNceXVdp/TTjvj29h9Ma7eUY?=
 =?us-ascii?Q?pwm1oUx1G2+K/CjyMTVdt+JT9mB5wk6rwSa0foITN4xhqW+89oQu/jAqKj/c?=
 =?us-ascii?Q?J3sWPiXTGBV8DuGWjs1AFiu10NFguow9wbsnc5jpqOdw8OXMGsNANRdiT8Wl?=
 =?us-ascii?Q?ZRMdF1NBqZHBcvX1BbJbXjoGZw8aeffVRF7Gs2kv+KRwXHzf9SmhSJrv++qq?=
 =?us-ascii?Q?jdUo/9072eE2BSDlELEifSmIyxz1rbPAzDNUUTX4nZkYvsA7UNjSvCj1fsfm?=
 =?us-ascii?Q?+5JaReGAxXg8j7Jezc0T/FAo6/JkwuEVuRNvZKyNMUYXBQFGWLkXQ3NHkOmN?=
 =?us-ascii?Q?hQN0/0dysCSK3o0q/Cu/wloKSc2j7PzEtkDaGzAmJJ4kj/tJB5I4EIZVsHlr?=
 =?us-ascii?Q?9+phVHBfM5ECBP8ohLjsw5pt6sOHRhFI5E7BnqKumwJn+CZ8UrZMIhrwDLgv?=
 =?us-ascii?Q?1lStOUI7Vxy3SnWntga305JtDCFRKzfaea2xGajX22c/v3X2nIeuaw7QoIYp?=
 =?us-ascii?Q?SHoa5OI6qPJ7e/lpSzOIMrKHzbTC2nI12MAyqafstd808M7wxJWi9VvhkZDI?=
 =?us-ascii?Q?JMrT1kLOxxMCK6/5+ZvKDkGwBZP8XZt5jfjam3O5MU9XNYakQy3w0UQeGgzl?=
 =?us-ascii?Q?x07WH+Qq22n/ZwrGU22ej1QI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0c2022-69b6-4e3f-ccf5-08d9575d370b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 15:33:31.9459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/JXWNj80W3RdtiVQKnRS8MgZYS+7pfxZ7rWUo+/PxB/Us4i9vAT3cJhxwfJT3hEmHqIcd4gmJYltIPBujGBsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5250
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10065
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040088
X-Proofpoint-GUID: OrVuWjddOwoQfWQFPfB8tyZYLyQdrXCS
X-Proofpoint-ORIG-GUID: OrVuWjddOwoQfWQFPfB8tyZYLyQdrXCS
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
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-08-04 at 09:56:21 -04, Alexander Bulekov wrote:
> The timeout mechanism wont work if SIGALRM is blocked. This changes

NIT: s/wont/won't/
     s/changes/change/

> unmasks SIGALRM when the timer is installed. This doesn't completely
> solve the problem, as the fuzzer could trigger some device activity that
> re-masks SIGALRM. However, there are currently no inputs on OSS-Fuzz
> that re-mask SIGALRM and timeout. If that turns out to be a real issue,
> we could try to hook sigmask-type calls, or use a separate timer thread.
>
> Based-on: <20210713150037.9297-1-alxndr@bu.edu>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index de427a3727..dd7e25851c 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -670,6 +670,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>      if (fork() == 0) {
>          struct sigaction sact;
>          struct itimerval timer;
> +        sigset_t set;
>          /*
>           * Sometimes the fuzzer will find inputs that take quite a long time to
>           * process. Often times, these inputs do not result in new coverage.
> @@ -684,6 +685,10 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>              sact.sa_handler = handle_timeout;
>              sigaction(SIGALRM, &sact, NULL);
>  
> +            sigemptyset(&set);
> +            sigaddset(&set, SIGALRM);
> +            pthread_sigmask(SIG_UNBLOCK, &set, NULL);
> +
>              memset(&timer, 0, sizeof(timer));
>              timer.it_value.tv_sec = timeout / USEC_IN_SEC;
>              timer.it_value.tv_usec = timeout % USEC_IN_SEC;
> -- 
> 2.30.2

