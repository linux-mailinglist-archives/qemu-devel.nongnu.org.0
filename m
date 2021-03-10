Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD5333B31
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:14:11 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwn4-0006nw-V2
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lJwmG-0006OS-RQ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:13:20 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lJwmE-00015B-E1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:13:20 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12AB6a5f096912;
 Wed, 10 Mar 2021 11:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ID4vtAnoJuU07L09oNI2Tcq8cqpccm3EvkHlXVdBF/o=;
 b=Uj6hjFcHFXhR4zmGBEy8bBAJI3RpaoK/sei7WvVxyiSSItHW1/h3EdybgDWtDr0AVV02
 AQhI3NS82dfJYsw7/VpslAshP2M0x3yompYZClvk945NnbmD5LmHS3VhyUt/B8r1Omrl
 gRN5bHWHS9LS4OnDEZFTYCbqsdAjU+CuX3XVrESIioHiJV2LD74VoG034T2R45d3ksQj
 Qr2h/yHl1ciEioVi9qL7zpUfRt0QxafxCpcSs3E4vu90g24C8UCKkbBg/GguPdpOug7a
 XYDhNMVR5S1zUSPiuQNSm+7gYL1Pm6Pc0MFu7UrmC207j7kl8x3GFNqH5Gpix8rj60Wb PQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 373y8btqxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Mar 2021 11:12:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12ABB3d9173283;
 Wed, 10 Mar 2021 11:12:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by userp3020.oracle.com with ESMTP id 374kgt6sc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Mar 2021 11:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d42StpXRCFdDQzGepf/eca5ypHT+1iOfpdXvZu+io0OAJzXsdlLSszVzGYDY5y8d4ajPb4jLMftyGsOnjDlrfvARmxQtpCTjConBTs8vFTHqdBzy48HHEMrzI6SBqNJoLA9PdfhZpEvOImy2Be/P2pW1O4dDWeMIiRNETxcP+V7OKFO1wfwoJGmJUWMAtIjqPLqVg4qAMdX6VgeF/FL//gt00aURKF1yqnrF3kJ2UwELRVA598PfDvlT/F2hz97jAy2VDNAWMZ5rq7+7H7srjDs+r4NxMW+jl3g91Qb3KqbVVtXPLCP10d7P9/NaBUKlEhcfBzuv2wT1iUfL2KRmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID4vtAnoJuU07L09oNI2Tcq8cqpccm3EvkHlXVdBF/o=;
 b=adp0cBINRV9h4tbGe2IGQQkLZsaOttdHc2J3qbZ6W3QmBRs1L3xs88uSQm7f2Fwit0wOM+viC+4RDILmeZLREZXwG2JWHakS1ywtrpNNSu3Snf8EZvNvDvJTQ2Wq8RPAhec9D9UioF7nZ9MrRvhiQitCA2V/g1GGgZEn6JfyUzseMTvlUYsGfXjxXkKcHcpba8UE+TE8aZRKU0fIAGYeDwPSHh5HuW4/9ejXMKOf/b+aT/EMCKlokPYVkp+h89iv/BLl3TbnPs0Vxb1icPUMA8+RQwGbo8IW8asgiY+mgQwft393DunQa6K+Ul7+G6uQOocodU5+VpmzfXmJDli+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ID4vtAnoJuU07L09oNI2Tcq8cqpccm3EvkHlXVdBF/o=;
 b=tThqqQbzh4SbhWCeQvMbo3ijQumoX6W+ldhq08sncMcuALxZAGpHNJaKs6NQ7iH8RZv/RYa7ib26+YahAHxhdcLh20imoRcl3Uly4ZSc+3DqAy6io52K+UusjyoCSSjaZ7WIO52O0lKDXCnzR7uus5mX8L24thKLaMqmwkYtyD8=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM5PR10MB1433.namprd10.prod.outlook.com (2603:10b6:3:e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.28; Wed, 10 Mar 2021 11:12:55 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3890.039; Wed, 10 Mar 2021
 11:12:55 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: don't leave orphan llvm-symbolizers around
In-Reply-To: <20210310061236.947182-1-alxndr@bu.edu>
References: <20210310061236.947182-1-alxndr@bu.edu>
Date: Wed, 10 Mar 2021 11:12:50 +0000
Message-ID: <m2pn07tg7h.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DB6PR0301CA0055.eurprd03.prod.outlook.com
 (2603:10a6:4:54::23) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB6PR0301CA0055.eurprd03.prod.outlook.com (2603:10a6:4:54::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 11:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24aedc4-515d-498c-2931-08d8e3b573fd
X-MS-TrafficTypeDiagnostic: DM5PR10MB1433:
X-Microsoft-Antispam-PRVS: <DM5PR10MB1433EAAB8303184368DA6EC7F4919@DM5PR10MB1433.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7qdY2NJhee1fWKgdqPxn97H7xDV83lgKk+AjVZMkEuX6KfBWCmOxqO100Fu+aSHOPySEaVJ9yIFe6sdEOWKWvhx2WWMFBHV7xTYo9HtXqVVtxy6CflQ2M3Dkm4csUKSIw+7gzaP7NR2uWTPWPJG+9ihZaPwRF+n9YMct0y4Yf4RZr5mIlwGJ7hdH5Oaxqoimn09GIDfbHZLJrytWoCOB45zbuZHOlEuLnc04YF/qo+oVYzmNLPUNvVWHXyj8S2RdeLRODgLPeKR+Q+BYMwSjsAmzaJea34cMDL3Jxb3MB9/lIFG+nKJ5dvjCk03opVTmhzHS0W4PGI+nZvOXz3Qr8hzFQbDBeKUvlcTbj1iOZKXEQDCBuaWD3dJoymLNdvq6p6IohnJKuXUn8mYIyRXbvboY11LJtEyw8LzmOta218xKo+zwNZwBMBby5g50sTHF+myD6AxmLirW2F78mznn55ZRv8eAl2JiEozKZu5wWLf9JgvJowEVGnzRzEYxDAMdtM5ohVAxfa/jB74t8EnpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(396003)(376002)(346002)(2906002)(55016002)(478600001)(8676002)(6666004)(26005)(8886007)(86362001)(186003)(16526019)(83380400001)(8936002)(36756003)(52116002)(7696005)(316002)(44832011)(54906003)(66556008)(66946007)(66476007)(4326008)(956004)(5660300002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cQubl8+Kp7WWfJPYe+TtpWdzE/0z4P3ePxDjNxogWEKshN6ABvldqdqZOEg/?=
 =?us-ascii?Q?6wlfDIWDbZD6OqAXSIR3YA7Agwh/rvHnuYLex1f9Yh3R/Lx4yLxPI5KHb454?=
 =?us-ascii?Q?BTCpql+BByXd/EJwo2q2lBRhqR36PgErELcpe8Ac0U+sBLeUy9rPdYMlKB5L?=
 =?us-ascii?Q?F9mq4UKV+jSgzjAE+sDtBkD/cSNpxSwYPKMVSPcydb2b74Q31vYf4G/q6WHg?=
 =?us-ascii?Q?ULjjtADfvKPNESxdbuwGjBt+TuPxUkzQWPUrj6M5kvL9kNwvgLH6Wy5RghiJ?=
 =?us-ascii?Q?KGEZ3fd2K+7t7a3IyDl5CRQI2Um46nM3DS1IN5WbMiwYPeGWCboYGYuaSOo/?=
 =?us-ascii?Q?/XGKSIQexbOC71V/pkBkUyVXiG/RQbmmVngYHdV4VLkREhLhbg294+OeCmtV?=
 =?us-ascii?Q?Jxjn5cSJO0lXCDVc8vbUtFOBCJpRKc7plWxosR1jCWRnOxkEhTxdXYdLl8Ff?=
 =?us-ascii?Q?E+i768pWFyR8Q+4VPGgIwwmTIdUsGhq72m8Wzy0UQkKqTsiKXS84GIKFqxht?=
 =?us-ascii?Q?aY79XkcKYe2ZlLnSAgH3QkxW53T9mhjEw3Bo124R89nrve8XqP/xD0RAGVyp?=
 =?us-ascii?Q?SiQVwdyZy68TmJ2sutLCEDVqt9BXbA8VYwUu27yK513y38DYemCHzv0KrRld?=
 =?us-ascii?Q?OKa+9/4ZXvEY9Us4gcU3czMDrBjoKv+VKZafp47iMbUgcAtNLojy+p5mvbkU?=
 =?us-ascii?Q?RTYvE/Z4RFUHVeEGQG0E+dCsKFXlIGngw9QdjYg3vDZd/a5RnWcHF/9Rpf8B?=
 =?us-ascii?Q?rFCfhCUVkC570qW73JXQuDK4GhLhceacGmrXkoDgWvW9wvrS/VrooCqoFOUR?=
 =?us-ascii?Q?uoLixNuPoZ8wwnEthXJZBp9pgqKe5tFQYSj1Tvqc3+vS5l0EvhSkPTdhheWC?=
 =?us-ascii?Q?31D1Xx8wz/w05GI0RKIoJzm25gBXcGs5CwFNFhCXrWoQ3mNpJQbJYsCDxuyB?=
 =?us-ascii?Q?0vGaUJPxOI7LdTnD9/Pn3d+8fZg4klEXsC1oTvnMRdgP+SWWj2gurHpWU5ym?=
 =?us-ascii?Q?h0IKoOUIb4DzJGFaf1+Kwxg2yyqeDVXS3zRQU8UjiZ4ussyYGLKXoOglH3Nx?=
 =?us-ascii?Q?+9hvdSrIdac64zoSbJwZrkYCJMLqGnYt5C6kei3E68hLVamACnsXv6aCRsXi?=
 =?us-ascii?Q?00xAdF6ltsCxR7DbXXr1AZa8271R4eU6oHsRV43+ikbFax4XIh9bQsXWhadV?=
 =?us-ascii?Q?K8sHW/LtdMER8YGSSHnjNVlzxnyrDX10pOODlwtf9ycOyRmtsyfZEa6GA0Gs?=
 =?us-ascii?Q?+1lVGvL/XMUo45jscEwh5zePDZfy1u7EvB7GB8h42Fy8vCMUkNHS57BtIUEG?=
 =?us-ascii?Q?kLqFFcko881TFBSY+AZIem7d?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24aedc4-515d-498c-2931-08d8e3b573fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 11:12:54.9650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr9JkIHQksEPeK+h+vX0ZoZ8BMK0Mph6kMaN+nHoROYOvowofxICCHwI0KduozQqkBRs3GHcGxlogMRh8SDPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1433
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9918
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100054
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9918
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100053
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
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-10 at 01:12:36 -05, Alexander Bulekov wrote:
> I noticed that with a sufficiently small timeout, the fuzzer fork-server
> sometimes locks up. On closer inspection, the issue appeared to be
> caused by entering our SIGALRM handler, while libfuzzer is in it's crash
> handlers. Because libfuzzer relies on pipe communication with an
> external child process to print out stack-traces, we shouldn't exit
> early, and leave an orphan child. Check for children in the SIGALRM
> handler to avoid this issue.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index ee8c17a04c..387ae2020a 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -583,6 +583,21 @@ static void handle_timeout(int sig)
>          fprintf(stderr, "[Timeout]\n");
>          fflush(stderr);
>      }
> +
> +    /*
> +     * If there is a crash, libfuzzer/ASAN forks a child to run an
> +     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
> +     * communicates with this child using a pipe.  If we timeout+Exit, while
> +     * libfuzzer is still communicating with the llvm-symbolizer child, we will
> +     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
> +     * to lead to a deadlock in the forkserver. Use waitpid to check if there
> +     * are any waitable children. If so, exit out of the signal-handler, and
> +     * let libfuzzer finish communicating with the child, and exit, on its own.
> +     */
> +    if (waitpid(-1, NULL, WNOHANG) == 0) {
> +        return;
> +    }
> +
>      _Exit(0);
>  }
>  
> -- 
> 2.28.0

