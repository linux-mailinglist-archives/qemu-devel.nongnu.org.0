Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D7549F29
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:32:44 +0200 (CEST)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qjr-0007rq-O5
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qey-0007Zi-GB
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qew-0001r1-9E
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:27:40 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdO0V027238;
 Mon, 13 Jun 2022 20:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=rzHBQVd+a95oHAbpgPqfzOEkSg2VthnJGZGdYTQEnTM=;
 b=bUSWZA0E5ks0hxMCYnjSI+FwXabWQA6Ec715EivajQahbbrxn+KzR9l9qG+MDev0A2sr
 wNUOEoqsqsM5bLh0JSpRiVVMuMpx0PK8qzkHRjPkDAojxnf66+ZWW4rujiTMJ8lDk5A6
 ZaM/B45cNsM8N0r3gZYS1CYBVBWeGZs/mJjN5SnFb6JQDdKarD7qLW34wMPnumORt/JS
 6+4cIWnLSNCFDgCOvdoZBCHMVuhdsnpbwbFXwKqQlDo4om161C0QoCRPPt7objGLUnPb
 2d6NbaGTVwcG01b4jWbu4MvRpGnT5qUHEO+CmmBn3V3o4UjdagTkMCkHlvzjEoz7bln9 Kg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns42pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:27:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKG5SB007030; Mon, 13 Jun 2022 20:27:11 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d08ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npIghsRTDbS/GnFCbSW+RYy6LEw96Bpir4JNzEKd2KmIdTe2GtCzDOgTm4pCOGUnj+WPRtC6fRmXiwSkqATj5H+4NkuPOzRikUEZtEiPEBRiP6J3wV4J4itcWhybt+MzjU9oBjhgPShuyF1s9ttdGYuaRBxDo3ovYzzkZbt6bRBpT80We5CNKwmLZcAdXSjHABZIjR8wSKRA509WOasQo1TmoKRdX9Ps/2tH4dg4J0+txF4EriCU0XRx4G3F05oFPRcDxe5LXObrMPkbe3GiQSbzZ6Uoc4xmuMTg0QEcHgGP9ocpETJ7d9iLXMYxc4wvg2LWSKROXMxWWKd+SVkgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzHBQVd+a95oHAbpgPqfzOEkSg2VthnJGZGdYTQEnTM=;
 b=UbKBv6ulNhGfxwsjVW0p0+ObQl5IsDRf0ikXp97UoayeCZJk077hZGEf/JgFdA/wlw3t2pGYi+xmkqS11NHyvhwLIbY9chwuHtoJXGux2dWApfluginZFDuPnpee9qaiNk3HuG0sIyDVKruqBsCGwX6MoMTe1QBRGSS0jZlm4jglORSlmnTIFJcDDti0xi7TlknWt5auP82eQbUMUlgWorCAidKzpGkvWMKUg1cnTmeD7wyw6h2jQKZxIOf/pCih2aMM+FKW7exktkCrhZBuAYjwPlP3NxSQrdrGGDqtX7BBVm6OGT3lKRYtRDiZaaButDsgG77dUfmCn2QLj5/HqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzHBQVd+a95oHAbpgPqfzOEkSg2VthnJGZGdYTQEnTM=;
 b=SzQYMBWIooRLJYMohEdRZmJTr41Am7qGIpJqaMqmuimeTjTD/xlgi8jUGmrwNpyYqWgunSZdM28WgL0GK8YAuBIwZC99WqrYYgbap4HjU7P9Rk5qINb1YY6RUhWne+GyGaRSigdm5uj/hMQ83rxwDenTQmCMUDBTPFsQyOH7+AU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:27:09 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 04/14] vfio-user: build library
