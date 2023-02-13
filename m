Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D60694869
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:45:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa5G-0008Bb-9J; Mon, 13 Feb 2023 09:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa54-00085m-15
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:45:23 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa4y-0006JY-7Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:45:19 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAUHbI017729; Mon, 13 Feb 2023 14:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=EUyyKDHQBtzsWto2C7/WHI5KXu+DMF0gqTYH/8HQ7x8=;
 b=i3lDQ6CX+dtYJVpwdShUvcF8nQcSjOmmq6kyKkVrtak8aZOhH13460g32F/z3B1KNPRr
 8foVcIv8FN0j6+28SmIYIT1iT/tS08afFO8+TLsxgWg/KgONAq7bJZnF10GFIEXbPU/E
 ctjZLzWqh2zR72qXc6wfI4xQeSXw7qHJhFHvVJ1G1oSpeKVrS50Ukaet0DQ9lKWI27xn
 AT4aKgMLuebFqXvKrteWv8IDwnec3NCBSgk368ThDKOL2cl/9ewYZ1lyamXk7C6Ji990
 b9Ec2qlVEFpMJB71nO0tT6xnNhFoViuiGSVPoyu5Wcu4Cv4Gupi/WjQ892Ex9XXlehcO XA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3jttvxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:45:14 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DENgRQ028862; Mon, 13 Feb 2023 14:45:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f3wuyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYjg+UjCddy6LvoyqWNA3yrOVebyCJkHhawASf0HBPjqKAV3vbWBSUPx0wuXw+4XXgpcdwF9sVLPhNNiVLv1lKyOvW9R+M7tQ1JNIK4QCkhMk2azgA0SGLu8sLtMJyDEevcurWTOed+wG/Mm2YNqPuhc0zLrOFkJzfmdNCdktvZ/pe9rWYbrH4uTnONZh/DeBHLDdjTM69j5Zz0iwE4vU26NtvqGWj1N/rUNSyYChPsfATHLFyA1oIPnDw1i/j4UwepRb08oyP/9YVyUbb0lOlthJmrxTWSfSK1Jin/PynqZSUupmfxxXOyPSfupMrjQGQIWfa8rwqFYifMZwnKvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUyyKDHQBtzsWto2C7/WHI5KXu+DMF0gqTYH/8HQ7x8=;
 b=GmutNad/IlTA3f9WIhFklH1BnjCc+oG9AAHcU+21jrbvY3HFsGmPko0bTC7w8GB/J+jq3m/Ge+VcdHfEvbdKWvv/cAABPpU2bF/9yTs1iZQMUdjo5y+TCa/iytSzgFPOnEK/11v2B3SJlZJ/eQqVSWpHj1K8m5yECubyb2qSOZ2jr76NrK5dsZYkksUWMjsqKqV8Gw7/7ONc6Kqogn/O20ULoapaXwNO5Tb1i3OkA5qN3AFyjcgFOHb9tCV0S7d/hkrzTnA46ovNNPRWVFLXZoK68cQF8zylAKTn4JUBNcRMTnlTQKaD+Jznvxyisl5d/sv2mjp2EG7konuuEauy4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUyyKDHQBtzsWto2C7/WHI5KXu+DMF0gqTYH/8HQ7x8=;
 b=COuBUEtgQmBUDuY1PBLKVn39pf4Ps+Lq30qtkKHBY6I+w3T2OrP/nutCKXmcMLL+6p1iwk6yDBTaIzJFXlScj0heUpZabTeEKhtKWQ30bFO7CuZrI+5fXF/sN7ZGGGoTjLJDm1+Fn4j/xob0ciADxl4FqhBFQ+NahiLs6lY6YQg=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by CH0PR10MB4988.namprd10.prod.outlook.com (2603:10b6:610:c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:45:11 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:45:11 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 07/10] fuzz/virtio-blk: remove fork-based fuzzer
