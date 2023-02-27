Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3901A6A4879
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWha2-00086n-PW; Mon, 27 Feb 2023 12:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pWha0-00085A-Fc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:46:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pWhZx-0002gj-W2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:46:28 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RFwwfx030574; Mon, 27 Feb 2023 17:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=BrMDFfrmJ0yvP93QIDIUYFlRkqVUOPySjRkBQEkYsiA=;
 b=ILrgphqmr+DYYpOIwARsOx21guW3EoyG92rv46Pf+mquCEX//5KM+3huM7H+S+gsKQp+
 5W0Ho1Rt0TPuRCgL3vRcXfJwCwMuQo+oaIlhWFRauxeAwBkkdKo5Uj8Jcrdf3w6Rqv/o
 MeASGWRdW3aGDH9cn680TYGs8siGicJdastfZmgEPkLN6cvMCBMmR5ClkO2OUT6cXxnl
 jzsFP+wNEZnn1Sh//QvTowVACMhjlTW9SPz/8hUrWdW6q21a6sPkywJhzyudUlLlzWLA
 jFfmRRwzhG9UVc225S9eFKgpOKCWrCHuDyVnYevvKdoKeeLvH9ZOW3SmDD3pbMZF4a/X Mg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba24a4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 17:46:13 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31RGVuML013169; Mon, 27 Feb 2023 17:46:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s5ky0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 17:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=notw1Kvdf/4IqGKCsQJf6jX4KFrng/6rNzOW7GSVowoNSlVXj174lIVFHhV7nTBwkKiA+nHiwrvTOr7ul9iIQE80eunZiyiP2VUZvYbvHxB9tf3FWKIk6ghCrSUtidLyQ9C8RY0bYe1ycop8Ob1LyPY1wpzbgGwHb4zqDB2bWJYERn68ebzDP0m6AKUXO4AnQycGWHZK/wf4HmrCKtJrI3wTf5NHemC2IVzktjVuSqAR2T4KknY4cbB4g0DbZp7qWtvOiU72IH+FDhOuk7PD7m3IMTa3iJKUPK+6eLZy+Pt/zoOn7EBARRbhlkStlFvZsYBCbZo6hmrHpbtAjOUeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrMDFfrmJ0yvP93QIDIUYFlRkqVUOPySjRkBQEkYsiA=;
 b=jSohinIsywoSrWFGUW8WgnZc42p3qEF6IPVuv7q9mgPkh0v/xP0lNoebvATgKUXUsVQz6UNaljX9o7qbUPwgCNgxNC9ZwJWpWKd/Q8JZO7bll2amtzomu2hGWvUmTq6i7MF5+DfNvrqGfeEnL9fpne3wnyHnwKhE638plUnoIk3x2M+dXrPw6A/PgEpnNAD9uSQ3CAS0wCKEMn5PYGmvaOCBVTjJb1gOB/UJqA4PgKnqknF9Ps/tAdF+gu46eTDDCzUkBI/I09x4sc2fLpg79M426R2RqRXDcb09PYwJA16WGpGBW/dr5b4yDMymzHMPqgIHGCo/tP3zJG1VUoQFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrMDFfrmJ0yvP93QIDIUYFlRkqVUOPySjRkBQEkYsiA=;
 b=a05c9qMMV7LVhrpjqcD20CrTQrs9l6OEJdLsVd2+C1YL9tPLwLhOaCAZgHQvu0ugasyiSHAUv6vFZEy0xYK3WVfSaiO/q6wy+kG3Wp8OBdRDNJMshkH90Zw70bVJl0FIgxC8k8b99+ZrFjU5pGMPMhqg1itViDyLNqDUxhMLu9Q=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by CH3PR10MB7436.namprd10.prod.outlook.com (2603:10b6:610:158::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.15; Mon, 27 Feb
 2023 17:46:10 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%5]) with mapi id 15.20.6156.016; Mon, 27 Feb 2023
 17:46:10 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-devel@nongnu.org
