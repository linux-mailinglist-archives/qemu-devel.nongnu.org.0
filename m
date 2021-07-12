Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BDD3C4EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:42:34 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tOT-000117-Ku
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tJ0-0001kj-Op; Mon, 12 Jul 2021 06:36:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIv-00006p-NE; Mon, 12 Jul 2021 06:36:52 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVgF6029706; Mon, 12 Jul 2021 10:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=za22V4R2iw31jbrY/zw+IT3wFS8/Ba5oaZsJkCjZhig=;
 b=gefRa7s5niFB+49gGDm2FmDimMaWT3e0Mh4ful1xlkM7KFVVt8lMwdIaU42WlsABtJq4
 TgLCCBvcIk8+gSCdX0CRiLeDCAMhWJVgqr1DweOXtZ0vWkeXYq1/ACldXq3Ry8C7qpo7
 IyYwqWfAYO3aXzKC688kKmWqY3GqopyKACZCB2EAn0B5v7WrYu55Sp82j5JufRH83AfW
 +ajkVDMF4jLWfnB+4zbD9hhsaw1i/gWq65yMRhryNIQF4jlPeHUxlm+mrgx8LONxP1W4
 ncfSFPjy1nOiDRuqCseJsKaEA1fazCvR6fUf8BJeGj9ISer7iEtfSYtmtwhJak7B/Cqj +Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q2b2jcn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAYovV098181;
 Mon, 12 Jul 2021 10:36:40 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by userp3020.oracle.com with ESMTP id 39qnatj8y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxhaT8t7AuZp/+0RGMA4D4ipjCWyA/3NIzrlsthEclPUm/Ql2qn8HMLt56yTVxSzrMuHmJ+9HBUofjGm3QxdRnb2oj1EqWuw4DElT25JAyWL6Gtc+VX95I3U75MsBJ5+MvvR8we3JxD+B5j+/lq3PMOfuBgDbwKmS2kfvVvcUhzCdSg6sNhwMPhDXzoK4fPplUvbLIS9EMAPQoUTE8QuaZJQJMzaNlZnuvokpt6QYz91lCdfG0/FZlxeQ6G4vckCLQttCxFll38Lco8H4WrO0YPn7XWy2gUQVEGRaJ6xenciCdi+ZwiOYDD5Zw7dej61Iq9jxZ2jnsXm9yQe8LBDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za22V4R2iw31jbrY/zw+IT3wFS8/Ba5oaZsJkCjZhig=;
 b=gJ/G5i2LPJ5m3oxpcQEmQtvkMNcwAZtSOA2D9W48cMOeegNFBCmB6CSlvsYluhks2Yy79WN5f2h/FiZ6eNu90i2yCswop0ED+fi85KUMI2tG9aih6u/mNqFGzNUsvQGUyyahN+8W6YyJG6gvSU5O7OOlod4IC9AyzSvbT9jrn0Dc6O+4iKBM3rF8hywu76b8PGTP6Lecu7n7OiR+G+5ExyRevR7DzmHgDJq+q6XG2Ya9R8uz0YpAwKJSMk+Ebzh2D7PJuN78qfEjCUzZtQi3o4+77/0wf80rKQz9XyjIwmdiGC3M8m7zU1d1pGQzf+EzTtEF8M5feZRnfuMR1lQPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za22V4R2iw31jbrY/zw+IT3wFS8/Ba5oaZsJkCjZhig=;
 b=dUrkSfNjkS67GRtRROT6UWB4Pvg7MeTV2CGODqbZEbA8lI7dv3kbPA9NVlaPIVW4vRibMvho9DTrWCHF8/W2mAlUFjvH145BCMMliUsLUzSSueCliWqXPpUluAWjzd7C0elyQhFH+dhuuX4msGWbDKW/nC18e0QPpc68GC5nl74=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4552.namprd10.prod.outlook.com (2603:10b6:510:42::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:34 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:34 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/6] qmp: add QMP command x-debug-virtio-queue-element
