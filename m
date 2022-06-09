Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C49544FE1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:55:13 +0200 (CEST)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJZ2-0005Na-EJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nixun_cn@outlook.com>)
 id 1nzI0Y-0003cp-W9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:15:31 -0400
Received: from mail-os0jpn01olkn2023.outbound.protection.outlook.com
 ([40.92.98.23]:51522 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nixun_cn@outlook.com>)
 id 1nzI0X-0008FH-6u
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:15:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1sY66C5iztrv2hjgRbYFkKkwI8UaPiLtWYaeCRgkAOPCP0Tu0XsEAIptotVAq+WXlem5UAStHPxpGqjAdvQhNE1xO7wo2dShKPcU0G3uC9PirWd2Mi3IKMIKLfXDL/1vx/jL7m6Kw9fPf52ZtiI6gfIr2ZlE4IT9LC6Ci3wVlsVNqcACbkMWWadb43C8CXOfoLDCDt49kDrEgmh2HPgKzhiJZqS9tE7pcb1bq6nKn1Ac/ispv2yWO8i9nnPotQXNpoQczhwiXC+qKjv6GG7QNTokLLdjSi65jbA6l213KmF35USrIz7In2zxQaaN1gOPVK6VOOKBwv59WtQhD+gWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAYIh6DnrjmOGWVKU1cf/6fskgIwZANmlqTnmOvkVSI=;
 b=jDQYcopwS+j6EHw+PXag8MjTm9ZvovG/CsXgmdrOkGRBNyRNWwiQO6jnsvUJrh1jyM4P+S+6qAk7TpP7yHRofP2FitgaJI2/HJgwzaWTnhCMyNOgl4J4/NuKbbd4lJl0Fyzb4ad6k5NsGaWrjaZ90O/qz7Ixvm2duxVMsRzst1blgJbqgmWqXuv4bYlMCpAP56MrF3PQTYgg0ZT4j8OA9fENV3ESTp7uFXxjKaLJ6q6Kr9jEH1/i5eC6z9vCi3tvRBVsdMmRFAGGTNtJbkEcsK4TWpXhgasucRfUmx2ILDJ3/qRbfhUWcnznV01qg6DKiRSbq8ms9NoxfUdGHYUigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAYIh6DnrjmOGWVKU1cf/6fskgIwZANmlqTnmOvkVSI=;
 b=Rh73Uwt+6A7MY+4jBMfk4wGbNylSO+2n5I+mW3Z53dspbavZvQYTdJLaOekwxfs/n1HnlFFjZipKO3b5lmlH2oA5eXT2JpULAuaehrul7k6QZQAnZ7whpL997Bp37hVD6ID8R9qc4w9tzYfFGQSce7h8N8b2ZTbAeCn5wdhBYkWLAGlIT/ZQn9ac6nv3zqFGhOACup4zBqpn3CGXQp0zfa50GDxNTeOPEW+pLCLBBSckO/Y2+gO9UcoCB6AdU+TYYkFjsJV8+prIk7KxDBPfd49yVbArx0SuJTV6Po4RSt1Jrl7YbXeUFcZhLpVaCcL0QBeSEv6miXp8jr+2a+2clA==
