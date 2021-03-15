Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD433B265
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:19:54 +0100 (CET)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmCO-0005su-Sg
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLm5D-00025i-NL
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:12:30 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:40334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lLm56-0003XA-Kq
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:12:27 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FC4kai125943;
 Mon, 15 Mar 2021 12:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=EUZGCTozi3ZvDoCSNw/vMTMUM5go0DRPvf26JD5MXR8=;
 b=CmomvocscRbmcHgcgYxfUa7X8Qum310PacRIFY63i09q2MFRsBNOli8l/xnxmX+jCBK7
 3m1WGodJ3D511j5HQG8MR5CA2CFh6Lu0T6uf64YKHDP0bxDOS8MYKAajtKR1KVCZc1cV
 R1lILUNmwRaeCq6hmwN4pcPvozzv8lsN5Qgl5wt7/bfQ0UbGFdZaikl4A25PwJWyFVNh
 GnBRb90C4l47FqS6n5iQWM4/bA4SP/NM2IJjiAXqsrQHY+33tAll0lmAfNHZ7jVs1f32
 rJ7paJ/qH9rohTe0jZkyWZtiY7nCu5ZccL4CRuHSd5ryT4raei5q5d4ZbPbYjrV/QnRx zQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 37a4ekghe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:12:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12FCB5to142583;
 Mon, 15 Mar 2021 12:12:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by userp3020.oracle.com with ESMTP id 37a4ereasy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:12:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2pP5Z9f3JOfZb4uNOGQfWfDsdCbjPEfC1xMyqrtF5E+HUeia7XCXyWL6SQkFuCjHpLjs9vFY1DNrn03pCBshRLcxxumod0yJEYxAQ8IDy5wSrjEsuVW6D1haQp49Po4/T+rGQjmsMzWCnI6DlTob4tlGvYK13iYJV4vkmJJAh4EgGbOuKQHVLsd8hTA3crKe16KiXGpwk541SR7YApMmrf/gabX77hG3xg55spHgdxyuWw2oQWww6oRFp5pSGKO09VZz82F9OabzDscFM5wqPpl/TGdZp+iL22IRLSh7Mt1jv6p3zj2GMIVZ/ZQnqUzvNg5BooCesLsfRpRn0DVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUZGCTozi3ZvDoCSNw/vMTMUM5go0DRPvf26JD5MXR8=;
 b=m7Uq8/6fhwRu0AXawSfgo61hYhQfuPTXsvZ6oNxcskC+HzoOsQUFD/JHKcktJKkRuFD551J7Q1711ODvmMzTzIikEVbV0Y0AL4HgMsKs6yHAv41jFEA+KlNhUd9Ii7j12o52tJwAMdPJdYQKvppXu8O2Z+hsZa9nUbitScp7Rp0F1ZYd1fRom7tvXa7d3pMnRaEwqp6SABZHe85MsnXCRlK+VSbT5GUkLVKmKOYqDxQKcnzm8cMYDRKvGrAr25og1sWudlQgboZb08OBmbGe9RF7mHyYMLE/Oq4qjckxf27nOczb87x4ptArbpAC/ogGmXORkoA/JAGbWa9Qw3UaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUZGCTozi3ZvDoCSNw/vMTMUM5go0DRPvf26JD5MXR8=;
 b=gft464u4NXAgK8DBCOKeG2rBtgsF8HrZRjT5GvGiKxS7XXTqSmu3vybxpiORBFte2yS0LiS2V0qd0UOIwaJAQBNxCogBWK16MbXcvQDd9o6x1Fkw7zjyjJxu5LCR2Fkm5W+tkVUAmhnLUyB1FO7HbmKmYEfgJskKbOojJNRAJqY=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2857.namprd10.prod.outlook.com (2603:10b6:5:64::25) by
 DS7PR10MB5376.namprd10.prod.outlook.com (2603:10b6:5:3a9::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 12:12:12 +0000
Received: from DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873]) by DM6PR10MB2857.namprd10.prod.outlook.com
 ([fe80::fca8:448b:525f:7873%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 12:12:12 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] fuzz: configure a sparse-mem device, by default
In-Reply-To: <20210313231859.941263-3-alxndr@bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
 <20210313231859.941263-3-alxndr@bu.edu>
Date: Mon, 15 Mar 2021 12:12:08 +0000
Message-ID: <m2v99ssjjb.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: DU2PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:10:232::24) To DM6PR10MB2857.namprd10.prod.outlook.com
 (2603:10b6:5:64::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 DU2PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:10:232::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 12:12:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc59ba70-fa0c-4f68-1512-08d8e7ab90ab
X-MS-TrafficTypeDiagnostic: DS7PR10MB5376:
X-Microsoft-Antispam-PRVS: <DS7PR10MB5376329AF426F2345B74867AF46C9@DS7PR10MB5376.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sob888JVDKYFSqPYZuROZA9yajq11p2xuXIwtplWZIXJeyjNvkChfi3DLpeDvLGqdFPvXSVB2euE0dwn9xiGGqzTXNWDDGgpsUIvroynAs4vP1MYX800N2lc4BuD0X+UKj3gnvH3ZxmpMj0ccq+6m5egXrO2lUFXMnnEg8W8wuEGo9yKjuNGkmnyqkUzRS+c97yCdzkQWfdjGFoBWsEK3eOHqUDAaYw0tyePWXkwf/x4jHIKG8BdMjUpcsmjHQmLZsPH5S6QuLW83LfK6ZuxfVr/mzkEZkOlOxVkR8xeQp/pCOmjAyfcMKE+1gaBXNEDxphNw8ZuCAuBYo/0xYGIhlp/1RwuDOwVDZANWZogqc2isNGrvuwFexOC8YWUwiOWkN33WVtTSpaEOF2Bul4ep74NsswJF7ZUhVCXloh7WYJrsPQ+8BUXD13Sqmut0z81tVsdlWolQMTvCzoWnDhMAtontW64/4Z1ao2L49Lv90qyneFrdeoEDEiXujR9dvIlhH9Pb/YBpnqAaAitJFfnhspgeE+B+lD6pfSERKqHtbbORywpWppJc+0SBn9o1A4i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2857.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(2906002)(5660300002)(83380400001)(316002)(44832011)(7696005)(8886007)(956004)(66556008)(8936002)(8676002)(6666004)(52116002)(86362001)(16526019)(26005)(2616005)(36756003)(4326008)(54906003)(66476007)(66946007)(186003)(478600001)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pRdHiKwzvIOPaxZEyBikiNTcZDPrP7miOlAY81UFCE+Ev1+AMlNwjw8hoUJx?=
 =?us-ascii?Q?GAjuSeYT9DwOpEu6CAKsGaK19I/odShhUEZPxPwlZFHRTXw9rI02iTsOCqDd?=
 =?us-ascii?Q?PDp7uEh9XvzDvOcF8qk/M2rKxjPbn79uEj9fNsI9xvDiEZbt3r2Xzntua+xC?=
 =?us-ascii?Q?XxLmldoJCnq8/fFmtOp3UH6K3j+EgvUQaD6dYtH4+0bEfaK+cVGbDZQlgqWL?=
 =?us-ascii?Q?F38HNsVQCaQMHsMDTkLiTRMxQ9GcUP7iv70YWApEDvpmdxmruGG6Yy8psHO7?=
 =?us-ascii?Q?ML40wfuqc40jQOCD9nspwxRDDFwqY4DYLG0DvKC6guvNAQbo/Sxr0PcS9dv8?=
 =?us-ascii?Q?VMr5VtWLfVyP69jCyuUOqKRrqrpHNJx9LKqHeAXT68BBrLenp/XXYPcFbP+k?=
 =?us-ascii?Q?IYJ9sO/bBJY5DVHBZAXiKPHCdqSE1qusleQuoI9gr/PfAh5GiuimFg544cgp?=
 =?us-ascii?Q?3D6MW9V6XCtc/juW0fE4WDnFEYPyF3f1yxzBPX4nM2vrH/PwgqZS2/Qhg6xi?=
 =?us-ascii?Q?ypna0TkFs59NaxfY6yUmi+DWhX9XFilEx/paVBDYa6mEK+owwDa9Nx7TvOcz?=
 =?us-ascii?Q?Xp0N05ywO8Hl5wo9QYT5vS4DxPUyxwK6WNGNdOQMydSSuGsrNYYwWK+BGVKn?=
 =?us-ascii?Q?ufswXMVyWV18GecK3zOmV8QRPHF0xjhyZto+8fkVn9Kw8UBPEzlFSe+JXtRL?=
 =?us-ascii?Q?if0T4EeNH9WcOh32NHtdbUdCM9XDRQsZSpkk4FWLw+5vajMCqjSbIlHGk6ZS?=
 =?us-ascii?Q?2tGNpuHmiphDp2aQZUm/H3tqYhae6wxROOfpxolsDWsjgWs9htqugx1ky9eg?=
 =?us-ascii?Q?8nM/xo7r+XX8C+yXpkfbTfok/WxTcAIZDzcRboWY/xchss1u8GmM5AgO+WxR?=
 =?us-ascii?Q?HcNi0jqtpVpPMsJNysM4jPCN5n7EPeocZwRxt/+w0UsBsq/wl6kxL0vuwsf2?=
 =?us-ascii?Q?THPBhriGiZJ76sP+GhjGxPhhSdGsKTefTFvUw8T6OesuA6DLcuF7I+lHqpBb?=
 =?us-ascii?Q?BhqvWRidPCw0txceZWh7+5bcnoA1N9mHDwTcTBUROS3UBdM0HBCukFPUSDm0?=
 =?us-ascii?Q?qqwaB87ZUGb5WeyVkLchgEs5EoU7QTVEDsciZ4Q1D0GnNSzpfulShfBnM/6n?=
 =?us-ascii?Q?qcQKVAo7tRV4i1qAtr1BjqFFLMoSw/7uSSTZNifrK5ssdxGtwbfg6I1hT9tf?=
 =?us-ascii?Q?p1AiT8uT7jX0MQmSCd/3EHkIZ8t6mlb7+jCwFuMcvGvFTAHnv6VdWFGRrWMy?=
 =?us-ascii?Q?ahBRN98tB8ElcE2pf+FR/1h2pMmwFoSw2CupGZIjKjcFKAVcHS8t2Xytyx6a?=
 =?us-ascii?Q?7392coyfhpsagaqLspNAIemv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc59ba70-fa0c-4f68-1512-08d8e7ab90ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2857.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 12:12:12.7569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftOyut9PnIz2dNhCLy1umJAEuYYb5kFJFOVC76akVBNNevBNzf/8lKZEojUqxZSzdolARfreq+eIhApI7Fn73A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5376
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150087
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9923
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150086
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=darren.kenny@oracle.com; helo=userp2130.oracle.com
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
 f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Saturday, 2021-03-13 at 18:18:58 -05, Alexander Bulekov wrote:
> The generic-fuzzer often provides randomized DMA addresses to
> virtual-devices. For a 64-bit address-space, the chance of these
> randomized addresses coinciding with RAM regions, is fairly small. Even
> though the fuzzer's instrumentation eventually finds valid addresses,
> this can take some-time, and slows-down fuzzing progress (especially,
> when multiple DMA buffers are involved). To work around this, create
> "fake" sparse-memory that spans all of the 64-bit address-space. Adjust
> the DMA call-back to populate this sparse memory, correspondingly
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 387ae2020a..b5fe27aae1 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -28,6 +28,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/boards.h"
>  #include "generic_fuzz_configs.h"
> +#include "hw/mem/sparse-mem.h"
>  
>  /*
>   * SEPARATOR is used to separate "operations" in the fuzz input
> @@ -64,6 +65,8 @@ static useconds_t timeout = DEFAULT_TIMEOUT_US;
>  
>  static bool qtest_log_enabled;
>  
> +MemoryRegion *sparse_mem_mr;
> +
>  /*
>   * A pattern used to populate a DMA region or perform a memwrite. This is
>   * useful for e.g. populating tables of unique addresses.
> @@ -191,8 +194,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
>       */
>      if (dma_patterns->len == 0
>          || len == 0
> -        || mr != current_machine->ram
> -        || addr > current_machine->ram_size) {
> +        || (mr != current_machine->ram && mr != sparse_mem_mr)) {
>          return;
>      }
>  
> @@ -238,7 +240,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
>                                        MEMTXATTRS_UNSPECIFIED);
>  
>          if (!(memory_region_is_ram(mr1) ||
> -              memory_region_is_romd(mr1))) {
> +              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
>              l = memory_access_size(mr1, l, addr1);
>          } else {
>              /* ROM/RAM case */
> @@ -814,6 +816,12 @@ static void generic_pre_fuzz(QTestState *s)
>      }
>      qts_global = s;
>  
> +    /*
> +     * Create a special device that we can use to back DMA buffers at very
> +     * high memory addresses
> +     */
> +    sparse_mem_mr = sparse_mem_init(0, UINT64_MAX);
> +
>      dma_regions = g_array_new(false, false, sizeof(address_range));
>      dma_patterns = g_array_new(false, false, sizeof(pattern));
>  
> -- 
> 2.28.0

