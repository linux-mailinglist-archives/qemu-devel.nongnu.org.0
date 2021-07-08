Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9D3BF7A3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:33:07 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QP4-0003c0-97
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m1QNS-00028D-V6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:31:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1m1QNQ-0006Rz-Kj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:31:26 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1689UaZM022686; Thu, 8 Jul 2021 09:31:12 GMT
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
 by mx0b-00069f02.pphosted.com with ESMTP id 39npbygqt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jul 2021 09:31:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1689GNSD075874;
 Thu, 8 Jul 2021 09:31:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by aserp3020.oracle.com with ESMTP id 39jfqc9dqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Jul 2021 09:31:11 +0000
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
Received: from BN0PR10MB5144.namprd10.prod.outlook.com (2603:10b6:408:127::18)
 by BN0PR10MB5141.namprd10.prod.outlook.com (2603:10b6:408:125::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 09:31:09 +0000
Received: from BN0PR10MB5144.namprd10.prod.outlook.com
 ([fe80::fd8b:fb7b:f692:bc8d]) by BN0PR10MB5144.namprd10.prod.outlook.com
 ([fe80::fd8b:fb7b:f692:bc8d%6]) with mapi id 15.20.4308.020; Thu, 8 Jul 2021
 09:31:09 +0000
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
X-MS-TrafficTypeDiagnostic: BN0PR10MB5141:
X-Microsoft-Antispam-PRVS: <BN0PR10MB5141818D2A9B050FA87D4935F4199@BN0PR10MB5141.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLvKPa75E+0zBALPiRh0FATefj1WD2Jbrdn3ERHzWpLUD4S7L14y1WaXhqnl1fuDTKjaJvdsP0XDxedaOJNLeyuRLjBDnQf9mpi91k20Ip+TwsuuGmMyFsBa1stR2WfHwpED5LFMvWpPXBpXCo5v2KY+meU05oJeGzI5SgIRufHoVc8dixxu+8UyW/1C+kNcUw+cv0UenaaLP/tnq5gcaneLndnTu3RaYDQnPwK7sCAh2O9N+F/RBf5XI2/huePrsZNolvDMiPQcqPNSHP/Y1U8ePV2VWVWLbgXZd1madDdsW1gnHfnAiS3ddvNVvB3WEXEzDqOGdyRWI3Uax7aWivapLI8BJDDFX0tJRfC4g2OhLzApjADEv6w7N3jZEVYSQRb/n/MURUZOLbEMChd18j+QXnDXLdThtw5T+OO6j66Hq81TPNnl0FLw/HIf/kx3c43CKEUIrzpyfsoufhOjtabSMQ8/QZDEkolDYgJQW1RSKBrCjjFq+BzGKRdYOVvYTDXkQK+apaAQkHQNrtDHr3Pk21leROVbYWs647qaG1LrEl1flp0xUahCuwTctRFhxNGofdfJZpEaIMD0gEcYSYmc2Uu0od8P+GhgltDp8f+QTAjOKxo/zDzckNzK0SQvh/Km16GQceDIxm8QTynwHLmZNtSJEXFxQPU19Jwf1fL9EGbSoV6tjczgOn4R1Xy0a4It2b82BatRYWnQt9HGgUyDlVTSu2CO8BunZJZ/7R5nbnvBfOdwPyIj0XH0MQu9NXrXbFy1UC4VrZAwbjMsBrPVCGRKk0J+w/jTUhVvubqEfB8A9QjuT8xSyqjcp6Ns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5144.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(66946007)(478600001)(54906003)(956004)(36756003)(52116002)(2906002)(6666004)(7696005)(8676002)(66556008)(66476007)(186003)(4326008)(8936002)(26005)(966005)(5660300002)(38100700002)(38350700002)(316002)(8886007)(86362001)(2616005)(44832011)(55016002)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?COnlKopBSOZ6UCWHUIgnArvuQZoKaSBJjWD0kyJLdWO5+Pb9dO2dKTF7P3WB?=
 =?us-ascii?Q?hw5A2kn0oB/ELzGOqD6IR4uPQNMg1obO5sJzm1dOsvquUIVKYVtmskP5KvRt?=
 =?us-ascii?Q?f6q4OPh+WjeEABzKqQ8v3Fk2+VwEC8J2c/FGPFZMgqNMT2vtmoihspE3w6Oy?=
 =?us-ascii?Q?/nNIN/E6H0sQAHTuxJwPxKT+kscHRkl0jgW961oiXmA1vrcL7upKp+/dlfTd?=
 =?us-ascii?Q?rf5lN/rfw54e+RWzGZBIS7MxBm7DsMlVUt3TuGygOaoWl+sVmO8kzsUTy+bx?=
 =?us-ascii?Q?36U6MzKbWUjhjrxAvtT1BdCytrNm5KFB8vzhkFFUp+zT838UUAlMZDwICUcq?=
 =?us-ascii?Q?oy132c4dQVGW25+XAUjftKU36LXjz/T+RWqvSVmeGSGNWzN+AERuUQx7lMm+?=
 =?us-ascii?Q?OAh4mqYbkjnKVm31+Qe3oNhgk/f5k1FtdVaNEqVgp4e0+A3VwrK12Ljaz62L?=
 =?us-ascii?Q?Cz4DQA+D86lmWc76vujkOUyxcmnz6UjqqLV5zZbE21GWmMHzJtencLreHHI4?=
 =?us-ascii?Q?AfLMLRgQ5eMWSLANMlyRy1nXBNWtKAiuLRI9yaFPcZ4IKM6gDzgF76U+z0yz?=
 =?us-ascii?Q?W6HCh1gRiUQKlZBEGobNNOS7ndAX1iXYPAmX/+UZHyF45xtTnw1fgktwtzra?=
 =?us-ascii?Q?ENUjSmHnvLkLhgzbUV+HPwTIZp2WvVzqHHWSSAU84mnD7WyMjGg1qHSCbcUH?=
 =?us-ascii?Q?gqx5lr3bsKZoYIVEj/oFG46rGKme6fskE9cCc3HHkwzNUHDPxrVdXeB1cA7+?=
 =?us-ascii?Q?F2LAFaojXZGsQeAJpZJ4Y/WAQtJARnfhDbRY5jm51MmsSenTeOCeniyhwGCe?=
 =?us-ascii?Q?Wst9a08MTExDMIKazRTu91UX6VL3m76J5FzPqDl1867VxjywNjXp/l6cRL9r?=
 =?us-ascii?Q?ngsnBC3K7Qb03RGBcRoahMxORV+sDRiGRmcs0+BHwuGbLM2n8gg4kQvUzxHV?=
 =?us-ascii?Q?xhVI4UJKCKq0wZqAZDbA3AKs0LZiAY5EKkoMdVCKgijMu4tvbfVjS5iATf9y?=
 =?us-ascii?Q?jD0rIOv3zq6FiE2MHyBNKKAJGRZDxXeaNlRn7JtHhFRjW0ld4tfW6mkWRg3Z?=
 =?us-ascii?Q?TafHNSRB8rF+hZHafIq9s00rPzwkLWz1n9UrhDSVXp3kDI/NntEnZHdP60jc?=
 =?us-ascii?Q?zLclgSZc3KOP08UO6c96wMy/x8S5UZhv/qhHRGOvw9ITKkkPqBoyTQoAo+3z?=
 =?us-ascii?Q?aIYtZjo7hqPXYiktv2EPgF3qQf4V+zA5Tcozx6WPblt94qdhjDBQwU1BSV3i?=
 =?us-ascii?Q?n4lPiQE789HqUdqBCxmV816hDROqfXT8GfGlhwNe/cU7sSJO0ziOUEJpJ/K0?=
 =?us-ascii?Q?32YMxJUXJ95aJyWy3esG/SB5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b443051-f88c-45c0-55f1-08d941f31871
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 09:30:59.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nozTkvma3l9GUy07yrJ5WAmJubsHpqIquBiG4jIpbSJLRnKtOmcnGuXkJSCFIZB0oKy3jufKQOwEZ+vWdNt/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5141
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10038
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107080051
X-Proofpoint-GUID: xDH04DPgA2RwYglSg7Csuwld7hXYjP1I
X-Proofpoint-ORIG-GUID: xDH04DPgA2RwYglSg7Csuwld7hXYjP1I
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

