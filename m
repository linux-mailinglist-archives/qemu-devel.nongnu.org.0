Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC3507C0A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 23:42:42 +0200 (CEST)
Received: from localhost ([::1]:52352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngvcP-0006bT-Fx
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 17:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvaD-0005lZ-65
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:40:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngva7-0002k9-Nb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:40:22 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JHcfwZ009531; 
 Tue, 19 Apr 2022 20:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=FE1luhFeahUiJWyDBZ8paU0oYsTOSdDJfI9rvSq9s8g=;
 b=rU6ILaTZe5vXuoysRWqM7er4/4l1lFFo/AuVsqN5s0lSz0hh0cx8HRdTaewKACQ9ItaJ
 RsgGaEmLe8jEYDWdnRApV4jT+yRmSBW/IhPORCcLTQyIdnJRN6nXa3BTY/Uvw2Pom/r/
 Fa90qKaq84AUlt6W6EPcFdB6LxHG4Pjj75bZKtVjWSGxPcbhTDNfpWTNSQCMFzYHiEEu
 0OvMGrGBJcPeN77pQSxnlDl+Ih9cTo5VO5RchgWeIol9lztmyuJjs67BjoNeOlqlWz7c
 f54eyfwWPuJD664x/b1u2D31mm+KrKV2g7bIjZQtVmVH2XXucBwRZ3GbSJMNg8tocbEO Xg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmk2q799-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:03 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZj7T034072; Tue, 19 Apr 2022 20:45:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm830ck6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1SKI9bpRAaerF3/+hwkvNEeOpupDUx+44QV89S5d6QB1Tw/ajXVxi+NbzQEHRxtOrsBwa9Xe/oQ8M+rUFohCr/AwWt9Ud582XE4PKzPn1Sx318JBtPSymDaRiBz7o7igi/uwppvCe1o6BQT2br0GZPae3kjLmOgQZwTQXo+T+Gr0B3k7jbdBk44l1NWGewZJcy+3yYPL6ejeDNCcnVXPbws31srMtFk6ijvKs82550mCpaBL8TtwkalkPODAueUmPqADksxC/rT9bLjxC55riZETFy3MepWJFnLQD3+q6Sqa5u/hm0PWA/8kHIw4lqV8IIvxM9XkVFHJUNVrbv/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE1luhFeahUiJWyDBZ8paU0oYsTOSdDJfI9rvSq9s8g=;
 b=ZhwYgP0DE5jreF5+9DqQ6MeS8wBKKlmDjXGetg5t+azBxA6nJgxq+WypjZzn3xSQga6frW1vqgXDnNIlsXKkSDSaF3YFlb2Kcu6eoREYyxUu0SUfDnr+8iWZ48ABsH2vrGEhV9WGvxMFeT0ZMOeKWWGyYxdrZyBWaP3egcTdMapY3MzVHFsN+tGJse+Ctbf+7hVWbds5wYLZ6o0c/q1bSBZH58nQv8t1j7hkv59CeOi5tn42xVZqAsAHmJ0Py8Rxp93EphVUE08umKSdT0aG4qAzqm86UQCImGF8L4sndxJ4icwcDF20J9yuTFc3NnDcgIdLCjj+Hztvb+NQGlWO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE1luhFeahUiJWyDBZ8paU0oYsTOSdDJfI9rvSq9s8g=;
 b=FyeiPyZ+Jj2k0pLIWKZ/7qidx4Ie8sxrFL54QS2S0EwS/+Oa1GR0Tc7QkW/+7247Mu2DUGj/6forZ8aGXXchZXuMUaHWf36W9+/opldPaEm/K4H+6LAgFtHog1X421Gi5d9k+nu5eX/iA0UvozPpdmZiCgSKlHK4d+ZiDxZNtJU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:54 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:54 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/17] vfio-user: build library
