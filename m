Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B61518682
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:22:29 +0200 (CEST)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltQ4-0007aS-HR
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL8-0007gZ-3y
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL6-0001Mv-0a
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:21 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243B8Mvs029440;
 Tue, 3 May 2022 14:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=HyLmZZmUtNjHoWk/fXc0kbzQpeB0AWYnnkpgJEjjtxM=;
 b=1B7rnOZOXNcAYFDgOWn9YxO7lrWhF/Jnz49tTDZ/2CIVZEkeNJMuMTgG4F4BY8ERrYJd
 yF2ekaOUb6Nh21iQRMQErcd/b0IPpySjR4onEItQfb3W+PlSb+mgIRNPYODYvFaFljLz
 39TacHMg1DWdvcR5ZUBNXI2inGW2h9M+LOSdbB+Kw3IS9nmWci1U/z2dXuP554+f9sBg
 Z2YU0DDlSGklX1jDbvOMQWh0XB4N5ZTL9orSCTaiBaKpMLL48EJhq7zALrJn3iuxySuD
 yBQOcuotfcmUZMJtuxiBFRkZRNmeLFE7YTCZ8IuDkud/g6bx2yr75yO68c1B+uVxS1Tt kw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:14 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EG1s8032338; Tue, 3 May 2022 14:17:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fsvbmd2q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr/0dSCIkRMWZiqqaq/FT5xBxJhpYpQzzWUHAQJCjMdnxv19ECtGj5IXq8+RHm3qwgdW7p30FtfyeFnSowjlkyPryrgbE1Lk/YQ2E8ubeJSFQXLBtxmZHSrG8+gzDGbC4WIjEYqP7oLjtLDbJVCyi3FM8bZDGz7QPq5zrcVtPdFcQBBLfm2O3B3L7YIfUW2aQGIKIziXX0S9Wm63eBBTy+nxc9GCg23WRWI+W7VJeXEqvjuC8RepP0h3b993Sfv2e1uwtel0f7+yUJ375eujwREFajtS4u3AKfsSiGL8B4f0M/tzIuEbsayZYY3iE6pYlIe0L2/2YBT3rD8yqRs2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyLmZZmUtNjHoWk/fXc0kbzQpeB0AWYnnkpgJEjjtxM=;
 b=djr1CSAL9nn8vJDRCYCLH8jR4qWHOcgh85j4Aj1RrDf/3ntAmSBENclJGMhcOuonIgJi4FBs1uxxrQlVY94blgbVnLkK1gieNrL7KuDZfD3loXWloMwS0XfjOu9O3qpukOzdEk2DAvwd2/uLhUNFI9gL/hoNpjapwFp8jDxX7mwXhtPfkItqlKmC8yMzBB5SzN4fkK0b3y4n/fPLc/KXRczHxMvdWV50HAiKH71BpWA1KGb5qFjSh8p4SlM0TL4kGvuADiq6HdYw5RmTjyPl3c6BZPIgTclL7TSrqdanUkJ3y1tJoShliIqzw47sFNVJafNv+ZapbhKlzFJQp/M1Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyLmZZmUtNjHoWk/fXc0kbzQpeB0AWYnnkpgJEjjtxM=;
 b=HQa/GcRtPiSUjT/Y76euvKJixBdq1VglA1JWhFdbRtFSSXcTyJ5x7PFOswTGLxE00hMQNH70ORSxY1Qbvwt7O85YuzQMcubTlM/D0O3/Y9Xx/6SdHS+uZi6dyYibwRyiKWvg/VMtn1tUp39lULEgxWmOchhG2UDQZtE1vs8INM0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:09 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:09 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 02/17] qdev: unplug blocker for devices
