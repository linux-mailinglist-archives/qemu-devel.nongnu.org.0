Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3190D4EACAD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:52:38 +0200 (CEST)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAOr-0000lK-8h
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:52:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nZALD-0005hf-F7
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:48:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nZALA-0004bF-LO
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:48:50 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22T8oR5n012691; 
 Tue, 29 Mar 2022 11:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=ur1SGNZ7x//GFmYdjcSYomNG8rSORh+CUaAzmewxo1U=;
 b=YsID4EUvCCsABUE6DBNRYSoQKwhb4T42Mv0IR2hjOkJg4By66wsMxw8WlkWem9o+Bac2
 rKZUU1IEHgLJdd8MP8uVV6CdZIGEehayik2hPLRnFYLp0paGQp8DSHmWGQY9Gc1cOWeM
 4pDYI1BPE4laMyuyP/RrY5gejHPCpy++j78RPSCcSd2V9+BaBXTqc2PQ0qkXqVua55qe
 ANWg5f6zn7NPDpTK9w1J+jAf4QEz4aRRqOgbPq0xgXprdWJbbFYlB/IPaU9Rtn+kpEOR
 VAbn4E275Lp6udbb2GC2NkQh06I6qOA9RnIiquzVhwNHuTA6L25iRhKL00NcPLvLn347 HQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3f1se0echc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 11:48:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TBmSWn192041;
 Tue, 29 Mar 2022 11:48:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by userp3030.oracle.com with ESMTP id 3f1qxqe96x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 11:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dn7Yn3K0AXbaHXB9HnUpBEVPIdJm0iVL+3tQ/rohEGx0gJlE9aaeUOIHlqSNLG3nvLWRiTX7fNGNNXGEk8FDi4TZRy00E7zt01OHOkAfmGPrYIopTiHRkQeTwrV1UxkLlMcb0BPID7ZnkgLeZOYtyW/iD3wW5rbEajinERgufydpmpZXlTtKFSccZwvUACab/ccIM1xtCrz+ywXCvURlM+R1WH7ETTx+XLuG0ILue4aisZUl0JiujkYVyDiwYnI3tpJU10XTEUkHvd34FsMpEj3uwWgO4hWJdHomWdApO9Cod+WcxJlNKEZp66Jjagm5c/ocs88LcrmCik+vMEvepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ur1SGNZ7x//GFmYdjcSYomNG8rSORh+CUaAzmewxo1U=;
 b=A//lRBVNlQhfZ/GlfHBwGGbAegxpFjHdUpziv/BjiL35GkrbnXUp7qiXnK0+UqnE4PwTBR6hHSOm9mm9teCBcxA5mEjRT/96BKmGuUKqMleCQR1kGtlt7RruOC3zD6T0vOIEn5geqBsfOmEZtdVrMqQO6shERfKtIHTGFgO+C1b2N4Sb3m99lDFvNQ3SiHQ05jhCFhyl6riJqK7SSQD9vaxerRGmpdKdulQbqkv0xl+gZQAvKlSDY2C0TXnHqgfK90ZTG84jS6i0vHhT74BrruDPaZyWCzbl6vycdlJebxGjnsrnCcRxZpbpdcWrLjtoXqjDuLMYjAwKUB3a2yBytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur1SGNZ7x//GFmYdjcSYomNG8rSORh+CUaAzmewxo1U=;
 b=Ntm72xBXeTs6+xfnjDOtsCNFbzOvF1/TohoqF/pqP+hKuDLDeTsT61SHubGaLMomP+2WiZHX9QnYw39Qk3b3nCdf+NTdRlR64dR87KAYbU8QDpoAb0/lIdbjzhm+z10xqA2rTIA9BhfgLRc+PUShKN9MkB6+SsyySr5rHYcbOgk=
