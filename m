Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EB3BF7A2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:33:05 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QP1-0003X0-Qe
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m1QNQ-00026z-JL
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:31:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m1QNN-0006Qc-74
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:31:23 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1689GPoY025004; Thu, 8 Jul 2021 09:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=KbzjePK8oXEprsr1mSP5NuwzxUQNXusvAbM/fc+eSSU=;
 b=i/XULkXYEZYTZbUMM7taqIN5JsSgUNDwJjCX7Dj1fmTmE8L+Gz1ODDZoonqKml9iIFjB
 PRLxnOPpoSypAlWeJJoFUYB1fuCRqZV9IKWCtZUNHO8PKLB19V1gi2+C16YahbwIu6gR
 Uspib/CyFdMbwPDBNW/xJ7+YZ3/zshuSzYYquxzDavyMrQzX8uUDo7Zw8K4W4r9ysrAH
 sXTbc9hzsmjGsA/682rF/N+Hpfih1tiPi759/Mfja1Mw9jRjKGJCLt1dbnf/WLHH9cry
 B7b0X/0M0HfH3i86SvqtNM1BauqTV87LzpYyFDmLco+ZnIOA9ZKLF6xHrgxGSt58+c2R Rg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n4yd2rmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jul 2021 09:31:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1689GPEZ076056;
 Thu, 8 Jul 2021 09:31:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by aserp3020.oracle.com with ESMTP id 39jfqc9der-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jul 2021 09:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjB5FASBoZaq+04II8ZPe6BKaJhkuFxEKsmYDM5ocgTLRzwPrq01H9gk0W4p/ZF8/XQD8Gr8pNZuSiD8L7CuF+6q0xBx8NkDxCITJHUndnnqcc+XXJ76vxTE8j7hc7+h/nRYhQDkUVpp1V7g8Pf5EJ9qp+QlFNNy+du1skmZYThrcLU+uhkaBt00TzdCiFtnGEqzjozielD0uo6JIX6k2cjsUZUbaDPR1hJtbTHrt9sRnTCTOLkoQiM971BKutZbvrz4Oh5RpRa2sKHpwsD1OG3jAEmyVbdr26pqjZJTKMdmdS61aOPbBl10A//IUfku7YSdTCxY8eKOYxjwzWLfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbzjePK8oXEprsr1mSP5NuwzxUQNXusvAbM/fc+eSSU=;
 b=fAfqqt393N4YZpTaNA6TAW29OVlFgOEfjvVXpSkk+dOVfg41WRB1YfKGtSii+Y5zHMZ0GQTYpWhviWVaDMiwoTWbDrMvnsNzqcOsrQFJemmCBRpijcqbw8PbarZlD35uNNFOq8QJoQ+GwCiIl/5Lad2GXoTX8h0+D4Odhj9mt92Uj+sPuV+Fj9xGCL9omIlDp3uw9eQWvBALZ2M3gcB36wVq2KqpQBuuqgGa/61BBHRgMJc03mWlBg3fR4+/CVVHm1DCMLduFeNHNZf1qPPsQeIWKyCwkm4Em5qJ6gsdxZiQ6VbTICTcqjHQMrvhzMslS61I8N8IgXR7EC0+cLvrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbzjePK8oXEprsr1mSP5NuwzxUQNXusvAbM/fc+eSSU=;
 b=Ot7xMNIvDc21PPeGqJw7E/Lde8k47vpWW7jbIUx2vJsJL7xGxZrL8Q0idlsfdk3iNE4QzJBtv/ZGyPJd/DJFKu8KapbtvurTL/LXNHQNGDL1s3ocBbQd2rz/zdLBugY2HEJaR/pPHWQlWCAEPyEz1k2uDI4zb5coHwTE/Vm1YrM=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4223.namprd10.prod.outlook.com (2603:10b6:208:1dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 8 Jul
 2021 09:31:00 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b%6]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 09:31:00 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 2/3] fuzz: add an instrumentation filter
In-Reply-To: <20210630034124.222689-3-alxndr@bu.edu>
References: <20210630034124.222689-1-alxndr@bu.edu>
 <20210630034124.222689-3-alxndr@bu.edu>