Date: Tue,  3 May 2022 10:16:43 -0400
Message-Id: <01e8950f954c291acd74c9caf1d2016e898cd80c.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7b4de9e-dd8e-4ed4-fddd-08da2d0f9bd0
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB335890B92834E39E6C5A2B1F90C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l9z3QmXuuGqss2xf5HETSfR+LdSI5O3YgCNFZqRnQBygyEKZ6dBPeeythAH5j9KfFaurZdlQJvGVp7b2rCf3HlhsoAmh/0JjASxHkasgn7OzSgCTjyb9r2aKR5vqqqox1jj6i5dV5CfF8xEyYvsrM8Kf6PaxrdEK+A196Fe6RBnHzhfPsSc9BpiSXYOm7HHDZ8kAYKwbi2PnQuqKK8oAyiapPRSG2GSpYttaTo6nfjTtjX0lcfovvYuzbQ8kRN5aiS6dJgX7VA465WaHqZIomvqr/jerfv1jvQr3tp0+M5sbjqJ5TeQt6zZ8y9Rr6QM7HgKvUO/qtE7Jl9dQ/2mN2yQm4QbuwMzhJzl80iTUzDLBgI5/znjeTFFHcSKkqPSFlL+DfBecOXAuNT0ItaOaPAaOEV06JAW1ip7lSSycdNJSNHpHsBWuUcValTM0znJ72v35fG2VatIUyHvGm3n0cY0AdkftTcY+ZZtd+7fvKXXOO4sq17KzGrC79paZm0Z2SrbQQeiSYVuaTOYrssJBSPw14zd4U8t0y12jlD1b+jtP+Q3dLsvyD1n6GM8eQn8KJD0GtbsPZ7og2JFPX9UPt+jaIjsKXyPjlu9zYZ0DFOSlUwxBUr//Ri0KPzpZEzvW9ktDXzWfDQWOCtlL8fZF/7MBQWvmc8V8UCd6v8guxmKJlcimbXSkcNkSIr+fDH6kNdHTN0Cqwt9+3SXBGuCiuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpOnjBZF25p3lFhC+08HAmQhDOPltp9XNLK7fHlSFKeoRMc6OqTVRS7FUfnY?=
 =?us-ascii?Q?zvH3jELkprUdodQBPiT6GXiGH45Uj9KBTjHH/C1gY+HR1GT+vJkzEsWbvmzX?=
 =?us-ascii?Q?NiP/xElFimR3F20M73uxGKmCVaPD7QxM/EOQZ8T7sEOXsYBbywjLtUgLOv9G?=
 =?us-ascii?Q?mRpGBXIXggKx3Y+NLllzAYKwn2i3BT9PCPrMAQHXnDc4H0UgA1G8Xq/GwINh?=
 =?us-ascii?Q?eJOCZaECbtUYqy/5nnWiSFlcgCj5snsLNE2ekkCor3SL03oPFbqyd8h348z9?=
 =?us-ascii?Q?oq2st77R7ZNGE/K69W6SwkN2EZFLu6voM0QN1M8zunGYU97Vwfcwux+MyO+N?=
 =?us-ascii?Q?SGWO2S70pE0OpCp06wGq4KScBKEk6eymcopJrxtcLybnpsVMLmY5x6NIwn/n?=
 =?us-ascii?Q?xNPTd3VmTA07FurZNcam/hf6caN/9qvqyqOgbLrI++1lC/kN8Q8YOAHheLCG?=
 =?us-ascii?Q?uGTeP4mjkYw365kB8Wv2hxA2TGEdUa0+4sDShZTZ4aoAmjbxnyzC/GwBOKod?=
 =?us-ascii?Q?0FIU50p/A0st4FVWiQgc8n6GMytF81i2/kuhUMHpwxAdt5X5ksEnCrtF7vOn?=
 =?us-ascii?Q?dbI46ZsOTuW2CpQ1+fV8/VUEkNVjpL/asOWeXPAKQ9O/hrDE5He2nm9u9AKq?=
 =?us-ascii?Q?gh5P9moPs6233Fyoa4gZNyN8bjyeALXi3FRaaVhPIkEn66anzoXqlX4dDaLk?=
 =?us-ascii?Q?OF7KAuBBIFQNdZh2VH6cZv7Rer4Inat2AkO5xonDtIJRLyUegNHEHcjYCFw9?=
 =?us-ascii?Q?ke2ZCtJxL0dyUl7eF27MdEX5gHd2QEx9u5nPCpmozKZxHCdfSgTbEEf8Zpk1?=
 =?us-ascii?Q?xTIbM/U5V+XrlmcUReiaHgwKCHBKZNT3RWy8Pm/HX6qp3aQFiqxwbZKFHZA7?=
 =?us-ascii?Q?hVN+xcL5325ZdaglZosS7CboQKCdm7sNYxJv96YeBuGWgdgIx/hSaEdX+M6Y?=
 =?us-ascii?Q?mCSzKzc7k/eGmcQK/4+RqNouonJHT4NRdaooXcqY41Rt+ug3JpP5UnDUMq9U?=
 =?us-ascii?Q?x1XjgnM8arAUUQ1/q0PmdJGeJWUP4xmrCsYRTgU0v8HrBGLjjlsFg/Ajd4Il?=
 =?us-ascii?Q?rrpVu3DKMtc+NrKSviaNgdkOZrS/0RAdBroF++/3M0cA5DGML6Vyu3iweIEi?=
 =?us-ascii?Q?vKmN5wHnVAr32eTSDTG5weqsjPeO6+Y1J58T1NXKQ99kOUnCHK3+qXTygHV9?=
 =?us-ascii?Q?qiaQc5fXPDwyfC9G+0UPgbZypcsYMN6pFyJq7K3VCB85ww99Z7+d81mOnvhW?=
 =?us-ascii?Q?BAUEGpdl8dxg6ilqcHZgBljeYWw4Uq4EZbycVBpQX72lE6ld9b33rSThzLlH?=
 =?us-ascii?Q?cM9jyV6TUk5JJ9wf4ouY7sHaPuNVnTwBgejmNvS5oKYtYuFhwVfV9JOMM3bj?=
 =?us-ascii?Q?xDVCUlf45cKlvjLwrbhNdCRffHH9CBpFZcZHNN95qVyy3oGWhgoqBXqzITfO?=
 =?us-ascii?Q?MIW8dtb5eVZJ/pdqrIiMwI+yu4Kh6leFOLB6Dlb4NWCzlVKMQoq20VjmzSV1?=
 =?us-ascii?Q?Dz6mrE26WUX9PAjGbw30rOvQgw7Qkr0AkP6zwFPtaDqJjYsTskOdqZXgJi+s?=
 =?us-ascii?Q?yfz5m7AxKurle8u9NP2BlYPpY2/oGqWCPyF1c81xT7q1aOVTFwxRLdL9wur9?=
 =?us-ascii?Q?KFCWIhyS7dCSYFVNonOPx0a4Q7zoNxV1f8JjhZ598sPgEUmUIz0OXRlK56JE?=
 =?us-ascii?Q?fi8n7c0YErKzGjlxN++ZBIV0kfJfzIXnUCTNm3HPK3tU8E004MZVpjk5yUwk?=
 =?us-ascii?Q?zyIsXQkW9Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b4de9e-dd8e-4ed4-fddd-08da2d0f9bd0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:09.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzQ9dOEyDPXDRKm3qJ7RBKbF7k+jqXSmMywFo3O/aeT4f/pcqjx7yuZNe7ABfKFLWxdZEWJ/+jHzjm3r1l61kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: fO_ImpAA67On8H5SnBuRtS8J67KDfJa3
