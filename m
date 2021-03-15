Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D4C33B1AA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:47:12 +0100 (CET)
Received: from localhost ([::1]:50206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlgl-0006nv-NU
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLlcP-0003VK-BO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:42:41 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:57088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLlcN-0003pu-9V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:42:41 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FBdjLP005376;
 Mon, 15 Mar 2021 11:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=dZ3KwcA38vWQOoKFMv8OuL2d3BNHaxzhsLHt1ObYNk8=;
 b=iutzU+4zFABnSN7xOeTflNntOaXLh5HVzQsYusEtKHcezWNhfQaoskg1KWw85GOgcm2+
 txd4YYDTRhHafD2ZtSmfeT2r6L9lkdAs0XREVzpzrNw9b5HMdq/0vk1rxlPGmTnBcTwf
 PUh6PXz0DtjedhspMRX/2PC5gcZrJJC8k7TQxxai/LkzHBf1bmWfYWaiSfW6N5xd0C23
 Oa9UkXpMgGIkcGF0f6rhrCCWpdq55vpidU3uGRYI/KS6bkp2DXBtfzTnQntoH7FtV7O/
 dfnBIlpPBm5KfbTeMyGaylkVd2G2I95CmbkQOJkqzZnr4CrQmOPwdAE2wR4/onQtF1nP eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 378jwbbm6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:42:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FBeW9O092770;
 Mon, 15 Mar 2021 11:42:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 by aserp3030.oracle.com with ESMTP id 3796ys09vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPHRWNLwS1IgzfcLuHxQ7lwu2qvxPzDQGa1qbqQgL8f6HbGplAeRjhHu2lP5/PzfnFEa1e7Sp+K1DP4Dg5VwQbWYpwA5FjG1XYErjDFuSSV3/cT0a+8bAv1WVnk58l4Su7wDRAJyU0RyDVkHuUmGr3dsxgk1Ewju2pDJpszxvw4arBFNzn/uqJerZAcxNZceUPmnbs9u4Q1nxigJQB95Ssn319Xnztsdg4TWUKAmrTPg1QQImMjQ0JBkd/FiwwEEaEDjejwSjTjRtG+T6CsqFG9dlfxt6yam12LgEhruImxsB0T90IyIjbyalzpRf4p2F9F7YSeENgPLX8SvHBLJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ3KwcA38vWQOoKFMv8OuL2d3BNHaxzhsLHt1ObYNk8=;
 b=ltkE4td/Lq4LQIwkQqzCtwhsycIV7Oe07ZHS3i1GanmAKol1rwspskuWZCooAa3ctOQZ7SMZAYQAwS3/Z6cRdeyxLiFFdAlt0F3GP0dNlUQEosLZL4cTWmp1MYSq22bGJPfvhCSvAruRG8yXNOkQTRdwu57+ukolvTnNszs1lt7p1rl5sLoDN/AZXRBq9n3ETNRZcP5GEf5CFT9OPfg5ZXc1i6ajwDjf9XyAI7ezlWufra8SdkxF6/SWdVZWJ1OXMuvgMSM3Rb0gbens1CzjYH+YEU3mGw5BcDcywvX1U5RTLysSW3rk3dZbOAyQ1QSXHy+CEuyY/yJsgHmZM63upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ3KwcA38vWQOoKFMv8OuL2d3BNHaxzhsLHt1ObYNk8=;
 b=bEqnVKRSyVS2QJo5Hvczh+Zyvk3JngsxXZmck6OduOktD/VKzA1Df+YGyOBBec9HR7+5PDH+FT5633Tur0CMqHxdm5ABqdRJ7Fsn+LhqTmtS1Rg2+PyHhAq7nAeSITVDnX0djVPwh38VT3wZhuSw5rLrtV6V7OAksr8Jge28Dj0=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DM6PR10MB4281.namprd10.prod.outlook.com (2603:10b6:5:216::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 11:42:27 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 11:42:27 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] fuzz: add instructions for building reproducers
In-Reply-To: <20210314042358.682136-3-alxndr@bu.edu>
References: <20210314042358.682136-1-alxndr@bu.edu>
 <20210314042358.682136-3-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 11:42:21 +0000
Message-ID: <m24khctzhe.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0273.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::8) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0273.eurprd04.prod.outlook.com (2603:10a6:10:28c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 11:42:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9cbf87b-b952-4481-19a9-08d8e7a76867
X-MS-TrafficTypeDiagnostic: DM6PR10MB4281:
X-Microsoft-Antispam-PRVS: <DM6PR10MB42813CB873ABD4F3B219055AF46C9@DM6PR10MB4281.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNkd/pY7TAzeD/3TJWSrmyINCowkGVys7qz/HCVjUB1IwC+xzT66PkRAEGQ8is8q7MMY1+IJ+1FhvtYpzYB9DTWZ/Z06aylO0CUYQDXOQD2xiNVHdS4LnrLa+d4spRd9mW4ny384Yqf7I6E4/HShcMWStgtsscwyuRc+jimCVsly/BtbP2B0qOZzLU2QEuhv9n0DFk2XGenVkQ9UcUxe6fUzOiRMdXVXYBhr5+hkpiZIALoHRYScb+59zIma004BglD4yp9vo7V/dMr4weHOA4tTe6d2i4rIhnfz96Nm4Rfb/QH3LKdwFF7NU7znatZltBk4YXhp2RCyzvy++Yun7R1T7DI9XAhhvFn69/V5V49RHvxHzrKk7G2HFaC7Un0M31V4WcdhXFiBbiCrrSemMFnxzKy1Cassdod/qlabApAe2cEYrjDq10rghA4GB23HrUZCXfXlEZFHEkSyfOqqSxsK1O9+f0j4+f+JJmKKJ2RWpj+nfRkh3OaVpjhO0a81R0WFABPq/NrFRW3Q4loPPM25wXgZEEwbs/Zc/LqxI24M2GxeS2FBlA0PDf466qpi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(396003)(366004)(136003)(8676002)(83380400001)(66476007)(316002)(55016002)(36756003)(26005)(86362001)(2616005)(7696005)(8936002)(956004)(5660300002)(8886007)(54906003)(4326008)(44832011)(478600001)(16526019)(6666004)(2906002)(66556008)(186003)(66946007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HjMI83j7qLCRyJs8Q2dhSxDQy4PYlQIC8ZJBxl8401v+buSTg7j7DnXMSuyg?=
 =?us-ascii?Q?v+bXflPR6n+xFH0KtrORLpzfRL1A6QKEhOzMau2j38BiNLkDhQIe3Ix4GTEP?=
 =?us-ascii?Q?6pUeuO4GRz8H98QUIR3yKI4ZZfEQ42zSyOquF5tlTw+bs3CTJGIxJRz8OhxA?=
 =?us-ascii?Q?+Y70pzoYYh5lD/wK/ues8Xtzzj1YmJtct59y9k4cr+6d+a8DxgW+RvwahK9x?=
 =?us-ascii?Q?fiLMdoLXyHZqd8d8I2ADGNLsYX/JXkiaNqYM4lBGMPdrPmJ7NkZAr9LK0IT5?=
 =?us-ascii?Q?BcSrIQtG0JrbbjorBkiv+iibPP3Act1waeWRdWcUXLMk6bkPu8RYAbPVV6yh?=
 =?us-ascii?Q?J8RRUCJyBX1qKhKbqwpdPh3f+lm3rnLOpElFbCXN7SF6QNVcYDkvJIDg9v5I?=
 =?us-ascii?Q?IW0K8iy3Ws2F1Ts8/XU4sbLqI/orNlnDSAGq953dqp0WvQOQhCA8Gw+wA195?=
 =?us-ascii?Q?WdOyFkyx5ZktWS57cdgYZyUsHjvTaVv+g5jckZQDO64eygsa0QbvkzLcjO+Z?=
 =?us-ascii?Q?fucwN7HDh/aVFaoBeQwDePST9VaxGjwHkr8jDM2TzYH5eLAQg8yEuW81dmhJ?=
 =?us-ascii?Q?sCOz2EreCW6RtYFC9QbOTaIEzlKMLIlUxZDX3fWRqMGi7RP07cH6NcWYdUe2?=
 =?us-ascii?Q?opihsS6yPYsYivKE9ESqK39XSjibGdpoq/NpSAaCa+vGzKUukpstfe4SauyE?=
 =?us-ascii?Q?jGn0C36iyRPwUOH9Z2hrFlrylQBpypyHRdAqFSO7sWdezejZsBkUte2GM3Le?=
 =?us-ascii?Q?TGtpQkrlNYMjEJXl1M8ZMY9V6Y/NDfOcIiU/rAfoqWQ12OTJY8i48x7H4fNC?=
 =?us-ascii?Q?f6t/E1D4p5/cAZP92SqXlYxxFtUmkOFuj8IDdtft2HO63ey5viuSMBx3jjYW?=
 =?us-ascii?Q?i74Fs1QcNCQ9+grseNay3sDMQl7CiNIAa8s/3g2Z/A1Q0+c5s6k95buJJRWd?=
 =?us-ascii?Q?l3HsSjoajLry4q1Y18WkMGv/gGL9CuLHpgWmsPnv/pl0kY2QbTgYceKydO2q?=
 =?us-ascii?Q?XDZ3tQZ1JluapDteIimaKnZLFpb43uNUS1mfWW8hfV8f2XicsHAEB/9Y5RJA?=
 =?us-ascii?Q?ZQ1SQl1EqP3Hb+4c1/bmqTY+siJH5A8pocPq2makbCwh+jCFihbXuNDw5uvj?=
 =?us-ascii?Q?qxJTcw+FE1l7ry57YnO4UiN2jKND3Xqu742zuKWeznnt3rzJIA8Qqr/Rs58w?=
 =?us-ascii?Q?82w9fEshcDGyIzDkU58xzTFdEVJl4ZZkD7m8P1n0I6aSSFSxfR1LFMl7UG/e?=
 =?us-ascii?Q?mU1Czbm92QE8uiypqEeUsK3MlrG29oLg4e8qsQAiV92ukCO7wR3QC3t8OYaL?=
 =?us-ascii?Q?WVFY6PbYQW8qTsczu13vOXA/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cbf87b-b952-4481-19a9-08d8e7a76867
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 11:42:27.2105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLwLchGHMDNrq96tjHBggSs3ajqtjlAjPIaNItVR1w5ukrCt+qQnNNP339/V3JiouT8P7tosBVK5QhX8yd8Wmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4281
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150082
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150082
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
Cc: Thomas Huth <thuth@redhat.com>, f4bug@amsat.org,
 Alexander Bulekov <alxndr@bu.edu>, bsd@redhat.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Saturday, 2021-03-13 at 23:23:57 -05, Alexander Bulekov wrote:
> We have several scripts that help build reproducers, but no
> documentation for how they should be used. Add some documentation
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  docs/devel/fuzzing.rst | 45 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
> index 97797c4f8c..025fb0c19b 100644
> --- a/docs/devel/fuzzing.rst
> +++ b/docs/devel/fuzzing.rst
> @@ -210,6 +210,51 @@ Build details:
>  - The script responsible for building the fuzzers can be found in the
>    QEMU source tree at ``scripts/oss-fuzz/build.sh``
>  
> +Building Crash Reproducers
> +-----------------------------------------
> +When we find a crash, we should try to create an independent reproducer, that
> +can be used on a non-fuzzer build of QEMU. This filters out any potential
> +false-positives, and improves the debugging experience for developers.
> +Here are the steps for building a reproducer for a crash found by the
> +generic-fuzz target.
> + - Ensure the crash reproduces::
> +   qemu-fuzz-i386 --fuzz-target... ./crash-...
> +
> + - Gather the QTest output for the crash::
> +   QEMU_FUZZ_TIMEOUT=0 QTEST_LOG=1 FUZZ_SERIALIZE_QTEST=1 \
> +   qemu-fuzz-i386 --fuzz-target... ./crash-... &> /tmp/trace
> +
> + - Reorder and clean-up the resulting trace::
> +   scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py /tmp/trace > /tmp/reproducer
> +
> + - Get the arguments needed to start qemu, and provide a path to qemu::
> +   less /tmp/trace # The args should be logged at the top of this file
> +   export QEMU_ARGS="-machine ..."
> +   export QEMU_PATH="path/to/qemu-system"
> +
> + - Ensure the crash reproduces in qemu-system::
> +   $QEMU_PATH $QEMU_ARGS -qtest stdio < /tmp/reproducer
> +
> + - From the crash output, obtain some string that identifies the crash. This
> +   can be a line in the stack-trace, for example::
> +   export CRASH_TOKEN="hw/usb/hcd-xhci.c:1865"
> +
> + - Minimize the reproducer::
> +   scripts/oss-fuzz/minimize_qtest_trace.py -M1 -M2 \
> +   /tmp/reproducer /tmp/reproducer-minimized
> +
> + - Confirm that the minimized reproducer still crashes::
> +   $QEMU_PATH $QEMU_ARGS -qtest stdio < /tmp/reproducer-minimized
> +
> + - Create a one-liner reproducer that can be sent over email::
> +   ./scripts/oss-fuzz/output_reproducer.py -bash /tmp/reproducer-minimized
> +
> + - Output the C source code for a test case that will reproduce the bug ::
> +   ./scripts/oss-fuzz/output_reproducer.py -owner "John Smith <john@smith.com>"\
> +    -name "test_function_name" /tmp/reproducer-minimized
> +
> + - Report the bug and send a patch with the C reproducer upstream
> +
>  Implementation Details / Fuzzer Lifecycle
>  -----------------------------------------
>  
> -- 
> 2.28.0