Cc: alxndr@bu.edu, pbonzini@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, Qiuhao.Li@outlook.com, fam@euphon.net,
 lvivier@redhat.com, berrange@redhat.com
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
In-Reply-To: <20230227174019.1164205-1-rjones@redhat.com>
References: <20230227174019.1164205-1-rjones@redhat.com>
Date: Mon, 27 Feb 2023 17:46:04 +0000
Message-ID: <m2v8jnm277.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::33)
 To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|CH3PR10MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f90822-bc96-4cac-d45a-08db18ea82ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2RBEfAg7ptTfeJiFLqfnvssdEWci0iXNrP1kC/xCMr00OoHZ+ABxJhj0bKugOaBIQ3drIo9j3l/sE/mPNNeiMsx+0WY/EhVpK6uSUYdTVcAe6vGEX1jfkkXIRPdPQfLiePdP9bx364eMDo+OsgyM0YmKjycyn7L9pAnS54ss2xX5amxsNhUg1DzMjbqV+OmiF4S+qMK2SGw6r3vytNBTP38bjCNoA35iAejFIG2n945Xqhq8zZG1IGCCDwbX5pNPusimajXsy44FbAvl5PZifz0PymfX7scmGCyqZuQOjS0c2LJ1nG4lBQYJWjAOMKXVoicSW6ZCxUPyW1O55TZHNhRgVNUCNAVEHkx581bUOUwtnRsed4hZ5rsLJtptki8tPggV1b2SvwN8jJorWVSSnonKxrzorqGQvad9ddD03pY/D9DKj8i+4/IW6BfNqKydQkNmwt6zx7s0MPMob6oCk3ZyoL8UteKf3a1qQElISVTPIa6f2GblYpc4bCJoMF1yCk0LFKLb2Vj5ayHl041s+sAwN6N202cUkxdx05FYmFnMezEECZsdryFtsbUsO3PEdtwReB7Rn6hZLFH+QuXctQkhWIrTDB8GnV8B7WKEYVjzxYVBRaO+XELbwWjJ7Vdx/YvSBqR1wIz6MCZCii8AqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199018)(8936002)(7416002)(5660300002)(2906002)(44832011)(66946007)(66556008)(4326008)(66476007)(8676002)(316002)(478600001)(41300700001)(6486002)(26005)(6512007)(6506007)(6666004)(186003)(2616005)(86362001)(83380400001)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pLNP3lbSWn/ygF3bUfrToOdVENRQo0IXorvXzukzMi4MKhvjI87Mt4aga/ij?=
 =?us-ascii?Q?egtLxjztG5HuNazkeS/JpeQjY/8cXf6T8wqEYMw8E9/kdejgKj3HBPeGs5Bb?=
 =?us-ascii?Q?xWK4Vihy1GRnmY7KEOP5M4JhWtwJmyJ4GawLMmVDr9Esk1GH528ZMnJabB2D?=
 =?us-ascii?Q?5xroHwcVd9qGuaUD1TNucu1j6XLPy4vgyX+YUJLdGDoInzoBwB6nnLyiRYJX?=
 =?us-ascii?Q?1WVuVwoEi3uIUEjszkFe/xMSE9BYYnwPaFxQQlOb0ocxILhwuTNb26DF/+sX?=
 =?us-ascii?Q?Fcb6WSR+K9HDL43Td24yP58cGtKeRHMnsJ/L9x3wf+tzeLGSDToh2ng73/k8?=
 =?us-ascii?Q?Abotr6sdM38xNZC4SvdkiARwv19byX1SGJ+Yn0gS4MvGQA1we7z64ik7RhdM?=
 =?us-ascii?Q?K1btRoHxEXx1KpKhgCNAgwlmM8BEmj2IaJrmqBn/olpah8USua4C4nC/Q9Hh?=
 =?us-ascii?Q?Ygg8qL/vaCM2X6R4TRk/s4m7Jn7M3x80mWDonWd36o1+EKbAVkxymHm7Cy7w?=
 =?us-ascii?Q?MBV4JQKRzo+JPW/xF34zDTvK+xplMZ8jwQk7y3hm49n/qOCMVVlQQmdyS9A0?=
 =?us-ascii?Q?dOUdeYpACIjm85qr1WVzPBZke/4yValDFbW493J+Q6oyiRZXldTaYHrkZ5jC?=
 =?us-ascii?Q?Bs6/+MC+TqLZEongG0aBvF4WQ8Pc7ewV5lLGa02EuFxc15C3Kop8Bkk0fIAt?=
 =?us-ascii?Q?qgdsQ13W4MU38jayXc811Qs9ZFdWzxKQr4XXhLvAwioCRLwW93aL6mq2z86J?=
 =?us-ascii?Q?nXOyWjVDyzcdMh/Fs+EVpf/1WCKH+rIClSVv+BdGjCESMK2o6NXo/YbVGfI5?=
 =?us-ascii?Q?Set2Qsx/cLbWLR6jTStAm5z4huxcHXS+KmR1wDndqBdLgdOwtI2aqbtlFzua?=
 =?us-ascii?Q?/Z5dHkG3SjAmMOX2kEnQzYvzmG0h3fY2tpuNHm7LsApDL/IcouzigB+QYYEw?=
 =?us-ascii?Q?u54TNn9g0kaABp4Vlz+PXb1hdAwlNy+dgYy8YIXHuYbxKUDB60ro9omqJzOc?=
 =?us-ascii?Q?vXWEHcYHyF9V8DT3sVZt8WZdKQdKp6rDAM6cMEwgyZfbBTH/prNKgUOFDZIz?=
 =?us-ascii?Q?rRvH/9BnNfsB7au/gsERZRDbXxLqLO3sREuT10+sufy1dj5fErLC1tkiRwqD?=
 =?us-ascii?Q?FIMEWnoHy6Odg+jji8f9ssH0p/+39VuGUxoZRjaj+pwQYaWZWKHJgOYsBFBy?=
 =?us-ascii?Q?zEbQ6PiIfnlOqabO0ZRfzmlBFQyT1NcyF8yJ+F8MH7QOFWNOJ8gnu8lqGYlz?=
 =?us-ascii?Q?B71kEZlZTXvpp3hAV5CJ73FDDlhC7y1EOFo1PhoLDyl+f4RBhomOzUYd9+Q7?=
 =?us-ascii?Q?uQtEIJKx37iCBzBScIcqd71inhjYz93SKayIXeXNWvT7K/5tZ4Ce8FE5z4kk?=
 =?us-ascii?Q?oFvGq/2F9/Um2ugI8fXkWT47MHY8toZeziJh+C5pKo6UBNC4v8OMWikrVFhr?=
 =?us-ascii?Q?YtQxyJocaD9xHVT7OLCViJqceHaQbXwFyvPVSdccN3+JA6Y37Xa6qygnfG3g?=
 =?us-ascii?Q?WG2dCjnrtE1Dh83VjmzZesTkvXn9NljOQpb+ZQv1yXGNsxYQoZglPmFXYxg3?=
 =?us-ascii?Q?ZYKwkGtw9RpxEZnE9SH6xuxcwOzgYLWM1xgZ8Clp7afWR8sh1W9EaR6ymTTM?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vu5F0UtOViGWRKbEhCs53V6H8A+ghj6CmTBmUw4YuZgNqhLLzcxfmtioqsZ+zZbzg7e2jKJCghCCLWlt0MOmkQa+Ay87SpO1zMoXPm68Z+y6r2/PzYglgGrv58msX91+23KBmPUDQ8AXuleOHP2tsS6viDuMH9AlWvWO/d49i5QHlZFFhLMlQqVv+DoFE4uy+ldsrdqe8awGAkszplzi9wTMF447bLg8kK8wMGlCEDklfLEX1EL0mPHeMXSjhfWFGibTkifvVd7Lc8iXPD7++5A4raY6KpEX8NnStzoa6t/jNZDcbsokz7GH1u1s474iAYvOkVbgHsSal356oeaTldGVMZkd9GNDGnp/43ZD8tEMPobOExwvV8+imVbLoH2tu1jvlN8OIFXQ1L2kgcAXFnX5SDmicIrlUMR4pxP6rjj3TwNczuNkm9Z01xGVb5W0WgTRY+mOisKyH6NQA3uUPDo32brHqolSpq5BRpPgIdd2qKrNsFH8RW4AMxw46hkRtVmtXZH2sLsVWBaRgHYOMBVg4V0LuFYlN6u3JKtQeKvtBt8XphYcl6wLc+A7XpIyuY50RySmV4RvtXPSljWPq20WEYcn5cxmemtdfyhPFe5vXFRvMTXalnllz53zLbhkhgOyhmgbpRqez8MN9SJrJtkNCHh41zlq52QAmC+OJCvNNTBNOIq4NtWzrhlOO4Vyve0n4wtWkCUxpM0zPpNVr7UlKLUohDR+4RswdYtaTOx0tMZl87HHAnGwVk98FOuxnuN+xtfRefu2xwCbiUPvQ1wu+ZoyTTvdBPtZfWi0LSOM9z8qGlrijK9/Ch4hS5/YmC4tv0XmeFmhL5EwgpaJibKX6EizgmFUgqc2Ge1x/9M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f90822-bc96-4cac-d45a-08db18ea82ee
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 17:46:10.3829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8iIGqS2BrnubbiRH1qy8/I59ah6bcVrL7A+a4pfQd/JPUzaN/KqOyzCzGCw1n/XsvIsLUP1FjQ5uVe0Jjwf6fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7436
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_15,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270138
X-Proofpoint-GUID: Xxdo2741WXPKINQ0jNmueG0XNrNIl3iL
X-Proofpoint-ORIG-GUID: Xxdo2741WXPKINQ0jNmueG0XNrNIl3iL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On Monday, 2023-02-27 at 17:40:19 UTC, Richard W.M. Jones wrote:
> These two tests were failing with this error:
>
>   stderr:
>   TAP parsing error: version number must be on the first line
>   [...]
>   Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
>
> This can be fixed by ensuring we always call g_test_init first in the
> body of main.
>
> Thanks: Daniel Berrange, for diagnosing the problem
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
>  tests/qtest/rtl8139-test.c         | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index a9254b455d..2012bd54b7 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
>  
>  int main(int argc, char **argv)
>  {
> +    g_test_init(&argc, &argv, NULL);
> +
>      if (!qtest_has_device("lsi53c895a")) {
>          return 0;
>      }
>  
> -    g_test_init(&argc, &argv, NULL);
> -
>      qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
>                     test_lsi_do_dma_empty_queue);
>  
> diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
> index 1beb83805c..4bd240e9ee 100644
> --- a/tests/qtest/rtl8139-test.c
> +++ b/tests/qtest/rtl8139-test.c
> @@ -207,9 +207,10 @@ int main(int argc, char **argv)
>          verbosity_level = atoi(v_env);
>      }
>  
> -    qtest_start("-device rtl8139");
> -
>      g_test_init(&argc, &argv, NULL);
> +
> +    qtest_start("-device rtl8139");
> +
>      qtest_add_func("/rtl8139/nop", nop);
>      qtest_add_func("/rtl8139/timer", test_init);
>  
> -- 
> 2.39.2

