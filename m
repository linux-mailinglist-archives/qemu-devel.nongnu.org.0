Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2FE3B013F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:22:36 +0200 (CEST)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdYB-0001Nz-5w
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTt-0002lm-5l
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:10 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:58273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTm-0006FZ-Ui
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ffHu05ns0a4PVzRntMRhGeR7DMvg0pTAyQfKBKaZz4=;
 b=NZIu4ylJ07J2rQGflWVGUmCa/I+5SBaphKRHzKhz4FnhZ12Mb1bH/i2XXf1smPKiBF37Nu
 BKjriy624OXRZF2/SRzoMxpOa9nEVUxV+qcgMH1EWoIKz/TVN+ezwHXZpP0PgdWJXRVoOf
 QRHKfwSOcF06N4z2o1AC6hsmichGE2Q=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-H1p4kDNiNei_Va_HOetYqw-1; Tue, 22 Jun 2021 12:17:59 +0200
X-MC-Unique: H1p4kDNiNei_Va_HOetYqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnwCySl0ozuTiPXKGkPLQGO+YLeKhm+UYO5AZ2Wcrb6f7FnCB1/mHI7SjupjugzI2BeDz45B5EDGzceMOsUiAdCISnmEnEdWa8tfk3ttk0DbrIzNw9PDmbjXV9NoyZOMUPgrHbXI49FRMb/erYeYvyVdeChQiHZigLP5kjChG0waAyWVW1buUpobi8ZLks03pJIg7jjaZmbcAjqgVy4t8/gGJFssLfhgTvwGVKj4nFaOq4egsk/moeJ3TaTWMY6wBzpiVUjXDUY9tSc0B1hLYeEbyMq9RTvD/A0319hhAwAoZXmny+7DEmz+TrySlxXluk2UpY8LmWbeRZIExWW/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr9a3tWzY9nE2P88NC50Jvm5gSYST+el4uIWz6Llkeo=;
 b=N538YDTZ1aRRiC9ZEtc7dgH5vbx1NDoPzHvUVBhubMiWn9koGv2J0rR9Q6SbQ1dhCsTQFgKGwRFbhUPoVsCvvi8fMgTv0W9ERugCR9DF/twDen+IFCYK7m7pC4F6pKmlRoJ5Db+j7kXNeAuMWp22XRVeG+XPieHzNoXZkAa0gMWjyZiRPKE/SVcZ7gNvgQYqrJF63b6QbleTaQXHKlvTK0DNc/0hh7zivD5AXFNWtBBPaK0D4TYILamgk7kh6ETHXJGcM8OuvWU1yTRJXjlSktE0LaiBJqI3o4jCoAjQ5sgeHG3LwHM7zsxXR4mZrl1qoxW3qS3S7PlauSACqTXMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5405.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:17:57 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:17:57 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 04/13] hw/s390x: tod: make explicit checks for accelerators
 when initializing
