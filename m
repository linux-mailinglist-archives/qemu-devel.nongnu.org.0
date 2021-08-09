Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FD53E47CB
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 16:40:05 +0200 (CEST)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD6Rg-0002qk-CH
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 10:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mD6QR-00022K-Hr
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 10:38:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mD6QO-0005Nv-Sh
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 10:38:47 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179EGUT3015230; Mon, 9 Aug 2021 14:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=FwFdZ9nx8WEJWumGgE14RHp1Rpj1wALl3zmgZv9pkcg=;
 b=FkOcOp7mN3lH3yODVTvKgPGazJeA00p4wPOXte1Y2rKi229c4dHxtSf3od0AGyu+Y5AE
 6WCObZ7jnkFDJdmbfa3pN0yUu9WY3sKYi7sOwKeh2cG9V5WMFse1Ffyg0/uolrK1npz/
 i7JMG6eIiRR61x888wEriWHHRJDGkYzVezsjWsP/XZNhc9orYtz5PyDdZx7NmtHgUT0Z
 ZhMuxiRWm1x848HKhOpbSlRAvb3fBFcK3Q135dQMutFYwAiPgNH20JJ4lunsjlB8C4nQ
 QxNBZUMUExbvXAHnzCYSc76lRTqXKxE3JDZsnbq/Dx/VJKa8QJP0EAix3aKat9kjLvQQ +Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=FwFdZ9nx8WEJWumGgE14RHp1Rpj1wALl3zmgZv9pkcg=;
 b=YoMbSPQTP5pPCe8vhRchypvl17RKXW/1Y6Pdd+FG/znVzhNgRh+0VjckxE1rQUtaDohk
 BSp5GHG9tbdZYzJ7cfzxmf236xs4e61udbisaDgs8FmO8UkHYlMU87JBB3dKUyl4rcDB
 vI2lEaqQRMQ7lmCE2URfl73Sc0ZqvMDwlom7kWP7gtQNES4S4t7OP/U0nv3togACpX9N
 5zuwP3kXdOkG0xJen/5U9bkNe1D/YYCCRHGnGeGmH6k//XA0sj26NzRo2F+Q4ebPBWvJ
 d0P18DdcIw735j0X3Tsu6dx15RqfOma/uVM17l58WB9xnoBd4zRPwxapA9kP+4ipemd5 OA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ab01r8x9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Aug 2021 14:38:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 179EGL7T159507;
 Mon, 9 Aug 2021 14:38:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3020.oracle.com with ESMTP id 3a9vv330md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Aug 2021 14:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN/5eM+0CIySLaNU4nurjZxuQrO8toS1aaTNQpiVVJWu3RCPAH2UA6wmTE5XYx36opatvYw2hYMKfamsuyM2N3LUnAcZ7ahJPWajRzsx39kHOhfEqjfPZQfMDScADf+yhOdi8QTiwRw9aX39x7RU4Jvb2bNQtuLsmaaqfT97NIcM08j5ijuR0tvUBp3tdBo/hQCl2xDlTt5zawskxrpK+et4KZ3StsoMovqH4qAPLM23nS905WJclg4IuxEbMxGKCLVJj6Spyln8qtMO3Prk4/0gE4vNwfesF+8+MlspbRxfpJefcYaAMjqJUvyZWPf+aMo/CEoic1fKjJbF1ja2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwFdZ9nx8WEJWumGgE14RHp1Rpj1wALl3zmgZv9pkcg=;
 b=Lp/Lrp0EvmVJia3vmL6jsRUH1KAvRygoPQTh9zUPOgsMCvM8qXC6AR3Q42BGIT1QnW9eUri3Gg4yfNLZnb3ynTogFd4qbQNOE1aJ347kA/MkvxI8rq6gpftvwSQWDbpv96c3TOk8Nu6SYRRoAYEjBgu6TCFOH4PU4p4wz9QAQDZvhodFqOhow+aLQQ1pS31u7X5gl2xUqt4SKBR+31dXaySEYiY52cVQTyWWtGBwzQa4AhO2r9x2nXfdA97w9Z7HnqwPGIYVkDYveVNMOnEB5WeeV40UQHK399H7eaN3qQEKraWklUWYXewrQe4O8Y1Ya3ZlJXajrE96gg8YPtxmJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwFdZ9nx8WEJWumGgE14RHp1Rpj1wALl3zmgZv9pkcg=;
 b=AqJF7kh8Xfjx1hdokyZdLLn0/Yyy0chNnac3QNzAn9sp5ovt3KdCYbAieCfICJQHtkSUjmVqKj+Wk9QOPBd6HdD71BwxCVrDypkhx+9rAqI5dlIYzpAXyoTbghd84T1RbsepmfkeDeRECe4MKgMco1ksZerVOvA5rvkJDoLWkp0=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Mon, 9 Aug
 2021 14:38:36 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::5099:fac3:f345:c877]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::5099:fac3:f345:c877%5]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 14:38:36 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: avoid building twice, when running on gitlab