Date: Mon, 12 Jul 2021 06:35:36 -0400
Message-Id: <1626086137-16292-6-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.41) by
 SN4PR0701CA0019.namprd07.prod.outlook.com (2603:10b6:803:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 10:36:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38d56a8a-7cd0-49bd-588e-08d94520ebbc
X-MS-TrafficTypeDiagnostic: PH0PR10MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45520CACB8BD24B4D22B5349E8159@PH0PR10MB4552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFpi5Lx03bQ25Qgb2Yvq43iWNm4pw0VcH7GaoiYE/bzaFBqV0dHhKz7nc01JsDQaAbqt+GPJWwKFPCyX9uV9vSwGv6VDcay0M2J8LkzeOg2OTrIzAnPRUMPfjv6IYhyxODDNwI2fPpukB2+ZeXZu2mghpp8eJze3YhtdkYNr7K+6lf88W+8m+B/5keVDZBGfunGtAknlhsEN41Ko3bg4C307Nu/U0LYTXVh2fRWc/t3am5qxP3Dq21pk1bC0iLJ6GR9hK3DaTAAiF8v90ilG3jVp4o9x/RLjSg546R+4426wa00SVRk82DmIRFrvnhYoNlqqOU6w70KVDivzgqDWUBeIz1aXzu+K7GYn4e7GTXUbagbOyWsDAsXrh7KDU3HXg/P5hwhIb2CkrsSiTM/izvzAuqHT37/TLtBh/rZJpw73cpUkB8WVBXceeQz1xvFOhYRHq5Ifspn0YV+FHARB0kNvVyM30db3rtQv/m7c/pG12137iJnjNuyT/p0mzwDDSkIspQtXydgJDQUzf3rDoKw86Y5j3xswDOQM0N0Y7IR1jfhyGC8WVJUUkDaA7CTz+tNHZ1RA5MEd9F3Rsc46BKY7p3IM8P6EtAnT9lbPMzg7/8fjscsniRmjf+IVVdNgKJ+ZKh3EwXR/fwShKeYw53eK8JEJkzAonSwojqyjo14utChpZSgxsFd8fKugnOrS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(83380400001)(7416002)(956004)(6486002)(7696005)(2616005)(186003)(316002)(36756003)(4326008)(2906002)(8936002)(52116002)(86362001)(107886003)(66476007)(66946007)(44832011)(66556008)(6916009)(38100700002)(5660300002)(8676002)(38350700002)(478600001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXk+R1eGvA8XXmwpOF8gWwhqDOwkiXIgFkgpIy71sVsWBQ/Edn6f2UaUUPz7?=
 =?us-ascii?Q?r1U1S2dDBFuzkNgj8ND/AxzDBXXSX1oSU6ObqiUrYeR4H96BQF0AOBOObcXk?=
 =?us-ascii?Q?lGyMT7KbP3BNkJ23Nv1QEpvprYemfOLcFXMTLcxaqA6JhiXEvJn2gRYIwik/?=
 =?us-ascii?Q?ij+q2uA6OADq8hBtQTia7YEGVlovXbOj31X5HfcYxKu5QPSthJag/sJCfJXA?=
 =?us-ascii?Q?8nv3TtwsbbvQ8NMKU0mkgRmXyxb6+dmDmn9oTeyhS2ZEymcl3KvHyuEpl9I/?=
 =?us-ascii?Q?Gb17gib3m+VQ3AjPMnrtJPwAu3l5+yzkh+H3psTzxzLGb8frYFPHZsadojPL?=
 =?us-ascii?Q?QPqL76KpNphO8e9zlkffnidUu9/RUfUAA+lS7zEFXw/Tdl6pQwCfet5NMDIz?=
 =?us-ascii?Q?6Rqo14zuqpjQzJpENjJ0YJ/BVdtC8yH6/W2MrffSRDFq8ux/0fLpPIelh+JN?=
 =?us-ascii?Q?HD6T4q5RAXL6KZ1jVMoH019Jz8wWppC5+vyfCyRvZokfE+xL+BOjXywPuPJA?=
 =?us-ascii?Q?9AveMtpydonslHXHi6Su/zv1dOwRLR0PFmt5NpTRW2vFsZXj3xVg5oSoK8Cr?=
 =?us-ascii?Q?HLirkgDJsyBlaIB8ap1R14/hEV4HLIo/Or6+RaBhkDUEuyAKlrF4q5bzzfRN?=
 =?us-ascii?Q?5cHokJX6Z6Tb0+kyluz+LfEqrw/LUgaiLaLpZdITOEEl6ckJEEyUfBUS3M5j?=
 =?us-ascii?Q?akUGVQ09pYiG0kS99xD+i+wiHdxivnQUkYqs0DL47eIO/oclKoru+fkKRM1g?=
 =?us-ascii?Q?2XIurk2aAWsJmvbVt5Cf91/Agh7azlcI47Gk4PWcvUjbNh+pQLije8rdEq+H?=
 =?us-ascii?Q?+m7kp+3g3caJ2CgSB1IpAp/4Tl8UFzzZb7nPCbynrww4jZXwHeznUvrdSsLI?=
 =?us-ascii?Q?T7a3TEMfO5r2UOSFrBzPm7/Lvzi3K07sloAvZdytrHuYpqvkXsciECY8mljy?=
 =?us-ascii?Q?iOpjO3d57bTIOu7ZSt7i/Z88RFyN+TcVoKyOe54FUUbB9Y4FZPsljXECRxgi?=
 =?us-ascii?Q?jrikCHqSwdoOYqfOypZ1vDPezavQLAbL54wCdjXE6CiqJLYbx5ilgGD2x56h?=
 =?us-ascii?Q?ars/dI51Y22SI1ufuf6ceB+1GCpiI1hbliJ7p5xGmI+SfxvfmyQzpQqQk0hu?=
 =?us-ascii?Q?Fu9KzpLL5j/JZQxLjdzG6X1KwHPK1n7FgONR1U/OA66t3hsZgdL7AZvaPIQf?=
 =?us-ascii?Q?+IsjmO6BDFW7ER/drKJoDCB9f7Wrz/bBlJ3XVOHOTkucp+ygqFDZKtkb5ALq?=
 =?us-ascii?Q?VrWMyns+owjjm2g+DLXTWpxYyb7KkVwDCZS26E3hrm7I6K4jI7ZdalK78mwm?=
 =?us-ascii?Q?B23dbDRHjSvKlog1SU6URJeD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d56a8a-7cd0-49bd-588e-08d94520ebbc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:34.7707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRHLRF4bh0faNPtyZJDPH557u3h81IoybzoXomgPUWRfsOQFWuvV5E8+ztTs+LNPJ24HIVbtEFIS900ApOEvJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4552
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120082
X-Proofpoint-GUID: mKCs1pHj10tTjXpZnfap8ND8-hgWg0u0
X-Proofpoint-ORIG-GUID: mKCs1pHj10tTjXpZnfap8ND8-hgWg0u0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the information of a VirtQueue element.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 ++++
 hw/virtio/virtio.c      | 135 ++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        |  94 +++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 3c1bf17..8275e31 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -23,3 +23,12 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char* path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ccd4371..bd4d13d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4106,6 +4106,141 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
     return status;
 }
 
+static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    VirtioRingDescFlagsList *list = NULL;
+    VirtioRingDescFlagsList *node;
+    int i;
+    struct {
+        uint16_t flag;
+        VirtioRingDescFlags value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, VIRTIO_RING_DESC_FLAGS_NEXT },
+        { VRING_DESC_F_WRITE, VIRTIO_RING_DESC_FLAGS_WRITE },
+        { VRING_DESC_F_INDIRECT, VIRTIO_RING_DESC_FLAGS_INDIRECT },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, VIRTIO_RING_DESC_FLAGS_AVAIL },
+        { 1 << VRING_PACKED_DESC_F_USED, VIRTIO_RING_DESC_FLAGS_USED },
+        { 0, -1 }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(VirtioRingDescFlagsList));
+        node->value = map[i].value;
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char* path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->index = head;
+        element->ndescs = 0;
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (element->ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            element->ndescs++;
+
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 7007e0c..6bd9524 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -508,3 +508,97 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtQueueStatus'
 }
