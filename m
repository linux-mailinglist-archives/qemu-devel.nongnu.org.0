Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F76329795
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:06:23 +0100 (CET)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0z0-0008AP-2S
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lH0wH-0006ep-DJ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:03:36 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:45490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lH0wE-0007FV-QI
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:03:32 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1228x221162672;
 Tue, 2 Mar 2021 09:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=mp+E44qAGRXjt0y5OzUHNFl2wFJVo3zoS2peoW8YsFM=;
 b=RRft2l1/ki034rr1Xn78OR+WASBMsppjgnu+i9/427wxavCu+3Hpnh1IxxBnXH1fyyMJ
 7114XuGvrD+ZHL/hU+QK4C6pIXfatIyNj2X8FqarxTgIOVLY3vgYQRQoCq+RHz/LJ5UL
 QqPg/zBWHrOPy3hDoZFK8WcPYdk4d5/aMSYvlJ+ZoxOel5SMhVAEhEDuI+qG+F/kU9JF
 Z6fTYhZ9yS7Fn9TzklBz9lCDk0o8UAEQLK1xjkEkOMvsN4Q8Blpxf1qvTG75j97uzb19
 9lPktOOIKdwfLrzJVSz3bAZkyQpP5diB45doeMTwzbB+V2NhXJ6NnzQ02GWyiZYfudjO PQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 36ybkb6u8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 09:03:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12290wRU007522;
 Tue, 2 Mar 2021 09:03:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3030.oracle.com with ESMTP id 37000wpt3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Mar 2021 09:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkZBBld4Y1MuIXBkWVA6LaSRzJYKbKqxSPDJsHlBaZ3V/UAGi5M2Xq6Hbt8jU5+r6kyAxO65ZfJxF1ePrKnKBEYSwN2Kg6hQhnGIrN1VRRtLWonVJ9P8NKwoLJFB+DOLezkgWIwa3R8WK/KOnciM9GotFZSxd3B6f3KEgCQ/VX5zT6WMjAfVpspD1KsMIW2i0AF7HtVcZdYZET1HuFLvBg0EJblEke7hKVTvCaOhGf8pYIG6Kt0AQ9hm6KbuR/YHDE/zwtJ9ivAiCJv5WefHvuUQDfpF8FLVxcvGEpOtVECYUoIpaoHYqZtqzM0aLNN4fRIvIsNE/KKSBLb5uFUZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp+E44qAGRXjt0y5OzUHNFl2wFJVo3zoS2peoW8YsFM=;
 b=aPGKzxKzKBeYDnlez70LVtas+HDaERATRJyI9bOWwsdUvYAMAh3yAj5qoY5AO9okh/5Jze+LEB95lknMgr1lNsGz7sc8qnhMTsxshJOoU9f942/sJAWrlzLXiuQV+szEerLM7PxvlP/6IA3xo/VjndOeU7ysajAtyjaWnGkkTTfj14NAaKrPGYYQosEuc6md22BG8ScAbtxtp1vi+FUJGw3rAJGSqx6XvbdnsmV8qKDLZHp3ZsN1i/6C/ZxihPN5xR4W6TN1uP3Yqn9Im+wDbsooSIun61A5SlGIKEw+mWasdit1w/Xs0z4+cPHc6No2so4SgIeZ505nqc+qC8aT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp+E44qAGRXjt0y5OzUHNFl2wFJVo3zoS2peoW8YsFM=;
 b=pU0Nr7NURtwW6OPw+SclOuZuRbeitf+F8GiNFRdIPEtrLe2A+qR4r6nbWfUPv85+u9q3vpuTkfIGAMiX+tEge96T9LM7XJix0OQENyH7HghYvTrt0z2oO8M9AaV1n7ClLk6+vj5jerGyrOHe6S9IwDG9X3mTf4v3svJHYDikHVw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB4396.namprd10.prod.outlook.com (2603:10b6:5:21e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 09:03:22 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 09:03:22 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] improve loading of 32 bit PVH kernels
Date: Tue,  2 Mar 2021 09:03:13 +0000
Message-Id: <20210302090315.3031492-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::27) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Tue, 2 Mar 2021 09:03:20 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id b924fe4a;
 Tue, 2 Mar 2021 09:03:16 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072b66df-a2ae-4673-d854-08d8dd5a07af
