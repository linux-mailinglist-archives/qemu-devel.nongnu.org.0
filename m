Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556BF3C6EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:38:50 +0200 (CEST)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3FoP-00024g-Cr
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m3Fn6-0001Dq-8n
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:37:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m3Fn3-0006pg-2y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:37:27 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DAacaG006347; Tue, 13 Jul 2021 10:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=A2kS80s53SU/fArwx8XegF1raY3ocvg53ZxbVC6YpJw=;
 b=LeuaO00wzcR3qzxFSthHAp5clk8IIs5IqvljTJuSD1m1EvpbWAE3EjlOPiDI+/1Y40d2
 AwDUfOXGLJ2oqY/hwgHRTeciwobYIp8goT94X10LsSOTIqJ7HNylS7XBfSOABNKZV9ti
 Vl1fW89S7beCvJ6K6qSRLAasICp2H2PvCgxcdqKvOF3h1OeTPR1mA05y8w1sWRh5axw/
 4znsgQbHioOz/GsdVRSifYuo2aZk2NKUvTmPU/Ls+kFcVd3tD8Ii/NY2oXbHcFi9LLIY
 pwDEg8MH5txm5PFwfc6/XYzob5+Wb7oWaOCXj2BbA9bcqnowntD018jwKtpuZ+UdzXcC 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqm0t1gp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 10:37:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16DAYeTp077739;
 Tue, 13 Jul 2021 10:37:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by aserp3020.oracle.com with ESMTP id 39q3caqyj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 10:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8Zb6p5k3rVNC3SF3YXwooq2kozvkRbv5D/s6R/+1ABypanOIC76Q6H7lImC/NcRDL25tuFiiRi7yuuq/2+T22FOaSBllekLwmjeEH0kJZ448Z98CTBFwlofFFqgdl+yBZ6OZjHt5D6BcpT5acs1VvI04Ip3CfGEQFvove7GZqKHjYuFQ6rI3hU30a2Ml+U3y3UrhDNkwoTSn1bm/Ki6bAvFcQ1iS1bqINq0WjfxK33Op1BPw4i3oAL8OXdUtvlixJ8j7bBqiWS5b6piNnsXREwokZBw5xT1ntNQF12e8cqO1rbQ+eWylh4fQDtXU/Z18sjuGc2GA/8OvzAS7+0Oag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2kS80s53SU/fArwx8XegF1raY3ocvg53ZxbVC6YpJw=;
 b=ZL43axQw9ojTxT9PRmtfzWgCMpXjFrr4+6Sz573zmcqoVyhcMVH1BxeI1Ld4NSXePfwmf8inwj4A/5zpYBcJl70qUPISYOJ6vcZMxCOD9KmcsdZ01XIumv+QLJRcJHCYtmFBfAyjXm3lfxh1LIfz9HRWCaScaeq96SNiLKZqh0tPZBCVBwc3ICJyVl/335KRI4umD6E9f0Lowjtij9C1REFj1mezvjnSLrHtH4rV5l+V47Ln6UybEpBO3+QBHL33NZvCTYvi4yTyDijvlcyJSukSWJDV2k8+KU38WtX+Hf7YTwDv9cUuTovH8TyhkbN0qndAP98lkg+3SPk5q1r9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2kS80s53SU/fArwx8XegF1raY3ocvg53ZxbVC6YpJw=;
 b=oadM3UqbBFcixUR2Bkp7wxpbpqaaWHDMDLRxvY5azGJIaoRaxVz1AlPhWLLJwTtzKgGV2B450DZ6Ss5hZsEG2WzDIhztHrLv2QOHwP4adzzJaVrpvb7/NEZrKmMxF+A9C4JpHlWyMVp25TiTFhCj2x26Gadt0hSW2U2b9+v4LaA=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB4930.namprd10.prod.outlook.com (2603:10b6:208:323::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 13 Jul
 2021 10:37:08 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::54fc:5f45:9a1f:ae7b%6]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 10:37:08 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.1 v6] fuzz: add an instrumentation filter
In-Reply-To: <20210709200845.22610-1-alxndr@bu.edu>
References: <20210709200845.22610-1-alxndr@bu.edu>
Date: Tue, 13 Jul 2021 11:37:03 +0100
Message-ID: <m28s2av6sw.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::29)
 To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (46.7.162.180) by
 DB6P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 13 Jul 2021 10:37:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b8ab28b-1a9b-4eca-9793-08d945ea29f6