+
+##
+# @VirtioRingDescFlags:
+#
+# An enumeration of the virtio ring descriptor flags
+#
+# Since: 6.1
+#
+##
+
+{ 'enum': 'VirtioRingDescFlags',
+  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
+}
+
+##
+# @VirtioRingDesc:
+#
+# @addr: guest physical address of the descriptor data
+#
+# @len: length of the descriptor data
+#
+# @flags: descriptor flags
+#
+# Since: 6.1
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': {
+    'addr': 'uint64',
+    'len': 'uint32',
+    'flags': [ 'VirtioRingDescFlags' ]
+  }
+}
+
+##
+# @VirtioQueueElement:
+#
+# @index: index of the element in the queue
+#
+# @ndescs: number of descriptors
+#
+# @descs: list of the descriptors
+#
+# Since: 6.1
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': {
+    'index': 'uint32',
+    'ndescs': 'uint32',
+    'descs': ['VirtioRingDesc']
+  }
+}
+
+##
+# @x-debug-virtio-queue-element:
+#
+# Return the information about an element queue (by default head)
+#
+# @path: QOBject path of the VirtIODevice
+#
+# @queue: queue number to examine
+#
+# @index: the index in the queue, by default head
+#
+# Returns: the element information
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
+#          "queue": 0
+#      }
+#   }
+# -> { "return": {
+#         "index": 24,
+#         "ndescs": 1,
+#         "descs": [
+#             { "flags": ["write"], "len": 1536, "addr": 2027557376 }
+#         ]
+#      }
+#   }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement'
+}
-- 
1.8.3.1