X-MS-TrafficTypeDiagnostic: DM6PR10MB4396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB4396D8AC1C44D66D44698FE888999@DM6PR10MB4396.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2JAHNbqnJ/Vn/aDCeGbut7RvXspw5H5yn0HHpV2xdwB1B50E+5edTtKl5FoBDs81cryrDKsivHETAU6BGsHDk+E/+N7VNivh5OpqJRFUTNEIBQ6I0NZBMhvKSyX09OOjaItl3S4wDVA3vTpuFjvt5a6eQIMO2kQ8zsrSuas2ST6Ua5KojUfzi+RqQ2a9kuBPi64rYSSy8EUCx/CzJHX0kjxyk5sJ0So3DTqiB/UFZoJS/7dTQ8P7gSWXwDJfHbzslbuLoV/Azyddp5np9xWZ5nx973ywBKmpi7wkJymAU31kocwG93kKaZaLtjmd1BQ7qMDP6Hx1IREgQ35igb6UZ1DAht49sO/GRkb0w2nL1ztO6S+7zfYi9s5ejKaFAf7CkiEAxcHq1dzb1nlRnmpfmMbdbpTG/ivDuTWmkrcU9SgnEMutoFK8Vy2VaBJdKKa21veSfy4YygkIalWEuhowxq0jGbkRj9RUAJbXKavgKREUgk3IeENykvDWzmZAvK4l+Wds9Fp9xZLXAge/YGivg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(39860400002)(396003)(6916009)(44832011)(66556008)(2906002)(4326008)(5660300002)(66476007)(52116002)(66946007)(83380400001)(6666004)(2616005)(36756003)(107886003)(8936002)(4744005)(8676002)(478600001)(186003)(1076003)(54906003)(86362001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+JZzLSi6niigZ+chb0Hn28HCWJtGSCD/G+krJaglYuu165OCY2McLQRDTTin?=
 =?us-ascii?Q?KUKWDzJ4oTnpppnxN/vgfpnNF0HkZdr83thE+Y97sNHqfmI27y/IqnzCA9Yd?=
 =?us-ascii?Q?s4DnF71gvDPwslPIci0c3EDcvOyIJjUoghKFOHa3RUKX6pYcfBw18KyZAZvB?=
 =?us-ascii?Q?canLWzeTPavZdVSZ/bklPqaN6cowmYFGYkMKlSH0k8JSu/H8awrwu0ArbSO4?=
 =?us-ascii?Q?g1t6rJp98rvfjOULBgyxoJnuGApg0QKcSOElXwkv16PMXWJ5Rp/eHDelVtDe?=
 =?us-ascii?Q?9HSiDFlh14ldkCOmUyECWCQ832bjawHE6PR7r0sGNfP5CZmI93dWlhxJ+hxL?=
 =?us-ascii?Q?u3f7q/PONPQQ5j32ZlBFuWN30CU8g4Ge8sLnYmaf1Rh9AYVXNJkMJv+nFz/X?=
 =?us-ascii?Q?64LJajxvXL/MJ2sz3BnBKy9W1d4yez+Y46xPX/f7WPCCO1MGBkHPzXx+p3S8?=
 =?us-ascii?Q?3SiKHu2/7abqFRf9wMXU4fWifanmzcWnxnnQtliD0cZkhyPWeNNaJpO/gFTJ?=
 =?us-ascii?Q?shHz3WfIOQtjQeO0cfRu0PTr656DsELbAQMT/CGI7e0VKtr7Tsz5Er1KnhMj?=
 =?us-ascii?Q?cuvk7hl7wOiSuFS7d2U2ccUkxBDK46HvZKAgkwTS4ecnNd/yuWHa7fn1IFQm?=
 =?us-ascii?Q?WEsM180sz1o0FSABHnylMMr+S3AjHrGrXG3tU1T9RWsrf/veNqrxxW/QJMG5?=
 =?us-ascii?Q?55/o8Q5CnhZ6aViMle1drwWsEKOGNg9QXNiIp4D7yUjOdPjVarytM9MgZFyQ?=
 =?us-ascii?Q?JXxwGNN+IJ+ujeV9H57LrOtJzcNXYrjJA9CD+hB6nc4xr5UlOCW2BNiIngQ9?=
 =?us-ascii?Q?te7EI/hRa46UUxbzKJQud0unBAReHeXLDivqj59uk1M6yUwCF/Yk7b7CMTow?=
 =?us-ascii?Q?iR4ol02hpZYUIcG/7B3hRDuSaa1Wj89lrXnlT/BPSJIE+1D8VQOWyEcU3QSW?=
 =?us-ascii?Q?IEBL23xbn0NVECISLya3X1mTHX9ZZrTA2I4cnNvIz3HW9nS5pr/0QlrlXBfj?=
 =?us-ascii?Q?sDyK0BUnjkQWBFozLcXd+yLEU1e57fIRY1u3rWGAT+WZGgwfZ5gzfUWTnXDS?=
 =?us-ascii?Q?CFdziRgFfSY+pL22IPZ/oB58FGuBCUzziLST8XRWbO5p7MCzHiCeGTnqtt1P?=
 =?us-ascii?Q?wvL9tTWeeKUX9LrTXxtbbYNpgjHWtaf9gAk5+Y6iscboO3QszPYHYmAU1mdD?=
 =?us-ascii?Q?I5fSswRJFP8uXR1gcyXffiWXRWPrvICgtxSnmK3sbSrjuie1GwVyXv17LjgD?=
 =?us-ascii?Q?i1K2zS9Qe3gr3GrQzTLQ5XKmb5oFlzi2tQeeVHsy/lC0V9gPmm+eRtqHnKDZ?=
 =?us-ascii?Q?omw1pIjnxkl0FdCpEbk9kld7DLwKQRMa4Bkqp8pEE0Hn0g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072b66df-a2ae-4673-d854-08d8dd5a07af
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 09:03:22.1193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6rY1dw8mLhGni+Bae88ymtom/sEQYeM7hwK4YE0jntAnCk9SV05yAnzRdzurvW5lcn78qEmhCP/IL7hjsdjcmgcFpdPfQSjleG+wbLaX7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4396
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020075
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020075
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While testing a non-Linux 32 bit PVH "kernel" (it's really just a
bunch of test code), I ran into some problems with the current PVH
loader in QEMU, which seems to work somewhat by accident for 32 bit
kernels today, having been fortunate in the layout of the object files
it typically encounters.

Non-PAE 32 bit Linux kernels still don't appear to work even with this
change, but I think that problem is somewhere else (the kernel is
loaded and starts, but the VM resets when it attempts to enable PG/PE)
and I haven't tracked it down yet.

David Edmondson (2):
  elf_ops: correct loading of 32 bit PVH kernel
  x86/pvh: extract only 4 bytes of start address for 32 bit kernels

 hw/i386/x86.c        | 6 ++++--
 include/hw/elf_ops.h | 4 +---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.30.0