X-MS-TrafficTypeDiagnostic: BLAPR10MB4930:
X-Microsoft-Antispam-PRVS: <BLAPR10MB493008549358C16668192256F4149@BLAPR10MB4930.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Mr0mvnA6yR0c7x8+gTLKH5u+u3BqTwE9fVtzBolLAWMli2P3ptW7fGaxff79myU62d3Gzn7y5xzBrbj1hTwJIMjdrJZOPWq17x5MIVuza4zTbd7R/z1CZhVLSF5KpaSrn6kPz6hX/uJa+MskLpEb4apdkN+3WgfEYgxoEPQGeVaYZfPt93zxJX9XtVoowJsnlbHAAKXLaxEtU1NRQXioT9zztODo39yaxptme21JYFQPerePLLkg0ZP9JIEEvTokkanpjcocsq3h8vOrkCXfuLyHf3vNITzJbW0o4MTNtLVWQuzqg7CdU4TKukt7a1CH1J0lgCVluGQrjSclZ0KzXfb6IwbZFM/AIDgIQuwEf+tBvFE9Rn3uo5n5YwT4Aea01uFEvbp1KHtJPsfJnJiO2B7Gz7gZemrb0OOG0Bay60z0wLxEhSpAKZ2FfqR3x1/MkKdYUVIOuGiHMfaUYIsDvgmGgu6gQJrVhZ4vMEVTXKeFFJM9Wp5rQ1SaaKyTTTWQdjG4ZJVhRJoBHTDuhN0j3OhT9IHubyA3Bg2j3l0lY/OIOoY0zV5el9HV2i41H4K9goeFwm+iJRnVVqizNF0UvVcva+TyCuswvHw1LVTpdEcHiqxs+U97I8IrYILIlkwa4V/DWk2zmxPRNBp/WVHZfLoDv7GhRVU+Q1dwXvtxm3LtQk3cqKplGvPMBythjnI2EoT1Hwfr7ux3wU1Utx/kA2pqIFRrcmhRGlU1NCmYmxsF+TlPG0cSAP+OyVUaaS77PexW406C++V82rX/HU32Qt3xnaJSZK3HNX7nWEYN4Oo/hIhkfLAJSnWfJwCw3+m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(136003)(376002)(346002)(366004)(8886007)(86362001)(2906002)(44832011)(55016002)(66946007)(36756003)(7696005)(52116002)(478600001)(8676002)(66556008)(5660300002)(66476007)(316002)(26005)(8936002)(83380400001)(54906003)(956004)(2616005)(4326008)(38350700002)(38100700002)(6666004)(186003)(966005)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?An2I+FvkXl5WoWMSmB4SiZMviD1nsKr5QdB/LN1er0PGGkS6YsTj13Ums7xh?=
 =?us-ascii?Q?C2oKUdrFhopDCBeDktsoPhy+6mezzzf9X26/VaP4FWptlElxd/VKVg6eLoPJ?=
 =?us-ascii?Q?CkLA5GpioKdTuHcoPsPLnplcyk5YUYcPzFDZwHF1FtyXHy9bvXm40aM1sBdT?=
 =?us-ascii?Q?TaZRLtHL31g+87MGhhr8mUlNXb2NYAEg2SkucyLaUhHqp3Ypw1SD/oC656HX?=
 =?us-ascii?Q?EJSsA1pYXD6NS+nYYBPwAlAizOXpDQWYTRPAKKwT/HBKjuq1g/A08EyFeH83?=
 =?us-ascii?Q?0EyCpPhcK1mH/N0MWve/egjL1QlWP0STLp1tQqp5wXDitM6zJJJ6ouxuUYX9?=
 =?us-ascii?Q?/EKblv9iZiKdUNFijRAHQtfj2pQU4/bN6+JOWNqagIhT3kbg/45507+uqeEk?=
 =?us-ascii?Q?arexOhDyAycQ4lMFzyS3rmop7Nr1K58evVRIhuULKz88ck4hn/nVaJIQVX6/?=
 =?us-ascii?Q?SmnX94I08M4x3S11MCmRXCNNy8sfBXa9n7Bd7opckLGrX/PCd6GlGtZybyOI?=
 =?us-ascii?Q?yQq/XPeeW+AQEExiLgyR+FaJMN1wEE3zcUq5g1Fim1qMAApR1TbeVvyUO4Ms?=
 =?us-ascii?Q?j0xykYOm+yqEKf3XYcGW3FVj6CsBT4mujA5/xbmV0a4tkXFRpxIj/B81Xvhy?=
 =?us-ascii?Q?N0hixDRRi3lt2c7JS8RPVqWM0+rdt7A6WflJF+ZqanACh/y2lH9ibSNNLzyJ?=
 =?us-ascii?Q?qT5kioryroQMolitCN07eXbS+T53IcUFR5nwmy7MBIDrnjcTR+E/9soMNNHB?=
 =?us-ascii?Q?glsAopIWtUIREQGJU2OJ7E0neeG5nlzIwDxAVtCNn7tMEU8PqwYjtY7epPTk?=
 =?us-ascii?Q?82QmoeQzRdGJjVfffojLDyfBcrxx5lIFQCEV6Zco3i/japM42TAkIgYlSZMW?=
 =?us-ascii?Q?DFsRGsxOpTc0RBpE3D/4D4paErPmrWua4BLF/L0pdsmyv3FTmCwvPH34zSlP?=
 =?us-ascii?Q?IZYSQSIJur3iN/Tds3CM7JIbx8BFOaUhL7clVXoKmE/7HEjLhGE8rSzqPuiP?=
 =?us-ascii?Q?DJoaPWvEy6YMFbM6hRiztq2izMYiaz6wwzaq2+8El+H9Zc536a0+1ZAOsJZG?=
 =?us-ascii?Q?3WrDpgthJcHCVySSKnK4vdG4YxoStGoA9sKuNo39pB2qwx4D270q8TKhBLrz?=
 =?us-ascii?Q?15l7q2P0A9ujAe1Rl/mSTg+qezkWQeje9sjV0LbJP5cefjFwE8/4VhaK1No/?=
 =?us-ascii?Q?vS3BXBgoMRw+mJVqTb7N/C79L4NVluEfCe1qcj7Yvkezb/gXg70ZpelmIRt8?=
 =?us-ascii?Q?WNTezdf+V7ReWRKz8st2HS9bHuO5tpUKm1qKo4VzjIBkpmr6regHKDAh4Jq2?=
 =?us-ascii?Q?qz/HievGzKHkIOVpuV+gthPN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8ab28b-1a9b-4eca-9793-08d945ea29f6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 10:37:07.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gdj76z0OZrHrJNmUfOpZKQjUMQU0bHimvVMSF9e5TbFDjjXInRvCOD80OZ43xcp5D4E0uFTkkhnllwAWtVJPjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4930
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130067
X-Proofpoint-GUID: TdGb0QdMHxE0ovrP87FplaEUbBK8-7tA
X-Proofpoint-ORIG-GUID: TdGb0QdMHxE0ovrP87FplaEUbBK8-7tA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-07-09 at 16:08:44 -04, Alexander Bulekov wrote:
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

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>
> Hi,
> Resending this one, as this did not work with the OSS-Fuzz containers.
> (The instrumentation filter support was only checked/applied when
> LIB_FUZZING_ENGINE was not set). I had to shift a couple things around
> in the configure script, since this was last reviewed.
> Thank you
>
>  configure                                     | 28 +++++++++++++++----
>  .../oss-fuzz/instrumentation-filter-template  | 15 ++++++++++
>  2 files changed, 37 insertions(+), 6 deletions(-)
>  create mode 100644 scripts/oss-fuzz/instrumentation-filter-template
>
> diff --git a/configure b/configure
> index e799d908a3..99d6182af9 100755
> --- a/configure
> +++ b/configure
> @@ -4943,13 +4943,21 @@ fi
>  
>  ##########################################
>  # checks for fuzzer
> -if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
> +if test "$fuzzing" = "yes" ; then
>    write_c_fuzzer_skeleton
> -  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
> -    have_fuzzer=yes
> -  else
> -    error_exit "Your compiler doesn't support -fsanitize=fuzzer"
> -    exit 1
> +  if test -z "${LIB_FUZZING_ENGINE+xxx}"; then
> +    if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
> +      have_fuzzer=yes
> +    else
> +      error_exit "Your compiler doesn't support -fsanitize=fuzzer"
> +      exit 1
> +    fi
> +  fi
> +
> +  have_clang_coverage_filter=no
> +  echo > $TMPTXT
> +  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
> +    have_clang_coverage_filter=yes
>    fi
>  fi
>  
> @@ -5843,6 +5851,14 @@ if test "$fuzzing" = "yes" ; then
>    else
>      FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
>    fi
> +
> +  # Specify a filter to only instrument code that is directly related to
> +  # virtual-devices.
> +  if test "$have_clang_coverage_filter" = "yes" ; then
> +    cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
> +       instrumentation-filter
> +    QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
> +  fi
>  fi
>  
>  if test "$plugins" = "yes" ; then
> diff --git a/scripts/oss-fuzz/instrumentation-filter-template b/scripts/oss-fuzz/instrumentation-filter-template
> new file mode 100644
> index 0000000000..76d2b6139a
> --- /dev/null
> +++ b/scripts/oss-fuzz/instrumentation-filter-template
> @@ -0,0 +1,15 @@
> +# Code that we actually want the fuzzer to target
> +# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
> +#
> +src:*/hw/*
> +src:*/include/hw/*
> +src:*/slirp/*
> +src:*/net/*
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