Date: Tue, 22 Jun 2021 18:17:17 +0800
Message-ID: <20210622101726.20860-5-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR03CA0049.apcprd03.prod.outlook.com (2603:1096:202:17::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 10:17:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa78b9c7-4601-4fe3-7aa5-08d9356701b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB54056FA4B404DA547435FE9BA0099@VI1PR04MB5405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHkDdNz8TB6Oc2EaqrUnBuTKVXYeZDOp6AH8VUNT4tbMmYKUd+tfpLuISZcU2lFvPnlly0LGINmxp6seKJb5JSbG71C4d96891wPauTKhTe43twCyFqcXrY4FK2KrGzjAndduWAPMdANqvZWM/D/AGalpf0P1+JbiczGZM5gZasZAqWjT65hypaJBKTolb5w24iMKOD7Jz7ht0LTFRPS/RzV2+Rzk/0LUcHh8jqb/DDiU6AtzgfhnxGydUkIJQy4iqQ/cnEvX8IEw9AiqM9JQr10K8ELh8fxe0IdyE1jnEKnXCz+gYp5wgntoffmgRlIUhM29vVScFtG3M5M7GQfKr36UNi1Oe+c52ETZU7n8aOO8TX4TCLj8o8KG71GGpdZ/VtHoBdKdWFlo7AXmW1E1bw+q/zi6EHv+bwRawWX3XPxmQH2aJVO6+ZrKgrwlqJyuFQUTY9KNl8qNkhTMIR8dpXn7EY0uhk0/yP+CxovZNUIxr6YlvCITJSKdm9keFRr+i8QVkdkxjV35l6liShXxbvrQ8QUaduzzdJjDrYEtiauhZfiUIIBqbnyODGzzjISZnLWcd3qJSf9tzkuoWb+ljqlvqzwwXZOFwd2iFl28pG8/VPARDzMX7cy27nGXfpozKjOGAGY2njAPnAhuJe7lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(136003)(39850400004)(346002)(4326008)(316002)(956004)(86362001)(2906002)(66946007)(6666004)(6496006)(2616005)(66556008)(66476007)(8676002)(186003)(16526019)(26005)(8936002)(36756003)(478600001)(38100700002)(5660300002)(83380400001)(54906003)(1076003)(6486002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8+QVatyMlPC4z1XcIx+RBOMTunrWV8AbMuwdEpk7Ny7cEPsUG3zwAHaD0UL?=
 =?us-ascii?Q?En7y3t77jXyFBAxeJNsBZFUYu7EOjGOA0sB5o0ilh+oSdAGDILzCj/rtoLfn?=
 =?us-ascii?Q?779UkLU4mss9cvXo7GTQpWbFc0CpbMJXT4vTg7QNaIoF4mkfaHV4tP/xTO6Y?=
 =?us-ascii?Q?5Rya9LXyzmfMl5nmHQMuVvef3Qe94o0AY/+NeZ0A4Mn6fRxgwpF61lC/Uf/U?=
 =?us-ascii?Q?SSGDgwXnkOW5ujCyP8swwiEAnGXPf54ZkNvU8HQ8IF8E9u+6iU8QVhI0yaIP?=
 =?us-ascii?Q?U57y6b8IrtfAukTeZvm/udVS8vtEYPoqgkCpWpwoEDa9m86Z/GBUD9nGKkNA?=
 =?us-ascii?Q?MeK+2k8kvxh8thc2yEB51NewoY0mBKTsheyglgsqS16I4Tzia09FSQvutcl8?=
 =?us-ascii?Q?gc1XpB7DHMXgJULJEhQMzSjqD1gZu9cw/sJvobH9b3PyIzFNJxtZD9uamsxQ?=
 =?us-ascii?Q?eVlIVHxqqiQlkSINJu5w0kj72BPOEP8n58qN04Bi5zACXaSTQkxJWVMnpKjA?=
 =?us-ascii?Q?imTJlkx2/E2099ZbjTbfECcDdRxfjQygT6OjwA19Mzeds75JtRoelIVKOSLT?=
 =?us-ascii?Q?8av9uOpQvdLmNRr/YKiYTKHTxUQ386OXPmm4KLCiBCdsycC1ydATU270bk8W?=
 =?us-ascii?Q?IEjDgoII5sCr4suU9/nbnLr5NPo0ShWoGwZQhyx8bZffDK61gq1TIi+Z5OMI?=
 =?us-ascii?Q?8qeTr29CCGPP2dedkHBZMeukzt+npD13oQ+ES2cwI2+WVbmV3WDCcfkNYawV?=
 =?us-ascii?Q?LYNO4m6rbN/5HFvvwh+ZHXVtGe6t72YXB/2H5FYCAdo3o85o9d9s+LT2Ke7r?=
 =?us-ascii?Q?HfelvjqSVAJC4GeUkHdOBgrjTHyFEp6tYfcm77XWjkBiGdNqmVn0pQ6y3MPh?=
 =?us-ascii?Q?q9kft6fXKSrl/BDniwa2rKKHhKbVVIRsVvswRCqTJXEZ7JZdFQi5ySnKRZSd?=
 =?us-ascii?Q?AQ+1vaHTjFQU4FfeWHfx2HYzd1C/OWMI+K/o519QYPc4blatM++G9wDmGB10?=
 =?us-ascii?Q?Hwlpdq8cbj/2blDKdtAxUZzitv09xB19V6XL98qLhcj0JR9XxlnK239Qsi8p?=
 =?us-ascii?Q?CvXVpGaxz3AjFNpMStCewAfMsb/NMXxwuylEQo5s1/fhv299gK/1eivuOJx5?=
 =?us-ascii?Q?WhYVxQ/OaNRO5yzY7fOSoFnqltPkEdZPRvS4baT1QRaGhLgtfFelp3Jx9BwL?=
 =?us-ascii?Q?YXGBToyXK6mEFMX4+xph6crW/nV5ozQZ4jBsHwIAbbK521A6SHOJXFgrIRiL?=
 =?us-ascii?Q?v/0Ps61wz49sos3nW72bQGfytGWZebDhVDcOvsa2bt/Lg2UUvM/Ae9oFH2LI?=
 =?us-ascii?Q?j5NIsMGBJC2ACNq0U1IpQszz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa78b9c7-4601-4fe3-7aa5-08d9356701b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:17:57.7663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVu29wQdnNH3A+fTA6isFv5aJgCjkb9K9YaAABS0DPz9wSdZ8tBtsMBscdRu5OSw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

replace general "else" with specific checks for each possible accelerator.

Handle qtest as a NOP, and error out for an unknown accelerator used in
combination with tod.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/tod.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
index 3c2979175e..fd5a36bf24 100644
--- a/hw/s390x/tod.c
+++ b/hw/s390x/tod.c
@@ -14,6 +14,8 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "migration/qemu-file-types.h"
 #include "migration/register.h"
=20
@@ -23,8 +25,13 @@ void s390_init_tod(void)
=20
     if (kvm_enabled()) {
         obj =3D object_new(TYPE_KVM_S390_TOD);
-    } else {
+    } else if (tcg_enabled()) {
         obj =3D object_new(TYPE_QEMU_S390_TOD);
+    } else if (qtest_enabled()) {
+        return;
+    } else {
+        error_report("current accelerator not handled in s390_init_tod!");
+        abort();
     }
     object_property_add_child(qdev_get_machine(), TYPE_S390_TOD, obj);
     object_unref(obj);
--=20
2.32.0