In-Reply-To: <20230205042951.3570008-8-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-8-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:45:07 +0000
Message-ID: <m2cz6dr5e4.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR07CA0110.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::24) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|CH0PR10MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: 14571be1-8590-4085-da7c-08db0dd0e8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgOpkRuttaiAn8SA20+ABnFnWn6YI8ICJwAjhnfJe73xPH0mHrdorTXdCyjN9mNWutQYFc8LkbUgIbb/q+pObKarc/PTXn8h9AaK6pyzqr+Obqlrd1+1rHL8NpY8CWeW1tMp6+RTPfNW6coH+8PFo8Nlw2Tvnz6skrM0Zbg8TxWdAr2suRSSqDDKmoVjHSfx7KVWKn4XhgUgtq0HIkXPdf8qYsXf9uLBCQHJHBP2W18RIp6I2D4ntN1jvwiwEN7P9TYvWtYCqsWF39OBFyBkhO9tWi9grH+BFieb2EN27ti/ucCk7ZCVmBmftrMkcMt52utTeNNizRUqvCLC+t7NulncuV46w7K53X3q3MO8AkSTj6R+gyrwLuU/rcga5lv9FaeLHErMAPljbneD6Frp0w6et8Nonsh8zBafRcCEDT08s58y0dbZR5VFZePcIWQZbVcCJkz5KjtQI3EIeTiKlVIlJkxX7dLV1fl1ai9NCcUj1gm6VC5vHXy2FjbIMffuCckEothVH+hQH7CmV5K0ZGwWHxihBAE612vWuSpBeMiHrHtCUwW7HuHaYzvQNEFEToDFgzASaSBtteatqxXQYmDH/OKYqcRT2hx5i3aTcQmbsVewuQkVRFsfViC2X24ux/A0iV9VjdSEzoQ55WM6iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199018)(36756003)(2616005)(83380400001)(38100700002)(44832011)(8936002)(41300700001)(5660300002)(6666004)(2906002)(26005)(6506007)(6512007)(186003)(4326008)(6486002)(86362001)(54906003)(316002)(66946007)(66476007)(66556008)(8676002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qmn488/aNs63aECOKDfkP2cSTIv8Z7sTJHgt1hxK7lrrEquTt/Dixy9nFQCH?=
 =?us-ascii?Q?zm5wO4zKgLdAPkTp+s23Z/vy5GnHPWgT7mvBakMWVWYON9wfF2Igg1QuJdTr?=
 =?us-ascii?Q?AX976G48io60M7yN3NJttlq1yCS29C97vw0GM0RWnyojLuSoSJsEscR1z9yh?=
 =?us-ascii?Q?Py33HJf43EwenjZNll6g8vHs4807E8dXY0GPkz7mRhwvvnURyoOGqZFwj/aM?=
 =?us-ascii?Q?HWqpDAO0DN/Kj29jr9c5DPx6BS6vkhc3ETaATZn2CJ38+dvWxWR78GaZ0WQz?=
 =?us-ascii?Q?lCygZ/D+I9U0sNiyRNkfile/M47k0W69rJ/tTDmNBZwbE+axfR7D9twBf1gh?=
 =?us-ascii?Q?+uUlZ7v9ssckgMvB0hEP3xZyTLQEPZBMJ6o9uU8w36TXnEMS17Rso1QNJmj0?=
 =?us-ascii?Q?Pb599ZIDqM0gntrI9bSNybuLGBFCPkLzLynyHxTepdllgSRCMKIW8bmoZgAO?=
 =?us-ascii?Q?jaAbyw2qotDyVAnG1ZyRkV81UhXXBGV/4/143YyqX/fa/8K5I+xxtmoCjpWT?=
 =?us-ascii?Q?yW0x7Vq6V2C1ar74ObK8xiDBGDAKrj9iavUhfndmfeSbGQWkvzoEhY67Qmsk?=
 =?us-ascii?Q?QumZ1nU1drFv5Tk4Kd2BPpG8g1NR6jKcx2wmobHbyCVUIG8PukDW3pjq1/Kk?=
 =?us-ascii?Q?ao2TIma1pl9UKzu9+nBhbpN/ZJANqZuxHqXQ7xlZIOImE9jvVkgngEX/Knj1?=
 =?us-ascii?Q?rFClel/PtVMB2QYL+QQCvbv5oyvGwbodgM0yNzH3l6fKs4FmTm/5iDrZUE1g?=
 =?us-ascii?Q?BMV+UNAjzipFUWouBbvcOWBAR1cWZllT6YuJ+tpWn0B9M/jaJkf/nQuTeNCp?=
 =?us-ascii?Q?NlKbNRpTre3VxfpZM+cMHEkeKR+Dvy8SG7a4esC98+Ta/zxOh66+R7DmVnZl?=
 =?us-ascii?Q?+KJKXwjNOz5z6x5cqGfDLc5Ci/NunUEfvvVy5zKtCVJK0HFBtIqpABR5WtqR?=
 =?us-ascii?Q?tCn0S4BJ8S7SbkMGypW/5H9nLeTGVRXl68H74w0jioEyNG+bhPscW0YGP4Wu?=
 =?us-ascii?Q?XZYeYwnf7Rlaedg2HWqk0WxX9xN46kcLDIL6IC4QZVlY0M0QO1Cr+jMDoyZv?=
 =?us-ascii?Q?55yzvhgJ9WK5knlobRKJq/3VAj3HHoD0aqsED1aVBKJjwt1mcfpy2kDxaMJ2?=
 =?us-ascii?Q?hKREI3//lZxxsXteTGaWG1STEAsFGsFKK9rzp2yXU/Yc/nButf8r0eouj4an?=
 =?us-ascii?Q?j+IToG5aA584e6nOP+WzvOms/R4PYvQb5wCp3/3jDyLOGH9YOgRVckFy+uuL?=
 =?us-ascii?Q?2jnxjD+bHdK4kMOXTj47JR8URZnu2CbEcYNhhwFpXv4sFF8m0APD+4L0Fbnl?=
 =?us-ascii?Q?mzP6NcBwBfoUe1po9nJeEn1YoCIcxBJMFpO9Rj1HzSTlRD6aGn07FIcFD/8w?=
 =?us-ascii?Q?uLbTkhv1b0+3r74ujQhyIP9gy/UOy5bV8PletuOb3Nhxdu9e8xlO2wME8RCK?=
 =?us-ascii?Q?J56fUG3VwV3DiFPNq6zHJLUOk/7nbphSKXUjltqblxZLgAtl0Vtu2wZYk0AD?=
 =?us-ascii?Q?DAVQznJ9E3uT5yhfqlJFhG/4NwJyq6XxCqnx78/FyGVGuNTD8WMi9OcNf3x2?=
 =?us-ascii?Q?FXjip1+MnvVbfcE9YI4EA2Rc/CcmQUOFcUwZ6ZrEmPVxH2oWnccyi1FKhgGN?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6bIsUoT1guaOS6B+dj32OS77TphT0NuRqXKWUfbW46K0puwwS2hxlfq4L9XKd4EpAHeOvC1CXoG9VX+uvBFAupLF99KMukzQ3UuftvUWftAKTLUQra6VqmXjNl/m/9N8JjNlDtaCQ13eKPIa6qhlG10N/89h4QfeJxWZpKgmwC1GgLjpp9XEwMl8YkDsZ898QeHjNri/zCt1xuxr8LXVMS/IDvhya5gIuFxCTeU11Rg2xPy++Kq+p+GdtcY0FIPyZtT9j1DcbFyazaXuvhSn2Qi/d8OKoQ2HDrKnyZgcIKYgIS9FnWGkH1wHKo2BfP+nYH9gPSIrB8hJcPeJL8F6Er+qf4wWmJdJduZyEKyqLlVnrdCYBHAhzKaOn85FBZ8wiZxLX0AmN8Voym261VqJjDkfl5Y6Db3JvOy+6i1k/pQH8fw9tFNVKjyuPiD1DOjBRSj9DtifWUtIvny3xRhcuEWZM5zOIZ3CZDykaHkSzhdXTTeIu7qAl23cWvVsvqXuSfX2CO8cjaLRupQdSNvXStSi7lIna7oGhJVzrDUfx/TY0zGUhC4tLjd1iLa9AOHdwnGrhVJsal7Z6de+ojyBu6J8qsJCLluz/U7ROHXQMQ/KCeAFM3ma1BO8EjWs1wvul6JOa2G/HZmhSFdVPS/xk2mc8ExWoGT/CEJ+vaY5ztdea00zjXGRHMm09wof9N8jz5D8+Z09PuiYEBO+opr0dQivAViRLnUFMDgJ3KRMsnXBsCyPR5Ng7wJVmEEuFrUaJluCMKtmvAW7wBHmBsgeWhmHvNkYsQks2jLmgAUlTrrQmWbbGKRMCIgmHcqb3iQmYaoVRJVCd6n3RzLgRmwHdQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14571be1-8590-4085-da7c-08db0dd0e8b3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:45:11.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tUJiMMmFl5pRhoPIyA5ND/QN6ZeZfOexUIetzlHwjwBemAKT+x1mE5q2HjvRC8Ms87SFXq4q45zldEziuY9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4988
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130133
X-Proofpoint-ORIG-GUID: 3YpOgE6DkeKx3xv5XxMGVfyHIdKHi2HB
X-Proofpoint-GUID: 3YpOgE6DkeKx3xv5XxMGVfyHIdKHi2HB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Saturday, 2023-02-04 at 23:29:48 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz/virtio_blk_fuzz.c | 51 ++++--------------------------
>  1 file changed, 7 insertions(+), 44 deletions(-)
>
> diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
> index a9fb9ecf6c..82575a11d9 100644
> --- a/tests/qtest/fuzz/virtio_blk_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
> @@ -19,7 +19,6 @@
>  #include "standard-headers/linux/virtio_pci.h"
>  #include "standard-headers/linux/virtio_blk.h"
>  #include "fuzz.h"
> -#include "fork_fuzz.h"
>  #include "qos_fuzz.h"
>  
>  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
> @@ -128,48 +127,24 @@ static void virtio_blk_fuzz(QTestState *s, QVirtioBlkQueues* queues,
>      }
>  }
>  
> -static void virtio_blk_fork_fuzz(QTestState *s,
> -        const unsigned char *Data, size_t Size)
> -{
> -    QVirtioBlk *blk = fuzz_qos_obj;
> -    static QVirtioBlkQueues *queues;
> -    if (!queues) {
> -        queues = qvirtio_blk_init(blk->vdev, 0);
> -    }
> -    if (fork() == 0) {
> -        virtio_blk_fuzz(s, queues, Data, Size);
> -        flush_events(s);
> -        _Exit(0);
> -    } else {
> -        flush_events(s);
> -        wait(NULL);
> -    }
> -}
> -
>  static void virtio_blk_with_flag_fuzz(QTestState *s,
>          const unsigned char *Data, size_t Size)
>  {
>      QVirtioBlk *blk = fuzz_qos_obj;
>      static QVirtioBlkQueues *queues;
>  
> -    if (fork() == 0) {
> -        if (Size >= sizeof(uint64_t)) {
> -            queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
> -            virtio_blk_fuzz(s, queues,
> -                             Data + sizeof(uint64_t), Size - sizeof(uint64_t));
> -            flush_events(s);
> -        }
> -        _Exit(0);
> -    } else {
> +    if (Size >= sizeof(uint64_t)) {
> +        queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
> +        virtio_blk_fuzz(s, queues,
> +                Data + sizeof(uint64_t), Size - sizeof(uint64_t));
>          flush_events(s);
> -        wait(NULL);
>      }
> +    fuzz_reboot(s);
>  }
>  
>  static void virtio_blk_pre_fuzz(QTestState *s)
>  {
>      qos_init_path(s);
> -    counter_shm_init();
>  }
>  
>  static void drive_destroy(void *path)
> @@ -208,22 +183,10 @@ static void *virtio_blk_test_setup(GString *cmd_line, void *arg)
>  
>  static void register_virtio_blk_fuzz_targets(void)
>  {
> -    fuzz_add_qos_target(&(FuzzTarget){
> -                .name = "virtio-blk-fuzz",
> -                .description = "Fuzz the virtio-blk virtual queues, forking "
> -                                "for each fuzz run",
> -                .pre_vm_init = &counter_shm_init,
> -                .pre_fuzz = &virtio_blk_pre_fuzz,
> -                .fuzz = virtio_blk_fork_fuzz,},
> -                "virtio-blk",
> -                &(QOSGraphTestOptions){.before = virtio_blk_test_setup}
> -                );
> -
>      fuzz_add_qos_target(&(FuzzTarget){
>                  .name = "virtio-blk-flags-fuzz",
> -                .description = "Fuzz the virtio-blk virtual queues, forking "
> -                "for each fuzz run (also fuzzes the virtio flags)",
> -                .pre_vm_init = &counter_shm_init,
> +                .description = "Fuzz the virtio-blk virtual queues. "
> +                "Also fuzzes the virtio flags)",
>                  .pre_fuzz = &virtio_blk_pre_fuzz,
>                  .fuzz = virtio_blk_with_flag_fuzz,},
>                  "virtio-blk",
> -- 
> 2.39.0

