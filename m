Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29735550FC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 18:12:59 +0200 (CEST)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o42yP-0007Z6-Lp
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 12:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1o42pE-00012m-Gj
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:03:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1o42pA-0004VX-R6
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:03:28 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MFV9hL009498;
 Wed, 22 Jun 2022 16:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=TW2dG9KXy3hM5KaJoa5kA3IU1Qy6y48bXowyPOmH8jc=;
 b=sBCeTZR2JJzUCZHDzrOO2LR/g3o1FQUKMF+plfEyA4VXUaVC3ER0jsiWbjeVzpeTobXd
 Yr/7c7gsIw00FbQY1g5c6SMvJ7FHRyfuJXiiMi3O9lHVUTDWgER0tuxbtA8rA3yvx6sP
 rjz+R9EitI5uo/mFA35uRNzxkQPE8JbkQhG+q4Yp5+8iHl2zEudP2Gb7SWEKX8CBzX8U
 Z2OS3eJg3QemnjYj43Qzcn11R7cguM/Qj3grOP8vQsM9m7DU+qoi+WxtkgXGQJJEF+VY
 01ZXDT2s0ae6K1UrACG6XTuSzMRo/osKJZQ+ci2AsaRJp7Q57hbDJ5NR/aUOQ6kOg4Sh bQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g20yq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 16:03:16 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25MFu0ha020004; Wed, 22 Jun 2022 16:03:16 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtkfvsfj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 16:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV14DcOnEH9Ns6u2+HEvICOG/WVwkLVAqRIdTOUwIu2dO25GiYKkyGVm7CA/1d9CfNdh7gUUzWCHx+Ua0O0/mWTCVXRYMv1YtlBLKxWzrF+1Mdd1n5PTMLJ0c56VW2N2a7V4rOwMMHZ1rNjJZO67SsM+TQkEqDs9L+h8YiM1ncibK5Py0J5Tn4MOOYr/rV9tqZG/NG1VRSLdaj77DkB1PyLPIQG7Sp8bF4tAOaEaOm1N0OkyfxLadOSZj8ldGg8nFV381jjG0KLXD4z2rr/2/jeWoDYIJUwf8KmVGDN+KJMevBDse13viXFF2TsHd408Ag5LsN16kE+6rwsPRUwZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW2dG9KXy3hM5KaJoa5kA3IU1Qy6y48bXowyPOmH8jc=;
 b=IDJ9r05RM+djmKFQQmV7sJHnHXsCbav9Np1NTgGtsX9ePtI/KEWGqfmXTyMcau/G2uV80AXXx+XP/jZzaOYpvF/NgrSWL3VJ/tIS+9otjO8zt5LcIXbOU/ZEop3PokCW2P+ib7SkwGJi2j6vB/A56hg0L/kkSj3thj9FcLDpyepxowQ5P0rxkPYuOSUalxZh3n9/ZgfI+v/R4BidzM7Ze8pT+N+9yNhoWcIY2wlQEhIwGpGuld8eLzWDuxTdzlADmQ4+bsSz57cQAPlA2XzStyqtBxT45sQYnnZx6w5m+myimgyRcyUYUqdRg3/1joYdfQ1+yD9eWowVyieMYTsRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW2dG9KXy3hM5KaJoa5kA3IU1Qy6y48bXowyPOmH8jc=;
 b=KVxkiNE3IAS8Sm8RGnDpz/T0I5tesSiHAonPo1gm7p/TTwISZndWdxw+5zGSBJE7jMvObJPrSsN837tJMOXq9S7X4OWAPLDFsRmVParaa8HfdXLQurgyZHhwVZ96K5hsLLbvO7UZK4p7skfhsXXHOExSa0Jgn6DhNR6ZiQX/ZUU=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BYAPR10MB3271.namprd10.prod.outlook.com (2603:10b6:a03:152::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Wed, 22 Jun
 2022 16:03:14 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::f0d3:c8b:c303:e02e]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::f0d3:c8b:c303:e02e%5]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 16:03:14 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Thomas
 Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH] fuzz: only use generic-fuzz targets on oss-fuzz