Received: from BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9)
 by DM6PR10MB4380.namprd10.prod.outlook.com (2603:10b6:5:223::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Tue, 29 Mar
 2022 11:48:26 +0000
Received: from BN0PR10MB4918.namprd10.prod.outlook.com
 ([fe80::b5ea:d565:9d80:ec50]) by BN0PR10MB4918.namprd10.prod.outlook.com
 ([fe80::b5ea:d565:9d80:ec50%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:48:26 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 1/8] migration: Export ram_transferred_ram()
References: <20220310153454.3929-1-quintela@redhat.com>
 <20220310153454.3929-2-quintela@redhat.com>
Date: Tue, 29 Mar 2022 12:48:20 +0100
In-Reply-To: <20220310153454.3929-2-quintela@redhat.com> (Juan Quintela's
 message of "Thu, 10 Mar 2022 16:34:47 +0100")
Message-ID: <cunpmm5f08r.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To BN0PR10MB4918.namprd10.prod.outlook.com
 (2603:10b6:408:12e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4e2aab7-a7f7-4091-7abd-08da117a0903
X-MS-TrafficTypeDiagnostic: DM6PR10MB4380:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4380BDBF6A197E5D426C6F42881E9@DM6PR10MB4380.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hv4bTrlLc5Jmg294qttHWOnLNQQqaaQG/+mPqgzRLhCN1INhCXaJykGWKQh18EATN916s7JjZLVIoBDGxuNxvve4vxIGPVnJdbWIaUiL3RrcfV7z5PVleUonW5n3AmZxIOopjpnUL1PZWcZz50GSzkzI2RfqXpmcemGtjxDaYt6eAsWrh4Q1Lth0Db/U0ihSWbh6VXL8IGQAVygfQcsLlbK7wxeZyxaH91YBRwiskiT3RUfJV/Hsa3qUINeT15oj1rMNXDp1DaCxgTQThWPv9HuVixw3+EWt7Lh0hm4WgPCZ/Za4N2aHtMurIAEwOfESGdMK27odGrJaM9oL9iNdx1UzphdbHjiPyRNFUvmyV/ddiY1k0f/WjEU+XngAZqX0Tl2D4YwZ/mUwRIM52dmE1x07tv2+mf1n1pX9+Fzy2DV7wKvnDPCqOF5UC6t86dR6ed0tNlNATxRo2G7fvEigI6JDjsnOmlf+etc3W/hT01rWvzFjy+64bfFd8YiSJNddsF0xUqOxfJPylYrIVifoWKVDU7cY2C0B7lyhwvshTqbwugcauu74v5j2rjyLoFEMvj98KqeJOlG8qInUHGeUhdpEauwGOjfrJvg5mBsinfIfwEM/nmnRtJjp8tTLLlCSoiL3We1P45jJdzYhtDaw1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB4918.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(44832011)(2616005)(54906003)(38100700002)(86362001)(8676002)(6916009)(8936002)(4326008)(66476007)(6486002)(52116002)(66946007)(83380400001)(5660300002)(6666004)(66556008)(36756003)(6506007)(186003)(2906002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?edQKUjJ0csMkyh33v+usplRqTh0/yRIvrM+CSxQCAqyUGq0p6k419yxSQo77?=
 =?us-ascii?Q?QU+fA5dAH1upaJrsuNdi+sQomr7xFARq8QaKI1BCLJDKMAylWLCP+mHRBmjY?=
 =?us-ascii?Q?v8QYIeYgEUjfpNt/Tj1AAktDGmPHJcC/PxpZ8mrjRlhXiCaBrywXsmFIELup?=
 =?us-ascii?Q?iC9UGbuzxiiG45Q0rDt1CbBcUjoK/NDjSbFGVLBBk3vFGW3rUtUGye6a+2cs?=
 =?us-ascii?Q?AOcOVO4ujpKPWtIDnCCNgJzw9urGScj4CA2TnG8/pRbFFspQST46rEUeGx6y?=
 =?us-ascii?Q?kE2DudWEuxNIu48fGVQW+Qzad0L5fJBIQkjr73V1/z0+qG0qYiSarSHYGQky?=
 =?us-ascii?Q?ucG51mN5gzKeCkbM95kfBZTdePSCX8BCOIEnxApd4XwuCK5OipHvm791UJfS?=
 =?us-ascii?Q?o5LXC+VVdc9euabm8hsPReOvWXYHHSCcgcOKLynRIvkKyVMTRsh822y1ObbY?=
 =?us-ascii?Q?Fsso9J4jks4iyDipw9ApUn6BBitLcmgYxrjf4Le+/IZ231u/E1tY0AHy7mw9?=
 =?us-ascii?Q?L9tnNk7Wlp3mFZ9v6I8B8z+Np0uYeghvZQYmw/qZjXw93Rk46ANqv7yEHvJ/?=
 =?us-ascii?Q?OWrDQuoNpt8N0mRdlxhLp3OjE93nKOPfvqjQnjVku1dBn16JA004fHUk6EVo?=
 =?us-ascii?Q?D7+fjuk11lRtEPngmMPuucSAQbw5rLmNhsXkUINvNNuvQgqRhLnVLHUk8v1t?=
 =?us-ascii?Q?ds7vknL49wnOISCPUjD+SoysSwhyH+zQurHtjVb2Kb4m08JMfu/QqDdeT++r?=
 =?us-ascii?Q?Fld1udTYUDKC3Miya1xyLU/dSvj80OKZT9s7TvBjhC8HW+pIJLzdtCWGo/pV?=
 =?us-ascii?Q?n5t7E2p5QWz47tyRBPz13u9dV/FVcOqqeGutXE2q2HEo7UT7+d2iIezCt3WG?=
 =?us-ascii?Q?IG85ff63TSZ94juUCOhEyCv6SvO0TdLpalC3aN3fgFAtOv3kL++8uVx7wiyn?=
 =?us-ascii?Q?kYaHawkVKy12OFis0+kZegnkDucDb3qriuEZZ17iWFFa3KG9G5kgY+7UuUU+?=
 =?us-ascii?Q?ZjcfDYXFVGj9+8pWQP0sFlCAq4qyB0YXBtVt7vaagLQUMUKKxPkUcx0oPQwj?=
 =?us-ascii?Q?Vk6fxm4H1mjj5tRSiXyjqs4MpjgEmizM9QWhBVmyzjeaR+hSNfttwVuoop46?=
 =?us-ascii?Q?nV3sktFIBAScKOHQZuqND1TeX08IZsRx284P7B8xnhXJJcKDaWRqcvwNkd8A?=
 =?us-ascii?Q?stl2NC6m6amKDXFmK3AKHqVvZuoo/3cvAITCu0F2W0Gr0x3nS+oGPRjBJ10b?=
 =?us-ascii?Q?/eEacT6kmSFBMxzFbIC7nPanVYOoSNMaC1w5MEpYX5kBhjvc+dzmeIltxLH4?=
 =?us-ascii?Q?jUgvsexBZ9OQMd8laggnBuIY8n/P2zNj3kzI4Y+SQFe9NpZWn6SJEwjEnS3p?=
 =?us-ascii?Q?AyrQ/FFW4EMvRJFiyJGNmYWPxH96F7DIsIdusOjjKYSQSXCkTwgMBC/J76YX?=
 =?us-ascii?Q?Jo9khuIorhZ5H+TVP3Ur76fp5v45TsBJbthH3LOpBWWW3xukc2sJPezdvF/C?=
 =?us-ascii?Q?4w/k+etxfxtHDWfHuCqeMYGCx8s6LWR4NRxt9L/rq9w4jQd0uwDjchTwIFdk?=
 =?us-ascii?Q?2cYhkndeyNIVIQR2AVWelYc6K7MxLjaAqBGYRA4lQxAjCI/uN6wqwwVCa08y?=
 =?us-ascii?Q?LjVQq9bkNxAEpV90zuku1ek9pP9tZo8/heNHOBVUo4qrvSxLHyOY+4Iuh4K+?=
 =?us-ascii?Q?8U/JDFTfwou9q0GMaNTOyipg6TmmR2+Eyko4+umMTPw0aJ8RIAOR5qTzayim?=
 =?us-ascii?Q?S4vGCwx43O8R9EUW2aYwfle9uCJsZLW2+Spg1S1ujPS7kZu/XWQdDKaXQewJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 8LY+qUXTQSRbbg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e2aab7-a7f7-4091-7abd-08da117a0903
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:48:26.7971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DD4o2/10YlxIcfr7ISAiC7zo1DhX5kZ6gBgoO0c42RbM0zl0Xl1iNqygiAQPfSw0WEnk/gUwyFPIysCjqfwRcxF8Dyi1KLm4f4vjWYuZVt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4380
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10300
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290071
X-Proofpoint-ORIG-GUID: I1LGtp2jlP0UMn-uJqF0-XabHB9RjUmZ
X-Proofpoint-GUID: I1LGtp2jlP0UMn-uJqF0-XabHB9RjUmZ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Leonardo Bras <leobras@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2022-03-10 at 16:34:47 +01, Juan Quintela wrote:

> Subject: Re: [PATCH v5 1/8] migration: Export ram_transferred_ram()

The function is "ram_transferred_add()".

> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/ram.h | 2 ++
>  migration/ram.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/migration/ram.h b/migration/ram.h
> index 2c6dc3675d..2e27c49f90 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -64,6 +64,8 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis);
>
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>
> +void ram_transferred_add(uint64_t bytes);
> +
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
>  void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
> diff --git a/migration/ram.c b/migration/ram.c
> index 170e522a1f..947ed44c89 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -394,7 +394,7 @@ uint64_t ram_bytes_remaining(void)
>
>  MigrationStats ram_counters;
>
> -static void ram_transferred_add(uint64_t bytes)
> +void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes += bytes;

dme.
-- 
Oh well, I'm dressed up so nice and I'm doing my best.