X-Proofpoint-GUID: fO_ImpAA67On8H5SnBuRtS8J67KDfJa3
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add blocker to prevent hot-unplug of devices

TYPE_VFIO_USER_SERVER, which is introduced shortly, attaches itself to a
PCIDevice on which it depends. If the attached PCIDevice gets removed
while the server in use, it could cause it crash. To prevent this,
TYPE_VFIO_USER_SERVER adds an unplug blocker for the PCIDevice.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
 hw/core/qdev.c         | 24 ++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  4 ++++
 3 files changed, 57 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..1b9fa25e5c 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    GSList *unplug_blockers;
 };
 
 struct DeviceListener {
@@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/*
+ * qdev_add_unplug_blocker: Adds an unplug blocker to a device
+ *
+ * @dev: Device to be blocked from unplug
+ * @reason: Reason for blocking
+ */
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);
+
+/*
+ * qdev_del_unplug_blocker: Removes an unplug blocker from a device
+ *
+ * @dev: Device to be unblocked
+ * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
+ *          Used as a handle to lookup the blocker for deletion.
+ */
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
+
+/*
+ * qdev_unplug_blocked: Confirms if a device is blocked from unplug
+ *
+ * @dev: Device to be tested
+ * @reason: Returns one of the reasons why the device is blocked,
+ *          if any
+ *
+ * Returns: true if device is blocked from unplug, false otherwise
+ */
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
+
 /**
  * GpioPolarity: Polarity of a GPIO line
  *
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0806d8fcaa 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -468,6 +468,28 @@ char *qdev_get_dev_path(DeviceState *dev)
     return NULL;
 }
 
+void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_prepend(dev->unplug_blockers, reason);
+}
+
+void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
+{
+    dev->unplug_blockers = g_slist_remove(dev->unplug_blockers, reason);
+}
+
+bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (dev->unplug_blockers) {
+        error_propagate(errp, error_copy(dev->unplug_blockers->data));
+        return true;
+    }
+
+    return false;
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -704,6 +726,8 @@ static void device_finalize(Object *obj)
 
     DeviceState *dev = DEVICE(obj);
 
+    g_assert(!dev->unplug_blockers);
+
     QLIST_FOREACH_SAFE(ngl, &dev->gpios, node, next) {
         QLIST_REMOVE(ngl, node);
         qemu_free_irqs(ngl->in, ngl->num_in);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12fe60c467..9cfd59d17c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -898,6 +898,10 @@ void qdev_unplug(DeviceState *dev, Error **errp)
     HotplugHandlerClass *hdc;
     Error *local_err = NULL;
 
+    if (qdev_unplug_blocked(dev, errp)) {
+        return;
+    }
+
     if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
         return;
-- 
2.20.1