In-Reply-To: <20220622155028.2086196-1-alxndr@bu.edu>
References: <20220622155028.2086196-1-alxndr@bu.edu>
Date: Wed, 22 Jun 2022 17:03:10 +0100
Message-ID: <m2sfnwk7nl.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DBBPR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::36) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a19d0efd-12fd-482b-d6db-08da5468b64d
X-MS-TrafficTypeDiagnostic: BYAPR10MB3271:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3271DA5545682A3F43DF2C9BF4B29@BYAPR10MB3271.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCQpj2xtxJ0dZzAcgd4DZhYSBcuswz/2N0wWbi/X7NQaPhDzbChk8CZsxxo+a1u6FyBwdsETIvHYFOj1JXYzuxUP0D9OjnOZ/3uKFVgBjGThQ5gFtfdzUB+0uxQkl1lJw2PVv2qDWYJeooE07Bb7JFbDH3vHZCrtvHQLe0iFxIh6LSFQeg+kaRk3ARJx47lejEJ2at8X6NMHfelPCRcW/2pj5onnLtWSFGaTurMsrXBoLkcMke3kCsUOGdKoJ6hj8pcXuVDsZKd6YpHVWhcVBiCUE/Uv2/YE6l/hqxigGDFSQXlx/VqtFvmbGoQQB8cJyjZdgb4aoRhs5xTulE2AmIvVhrFQ45e0k9raEnf22fmW2GSTjhFooUA7WrOVTgW0Uy8vZhL/iUMD8yjHCok3UwVNu9uYDYppy96i8t3sa0+d6Xvy2zSmjMYd/awkLh5EFlTgjjNJUYkm3RNXw/8fypcVLVnIG4xCJ5Y6UcOY0AeLrQta2Cm1wVAYbA0RB6jzTLs4/qfwxfOnCXwuAlItcS31fQHTHjmqq44jnrOSDCh1QmO1xcyilDMGEkpGKkzO4xk2SE1srlvufUJoThIpruYV2wGx6Ho+iwXjTFP2vJsUYhU2s8o484DHgc3jE8IVl1pSP26S3goZsFKBccKYW/Ar9A8Fw6kZl57yXev7B1yl/iohYqXQ1TrtjEqSvcjHCTzBFTQWCph7ryJS4L//wBV2kKilIA+DVvKSNR4hCcvYq/pbVnok+BXyBzRQS/Ri
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39860400002)(376002)(136003)(396003)(8676002)(38100700002)(8936002)(316002)(66476007)(83380400001)(5660300002)(66556008)(186003)(2616005)(66946007)(54906003)(4326008)(6486002)(86362001)(6666004)(6506007)(2906002)(6512007)(36756003)(44832011)(26005)(41300700001)(478600001)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUd26hrqF60TnkDfLrYOC7OiRBx+HuyU2qbj5TI3CDMdv5JAdZcGyMv2mpvY?=
 =?us-ascii?Q?DYGGfe1wPvpTunB1nw+VVLsl0PhErKe+f0W1IMWbACNOv9ZDemg/TMmvwf6t?=
 =?us-ascii?Q?trpJVMxXFdZYh/hkNf7al4ql6Y1/Zcp6TJNODFTZinki5joRmc0FKPs9c/iX?=
 =?us-ascii?Q?Y9bxdkqUjpEIog2DY8th2uYGYzqnA3btCrnW9baUaF/neh8mcXdNH3mdmUOA?=
 =?us-ascii?Q?yXXzprZ5V94dPlFwJlzhpDEyY/kZZuD67k7Aj503W8FHMYQQ11BGvm8bYMVp?=
 =?us-ascii?Q?rjTscv7sN1R1P6wEDVHsb8TIupIRVFzq/Spet3cUESYOdoF7CpCgUYG5bZzA?=
 =?us-ascii?Q?e9CelRKvSUGkxoOrquSrbvvinpqSBntzhuyYQAyn1jE/3BNpHHzsd4uO4roP?=
 =?us-ascii?Q?+pEMOeiInso82JI8RlB8hDzjNHLpL73CvPmmefNqsD/UUxzqqUTNTh/clLiM?=
 =?us-ascii?Q?l5+abce6tTP2iZ9EEG5zvV3oyT78KoikMXy/m9hPyaPLycv8uwtt9Y3XfTrn?=
 =?us-ascii?Q?YELEz+swWTmhkTDEUxM2HGbJqF+lPoVtJgPOy3PF4LGbkHda78WRUvzceFff?=
 =?us-ascii?Q?OtrNTQqy/1hOYK58yiz3q2iLYehhnhH6XetOPyDHsaypVrZBgVYwHOA4xxQN?=
 =?us-ascii?Q?WBOzr96dF9JlxwgzUvp33g0ez2fpprLI6RR+f+VnNl4FNAcGkL32pl0VIR0l?=
 =?us-ascii?Q?d02WWavpCxa049/mUU5siLMNeyXi7OpxVmZ976VMfh/hkJn4ioTsaSm+m6eR?=
 =?us-ascii?Q?7xaQGS5kXZuzUDDKkN/srBy4OWv3kQnEy0DZQHa3bThgT2oGVxpPMgjcZhiU?=
 =?us-ascii?Q?/uEjXdSju6OvlDRJN9SD7+46CB2Gb8ifxG1vT6KCQrgIpjVtjoxnKNOGYY/r?=
 =?us-ascii?Q?JO7Lu/fMJaojhw+KCBotmKU7XzRzdu340eTGyAJLwqsHISNtZdukUXc+axU+?=
 =?us-ascii?Q?8022a78jA9ZEJQmXx0F8MPRbnl06+zdYOQrzhq0C4dCd42bqiwiho6gAiYAo?=
 =?us-ascii?Q?oCtnXc06QYjb7nu3E+2GvsBuOcHs/OY0HQ/KKYG4SSZjEbsPdDHZ7fn6X7jL?=
 =?us-ascii?Q?H6A689Uh/XxoMpVF8/dSG7GjOfjIffYch3a6tWRdfIYvl85BqsB4hTmdhof0?=
 =?us-ascii?Q?/nbfFHoQhVdRVvxIc5YMrHAkgx2sNUDEhrFYjgLLPCr0hPhWCIyBSM+Aajig?=
 =?us-ascii?Q?uU49hOU+d2jl/cqw02Y9QVaMiY3ww1wt8zVfDbd41DJvUR8U9z+YUTfRYQRr?=
 =?us-ascii?Q?zer4eFwfYGLMjZo8kMKhNOPkW7s6QBR/s5GC8Gv+ERWlv3gDER3arorlPq8q?=
 =?us-ascii?Q?eHvIhB6JPyGMAxvtSYizGJfnoxGSlRoKCkLvLrRSoe8ZPfTVG7xbRubtL5AI?=
 =?us-ascii?Q?lvuJSaV/7/Dna/fbpvq6aqRsbGlhOqut5A7sW0CC0l9QPU8U1+tWIo4W9gg+?=
 =?us-ascii?Q?/grZLfvaT1NErRzfacMxUxNj7B2clwjQms9KyhrCAoOzoN0xY6vSm4ib6vIo?=
 =?us-ascii?Q?h6OBi6WP2HCWKtcbFR2NHArlShxGFzZkYcsfrNXsU2EoR7aHLgUecdpYK2Si?=
 =?us-ascii?Q?tuZK6tGKQ93XlA3vUiPCxRI8H3xcZFRiG8VjzHuWl3Affa1dQ3CS5fM80ziZ?=
 =?us-ascii?Q?Aizz+wv5fR5NiRMUQaCO/svqihy3pUx8yig0beQswG3qW/EAQVN6BxwGJw7l?=
 =?us-ascii?Q?DDqQqxfCWhpu1Zce1l+4S3VAdFOdqM6LfFpHIzr9GTmOiQsDbHWJxzzkHvHf?=
 =?us-ascii?Q?whN5JzXUyiT0Kd2nKzGYZpnOJADWcf0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19d0efd-12fd-482b-d6db-08da5468b64d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 16:03:14.0732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jc4cXma8kNYECFp+2Zqn9OdK8OLz/TW884s8+MQqMwxDrDbVr5aDx83xE56vSG1TmXPSS8qmJwUuQk67maFLog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3271
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-22_04:2022-06-22,
 2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220078