Date: Mon, 13 Jun 2022 16:26:24 -0400
Message-Id: <c2adec87958b081d1dc8775d4aa05c897912f025.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69694352-19a3-4dd8-a4d3-08da4d7b16e6
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723DADBCAD40AAA2976AF8590AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: effZ/4kucOLKc4Vd0JRUtH7SJhfTHOStxpVtJP5D5/8LAwENBGWTE+foN9y6cRFSIQKk88gS3ngAoOtJ9Ga4IiCWmqmGy28o+/T1igBYrps/5zpC/si7LRk0x4STiHTgvc6n2kapBDY75xcZefNLjEgrD3DX/NPUgNFajsSCh7FaeYDjKJyWFeaMv/IdkkmuHIpxrBxu2njjIu9Tompkv3iaaaX0c+izHHuaDXvj/cEZ9zISIgv/vju1r8nVrGjKqKYD8vN3ijRw9jaxRN6qa9ANgr881KrUeUd3zkz7337cJ/xu/EQDicrERoQoHDrE3Ag7Ztz3duM8W8knrcNxzIFxE3Omrk+L+FWzDP2hsU0HHgbKw0iT2oCc6dclG1ufxwOLyJmebD+gX61y2/gtJs2wyHJsxXBUjIaGgldTkT0/6YJKnSwktpxWAXg4DKJDKctI1p7mnaRkXoGkXTIjsDWYwyP+qH8wwiT5+qMmj+1mCxP0YQearcZRi6klxz3RqGPCB+de5TT1t7+pQgFGOFYtZdRLBi256dtvlj2c0MPeXsYEfiqw+TrGAAIIWA9fqe6MYZ5xrfPR5rq8Nn47z5LtV9pStrx8XsLfonssUeABXVBVtDDiO0vD9MdMN7GncKkMHA1nfRfUjJ+auhmF9b3PrsWc7FxLCiEpRPnQGCg0Iv/FFOnmp7R2OQCW23m5cNCSLcnyLLS5u6MBS1CIySKh7dO0+hF//YUoUwcxsdVBjNrZtU7c8qnINpZ1DB2h+HiEeisol4c/mHs6TeTDR9dODgtJuKmc5VPTOfyxGwIDI2snSvsa6Q6SK4kVWgd9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(966005)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(83380400001)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vjT3q2hwOHjoIeMZ3DQFYMwOLqVb4+Z52UVQgivHUO9gcGM4f7zgtesYUeHK?=
 =?us-ascii?Q?zZ+ML+lZHAo69mtbpUfyhMAM4yRiPLmG/GVlr0c9E112ehLHLcoMWN2qISxM?=
 =?us-ascii?Q?yu61ezl+g8z0JA65n/f76223QiBhnhFQrE8NttwBAcvMks8v7pxmZRnhW5/m?=
 =?us-ascii?Q?Xxv6MxKyMfzrTTKCMUbD1+k5uTl/uby5sYJva0GIkgFp/SDD/fI6EF08lLgb?=
 =?us-ascii?Q?J+BKhl1wPpcWHVgklZXR/+RcZSwD1esRtKdcu7BfS4MPyHnmhX2giV7edsQz?=
 =?us-ascii?Q?O1tjvpMpXqaiNq1Kr6y7iSKzDyrERb8XRUsqsE7B8Jz9FW5sIPZ5Co/JUyGm?=
 =?us-ascii?Q?j25aWzo2QRiqCEVJXY1Xz1QQGA7ltHZgoRyFPvK6g/BR7wqjlmsff3GCtTWz?=
 =?us-ascii?Q?TZUG/DHxYmF4IrV690XbjAoQISfva/gYH5+fOA62lxrDyeJT2BMBDQM2kY7g?=
 =?us-ascii?Q?dvSVQby2m8XoDD8AUtYPQ16RB6sgEEaV/C771sQ/Edo8lOdHdYfeRHzDiO3D?=
 =?us-ascii?Q?ZPshysSJLd0NJNUHaeTsYaQyqzjYe/S84I0Z86PlYiV5prw0rBfUy4D5Dr5P?=
 =?us-ascii?Q?ZAQJ058rAFDH/1iXA63ZNQkgVASbXSU1lFcUmO/7WkDcL6kqpnyF9XXpPrSq?=
 =?us-ascii?Q?rte1jikPXIodagDgeAxXOpsfwAduvJYjx+B83qtzedgQ/8cezsxN8q1u8tuI?=
 =?us-ascii?Q?XhsD6Q7CbazLPEhqXDoTBzYmOsVPNiq7i8Z1kJ8MchKb9pK6tYw8f7Mv73zf?=
 =?us-ascii?Q?KzYsvToafZI4jU8rtUaPutqWi1nALq6XLspSHNe2UtL5wq8/tsUKjOSyEGFP?=
 =?us-ascii?Q?Mpm88+bbMjwmqJwpqfsww3trzEHO8hlvzUwUqp2nToG533LXRtHrB6DzNNEg?=
 =?us-ascii?Q?gWwmXc+oSwhBKXb1yvxxxRaGewUNg/HxkDsd51cVLx/zNZx6SOFx4dhdITuz?=
 =?us-ascii?Q?MHmgDBvjYJ34Okn1pH02JcKeDssMtzs/7r3cuf1pEYA+Dvx0u8IKYWRkBM2G?=
 =?us-ascii?Q?d+Qe9MLSBxP+HLQ7J3UKIQNKQl2dH14HEl0qlK5DJsqFZ4EJMtek5IQL2e5K?=
 =?us-ascii?Q?juYwMrccmMglVtpv3sR2nvaYVIoK0mmfRH+uaVnb6YmAr1Oofx5ydv8AfT4F?=
 =?us-ascii?Q?yGnd+kaqwFPL1YsDL6WGbA8aWXuAjpGupjXKfCHi6+8oYc1kihi4Ho9+HjuT?=
 =?us-ascii?Q?VgGbnlcx2zLsRn5cbzO5gDj6/Mc9jT5uL6t47vDOOMEX/PoGHtp4RF7gAjoK?=
 =?us-ascii?Q?lasdxbr2Pq9uuuOt91OjKqS9hOaS+JbP46waB4gnNmHi/LjVV4NPs827CA4x?=
 =?us-ascii?Q?QmYfJHS8cgUBBeoHzU5JYm6u8/x/momt5CiS6lJFOWfYcjKsNvPdQqHA3U3a?=
 =?us-ascii?Q?ud4PQaPMp78xLUFUg6SRHdJm1EJjxqwc91rhAsAI34qhYNv+pZwl2VPylAmW?=
 =?us-ascii?Q?yWiPy5ZpkoHaAwbN++/DkS/6iE/AoNzaifpi3nTv26f2nZHc9eDgmIOm1Qyx?=
 =?us-ascii?Q?mTOISFnviZLmJ8QKRGCPcByKuoOrQGlhR+anzWK9T+DCC/5QoXkAYT5ZEXto?=
 =?us-ascii?Q?fJV1pkvz4EK0F3kOzPj5faCSVYqDdQ/CKrfBInb/qv4u78z65W0W/HUJu7v1?=
 =?us-ascii?Q?KOBHg4IYxuhoX+QqdVucItA3lOwQafMhQYJmnq/iM6ZlfnxrBza9YWf+EjwX?=
 =?us-ascii?Q?6qf+8dXVleWpIN7h0h0mQIacNJO8Xn2OIvk2r9X7f8i8dR1yFSuZl7a3lQUM?=
 =?us-ascii?Q?FcNc6kGUNg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69694352-19a3-4dd8-a4d3-08da4d7b16e6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:08.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0+aQXZwENg6iskFOgSDWGoHxwXqq4Q5wnOPCWwtWfNsMIYTDE5Msd8mRHzNgnb0TKnc75fuRlua2LRfbRePKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: kPx-n2Zmw4-1IO_RsRUh1SjYE7cvM4HX