In-Reply-To: <20210809111621.54454-1-alxndr@bu.edu>
References: <20210809111621.54454-1-alxndr@bu.edu>
Date: Mon, 09 Aug 2021 15:38:28 +0100
Message-ID: <m2sfzik7iz.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:10:52::22) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (46.7.162.180) by
 DB7PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:52::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 14:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6bef28a-0f1a-4654-757b-08d95b435ec5
X-MS-TrafficTypeDiagnostic: BLAPR10MB4881:
X-Microsoft-Antispam-PRVS: <BLAPR10MB48814B15F0D7E7F30CF09D12F4F69@BLAPR10MB4881.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lqTp96rIy+I/hF15Pvl07RQL45ivm9AeQ0EzWPlotVH3mNjA4tXPrungYHaEimK8cthjGVUFCfNahKPMjlv3cBY7+EIOxP4AkBjzydiSvXXnETwf59PtNK+0HxH4bFJsZ6Qe+reASL9p0QUmquv72KSVIvzym7lR8zR9qiW81y/JgEhZ9Ys+yYbzY9LfM4M+5RV+1C8kqIFTjCtSr4MJwW/PyvDIubmL5I007rStMSnbz93xRRXlY8nAOQ79ThZotOh+skp0sTzcXIdpSqZFDH0hEH5wMw+/vKldhj0SItOmcuDOg9cVd/VmR0YeAyM9d37gNj/223XZZknNc9tkKz4+zC/xF6r1y5ZpdM0srssqtByKXtymK9JaK2ub2g3oafGsY6E1odvidlZ9zWNQzf5KHTkAc+VYSvm6Q6EcF/iwNGom5GSmcK60d3Ab+yVrmrT4KEiIbHRzU1yoUV1No47bC/t82sExLFj2ZeZxQHJ4CZ0HCtDnOCskwew7MhkRjRdKi8bK5WTpsigOvILAGOHzUKOrsBeISbdMMZmbxC9y0Ka8mfQiMhU0ektxg2OhiGyghHE66FVj6fWA35dVujsE7LgVIyZAr4JdcgwcTrHlQsTC3x3FDhecZk65LJyLLX1176Akk7R4W3V/m3s5qvdJaMrvsUjHEDFGGZrwNVF5/7aWaEQrFJR+O6H/94OgE9cwVQYLo3MvaLLHw0PPAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(366004)(396003)(376002)(55016002)(8676002)(36756003)(66476007)(54906003)(52116002)(66556008)(956004)(7696005)(186003)(8936002)(316002)(66946007)(2906002)(26005)(5660300002)(4326008)(478600001)(83380400001)(44832011)(38350700002)(38100700002)(2616005)(8886007)(86362001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mmo7jXYK1tSZfPbZvyQxQYMxowyekhMA69se4i33VLCeIoqJmmuyFjU33sTz?=
 =?us-ascii?Q?6pyofn43r2Rgnn68qW/gc5OrPt+2UB66b5wGD0l8ochQ4PB1SoiYan1f72vf?=
 =?us-ascii?Q?VxNoXVA9Cmx7uL7kN4ZXrLYI0VWisx8E+2qpEudybKtcrBosGhn+LvKT0iSj?=
 =?us-ascii?Q?IDpeBX5PcGtYiR4NFnENXHSUVHInO5PQdp3Q8h0mi7l/eKi4AO1TSo5G6f6X?=
 =?us-ascii?Q?PpZsAInlzuNq1KnZhCOeHEPded2ZyhqyojYAv1Se4WDf0v+ppW28cwzRWvcQ?=
 =?us-ascii?Q?8fORWWoABACWSQgzymxhhRGNgmiiP+IGZuMZDXfKlqatVoF4NxYR5Guu0ODm?=
 =?us-ascii?Q?+mQKvoQnhGhYJdj2YYq6h9QEJTscZJFrXOyVUjnpFxWFbcuXYTir2sC4/0rM?=
 =?us-ascii?Q?e3uN28f+jtdq8RNsGFYFYUWUh2RwaWd1LzntgP51eE0x87CDi5/Myfi1q9P6?=
 =?us-ascii?Q?kZBxS82cWCJ+4jm8yC2fX3kxcccV9Nm2CiW5Ingwr+pMtiVZfpKdRy3jqK76?=
 =?us-ascii?Q?GLlDIFlspkv20/JN+DpYq8Wfj74ERTxSL3SGnDr8J2EUOl7nwa1nUD36ojzF?=
 =?us-ascii?Q?XZN2Ut4lKkaOU7pkd48YKgdvaUp8RIQ9K7Vk+P3Br3zpE8LR/hl2pGj2KM8k?=
 =?us-ascii?Q?DZ3HM2/R0Hr1KWd0ymFqK6TyKSNRLiHGQQl7dLuuh3+ptLfZT7DRNiuiyvKa?=
 =?us-ascii?Q?br5vzINhavnAT/mwjKiX79l8rWARGwUqrhqzyleH4+vU4BQzXZ0Ud3Tm/a/D?=
 =?us-ascii?Q?C2r160LMUurmbC4heJVtTWc4Qle5AfF8+f/w0Mibe91JIljAyA3mNCy8BRqp?=
 =?us-ascii?Q?i/9cwnHSqflwx22s1wrNRQcdZkapCNERgZCdeza1sltfPV06TkhEqBMfYAUb?=
 =?us-ascii?Q?TXHFaAMPajVVpAGVnjb4PhMLWRvzX1eybkEZDk49nekOTuawuweexmnfjWSo?=
 =?us-ascii?Q?kadwYY9O33JlQZwK4tGEm0rK3/eac/ahX+MnwVM9nTwvU8N5AUQJz5KqMY/O?=
 =?us-ascii?Q?5h7RgoAkanCIsaO4eLm5Ea7ms/3jZGXGut2TPdXTX6ScEOA/HZ2YR+otv34J?=
 =?us-ascii?Q?7o/jnCDh39TUKnew+b7mPCI24SSq5odqi8Qz7ATpGgyKI4TjxLxQq1jJ+tX1?=
 =?us-ascii?Q?PAgJY3t7EOpjT5NMNGXUh7cluYwDr7Wisf+GbjK9QunDiy4k2bUviUUyqSat?=
 =?us-ascii?Q?7M5Pdti7k7rAnA8fdImxpY1XNCLNHws254ZdWpCfgLjJ0alsh91GdZXuWq33?=
 =?us-ascii?Q?9jLNqbOJkmyep1RkElok+msNI/l4AlAE+qBwHVbY1W4np1NY1G5n9JYkoa7k?=
 =?us-ascii?Q?cgeP1j/WblWTQiTj2NqhITX/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bef28a-0f1a-4654-757b-08d95b435ec5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 14:38:36.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ggkx7kM+D03SZmOJh3otO1QZPn6qhAR5rjBISNYSgov+bRKMKzpGgSCtJf3KqDYCN1CdJD0j6rMlASUM8GkhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090107
X-Proofpoint-ORIG-GUID: agiE146jstoz1X7TB1ZSWZeS5QA1Y2ip
X-Proofpoint-GUID: agiE146jstoz1X7TB1ZSWZeS5QA1Y2ip
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, berrange@redhat.com, cohuck@redhat.com,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-08-09 at 07:16:21 -04, Alexander Bulekov wrote:
> On oss-fuzz, we build twice, to put together a build that is portable to
> the runner containers. On gitlab ci, this is wasteful and contributes to
> timeouts on the build-oss-fuzz job. Avoid building twice on gitlab, at
> the remote cost of potentially missing some cases that break oss-fuzz
> builds.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>
> From a couple test runs it looks like this can shave off 15-20 minutes.
>
>  scripts/oss-fuzz/build.sh | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> index c1af43fded..98b56e0521 100755
> --- a/scripts/oss-fuzz/build.sh
> +++ b/scripts/oss-fuzz/build.sh
> @@ -73,17 +73,19 @@ if ! make "-j$(nproc)" qemu-fuzz-i386; then
>            "\nFor example: CC=clang CXX=clang++ $0"
>  fi
>  
> -for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
> -    cp "$i" "$DEST_DIR/lib/"
> -done
> -rm qemu-fuzz-i386
> -
> -# Build a second time to build the final binary with correct rpath
> -../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
> -    --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
> -    --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="-Wl,-rpath,\$ORIGIN/lib" \
> -    --target-list="i386-softmmu"
> -make "-j$(nproc)" qemu-fuzz-i386 V=1
> +if [ "$GITLAB_CI" != "true" ]; then
> +    for i in $(ldd ./qemu-fuzz-i386 | cut -f3 -d' '); do
> +        cp "$i" "$DEST_DIR/lib/"
> +    done
> +    rm qemu-fuzz-i386
> +
> +    # Build a second time to build the final binary with correct rpath
> +    ../configure --disable-werror --cc="$CC" --cxx="$CXX" --enable-fuzzing \
> +        --prefix="$DEST_DIR" --bindir="$DEST_DIR" --datadir="$DEST_DIR/data/" \
> +        --extra-cflags="$EXTRA_CFLAGS" --extra-ldflags="-Wl,-rpath,\$ORIGIN/lib" \
> +        --target-list="i386-softmmu"
> +    make "-j$(nproc)" qemu-fuzz-i386 V=1
> +fi
>  
>  # Copy over the datadir
>  cp  -r ../pc-bios/ "$DEST_DIR/pc-bios"
> -- 
> 2.30.2