X-Proofpoint-GUID: yl49uu3NiV-WAQfAB5Fx6-USRGw0wExn
X-Proofpoint-ORIG-GUID: yl49uu3NiV-WAQfAB5Fx6-USRGw0wExn
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Alex,

This looks good to me, so:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

But, if it is at all possible to use Bash glob in a '[[ ... ]]' test
such as:

  if [[ $target == generic-fuzz-* ]]; then

that might read better - but it seems the default is that we don't
assume that, or am I wrong? (This is probably a question for others on
the CC-list)

Thanks,

Darren.

On Wednesday, 2022-06-22 at 11:50:28 -04, Alexander Bulekov wrote:
> The non-generic-fuzz targets often time-out, or run out of memory.
> Additionally, they create unreproducible bug-reports. It is possible
> that this is resulting in failing coverage-reports on OSS-Fuzz. In the
> future, these test-cases should be fixed, or removed.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  scripts/oss-fuzz/build.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> index 98b56e0521..d8b4446d24 100755
> --- a/scripts/oss-fuzz/build.sh
> +++ b/scripts/oss-fuzz/build.sh
> @@ -105,7 +105,7 @@ do
>      # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
>      # that are thin wrappers around this target that set the required
>      # environment variables according to predefined configs.
> -    if [ "$target" != "generic-fuzz" ]; then
> +    if echo "$target" | grep -q "generic-fuzz-"; then
>          ln  $base_copy \
>              "$DEST_DIR/qemu-fuzz-i386-target-$target"
>      fi
> -- 
> 2.27.0