Date: Tue, 19 Apr 2022 16:44:11 -0400
Message-Id: <049efa4ec96f2e9f195ee94cbe7b49b07861af41.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74bee014-a59a-45b1-6e5d-08da2245754d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB19982D33453DAC29A6A39CF190F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLcdDBvLmwwM1wo4PC7VCDUieiWbsfKIMEfAUzDNV+OpNqjGl5j+wSHxA4xCLZyF+R5KKd2N//I2Q6wqjlsXvaRMHRS/y82U0sEVao2RyL7Sq8Ify4j3qfM+DBoqidSH6x14r9lwnC0ePPVZDleWJZPn3FMwM/ScfRkDzmdDqAmlkxxJCNlUpch/0DaBJeeT2AlYZiZvFtRIHgLtq32PiczlWCIZVaNq3kb9/65Sl9dyXbk+GjW94Zxbx6UdpWL7a4Gi8K3V4UC3Uxk1661JFp7NUmZUPbnFcpRgx3R2sB95rvxAmfueT3WMTpTsrhb/dxniD/cXVT0t5LRTiorFvmn8b4Ng4ROCeFi+v8/5is+Tz5cQT8zoAxfk4PWffBcg1YsWvskwFk8mjNlSSOIWEexKVLj0C3309Unw/55NPP9RLV9i/4i8PUw0mdmZIwqzQLyqKdhqI91SOMmo57C+1SD1M3MjmzMQi/CFiyebPNWo31XfPeMVoVxjKzEJBu6hsjwqUjtQ0w6alTvYtMv2wKCVXD41IWpMHwkXlvInXl4YDd8s3uMkZYxs7SQ5uIkzicvJ4qod5XGLwBtXvl8MUdUtQkUFtx7KraTrD/Yv/SEX5rTMpF0RYQUyKKHIcLgkar8hNohwv0X/E89+P4RtYyZe7Noox8sPexPBEtqCsRQSdUOrrQ/Y8ETwpwACYh+cJ+fmd+VdQajDcGBM3YXltFY4CS0lUieGcZ6pmX23pXuroPDZ5q8bIiXgNU5Y1a3uJ/lll1Cq3/v5quYAyeZErMwaYvadNrXPPNNUG78045lvo/aQp2aoDiO3cr1sKcuHxSvzgny8Qc1OQoFFHafAhbIE3CMOgT7tLZq0iXi8Ab0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(966005)(6486002)(30864003)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5VlmqGfPQu38oIFSyPF4d4l6XgMBI92tT8qrTTs1dApEv7FuScimS4kdh8Jk?=
 =?us-ascii?Q?Pl265r0w4n34K+wtFlNddSLXkgN/33mt5OfZKIeMFOozhFBqTt46hX22Kgep?=
 =?us-ascii?Q?+RgGjdDgkbBy55uXbSDG5C+3tooAFE0Eil2Fd6zlrB/JnaDjYXC7K3fHh+hv?=
 =?us-ascii?Q?ZPHZuTwhAnqSaT8D+HvC5mteX1VEZLIiPItaTWNqXJUvHQ5Ti8tSoGGsUzRR?=
 =?us-ascii?Q?gYz80v+KjP9SRoOYxmY6cFEpg+unovg09Y/4dWRbAv1hjhREM8hirixtdvBO?=
 =?us-ascii?Q?L6fpvDa6abQmf0zDzyTkApPwB1tvTcvupU+azMMeHf2y1fjBK3E76Z+AhKD8?=
 =?us-ascii?Q?rFY3eSKXJqiVd6n7raiZBJt9vt1LdplqJYK5tqAj6ebhEBNVHcUuyTyHcseK?=
 =?us-ascii?Q?JWTg9HXII9YvxBZXyim42r6AmIX3qJrQtL8KlmtHWXfpmeca/n15xaT4uxlg?=
 =?us-ascii?Q?lvKgsOJ49kXCr0gBeAQtRr+r2p+tIwWIw3816YncPYNtfB6GcFccdRhz9vcj?=
 =?us-ascii?Q?pLD3pe7et2ez7Rl1lHcmkucqKZ9PuYu7/WsEjr2RDbL0bYZ1SuBCzVB147Ch?=
 =?us-ascii?Q?qULNxE5Zlh7Sq64EKXMChOWXVIXX9ZDX3V+GhiJoDQwDIHMkSV/TIFGn5JPt?=
 =?us-ascii?Q?mw70OewHRsAKjO6ZliY7/mRGeGEmRh3KiY3dw8NkZEVO4XnFYWzW+vweHrfQ?=
 =?us-ascii?Q?ZXHLobd3uIe8ll50Lb+mFoGfMg+bl8r3c1iREG2S/bqgojiaVgoDgHyY3ueN?=
 =?us-ascii?Q?rU2VauCNeaFcaF4rD89wnB92fTTh8DaGOqZ3ckYXhaHX4ebpFZ/0Xu1Zf23s?=
 =?us-ascii?Q?yftX+xt+USPdEpoWEVHKg/dwqDh5/fbIfid1yJiwjcrABb2T8oprvI9S2xer?=
 =?us-ascii?Q?dTY6fMErV6PNhTd9+IAZfA9cgKrl41x7dGZfP3q6jNPO+kl43jf31TvVrDiA?=
 =?us-ascii?Q?TKgWIojR/W+is6dIMqzHuv2dRLZ2tsObv711aMB+vsS9prfwzr2hiQkwBmzQ?=
 =?us-ascii?Q?e9AHq7dYf98SByTRT7+TOdZbivGdChcTWHfAVb6/nhx94HG+SgxQDBlJcKAV?=
 =?us-ascii?Q?taP8FAwW1SESs89KeZUe5fO/HDwYHiSGBXDqNvV8K0a+ftScL+HP5JTlMli0?=
 =?us-ascii?Q?277rPoo000nAwswVX8qTUpTf3jLJVV7qDq1k0yHchh7BVzo2N4fc1vFJE9aD?=
 =?us-ascii?Q?ptVbsm+XiXDG+p6qwKq9sUBo76CuPb0ritFYFvg4eDIAov63pNRmQrJ+SH/U?=
 =?us-ascii?Q?Uy22jkv8GXuNYEZVGhQgNLoHPLxS2TFbTX/L2tijGbDBaNbC4gQYzFHhlt10?=
 =?us-ascii?Q?5+5sk1+3JAzZbOzGQ5Bm5Y+SmGr+qg1uF4HaGrk7kfRB8sowRUQlvRlfyK2U?=
 =?us-ascii?Q?SP7DI8RLhyiCtu4BRFiiBb+u2mza2wcE01oKpELBWhMoApz9CQ0vXoLhpiok?=
 =?us-ascii?Q?I2Xho8JCqceTt9QIg25Ocwmj2xBdFmu/TU6pvcx3refDzrX32BG3dhJ43J6z?=
 =?us-ascii?Q?Gf/x0tUmR0L/ctB6tc7VQt8WQ01qOJ7Qk5K3a6zdkcFfKXs3SLoIimWqObSm?=
 =?us-ascii?Q?Qgc0M5eO+BmtrHD/Xzx5azd4U4EQJGrRs+E9hgF9Equ27EUjYIjHm63xGHeL?=
 =?us-ascii?Q?+abXpt3ptixqGhfoDnG1JlQ4eNJgNrZ+kOf1qMb5YcK4SkJcu9/e17ChtXPf?=
 =?us-ascii?Q?Ceb6ct/9EP7J2MVbmryXI8IM68zVcwhv8YMwxa77Y2Txa+JQmHYSZ4Q1lz82?=
 =?us-ascii?Q?I4pWbsH3Zw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bee014-a59a-45b1-6e5d-08da2245754d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:54.5880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U525uIack+y/4lmuGh4khnyDfA6SKHIwEGBPjZeO36+g6ljythKDT13qBNHObIYFFkar1TNMCqqz0/DNiTd9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-GUID: iwsW5volIGlII9QbQl6dRXPbAN69CnPH