Date: Thu, 08 Jul 2021 10:30:55 +0100
Message-ID: <m2r1g9884w.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB9PR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::33) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DB9PR01CA0028.eurprd01.prod.exchangelabs.com (2603:10a6:10:1d8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Thu, 8 Jul 2021 09:30:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b443051-f88c-45c0-55f1-08d941f31871
X-MS-TrafficTypeDiagnostic: MN2PR10MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR10MB4223F16475C45E9B4DDEE873F4199@MN2PR10MB4223.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6QBKTmQGn/3I4ffNwgks5a67sdJncYDqK+OpwXvUYrdfyU+VrL8u/ZLsNHintz6+cZZfxXm+YAElFJQ25aTVJ465/NNMJNoZSR5foqacsPEZTL0WfWKkOuczw/yCz1SDV5ERWqDmjKThk+7c1C14RgGc8874MwMO+68Ike0mx+MGrTkV9y2dJEeKf1zjjnHbJ8d4qU4lmJ2z7uuXrKTEXNVt2n/uqsbD7TxFmokNVeU36EFSuKAiiqDHjcbGxi26NSri8lhoEKAq/VLdjT5NoQYFXHwH/KRJ2lI5yXL3P1zDH6TxGH+jOM7hh2VswadtpnF114khzBCU8Xjmx/+NZ64oiMKtGnrwCQgU4d/xtexENxGQMJHvIoUBZQ9e/varoIkyw3iXHtd+tmOi4VFPu/73SvjJS85Ko6dRgCHCBPncmFQHzkHDDxYfs4v0gGtZURbMbjVFLAtodXkzK9Njq8TJPiJNMoNUlfr4iP8Un2fu2uSPf4D5mlLxWOMa+HsD9GtuotfbjFxT3D9GTuBMqC4+11h6+MTJWkHHI7QyFvdgagH8sVjXgXWkHyOmwcA7d3OPbMDJjQCuPohU7vUG9dBets6zr6Zm4Wcb8WGwPBeTGvEBS3iSVaQgp1Q7S8LfgoC7mLPn5K3+yMoxzemECcs39GxDJRmK4aPBBRJezdNWcdVBnHENZWQLy19QXRENSbdsyKi6+/VzmNhi1I99HQH++mC64rWI45rc1OCx8CN/uQKv/vRQ8DZtR426omqdx7TLaFx/54SrFA78cUj31/5j2PXOfpg7uOKjbX4dMtGP62toUwgVnihERle3tosN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(396003)(366004)(346002)(316002)(2616005)(478600001)(66476007)(5660300002)(38100700002)(86362001)(54906003)(8676002)(8936002)(38350700002)(956004)(66946007)(186003)(66556008)(4326008)(966005)(36756003)(52116002)(8886007)(6666004)(7696005)(2906002)(44832011)(55016002)(26005)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RPJh1MD11I9c8ybQ7MXB24OKk+SkOoCltygnO22kK2ORIHSyS/jHCuFCb3R?=
 =?us-ascii?Q?oQH1cnoVKzqRsHw5ftUUWpsVb+UnVMsQysPkuUOIXZNjvX4YsUHRlWmNRwfk?=
 =?us-ascii?Q?m3LXERzaYUtYWw9YGDHcKaTgesqgNzFQEpCZMftje+k+MKLZ1xjNg34Ievir?=
 =?us-ascii?Q?OjvcEWX4gbVJDcMNfbPpzQQ7/yigz7LUyiK3Xfrw5Y02Azxk5RIVEvd6D4fU?=
 =?us-ascii?Q?SYahegPgq3Wm2O3X0PlUjCNr8Z3VXSoV3pWgYgZV14J1c9IOb6iVZM1zO7Gw?=
 =?us-ascii?Q?ZwHciP6zPIm0x/NS51lx7yjzMp0f8JyXXMCP4K5UqqfdN0BItcMMa1QD+aBB?=
 =?us-ascii?Q?ZPMD9WmeBsClWYeeQOVWg3amTj6Vt+6l45RLToZCuy51LnH0OjNLdN6Mqzdg?=
 =?us-ascii?Q?CwXwqgmSe7cMFklXuLq73fiPLRkyDaov3rO3IXtvquVGKyRdYFlOrApgEyy9?=
 =?us-ascii?Q?FPjsyX9rhmg+1s3+eao5QBsof3y37Y6q+srlUxIBNvTo1HqLIQrV5Uzww3G5?=
 =?us-ascii?Q?/CUGAi1rns3Dfb4j3i7FDoJFYdx7ixTE3ZzsW3E++crRIyNFf6jCDCiJSfVt?=
 =?us-ascii?Q?Fb3y4BRiS03BjZn3MzQtc2dSNnpS0y7+gzHtuOUgPkZFmXJ4GcxemMAM3KMI?=
 =?us-ascii?Q?Tvd82tBUYdaB7xLHVegmPqfXGMY7BXDC0dSOMV4fUTXimDzbnoyQS8hFsZLA?=
 =?us-ascii?Q?9wH1NM6DfxcK9L2gfHlJK61Jz50VbcfPzIjEeJPXZkLMmB4b5VWOVHd0yr7N?=
 =?us-ascii?Q?yLQDUBLMccsFNBzC7PBnRfpgkTsgzKr9NtJi52eBM+BtyEP731fU8MLEO/AR?=
 =?us-ascii?Q?mE5eYzGqPawDAG0f7K6UGtVU509T0QWU+mrdphTGN3PaWLwTodsBPR7NAGHj?=
 =?us-ascii?Q?5Eara6tYH7vDU+fR6rD9T9r3WwBhMuRXxr7/CebO96XbEbiMCX6Z7okiVaOR?=
 =?us-ascii?Q?giflqs1t+CZ+WoCdiXw27d4etz+sYyKdLuWKyztkTafxDuiy/N1OmP2UYZA6?=
 =?us-ascii?Q?tjqEBW+UFE0cTSdvhBQGMwsvzFmsNTXMBDGxfnoH92vjcw0Dmw9En6IZDHwr?=
 =?us-ascii?Q?4ZgF3oIjVzx4wGFKXMU1BOqC6T5/ubbSLsYtcTAd7T/N9mNx8fYEAgnTSff/?=
 =?us-ascii?Q?99wmNG+iXV5gu1a9AxEd22p8UVzbAuMZWhL9Vw6Exo6jy+BwETs33sxbQ89U?=
 =?us-ascii?Q?6x/dynsZ77W2pU5DUs5a+1s56+Dl9bPbBjvFgITa9ZMDMauLik6O1My21+gH?=
 =?us-ascii?Q?UYslh6ZGm+3W3L0t/d5iaq62pYy4DExdoybVycFhIX3E4EMICFv/XIBjSsgk?=
 =?us-ascii?Q?Cf7dkwucF6yWuycyOLNt29/X?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b443051-f88c-45c0-55f1-08d941f31871
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 09:30:59.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glsEpylEbhiZ6VvGIjwOlp8t3ZeNZsNiaBLA6cmuV+3LrPIdZykQW7e11dT+aILmJvRSEZIAHh7CthZzy+OU0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4223
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10038
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107080051
X-Proofpoint-GUID: Ebj7wU3Lb_HCvIUJUtgTLtIQWtweogxk
X-Proofpoint-ORIG-GUID: Ebj7wU3Lb_HCvIUJUtgTLtIQWtweogxk
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Sorry, missed this one, apologies for the delay in responding.

On Tuesday, 2021-06-29 at 23:41:23 -04, Alexander Bulekov wrote:
> By default, -fsanitize=fuzzer instruments all code with coverage
> information. However, this means that libfuzzer will track coverage over
> hundreds of source files that are unrelated to virtual-devices. This
> means that libfuzzer will optimize inputs for coverage observed in timer
> code, memory APIs etc. This slows down the fuzzer and stores many inputs
> that are not relevant to the actual virtual-devices.
>
> With this change, clang versions that support the
> "-fsanitize-coverage-allowlist" will only instrument a subset of the
> compiled code, that is directly related to virtual-devices.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  configure                                        | 13 +++++++++++++
>  scripts/oss-fuzz/instrumentation-filter-template | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 scripts/oss-fuzz/instrumentation-filter-template
>
> diff --git a/configure b/configure
> index 38704b4e11..3b6ca054b9 100755
> --- a/configure
> +++ b/configure
> @@ -5189,6 +5189,11 @@ if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
>      error_exit "Your compiler doesn't support -fsanitize=fuzzer"
>      exit 1
>    fi
> +  have_clang_coverage_filter=no
> +  echo > $TMPTXT
> +  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
> +      have_clang_coverage_filter=yes
> +  fi
>  fi
>  
>  # Thread sanitizer is, for now, much noisier than the other sanitizers;
> @@ -6120,6 +6125,14 @@ if test "$fuzzing" = "yes" ; then
>      # rule for the fuzzer adds these to the link_args. They need to be
>      # configurable, to support OSS-Fuzz
>      FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
> +
> +    # Specify a filter to only instrument code that is directly related to
> +    # virtual-devices.
> +    if test "$have_clang_coverage_filter" = "yes" ; then
> +        cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
> +            instrumentation-filter
> +        QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
> 

The only concern that I would have here is that the file
instrumentaion-filter is being sepcified without a full path, and
whether that is acceptable as a generic QEMU_CFLAGS element.

I couldn't find anything that suggests it needs the be a full-path, and
all examples seem to be a simple filename, so maybe it searches up the
directory tree, but I can't find anything to say that off-hand.

If that is acceptable, and is working, then I'm ok with it, just wanted
to be sure:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> +    fi
>    else
>      FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
>    fi
> diff --git a/scripts/oss-fuzz/instrumentation-filter-template b/scripts/oss-fuzz/instrumentation-filter-template
> new file mode 100644
> index 0000000000..44e853159c
> --- /dev/null
> +++ b/scripts/oss-fuzz/instrumentation-filter-template
> @@ -0,0 +1,14 @@
> +# Code that we actually want the fuzzer to target
> +# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
> +#
> +src:*/hw/*
> +src:*/include/hw/*
> +src:*/slirp/*
> +
> +# We don't care about coverage over fuzzer-specific code, however we should
> +# instrument the fuzzer entry-point so libFuzzer always sees at least some
> +# coverage - otherwise it will exit after the first input
> +src:*/tests/qtest/fuzz/fuzz.c
> +
> +# Enable instrumentation for all functions in those files
> +fun:*
> -- 
> 2.28.0