Received: from OS0PR01MB5713.jpnprd01.prod.outlook.com (2603:1096:604:bd::12)
 by OS0PR01MB5908.jpnprd01.prod.outlook.com (2603:1096:604:bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 13:10:21 +0000
Received: from OS0PR01MB5713.jpnprd01.prod.outlook.com
 ([fe80::b85c:478b:cd63:726c]) by OS0PR01MB5713.jpnprd01.prod.outlook.com
 ([fe80::b85c:478b:cd63:726c%5]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 13:10:21 +0000
From: Ni Xun <nixun_cn@outlook.com>
To: Ni Xun <richardni@tencent.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,
	Zhigang Lu <tonnylu@tencent.com>
Subject: [PATCH] vhost: also check queue state in the vhost_dev_set_log error
 routine
Date: Thu,  9 Jun 2022 21:10:12 +0800
Message-ID: <OS0PR01MB57139163F3F3955960675B52EAA79@OS0PR01MB5713.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.24.1 (Apple Git-126)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [zebLg7RalyrjzqcJok+YAq6RzkHZXpFB]
X-ClientProxiedBy: SG2PR04CA0186.apcprd04.prod.outlook.com
 (2603:1096:4:14::24) To OS0PR01MB5713.jpnprd01.prod.outlook.com
 (2603:1096:604:bd::12)
X-Microsoft-Original-Message-ID: <20220609131012.50353-1-nixun_cn@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5345cd2f-ac6c-4418-512a-08da4a19687c
X-MS-TrafficTypeDiagnostic: OS0PR01MB5908:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F3e8K5Q25rvN2WC47A466LqVrxgl8M0PuIXUwEXf0RjN27Cd6X3KBnfiyfMGqy0c0EeErfu4dYZwZQjUPzi55yUoGolpCIqANo9GSkDZtWkobKcWDpJnIAvkqm8w6sqTT6gBqj90gnVYut4qDLZ3XXjhxyr1MZhwDFBk46OLeuWCyOoHKHPkjVue3TyQpTqfqHjJbpz3MCFEZn9UXs8bcqog7eJAwH+yHvKmQhkTV2I0Tx2WRFS6G4lOF4jKGRI71d8lObwDBmOxH78NXpuQEuxhIpIOqKlC4B5fYSlRn+oqQ9eHaOEpuDY1U2JbjIMq2XcLLK6S9rA+tZI1ojrFYYKOESAkNtoekmhewaS0M1prZKN97ZzUKxdoDXImO9mTzV8NVxbeldTlScQ2HDLVTOa3gM3OD0j9xz/F5CAjGAbH9DmY0G03iOBagw7JhKYzJyZzpywYgtrQ6hqNSkJRW/cZKdiGsRs8zNFiFM4+oTFvOKDLDjktX8nCmCtZYF1tsHc6iwmB5ArA12M4vxjUGj+oxdhQ30rbLfnSBWVuzQpQuteqnHobCaBrZxnV6LD80FHseXKo8pr2mFcoPeTjGA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+3CnJ0PF//8SYCW21PekvSxgNKyrpAv17uUd9cQveh0y0cvyZcXq+kAJ6n8?=
 =?us-ascii?Q?VIktDquERZiIwGNr7Pv36kBSBgEOLAJ/2D9lDn3Nrxa8qOHuIVaUZRGE4a7E?=
 =?us-ascii?Q?+xEptxo6KWnhLx0nBQkwbq4SOi7lmI3K/lr7qL6W1+DBtFr/vpfvLCGV1mdN?=
 =?us-ascii?Q?IemOCJVBjWuriaJLFcHqCkBHMRkxSsXCmBxJ2ssnZB9AysqU6EEiq0vY1pWf?=
 =?us-ascii?Q?TphrrFTnQGJkuzQNaUaoY9aitVLpmGs3eS+/gKhbH9DzN3Sicw3zGANolC7/?=
 =?us-ascii?Q?TfUp3/lap2VXLSVWqy7QcCty9zWvmHRsOC3w0m9oQjtF6hqVadnspAsBFXub?=
 =?us-ascii?Q?s7qrMI0NKRu9zgsprhInjzeoZ+MmhUKrTW+JPIMBaPSifm9CPb7dAlNZzPqI?=
 =?us-ascii?Q?YMKHRT5uVWzGN/+d+hzW5Ici14sT8TdWPSWF0YZo4h3ahIALfiqmb/Q2+V6l?=
 =?us-ascii?Q?7NVCbEArD7KoxTWj2kVtA3U7x80SWF5hq4bFe+LS51hnHOXrn93ZjU4grlpL?=
 =?us-ascii?Q?/vfOTuS6uO2NtV0PPd3mByD9stdxyuODcmCcBYw3DmxDWQjOqF5qoedch+Gj?=
 =?us-ascii?Q?PzW2RfsiGPI6bSozOEsIeCWibZNdAVlluUJGoYgROaRhOKtn+TVKSphrU5yb?=
 =?us-ascii?Q?5VjUJB6sjBsmRLulNOupOGbKVrTZxikmEWQlDKvt/w+aPRxyO2YDNqcnxZ1H?=
 =?us-ascii?Q?JvQEBnpn2+UFHbCkFvuip9M5et8I3H2qBbti7I5igLs2QhG039Rm7CN711IN?=
 =?us-ascii?Q?akKuBe1wky3FgactZ6V5gfU+SdU1bNK9NSyGKEEX4GfMx9/x9EVTlVgrA0Gm?=
 =?us-ascii?Q?DwthRKCvGj95fQXlYGyPCIHSGNpiZ9X8OKcZ+8yG90hKwfpPy7ZN0BNQ31kw?=
 =?us-ascii?Q?e8/DFVJMRsPzts+OdjLFq8eeMPx4COtVzJodsTQ6aVIDWclz2CQdGC2H3YA4?=
 =?us-ascii?Q?qj7vtfskChAW9gpn/PWBPe66yBAmpKvaDIthrHhloIXkNtXprugA5J0GF9ta?=
 =?us-ascii?Q?zBQahckJLLFc32pcHMOj/GXaH4FeX4DbCPus4bP3yR53HYS+ohzE66LN1euL?=
 =?us-ascii?Q?QfgBWL3h8RcHtc7lkQOGbwpRE52Ald+dFlBQqKwKRnyk1s4HES1E0QsNXfHN?=
 =?us-ascii?Q?t0dz4q9Fqj7ug4BR+N73JJgHwPsLMU5WlNhq6RdCctWlDE1uoZTzXPk6zgK/?=
 =?us-ascii?Q?+5K/8AAVgMeUXD9zCwLgCYd8f2q4V1bJfL9BQQLhTLYDCR58lf+/WnO/L94/?=
 =?us-ascii?Q?NhAjSCiaQk44IT8HcPnBVyBM27oZhd+n6aOACtizSNg9vGAFOXf5R0L/jezn?=
 =?us-ascii?Q?zB6WlK2Q7rSDC9i/Q5OFKaLnG51uHkcZ0Ibu6QynxHExWP7vTkhrEMCNdAcl?=
 =?us-ascii?Q?9d7rBU+wKonAnIUFJS4P13z9gSgwX+u3iusGAP06FkXouivp6K0B+gzxL0p2?=
 =?us-ascii?Q?4j3M5+dVetY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5345cd2f-ac6c-4418-512a-08da4a19687c
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5713.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:10:21.6596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5908
Received-SPF: pass client-ip=40.92.98.23; envelope-from=nixun_cn@outlook.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:26 -0400
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

From: Ni Xun <richardni@tencent.com>

When check queue state in the vhost_dev_set_log routine, it miss the error
routine check, this patch also check queue state in error case.

Fixes: 1e5a050f5798 ("check queue state in the vhost_dev_set_log
routine")

Signed-off-by: Ni Xun <richardni@tencent.com>
Reviewed-by: Zhigang Lu <tonnylu@tencent.com>
---
 hw/virtio/vhost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index dd3263df56..6c41fa13e3 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -886,6 +886,10 @@ static int vhost_dev_set_log(struct vhost_dev *dev, bool enable_log)
 err_vq:
     for (; i >= 0; --i) {
         idx = dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_index + i);
+        addr = virtio_queue_get_desc_addr(dev->vdev, idx);
+        if (!addr) {
+            continue;
+        }
         vhost_virtqueue_set_addr(dev, dev->vqs + i, idx,
                                  dev->log_enabled);
     }
-- 
2.25.0