X-Proofpoint-ORIG-GUID: kPx-n2Zmw4-1IO_RsRUh1SjYE7cvM4HX
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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

add the libvfio-user library as a submodule. build it as a meson
subproject.

libvfio-user is distributed with BSD 3-Clause license and
json-c with MIT (Expat) license

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 configure                               | 17 +++++++++++++++++
 meson.build                             | 23 ++++++++++++++++++++++-
 .gitlab-ci.d/buildtest.yml              |  1 +
 .gitmodules                             |  3 +++
 Kconfig.host                            |  4 ++++
 MAINTAINERS                             |  1 +
 hw/remote/Kconfig                       |  4 ++++
 hw/remote/meson.build                   |  2 ++
 meson_options.txt                       |  2 ++
 subprojects/libvfio-user                |  1 +
 tests/docker/dockerfiles/centos8.docker |  2 ++
 11 files changed, 59 insertions(+), 1 deletion(-)
 create mode 160000 subprojects/libvfio-user

diff --git a/configure b/configure
index e69537c756..39f30c0283 100755
--- a/configure
+++ b/configure
@@ -315,6 +315,7 @@ meson_args=""
 ninja=""
 bindir="bin"
 skip_meson=no
+vfio_user_server="disabled"
 
 # The following Meson options are handled manually (still they
 # are included in the automatically generated help message)
@@ -909,6 +910,10 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
   --enable-tcmalloc) meson_option_parse --enable-malloc=tcmalloc tcmalloc
   ;;
   --enable-jemalloc) meson_option_parse --enable-malloc=jemalloc jemalloc
