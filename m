Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D9352EA51
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:51:38 +0200 (CEST)
Received: from localhost ([::1]:52558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0EL-0003ft-0v
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns095-00016V-LC
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns092-00020d-16
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9jQOw025974;
 Fri, 20 May 2022 10:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=EI4wLz+ONh7Lf6M+8DwGGbBhgnukVgYb0eAaeu6q3EI=;
 b=n4b6CUUxjFj2yY2ULYBm9vkH37mjP1exjdVN+vdOwx9ebH7m8PGc0OGLCQDOOmL/bs3J
 RYrQCwAAHNSaOeUQ9ToE0Xu4bXFiYFnkx2oS0z3Vj3H4xhVcd656sv7pNmCgjiLjL4jo
 8WQHTYnWph0ceiM1J9MvV37zoyGMyXfTGqAilAUndZ3ypEr1jZPYAGQ5kDz3wsUtRqcJ
 uS/8aX0w02TQ7SuNuOdC6z5/T7Clvx+YRHekItIV5NSY/ymQIzkJQdxOELj5CTRPBKus
 Qu2ju2TYStQxDD5ZQRo9p9D2fKb88LxnoLk6c8x9Xj4Mt21HwEDlcQ60fQiojiqFkc3k jg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g22uce95w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:45:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAjodM012000; Fri, 20 May 2022 10:45:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g37csbefn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:45:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjvhB+/zDNMFV5ksvLmtweWT4P89twB3Ej8cGqlLe+zlKXhdgQPVnBNqJRWjhLFBL4XciyBmvC9U1B+z3PHF/bPsJNWx9ki6kW9N0PPzXXggKrr9y/WoCLtF2vHl5AevsiBxYfmv3qKPaCW4lvQbV/0eKAUS638Mi3L/8t/8/XRBbcdfG+3v3bqrBhPH0aSjfDh3y+pdA/N4sntsWmmFHyKrQM1ZaDlucclHQdd4IZwdIqwiYjzKflU91vDVtuk0UpoFk7lYgwQiEMOvO6PlAFlsc83NEnzGz++8LE2ehlmszXL01NYObE8dKpvDbDU4HB1SNmEYj/i5+TiEGvxyyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI4wLz+ONh7Lf6M+8DwGGbBhgnukVgYb0eAaeu6q3EI=;
 b=WIbAUs+3sEwS+ViTTLO2Dm84GZJL4R5ipLGhhyVFOWfFiHqwgjcsBch1HvYIqE8qlBBuCZz+Vg0xDDsgGaCZji/QYjGE9K9MEaJifxJ4Lu3sRFmvfKzVvEkkfBXLke9sMO0LbQ51DueXVxrPBBQnHl2UIc7CuA3cljco8fZa6pBlozVDNJBNEXo7WSCkVG7LxeFNrGM7NdKJpavVkQRftSjerKNF1dLmAW+zjtPVTymzZef2PPA3bxx4dBdz1mCMspw3VfNLkBCHnosJ3pbf6SFh/HmgcEieYyTPLmsG+ts2gr3Wzp54IJj6ZiFz4RuFFl5llEFtQtpy5/GckdbbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI4wLz+ONh7Lf6M+8DwGGbBhgnukVgYb0eAaeu6q3EI=;
 b=UO6ZG2Sjs30x782sIf07ezj1xJsUcZ4TMuh2bU+nAbzPkLD9rAy5lAU2CpNA01TCWSp9hFY+SWo/r0VszK5ktEbUg7UJlfEKNoYfVJEcHuQ79JH2NrWo4/PiqbqmmExGOLDkmXuQkMggTgztNqnWSTchwkeRg2nN3ovZ/BnmeKE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW4PR10MB5838.namprd10.prod.outlook.com (2603:10b6:303:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Fri, 20 May
 2022 10:45:53 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:45:53 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 0/5] i386/pc: Fix creation of >= 1010G guests on AMD
 systems with IOMMU
Date: Fri, 20 May 2022 11:45:27 +0100
Message-Id: <20220520104532.9816-1-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6a3ae12-3973-4659-0a44-08da3a4de9ac
X-MS-TrafficTypeDiagnostic: MW4PR10MB5838:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB583857B8B3BC8FFB15A69D52BBD39@MW4PR10MB5838.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Voiwxs/nctE0vK/iNvLgnOFUnZStVtsH+lB3s4zQqGk9n1Qh5EBQ7I3aH/aenQ+qXdCTx6rJLiZMoJK7IzDw0UFjrSs5uYFtwZpmx2OfIkCFkF5gLmFGa8ffieB2CIfVmnqpYXQtjNh+rxk1kPg2ArufPZQlng1PNz4QZx+TUqfcZR+b5ZCDNFtPdLawBAjAQn/A9GEYA6AjmQiF64QFLLHZdae4Jki9dFX0RLjdYSapjbW8PwUlP9bQP9kZSS2Az3J9w66Yp6BMx461JiPquk9FG5KoA8zZmTifKuinzmKHiijyaUXrBd3Xzox8YwY21LAPktc8ycxXul0Q2T3t57Zww2xnhOiJPzCN2SnrNh8BjZN3ib3ef4HGh0nuQwUSbbxeYpIi7A0qY3wDcP/Oq2PYUHk7xn5rxrUwD19YdY+R2tzaR8XUHLhjADjxSARISoALrnzRn0Pao4nlrcxu/GzY0In9VHwkhq30kIqQ7D4yjrFaR1ndYOgEQb7itLGPwiZY7WLse5DuBQqf0rTgZ3be1nTYJIam5hF/j8OjVfRfL4zhERl7xS2hrApedPJR6r/7ThbzHDvZg5R0wJ/pgjoyVNAXn3dzkUmNUcPVQ/bn50Et5YOxjpwg5Hdt8SxjrJaImAQvbXh7EjxdDWuOcS9As5mcXTzH5pBhrYjHmqiUmx/KQJlggXrqz0Vjtq9k+QPGXR7N2W9iDZPFjfFLFLe7Z8scEvoWzBfXDoA6VTfSfTyLteGgfknDSuSSF5mZ9aIgqd56pNMTFgcbPvYBzXiC77NRitXa3xPUoXQR4H9GdSimY4N7VpXkSHTXbVOmlnLZ4JYK6DJLelFw+JElRnOigFExi/X1XQaUjG9LbZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(83380400001)(26005)(38350700002)(6506007)(508600001)(966005)(186003)(1076003)(2616005)(316002)(6916009)(6512007)(54906003)(107886003)(6486002)(86362001)(103116003)(38100700002)(2906002)(4326008)(36756003)(8936002)(66946007)(66476007)(66556008)(6666004)(7416002)(5660300002)(8676002)(43620500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tbbMncng2ymKL/OQoxH4AOYMy5Ui+vxyJrVjT70kNmHQGbNzFwMVOhcok+es?=
 =?us-ascii?Q?Utd3aRdFF2hE1DD1JTwo8nVvtl004PkY9AtVZqUR7fqdIel3POuQ8Afm4nzz?=
 =?us-ascii?Q?BkynJFacx2+nNkUnOGSh2n28ciNZCYEjQhX8Cr4eOwNktPFsHD7rKU2mMyvh?=
 =?us-ascii?Q?YHMdHskHzEE9ZB0hIzRQeYWGwy62evYxTIZfBdYWd23/VN0o+gmW39bdWnVk?=
 =?us-ascii?Q?zSaXXTU5gkTki9inqFbWsLSWxg9Dy83jzUPoVe3R0li5yquH/dMdYvy88CnM?=
 =?us-ascii?Q?mGmC+XGPf4eRYN3rp5p2QJpt7Ge1FeDM9mECuYRdbjhEgF/JCU79WILFi5t6?=
 =?us-ascii?Q?gxPlCT5noB0rUaGP9VABtP28/YBTwSqy0bCKqx3T50WdF4VHYc1uUJZefPma?=
 =?us-ascii?Q?SfablHZnwEZqTmr/bWMjL8IxpyojewD0mtKDpGSuFHpeHcyoQZuuMvUdUWAu?=
 =?us-ascii?Q?yUc1Prf3RnYJ+SQFYVmMX5T1JamOBmSsHOyJQ73r4C++vGlcRZfJn8GRX5AN?=
 =?us-ascii?Q?DnOMLHAc0aXfeofUc+FvVhx1z4nCp06KQHwAaxyMDd27p/AZ91oiSS0xd5sw?=
 =?us-ascii?Q?+ngoUGCeqNJUHk1o+BG73clypVg11ZAYYNogAcVUUbDQeRVReW0JbyuK5iFF?=
 =?us-ascii?Q?1peZpisSY8HFIJ/757SYP5oBr+bFFDGI6LyNwQAz1F4ylhmx6DD/Nh9Pobam?=
 =?us-ascii?Q?jtaIUE5GDjW1afhS9GiZgM3Mz2Q2Wx38+SNuwAWkKR83mvCGOmAd2kv6US4b?=
 =?us-ascii?Q?v8DCT/GhGiQconIVBAN1DkuaHu7OtqkKx+0oTC9mgcSD9dN5ldtCUVQBW+kx?=
 =?us-ascii?Q?OAXb+4wxs/09MJ1hwRzL8rfJzMnL3M+Xn5AKnHGWwAfKIEjl82Pk/vo3kyYY?=
 =?us-ascii?Q?+0CPNSRXK5BVtwGaKi2KaydxWfMascYQoeB0BH0kqCTmDHSk5eLB24pJkfl4?=
 =?us-ascii?Q?j5l4L0sUNkVbAi5QYXVeITtCvGohd0KogF5b2aD5ApenS0rcA1Y/vZvxuVyV?=
 =?us-ascii?Q?seUY9LgfiLTLSdR7nHvGL44SKj2Iw0Zne2CYqEk5kIxPLARkaLwzDMvZS8WQ?=
 =?us-ascii?Q?AKZsP+mqhAJYj96MLpgpqTgec1pj1/EMYIJBkZXe3LkaHraNuii6hLHo46ay?=
 =?us-ascii?Q?+xBNLm4lzb+H4dtecSE299rvAO90z5vU0DUDNPMhrTTClgYoZFlEaaHN2ntW?=
 =?us-ascii?Q?yl4INO0SjCvCwaC/CTIor7okntVFKjFqwdpIx1eSw832S0rovybjP5xLHA/o?=
 =?us-ascii?Q?s89kWqITbJck6A1AQN/NQP3AcHKXYpRgbJndw2OdFycZ0ZLI643jRCZ4sEqn?=
 =?us-ascii?Q?BsFXsnh5uG9gSRaOvmpLiPa2hDG/JGaODYOHlpZS0j2Kasj61Xrj2DUP0j+w?=
 =?us-ascii?Q?mFzC/53YVKPLF1e5JyAjYU9wQ3Fjbeihqv8lV8y22BL7cWDXdlVWljxj9D1s?=
 =?us-ascii?Q?45eb27nAcfFnv8Ydl3zyo/KTDBZ//8JMS0LTfLFWdyWCs7O50pehWE++YCES?=
 =?us-ascii?Q?8ehNo1eH97EJLHSZv5N8l/XXH6fEXbGZyQVgR0waF7AbvbJXT02hVB7pYEk1?=
 =?us-ascii?Q?ix9HkS+5MVcGjnW589/uFeuB8FYUD5kLtm9iqQ3QKG+inTsyGZh/+uotON6g?=
 =?us-ascii?Q?a52ThPl/Qtua5cWBW6jso9awP+JqLnwymI455XkANRcrxTbeXNPavC9/ucdU?=
 =?us-ascii?Q?BHUHBEwNO9HwURta2i3+qKv18lfo4kVYAhbTtfzcCITuTKI3bdLqZlyoZsJO?=
 =?us-ascii?Q?CAPdTgpK0zz+zkunogfSbZMXjYa/gwQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a3ae12-3973-4659-0a44-08da3a4de9ac
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:45:53.6741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6Hli8hB46s++WVzr4B2HrZB3Lm9IERZ5u+Bt/TJ+u/JTiPor+07JCzvYztWFugCNJFYzodffLbzS/d2GHaKbHT6FgCJDE+P6hY/yREsUow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5838
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200079
X-Proofpoint-GUID: c3xoFQZZ4LFbhxFak-qE_ElnQz3qcVdZ
X-Proofpoint-ORIG-GUID: c3xoFQZZ4LFbhxFak-qE_ElnQz3qcVdZ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

v4[5] -> v5:
* Fixed the 32-bit build(s) (patch 1, Michael Tsirkin)
* Fix wrong reference (patch 4) to TCG_PHYS_BITS in code comment and
commit message;

---

This series lets Qemu spawn i386 guests with >= 1010G with VFIO,
particularly when running on AMD systems with an IOMMU.

Since Linux v5.4, VFIO validates whether the IOVA in DMA_MAP ioctl is valid and it
will return -EINVAL on those cases. On x86, Intel hosts aren't particularly
affected by this extra validation. But AMD systems with IOMMU have a hole in
the 1TB boundary which is *reserved* for HyperTransport I/O addresses located
here: FD_0000_0000h - FF_FFFF_FFFFh. See IOMMU manual [1], specifically
section '2.1.2 IOMMU Logical Topology', Table 3 on what those addresses mean.

VFIO DMA_MAP calls in this IOVA address range fall through this check and hence return
 -EINVAL, consequently failing the creation the guests bigger than 1010G. Example
of the failure:

qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: VFIO_MAP_DMA: -22
qemu-system-x86_64: -device vfio-pci,host=0000:41:10.1,bootindex=-1: vfio 0000:41:10.1: 
	failed to setup container for group 258: memory listener initialization failed:
		Region pc.ram: vfio_dma_map(0x55ba53e7a9d0, 0x100000000, 0xff30000000, 0x7ed243e00000) = -22 (Invalid argument)

Prior to v5.4, we could map to these IOVAs *but* that's still not the right thing
to do and could trigger certain IOMMU events (e.g. INVALID_DEVICE_REQUEST), or
spurious guest VF failures from the resultant IOMMU target abort (see Errata 1155[2])
as documented on the links down below.

This small series tries to address that by dealing with this AMD-specific 1Tb hole,
but rather than dealing like the 4G hole, it instead relocates RAM above 4G
to be above the 1T if the maximum RAM range crosses the HT reserved range.
It is organized as following:

patch 1: Introduce a @above_4g_mem_start which defaults to 4 GiB as starting
         address of the 4G boundary

patches 2-3: Move pci-host qdev creation to be before pc_memory_init(),
	     to get accessing to pci_hole64_size. The actual pci-host
	     initialization is kept as is, only the qdev_new.

patch 4: Change @above_4g_mem_start to 1TiB /if we are on AMD and the max
possible address acrosses the HT region. Errors out if the phys-bits is too
low, which is only the case for >=1010G configurations or something that
crosses the HT region.

patch 5: Ensure valid IOVAs only on new machine types, but not older
ones (<= v7.0.0)

The 'consequence' of this approach is that we may need more than the default
phys-bits e.g. a guest with >1010G, will have most of its RAM after the 1TB
address, consequently needing 41 phys-bits as opposed to the default of 40
(TCG_PHYS_ADDR_BITS). Today there's already a precedent to depend on the user to
pick the right value of phys-bits (regardless of this series), so we warn in
case phys-bits aren't enough. Finally, CMOS loosing its meaning of the above 4G
ram blocks, but it was mentioned over RFC that CMOS is only useful for very
old seabios. 

Additionally, the reserved region is added to E820 if the relocation is done.

Alternative options considered (in RFC[0]):

a) Dealing with the 1T hole like the 4G hole -- which also represents what
hardware closely does.

Thanks,
	Joao

Older Changelog,

v3[4] -> v4[5]:
(changes in patch 4 and 5 only)
* Rebased to 7.1.0, hence move compat machine attribute to <= 7.0.0 versions
* Check guest vCPU vendor rather than host CPU vendor (Michael Tsirkin)
* Squash previous patch 5 into patch 4 to tie in the phys-bits check
  into the relocate-4g-start logic: We now error out if the phys-bits
  aren't enough on configurations that require above-4g ram relocation. (Michael Tsirkin)
* Make the error message more explicit when phys-bits isn't enough to also
  mention: "cannot avoid AMD HT range"
* Add comments inside x86_update_above_4g_mem_start() explaining the
  logic behind it. (Michael Tsirkin)
* Tested on old guests old guests with Linux 2.6.32/3.10/4.14.35/4.1 based kernels
  alongside Win2008/2K12/2K16/2K19 on configs spanning 1T and 2T (Michael Tsirkin)
  Validated -numa topologies too as well as making sure qtests observe no regressions;

 Notes from v4:

* the machine attribute that enables this new logic (see last patch)
is called ::enforce_valid_iova since the RFC. Let me know if folks think it
is poorly named, and whether something a bit more obvious is preferred
(e.g. ::amd_relocate_1t).

* @mst one of the comments you said was to add "host checks" in vdpa/vfio devices.
In discussion with Alex and you over the last version of the patches it seems
that we weren't keen on making this device-specific or behind any machine
property flags (besides machine-compat). Just to reiterate there, making sure we do
the above-4g relocation requiring properly sized phys-bits and AMD as vCPU
vendor (as this series) already ensures thtat this is going to be right for
offending configuration with VDPA/VFIO device that might be
configured/hotplugged. Unless you were thinking that somehow vfio/vdpa devices
start poking into machine-specific details when we fail to relocate due to the
lack of phys-bits? Otherwise Qemu, just doesn't have enough information to tell
what's a valid IOVA or not, in which case kernel vhost-iotlb/vhost-vdpa is the one
that needs fixing (as VFIO did in v5.4).

RFCv2[3] -> v3[4]:

* Add missing brackets in single line statement, in patch 5 (David)
* Change ranges printf to use PRIx64, in patch 5 (David)
* Move the check to after changing above_4g_mem_start, in patch 5 (David)
* Make the check generic and move it to pc_memory_init rather being specific
to AMD, as the check is useful to capture invalid phys-bits
configs (patch 5, Igor).
* Fix comment as 'Start address of the initial RAM above 4G' in patch 1 (Igor)
* Consider pci_hole64_size in patch 4 (Igor)
* To consider pci_hole64_size in max used addr we need to get it from pci-host,
so introduce two new patches (2 and 3) which move only the qdev_new("i440fx") or
qdev_new("q35") to be before pc_memory_init().
* Consider sgx_epc.size in max used address, in patch 4 (Igor)
* Rename relocate_4g() to x86_update_above_4g_mem_start() (Igor)
* Keep warn_report() in patch 5, as erroring out will break a few x86_64 qtests
due to pci_hole64 accounting surprass phys-bits possible maxphysaddr.

RFC[0] -> RFCv2[3]:

* At Igor's suggestion in one of the patches I reworked the series enterily,
and more or less as he was thinking it is far simpler to relocate the
ram-above-4g to be at 1TiB where applicable. The changeset is 3x simpler,
and less intrusive. (patch 1 & 2)
* Check phys-bits is big enough prior to relocating (new patch 3)
* Remove the machine property, and it's only internal and set by new machine
version (Igor, patch 4).
* Clarify whether it's GPA or HPA as a more clear meaning (Igor, patch 2)
* Add IOMMU SDM in the commit message (Igor, patch 2)

[0] https://lore.kernel.org/qemu-devel/20210622154905.30858-1-joao.m.martins@oracle.com/
[1] https://www.amd.com/system/files/TechDocs/48882_IOMMU.pdf
[2] https://developer.amd.com/wp-content/resources/56323-PUB_0.78.pdf
[3] https://lore.kernel.org/qemu-devel/20220207202422.31582-1-joao.m.martins@oracle.com/T/#u
[4] https://lore.kernel.org/all/20220223184455.9057-1-joao.m.martins@oracle.com/
[5] https://lore.kernel.org/qemu-devel/20220420201138.23854-1-joao.m.martins@oracle.com/

Joao Martins (5):
  hw/i386: add 4g boundary start to X86MachineState
  i386/pc: create pci-host qdev prior to pc_memory_init()
  i386/pc: pass pci_hole64_size to pc_memory_init()
  i386/pc: relocate 4g start to 1T where applicable
  i386/pc: restrict AMD only enforcing of valid IOVAs to new machine
    type

 hw/i386/acpi-build.c         |   2 +-
 hw/i386/pc.c                 | 126 +++++++++++++++++++++++++++++++++--
 hw/i386/pc_piix.c            |  12 +++-
 hw/i386/pc_q35.c             |  14 +++-
 hw/i386/sgx.c                |   2 +-
 hw/i386/x86.c                |   1 +
 hw/pci-host/i440fx.c         |  10 ++-
 include/hw/i386/pc.h         |   4 +-
 include/hw/i386/x86.h        |   3 +
 include/hw/pci-host/i440fx.h |   3 +-
 10 files changed, 161 insertions(+), 16 deletions(-)

-- 
2.17.2