X-Proofpoint-ORIG-GUID: iwsW5volIGlII9QbQl6dRXPbAN69CnPH
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

add the libvfio-user library as a submodule. build it as a cmake
subproject.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 configure                                  | 20 +++++++++-
 meson.build                                | 44 +++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml                 |  2 +
 .gitmodules                                |  3 ++
 Kconfig.host                               |  4 ++
 MAINTAINERS                                |  1 +
 hw/remote/Kconfig                          |  4 ++
 hw/remote/meson.build                      |  2 +
 meson_options.txt                          |  3 ++
 subprojects/libvfio-user                   |  1 +
 tests/docker/dockerfiles/centos8.docker    |  2 +
 tests/docker/dockerfiles/ubuntu2004.docker |  2 +
 12 files changed, 86 insertions(+), 2 deletions(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index 7a1a98bddf..c4fd7a42d4 100755
--- a/configure
+++ b/configure
@@ -333,6 +333,7 @@ meson_args=""
 ninja=""
 gio="$default_feature"
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -1044,6 +1045,11 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+                             cmake_required="yes"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -1267,6 +1273,7 @@ cat << EOF
   vhost-vdpa      vhost-vdpa kernel backend support
   opengl          opengl support
   gio             libgio support
+  vfio-user-server    vfio-user server support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -2622,6 +2629,17 @@ but not implemented on your system"
     fi
 fi
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  auto | enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -3185,7 +3203,7 @@ if test "$skip_meson" = no; then
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
         -Db_lto=$lto -Dcfi=$cfi -Dtcg=$tcg -Dxen=$xen \
-        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp \
+        -Dcapstone=$capstone -Dfdt=$fdt -Dslirp=$slirp -Dvfio_user_server=$vfio_user_server \
         $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
         "$@" $cross_arg "$PWD" "$source_path"
diff --git a/meson.build b/meson.build
index 861de93c4f..84bc3a1c4f 100644
--- a/meson.build
+++ b/meson.build
@@ -298,6 +298,11 @@ have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
 
+if targetos != 'linux' and get_option('vfio_user_server').enabled()
+  error('vfio-user server is supported only on Linux')
+endif
+vfio_user_server_allowed = targetos == 'linux' and not get_option('vfio_user_server').disabled()
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -2111,7 +2116,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2500,6 +2506,41 @@ if get_option('cfi') and slirp_opt == 'system'
          + ' Please configure with --enable-slirp=git')
 endif
 