@@ -2133,6 +2138,17 @@ write_container_target_makefile() {
 
 
 
+##########################################
+# check for vfio_user_server
+
+case "$vfio_user_server" in
+  enabled )
+    if test "$git_submodules_action" != "ignore"; then
+      git_submodules="${git_submodules} subprojects/libvfio-user"
+    fi
+    ;;
+esac
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2669,6 +2685,7 @@ if test "$skip_meson" = no; then
   test "$slirp" != auto && meson_option_add "-Dslirp=$slirp"
   test "$smbd" != '' && meson_option_add "-Dsmbd=$smbd"
   test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
+  test "$vfio_user_server" != auto && meson_option_add "-Dvfio_user_server=$vfio_user_server"
   run_meson() {
     NINJA=$ninja $meson setup --prefix "$prefix" "$@" $cross_arg "$PWD" "$source_path"
   }
diff --git a/meson.build b/meson.build
index 21cd949082..fac9853254 100644
--- a/meson.build
+++ b/meson.build
@@ -308,6 +308,10 @@ multiprocess_allowed = get_option('multiprocess') \
   .require(targetos == 'linux', error_message: 'Multiprocess QEMU is supported only on Linux') \
   .allowed()
 
+vfio_user_server_allowed = get_option('vfio_user_server') \
+  .require(targetos == 'linux', error_message: 'vfio-user server is supported only on Linux') \
+  .allowed()
+
 have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
@@ -2373,7 +2377,8 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
-  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
+  (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2665,6 +2670,21 @@ if have_system
   endif
 endif
 
+libvfio_user_dep = not_found
+if have_system and vfio_user_server_allowed
+  have_internal = fs.exists(meson.current_source_dir() / 'subprojects/libvfio-user/meson.build')
+
+  if not have_internal
+    error('libvfio-user source not found - please pull git submodule')
+  endif
+
+  libvfio_user_proj = subproject('libvfio-user')
+
+  libvfio_user_lib = libvfio_user_proj.get_variable('libvfio_user_dep')
+
+  libvfio_user_dep = declare_dependency(dependencies: [libvfio_user_lib])
+endif
+
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
@@ -3783,6 +3803,7 @@ summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
   summary_info += {'out of process emulation': multiprocess_allowed}
+  summary_info += {'vfio-user server': vfio_user_server_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 544385f5be..fe8d34b022 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -168,6 +168,7 @@ build-system-centos:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
       --enable-modules --enable-trace-backends=dtrace --enable-docs
+      --enable-vfio-user-server
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.gitmodules b/.gitmodules
index b8bff47df8..c4e66ddb6f 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
 	url = https://gitlab.com/libvirt/libvirt-ci.git
+[submodule "subprojects/libvfio-user"]
+	path = subprojects/libvfio-user
+	url = https://github.com/nutanix/libvfio-user.git
diff --git a/Kconfig.host b/Kconfig.host
index 1165c4eacd..d763d89269 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -42,3 +42,7 @@ config MULTIPROCESS_ALLOWED
 config FUZZ
     bool
     select SPARSE_MEM
+
+config VFIO_USER_SERVER_ALLOWED
+    bool
+    imply VFIO_USER_SERVER
diff --git a/MAINTAINERS b/MAINTAINERS
index 0df25ed4b0..bc2241576e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3632,6 +3632,7 @@ F: hw/remote/proxy-memory-listener.c
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
index e6a5574242..7da83350c8 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -7,6 +7,8 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
+
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
diff --git a/meson_options.txt b/meson_options.txt
index 2de94af037..2bf2d20b42 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -88,6 +88,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('vfio_user_server', type: 'feature', value: 'disabled',
+       description: 'vfio-user server support')
 option('dbus_display', type: 'feature', value: 'auto',
        description: '-display dbus support')
 option('tpm', type : 'feature', value : 'auto',
diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
new file mode 160000
index 0000000000..0b28d20557
--- /dev/null
+++ b/subprojects/libvfio-user
@@ -0,0 +1 @@
+Subproject commit 0b28d205572c80b568a1003db2c8f37ca333e4d7
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 4b20925bbf..10618bfa83 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -51,6 +51,7 @@ RUN dnf update -y && \
         libbpf-devel \
         libcacard-devel \
         libcap-ng-devel \
+        libcmocka-devel \
         libcurl-devel \
         libdrm-devel \
         libepoxy-devel \
@@ -59,6 +60,7 @@ RUN dnf update -y && \
         libgcrypt-devel \
         libiscsi-devel \
         libjpeg-devel \
+        json-c-devel \
         libnfs-devel \
         libpmem-devel \
         libpng-devel \
-- 
2.20.1