+vfiouser = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/Makefile')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  json_c = dependency('json-c', required: false)
+  if not json_c.found()
+    json_c = dependency('libjson-c', required: false)
+  endif
+  if not json_c.found()
+    json_c = dependency('libjson-c-dev', required: false)
+  endif
+
+  if not json_c.found()
+    error('Unable to find json-c package')
+  endif
+
+  cmake = import('cmake')
+
+  vfiouser_subproj = cmake.subproject('libvfio-user')
+
+  vfiouser_sl = vfiouser_subproj.dependency('vfio-user-static')
+
+  # Although cmake links the json-c library with vfio-user-static
+  # target, that info is not available to meson via cmake.subproject.
+  # As such, we have to separately declare the json-c dependency here.
+  # This appears to be a current limitation of using cmake inside meson.
+  # libvfio-user is planning a switch to meson in the future, which
+  # would address this item automatically.
+  vfiouser = declare_dependency(dependencies: [vfiouser_sl, json_c])
+endif
+
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
@@ -3612,6 +3653,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aea7ab84c..671a5d8fa4 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,6 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+                    --enable-vfio-user-server
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -165,6 +166,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index f4b6a9b401..d66af96dc9 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -67,3 +67,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 60b9c07b5e..f2da8bcf8a 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -45,3 +45,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..dca81a2d22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3597,6 +3597,7 @@ F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
+F: subprojects/libvfio-user
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
index 08c16e235f..2d6b4f4cf4 100644
--- a/hw/remote/Kconfig
+++ b/hw/remote/Kconfig
@@ -2,3 +2,7 @@ config MULTIPROCESS
     bool
     depends on PCI && PCI_EXPRESS && KVM
     select REMOTE_PCIHOST
+
+config VFIO_USER_SERVER
+    bool
+    depends on MULTIPROCESS
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index e6a5574242..dfea6b533b 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..bd531fd545 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -91,6 +91,9 @@ option('avx2', type: 'feature', value: 'auto',
 option('avx512f', type: 'feature', value: 'disabled',
        description: 'AVX512F optimizations')
 
+option('vfio_user_server', type: 'feature', value: 'auto',
+       description: 'vfio-user server support')
+
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
 option('auth_pam', type : 'feature', value : 'auto',
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..030d2f6e79
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 030d2f6e7978b8ca7577b81d4f48e2771bcd8f47
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3ede55d09b..b6b4aa9626 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -23,6 +23,7 @@ RUN dnf update -y && \
         capstone-devel \
         ccache \
         clang \
+        cmake \
         ctags \
         cyrus-sasl-devel \
         daxctl-devel \
@@ -45,6 +46,7 @@ RUN dnf update -y && \
         gtk3-devel \
         hostname \
         jemalloc-devel \
+        json-c-devel \
         libaio-devel \
         libasan \
         libattr-devel \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index b9d06cb040..2422cc5574 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -18,6 +18,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             ca-certificates \
             ccache \
             clang \
+            cmake \
             dbus \
             debianutils \
             diffutils \
@@ -58,6 +59,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libiscsi-dev \
             libjemalloc-dev \
             libjpeg-turbo8-dev \
+            libjson-c-dev \
             liblttng-ust-dev \
             liblzo2-dev \
             libncursesw5-dev \
-- 
2.20.1


