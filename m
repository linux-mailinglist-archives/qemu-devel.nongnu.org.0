Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2E3B0170
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:35:00 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdkA-00049t-Fq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdVE-0005DI-W4
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:19:34 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:54496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdV6-00076T-Nd
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ra9h1cw72bPLHOTftS8+0vM3lOoJpnjT/PrrW4Kdpk=;
 b=d8RYrfRLi7mWrSpJutDcj+UyOJMuwmZw3wiG9GwAxPLsKqHvJ4RhzNI0qaHGWkerL7m8sb
 cD7kIGlDVK/nohXIpMFO9X7yfooMKTN9ZHizs8bUwJgsmyYcYcM7TsSV0cHCATNWVJ8emm
 xl1BmD4LHC47iRU9PyPRYEEhm3WsKwU=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-Xd2mqNHhMGmFU5eaIa6_wQ-1; Tue, 22 Jun 2021 12:19:20 +0200
X-MC-Unique: Xd2mqNHhMGmFU5eaIa6_wQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMFKi8HLZ7FtT7PTx+BuYHU/vlFubGmm9F7+QiXngvGd7V43H59akqlnrZ3OrRy7Ucn799S8MumNGOjM8M2tHkvuR6gTPpgKP2XLfRYde7wYdf9VtVvQp17IQfiB3XfaisHn9sT5uToHgBoiQ51QirMxSGlbqFrEwzI6DeHGO+NloOoI50w1UDoaVOn24pfkaDvgKIQYqLIODQzLf32dZejYOVoUR3oXdx2EZ6aVaxwF6i/mH37YO+ENe/FxXZg5zqaPGFjLQ0cjdA/KErpr0bR4C4bwttfWE4Xzp1lPDJg5RXotqhUV2HpTlY/PSYgzp4ziYc9c/08RBoRfyxEA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+hBCGE+GwvOvOlPekjt0SbTeg0cEAwLibVBPC0D5b4=;
 b=FXKNbWdQYYCMwIul1HoEcevsRGcZBODCUdo3jWq9vZk21nYV/WAv9nESHsT1J43n6i/zcUTvi0aY2UFWnwf0KdIpLkrSgFh9Zeiiicu0I8MHkGc7kA+3C7PXEG2aIKlpo0M7q/Px//6TrpzBHujdfxgQHOPjgrk+kBnpK1AE3aykf5wLLI2uXc9pQBnUk/4IAkcJVZCzh4en7l4xAy4wQ4RH6In/fw9hJJNkorGxuCUu9LwSyhWWkP5BZaldWMdopr1k8anplK28u81ZctoBDKZJxjxiN8PF87G4QwoQuOiB0UkYGk7yoiDQXVM71NbjLlE4NOA2/OkjBcqGdPUcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:19:19 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:19:19 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [RFC v5 13/13] target/s390x: split sysemu part of cpu models
Date: Tue, 22 Jun 2021 18:17:26 +0800
Message-ID: <20210622101726.20860-14-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HKAPR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:203:d0::23) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HKAPR04CA0013.apcprd04.prod.outlook.com (2603:1096:203:d0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 10:19:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eacb84c2-2bbb-47ad-46a3-08d9356731fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB57270D07A3CDD20514969C18A0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GzCWE7wZXTQabUKe4lVKHcAC5AmV+6Nt+vXjtV8LAaeuVvTWdXcTBDidRn5BvZvJcPwvVXq1F3jk/qw59g9VFZKcwOY0pq7rk4BAZGTzKdE80YkpOgz+XhsnsQWQTv6YnzMmGJK8HgNa5fGlM0p8JDryR+XWXnjhothhhtv6JDoYCnRML9dOBHl29gnb99OCphOmdaXtsOCADLf/FxCTxBaTvYp1O/0jFgCAxSdZvMARfPSKHXNwWeaRnf0PHSbAlN79MnDGlGI2s8AjarpSV+N76omL4p1bTzk/Vkgchse4c+Yupi26r8ZP+S39qFREURqchDdCtxKjzdQk+SUCX6fasgQl71HX78Wv15dlrDxlRi4Co4YzQ9e73uvIa9Tb9NsKgb9404jEYxtYdRQtwI1mwkJXpo8sXO/2Ttxc3MIuooklGPKrzkwNopvL0EXw13wHpcLu37NJWF/K6zaLTcW9mXozhGZt2D8JwfR8iaOG82DsFYWIt6govC+vcqT4zLzHZrRpylbERO8Gf6oKDAuBj+QfO9SMhoGl+T4Mr85yiaKgSjovXoeNM7CVH8jozLiqXJMmvJdWG2BR8H0Igkiyh4WZ/aPVUpRwq/416hWnL2FtS5dAGeNKrM7mbKQBCLgjZehS0RF8e4qjIsaTiMS2C2aj6UoDXVvIMZjQ1fGG5EjX88k9zrkXiljizdQyzWWwcqT7mJp4t4uAmhGEyP7gOqHNb1KVAdF1n4/cQYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(30864003)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(316002)(478600001)(66476007)(6496006)(8676002)(170073001)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gHksj/3syUx9qL6DQNyedVE8moIIJgU2o59hWm8gOgGweD8L3ARHU0UgC4+X?=
 =?us-ascii?Q?xAbvow2/rLAY4PSJLy6jUTTv6xC4dlMTe9vo68EzE3lHGBgpc4UDko7av4AG?=
 =?us-ascii?Q?EhIvMeud32MVpqRIkUushfqfxZQ2ibbOZOpmdSIlyVhdfBMbtmxWudursCGK?=
 =?us-ascii?Q?svaeKAU7BHenMwhsQlbKClYU7QBaeSpm63+V1UMR33GAZAUdectE9RuNAhjF?=
 =?us-ascii?Q?QtugJQ/qvrdNP8WKf6ZL4zIQC7pbm0hN4dZHbRA73ahBP10fPM4rpO7eAEm5?=
 =?us-ascii?Q?4hNshTl9IKZmHXpkUnhD/e/wQPRO87JERXMYufIABekBNHnG4fdlUa1vgzjS?=
 =?us-ascii?Q?TKe6W9zVGhHdLMASnDpWPp1MGGJGteOz1QumvKbyz+T9fo8nE9Lj/z8Zh+lY?=
 =?us-ascii?Q?BSPdJoUQ8gONQTc9rt7SVZv4uzOforjeZ8oi+sUxyIYcrXfcOdtDFknzi8xt?=
 =?us-ascii?Q?UM88EG3U5CYRXNYv9CF3SVF76r59VeABCMw4b0eZhNk8xJHJaIULXPyQNG3v?=
 =?us-ascii?Q?HE6Xxcj9KPwy/sy9rvW1Wf4KV4JOrq5c95Xux8KrmQ8LqV+KrHpR+6CMVfSm?=
 =?us-ascii?Q?+FIYHRA02f1Tx7PzaNi7QUf6DV/yHW/kTNIqhtF9CFDQKSAhW0Pd8QgpN1h4?=
 =?us-ascii?Q?HTT//rSJj5k6MyLh0ywowtZJF0cAhBbAWms15VkZEueB7E+cGoVBM1jMsBW8?=
 =?us-ascii?Q?KLqKmMRGO3EUd1oreN/44cC+wSSe0UPaFhsAi8gjb6S+cGKewf227NZmiFwP?=
 =?us-ascii?Q?V4WD+zXTuq0P4EzF9X4dydBUtvmwHzPccHRn+cFRT2nwK2a3pRzQ7u1+yCVY?=
 =?us-ascii?Q?g4PuF/eJu+bO5fcVW4yMhXsH3zV7x6Lfddf5vyskMqb3McGE3UEEH0H03VbK?=
 =?us-ascii?Q?mx0MxULF0Zaxd5d3WSS1qe8+PVcvRIvWYxSWWnV1EVq9BYnH8BUpH0ZgJj7Y?=
 =?us-ascii?Q?/SrgM+tqkas5r2ZV1IOPxMhGLAN2WwIhlQff66MKQgB5evRwV2d/y1OYQsSd?=
 =?us-ascii?Q?DCXhRUCxeSh/l72T3VBTTdedaw7yd9m9M8rt25bzqPmjfaAp7nJ5/rfYS1EO?=
 =?us-ascii?Q?4yEEjwhbQwyqKQUVYhGyOwjsjwGSQ9KrAmuG34VoKRW1zNYrU8AvOp3v+9TW?=
 =?us-ascii?Q?maRJQCDIpM4fzXzyayKSUb6+UIcwSP5Mpm+bGAMHxeWnQCFJdVs2VqhU4s9j?=
 =?us-ascii?Q?381ceWx/HJHySa4cG7RXGBIM+SNhWFQbT/pzXboI9Ka2xcE29RtdOLtNiCka?=
 =?us-ascii?Q?M5HK+M4Jld7ATUbnDuU3Tv3Rk1+RD+PqGJr1ZuJVcBVbz9w0dDStv7IvPq2D?=
 =?us-ascii?Q?g2EI9cchyDPJp01GZ6Q9fqs9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eacb84c2-2bbb-47ad-46a3-08d9356731fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:19:18.9534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTG1ajDEduVZS76Jo2ErgpwwSbT2SlWf5oOvl1UEQ7NXGquDebAc2xW60LzAsoaq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
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

split sysemu part of cpu models,
also create a tiny _user.c with just the (at least for now),
empty implementation of apply_cpu_model.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 MAINTAINERS                      |   1 +
 target/s390x/cpu_models.c        | 417 +-----------------------------
 target/s390x/cpu_models_sysemu.c | 426 +++++++++++++++++++++++++++++++
 target/s390x/cpu_models_user.c   |  20 ++
 target/s390x/meson.build         |   4 +
 target/s390x/s390x-internal.h    |   2 +
 6 files changed, 454 insertions(+), 416 deletions(-)
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 014d4365f5..0b446a471d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,6 +295,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
 S: Maintained
 F: target/s390x/tcg
+F: target/s390x/cpu_models_*.[ch]
 F: hw/s390x/
 F: disas/s390.c
 F: tests/tcg/s390x/
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 0ed1c23774..30a192590d 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -18,18 +18,11 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/qemu-print.h"
-#include "qapi/qmp/qerror.h"
-#include "qapi/qobject-input-visitor.h"
-#include "qapi/qmp/qdict.h"
 #ifndef CONFIG_USER_ONLY
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
-#include "hw/pci/pci.h"
 #endif
-#include "qapi/qapi-commands-machine-target.h"
 #include "hw/s390x/pv.h"
=20
 #define CPUDEF_INIT(_type, _gen, _ec_ga, _mha_pow, _hmfai, _name, _desc) \
@@ -414,381 +407,6 @@ void s390_cpu_list(void)
     }
 }
=20
-static S390CPUModel *get_max_cpu_model(Error **errp);
-
-#ifndef CONFIG_USER_ONLY
-static void list_add_feat(const char *name, void *opaque);
-
-static void check_unavailable_features(const S390CPUModel *max_model,
-                                       const S390CPUModel *model,
-                                       strList **unavailable)
-{
-    S390FeatBitmap missing;
-
-    /* check general model compatibility */
-    if (max_model->def->gen < model->def->gen ||
-        (max_model->def->gen =3D=3D model->def->gen &&
-         max_model->def->ec_ga < model->def->ec_ga)) {
-        list_add_feat("type", unavailable);
-    }
-
-    /* detect missing features if any to properly report them */
-    bitmap_andnot(missing, model->features, max_model->features,
-                  S390_FEAT_MAX);
-    if (!bitmap_empty(missing, S390_FEAT_MAX)) {
-        s390_feat_bitmap_to_ascii(missing, unavailable, list_add_feat);
-    }
-}
-
-struct CpuDefinitionInfoListData {
-    CpuDefinitionInfoList *list;
-    S390CPUModel *model;
-};
-
-static void create_cpu_model_list(ObjectClass *klass, void *opaque)
-{
-    struct CpuDefinitionInfoListData *cpu_list_data =3D opaque;
-    CpuDefinitionInfoList **cpu_list =3D &cpu_list_data->list;
-    CpuDefinitionInfo *info;
-    char *name =3D g_strdup(object_class_get_name(klass));
-    S390CPUClass *scc =3D S390_CPU_CLASS(klass);
-
-    /* strip off the -s390x-cpu */
-    g_strrstr(name, "-" TYPE_S390_CPU)[0] =3D 0;
-    info =3D g_new0(CpuDefinitionInfo, 1);
-    info->name =3D name;
-    info->has_migration_safe =3D true;
-    info->migration_safe =3D scc->is_migration_safe;
-    info->q_static =3D scc->is_static;
-    info->q_typename =3D g_strdup(object_class_get_name(klass));
-    /* check for unavailable features */
-    if (cpu_list_data->model) {
-        Object *obj;
-        S390CPU *sc;
-        obj =3D object_new_with_class(klass);
-        sc =3D S390_CPU(obj);
-        if (sc->model) {
-            info->has_unavailable_features =3D true;
-            check_unavailable_features(cpu_list_data->model, sc->model,
-                                       &info->unavailable_features);
-        }
-        object_unref(obj);
-    }
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    struct CpuDefinitionInfoListData list_data =3D {
-        .list =3D NULL,
-    };
-
-    list_data.model =3D get_max_cpu_model(NULL);
-
-    object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
-                         &list_data);
-
-    return list_data.list;
-}
-
-static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *i=
nfo,
-                                Error **errp)
-{
-    Error *err =3D NULL;
-    const QDict *qdict =3D NULL;
-    const QDictEntry *e;
-    Visitor *visitor;
-    ObjectClass *oc;
-    S390CPU *cpu;
-    Object *obj;
-
-    if (info->props) {
-        qdict =3D qobject_to(QDict, info->props);
-        if (!qdict) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict")=
;
-            return;
-        }
-    }
-
-    oc =3D cpu_class_by_name(TYPE_S390_CPU, info->name);
-    if (!oc) {
-        error_setg(errp, "The CPU definition \'%s\' is unknown.", info->na=
me);
-        return;
-    }
-    if (S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {
-        error_setg(errp, "The CPU definition '%s' requires KVM", info->nam=
e);
-        return;
-    }
-    obj =3D object_new_with_class(oc);
-    cpu =3D S390_CPU(obj);
-
-    if (!cpu->model) {
-        error_setg(errp, "Details about the host CPU model are not availab=
le, "
-                         "it cannot be used.");
-        object_unref(obj);
-        return;
-    }
-
-    if (qdict) {
-        visitor =3D qobject_input_visitor_new(info->props);
-        if (!visit_start_struct(visitor, NULL, NULL, 0, errp)) {
-            visit_free(visitor);
-            object_unref(obj);
-            return;
-        }
-        for (e =3D qdict_first(qdict); e; e =3D qdict_next(qdict, e)) {
-            if (!object_property_set(obj, e->key, visitor, &err)) {
-                break;
-            }
-        }
-        if (!err) {
-            visit_check_struct(visitor, &err);
-        }
-        visit_end_struct(visitor, NULL);
-        visit_free(visitor);
-        if (err) {
-            error_propagate(errp, err);
-            object_unref(obj);
-            return;
-        }
-    }
-
-    /* copy the model and throw the cpu away */
-    memcpy(model, cpu->model, sizeof(*model));
-    object_unref(obj);
-}
-
-static void qdict_add_disabled_feat(const char *name, void *opaque)
-{
-    qdict_put_bool(opaque, name, false);
-}
-
-static void qdict_add_enabled_feat(const char *name, void *opaque)
-{
-    qdict_put_bool(opaque, name, true);
-}
-
-/* convert S390CPUDef into a static CpuModelInfo */
-static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *mo=
del,
-                                bool delta_changes)
-{
-    QDict *qdict =3D qdict_new();
-    S390FeatBitmap bitmap;
-
-    /* always fallback to the static base model */
-    info->name =3D g_strdup_printf("%s-base", model->def->name);
-
-    if (delta_changes) {
-        /* features deleted from the base feature set */
-        bitmap_andnot(bitmap, model->def->base_feat, model->features,
-                      S390_FEAT_MAX);
-        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
-            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_fe=
at);
-        }
-
-        /* features added to the base feature set */
-        bitmap_andnot(bitmap, model->features, model->def->base_feat,
-                      S390_FEAT_MAX);
-        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
-            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_enabled_fea=
t);
-        }
-    } else {
-        /* expand all features */
-        s390_feat_bitmap_to_ascii(model->features, qdict,
-                                  qdict_add_enabled_feat);
-        bitmap_complement(bitmap, model->features, S390_FEAT_MAX);
-        s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
-    }
-
-    if (!qdict_size(qdict)) {
-        qobject_unref(qdict);
-    } else {
-        info->props =3D QOBJECT(qdict);
-        info->has_props =3D true;
-    }
-}
-
-CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType=
 type,
-                                                      CpuModelInfo *model,
-                                                      Error **errp)
-{
-    Error *err =3D NULL;
-    CpuModelExpansionInfo *expansion_info =3D NULL;
-    S390CPUModel s390_model;
-    bool delta_changes =3D false;
-
-    /* convert it to our internal representation */
-    cpu_model_from_info(&s390_model, model, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    if (type =3D=3D CPU_MODEL_EXPANSION_TYPE_STATIC) {
-        delta_changes =3D true;
-    } else if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
-        error_setg(errp, "The requested expansion type is not supported.")=
;
-        return NULL;
-    }
-
-    /* convert it back to a static representation */
-    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
-    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
-    cpu_info_from_model(expansion_info->model, &s390_model, delta_changes)=
;
-    return expansion_info;
-}
-
-static void list_add_feat(const char *name, void *opaque)
-{
-    strList **last =3D (strList **) opaque;
-
-    QAPI_LIST_PREPEND(*last, g_strdup(name));
-}
-
-CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
-                                                     CpuModelInfo *infob,
-                                                     Error **errp)
-{
-    Error *err =3D NULL;
-    CpuModelCompareResult feat_result, gen_result;
-    CpuModelCompareInfo *compare_info;
-    S390FeatBitmap missing, added;
-    S390CPUModel modela, modelb;
-
-    /* convert both models to our internal representation */
-    cpu_model_from_info(&modela, infoa, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-    cpu_model_from_info(&modelb, infob, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-    compare_info =3D g_new0(CpuModelCompareInfo, 1);
-
-    /* check the cpu generation and ga level */
-    if (modela.def->gen =3D=3D modelb.def->gen) {
-        if (modela.def->ec_ga =3D=3D modelb.def->ec_ga) {
-            /* ec and corresponding bc are identical */
-            gen_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
-        } else if (modela.def->ec_ga < modelb.def->ec_ga) {
-            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
-        } else {
-            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
-        }
-    } else if (modela.def->gen < modelb.def->gen) {
-        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
-    } else {
-        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
-    }
-    if (gen_result !=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        /* both models cannot be made identical */
-        list_add_feat("type", &compare_info->responsible_properties);
-    }
-
-    /* check the feature set */
-    if (bitmap_equal(modela.features, modelb.features, S390_FEAT_MAX)) {
-        feat_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
-    } else {
-        bitmap_andnot(missing, modela.features, modelb.features, S390_FEAT=
_MAX);
-        s390_feat_bitmap_to_ascii(missing,
-                                  &compare_info->responsible_properties,
-                                  list_add_feat);
-        bitmap_andnot(added, modelb.features, modela.features, S390_FEAT_M=
AX);
-        s390_feat_bitmap_to_ascii(added, &compare_info->responsible_proper=
ties,
-                                  list_add_feat);
-        if (bitmap_empty(missing, S390_FEAT_MAX)) {
-            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
-        } else if (bitmap_empty(added, S390_FEAT_MAX)) {
-            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
-        } else {
-            feat_result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
-        }
-    }
-
-    /* combine the results */
-    if (gen_result =3D=3D feat_result) {
-        compare_info->result =3D gen_result;
-    } else if (feat_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        compare_info->result =3D gen_result;
-    } else if (gen_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
-        compare_info->result =3D feat_result;
-    } else {
-        compare_info->result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
-    }
-    return compare_info;
-}
-
-CpuModelBaselineInfo *qmp_query_cpu_model_baseline(CpuModelInfo *infoa,
-                                                    CpuModelInfo *infob,
-                                                    Error **errp)
-{
-    Error *err =3D NULL;
-    CpuModelBaselineInfo *baseline_info;
-    S390CPUModel modela, modelb, model;
-    uint16_t cpu_type;
-    uint8_t max_gen_ga;
-    uint8_t max_gen;
-
-    /* convert both models to our internal representation */
-    cpu_model_from_info(&modela, infoa, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    cpu_model_from_info(&modelb, infob, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return NULL;
-    }
-
-    /* features both models support */
-    bitmap_and(model.features, modela.features, modelb.features, S390_FEAT=
_MAX);
-
-    /* detect the maximum model not regarding features */
-    if (modela.def->gen =3D=3D modelb.def->gen) {
-        if (modela.def->type =3D=3D modelb.def->type) {
-            cpu_type =3D modela.def->type;
-        } else {
-            cpu_type =3D 0;
-        }
-        max_gen =3D modela.def->gen;
-        max_gen_ga =3D MIN(modela.def->ec_ga, modelb.def->ec_ga);
-    } else if (modela.def->gen > modelb.def->gen) {
-        cpu_type =3D modelb.def->type;
-        max_gen =3D modelb.def->gen;
-        max_gen_ga =3D modelb.def->ec_ga;
-    } else {
-        cpu_type =3D modela.def->type;
-        max_gen =3D modela.def->gen;
-        max_gen_ga =3D modela.def->ec_ga;
-    }
-
-    model.def =3D s390_find_cpu_def(cpu_type, max_gen, max_gen_ga,
-                                  model.features);
-
-    /* models without early base features (esan3) are bad */
-    if (!model.def) {
-        error_setg(errp, "No compatible CPU model could be created as"
-                   " important base features are disabled");
-        return NULL;
-    }
-
-    /* strip off features not part of the max model */
-    bitmap_and(model.features, model.features, model.def->full_feat,
-               S390_FEAT_MAX);
-
-    baseline_info =3D g_new0(CpuModelBaselineInfo, 1);
-    baseline_info->model =3D g_malloc0(sizeof(*baseline_info->model));
-    cpu_info_from_model(baseline_info->model, &model, true);
-    return baseline_info;
-}
-#endif
-
 static void check_consistency(const S390CPUModel *model)
 {
     static int dep[][2] =3D {
@@ -900,7 +518,7 @@ static void check_compatibility(const S390CPUModel *max=
_model,
                   "available in the configuration: ");
 }
=20
-static S390CPUModel *get_max_cpu_model(Error **errp)
+S390CPUModel *get_max_cpu_model(Error **errp)
 {
     Error *err =3D NULL;
     static S390CPUModel max_model;
@@ -925,39 +543,6 @@ static S390CPUModel *get_max_cpu_model(Error **errp)
     return &max_model;
 }
=20
-static inline void apply_cpu_model(const S390CPUModel *model, Error **errp=
)
-{
-#ifndef CONFIG_USER_ONLY
-    Error *err =3D NULL;
-    static S390CPUModel applied_model;
-    static bool applied;
-
-    /*
-     * We have the same model for all VCPUs. KVM can only be configured be=
fore
-     * any VCPUs are defined in KVM.
-     */
-    if (applied) {
-        if (model && memcmp(&applied_model, model, sizeof(S390CPUModel))) =
{
-            error_setg(errp, "Mixed CPU models are not supported on s390x.=
");
-        }
-        return;
-    }
-
-    if (kvm_enabled()) {
-        kvm_s390_apply_cpu_model(model, &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
-    }
-
-    applied =3D true;
-    if (model) {
-        applied_model =3D *model;
-    }
-#endif
-}
-
 void s390_realize_cpu_model(CPUState *cs, Error **errp)
 {
     Error *err =3D NULL;
diff --git a/target/s390x/cpu_models_sysemu.c b/target/s390x/cpu_models_sys=
emu.c
new file mode 100644
index 0000000000..05c3ccaaff
--- /dev/null
+++ b/target/s390x/cpu_models_sysemu.c
@@ -0,0 +1,426 @@
+/*
+ * CPU models for s390x - System Emulation-only
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Author(s): David Hildenbrand <dahi@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "kvm/kvm_s390x.h"
+#include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-machine-target.h"
+
+static void list_add_feat(const char *name, void *opaque);
+
+static void check_unavailable_features(const S390CPUModel *max_model,
+                                       const S390CPUModel *model,
+                                       strList **unavailable)
+{
+    S390FeatBitmap missing;
+
+    /* check general model compatibility */
+    if (max_model->def->gen < model->def->gen ||
+        (max_model->def->gen =3D=3D model->def->gen &&
+         max_model->def->ec_ga < model->def->ec_ga)) {
+        list_add_feat("type", unavailable);
+    }
+
+    /* detect missing features if any to properly report them */
+    bitmap_andnot(missing, model->features, max_model->features,
+                  S390_FEAT_MAX);
+    if (!bitmap_empty(missing, S390_FEAT_MAX)) {
+        s390_feat_bitmap_to_ascii(missing, unavailable, list_add_feat);
+    }
+}
+
+struct CpuDefinitionInfoListData {
+    CpuDefinitionInfoList *list;
+    S390CPUModel *model;
+};
+
+static void create_cpu_model_list(ObjectClass *klass, void *opaque)
+{
+    struct CpuDefinitionInfoListData *cpu_list_data =3D opaque;
+    CpuDefinitionInfoList **cpu_list =3D &cpu_list_data->list;
+    CpuDefinitionInfo *info;
+    char *name =3D g_strdup(object_class_get_name(klass));
+    S390CPUClass *scc =3D S390_CPU_CLASS(klass);
+
+    /* strip off the -s390x-cpu */
+    g_strrstr(name, "-" TYPE_S390_CPU)[0] =3D 0;
+    info =3D g_new0(CpuDefinitionInfo, 1);
+    info->name =3D name;
+    info->has_migration_safe =3D true;
+    info->migration_safe =3D scc->is_migration_safe;
+    info->q_static =3D scc->is_static;
+    info->q_typename =3D g_strdup(object_class_get_name(klass));
+    /* check for unavailable features */
+    if (cpu_list_data->model) {
+        Object *obj;
+        S390CPU *sc;
+        obj =3D object_new_with_class(klass);
+        sc =3D S390_CPU(obj);
+        if (sc->model) {
+            info->has_unavailable_features =3D true;
+            check_unavailable_features(cpu_list_data->model, sc->model,
+                                       &info->unavailable_features);
+        }
+        object_unref(obj);
+    }
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    struct CpuDefinitionInfoListData list_data =3D {
+        .list =3D NULL,
+    };
+
+    list_data.model =3D get_max_cpu_model(NULL);
+
+    object_class_foreach(create_cpu_model_list, TYPE_S390_CPU, false,
+                         &list_data);
+
+    return list_data.list;
+}
+
+static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *i=
nfo,
+                                Error **errp)
+{
+    Error *err =3D NULL;
+    const QDict *qdict =3D NULL;
+    const QDictEntry *e;
+    Visitor *visitor;
+    ObjectClass *oc;
+    S390CPU *cpu;
+    Object *obj;
+
+    if (info->props) {
+        qdict =3D qobject_to(QDict, info->props);
+        if (!qdict) {
+            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict")=
;
+            return;
+        }
+    }
+
+    oc =3D cpu_class_by_name(TYPE_S390_CPU, info->name);
+    if (!oc) {
+        error_setg(errp, "The CPU definition \'%s\' is unknown.", info->na=
me);
+        return;
+    }
+    if (S390_CPU_CLASS(oc)->kvm_required && !kvm_enabled()) {
+        error_setg(errp, "The CPU definition '%s' requires KVM", info->nam=
e);
+        return;
+    }
+    obj =3D object_new_with_class(oc);
+    cpu =3D S390_CPU(obj);
+
+    if (!cpu->model) {
+        error_setg(errp, "Details about the host CPU model are not availab=
le, "
+                         "it cannot be used.");
+        object_unref(obj);
+        return;
+    }
+
+    if (qdict) {
+        visitor =3D qobject_input_visitor_new(info->props);
+        if (!visit_start_struct(visitor, NULL, NULL, 0, errp)) {
+            visit_free(visitor);
+            object_unref(obj);
+            return;
+        }
+        for (e =3D qdict_first(qdict); e; e =3D qdict_next(qdict, e)) {
+            if (!object_property_set(obj, e->key, visitor, &err)) {
+                break;
+            }
+        }
+        if (!err) {
+            visit_check_struct(visitor, &err);
+        }
+        visit_end_struct(visitor, NULL);
+        visit_free(visitor);
+        if (err) {
+            error_propagate(errp, err);
+            object_unref(obj);
+            return;
+        }
+    }
+
+    /* copy the model and throw the cpu away */
+    memcpy(model, cpu->model, sizeof(*model));
+    object_unref(obj);
+}
+
+static void qdict_add_disabled_feat(const char *name, void *opaque)
+{
+    qdict_put_bool(opaque, name, false);
+}
+
+static void qdict_add_enabled_feat(const char *name, void *opaque)
+{
+    qdict_put_bool(opaque, name, true);
+}
+
+/* convert S390CPUDef into a static CpuModelInfo */
+static void cpu_info_from_model(CpuModelInfo *info, const S390CPUModel *mo=
del,
+                                bool delta_changes)
+{
+    QDict *qdict =3D qdict_new();
+    S390FeatBitmap bitmap;
+
+    /* always fallback to the static base model */
+    info->name =3D g_strdup_printf("%s-base", model->def->name);
+
+    if (delta_changes) {
+        /* features deleted from the base feature set */
+        bitmap_andnot(bitmap, model->def->base_feat, model->features,
+                      S390_FEAT_MAX);
+        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
+            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_fe=
at);
+        }
+
+        /* features added to the base feature set */
+        bitmap_andnot(bitmap, model->features, model->def->base_feat,
+                      S390_FEAT_MAX);
+        if (!bitmap_empty(bitmap, S390_FEAT_MAX)) {
+            s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_enabled_fea=
t);
+        }
+    } else {
+        /* expand all features */
+        s390_feat_bitmap_to_ascii(model->features, qdict,
+                                  qdict_add_enabled_feat);
+        bitmap_complement(bitmap, model->features, S390_FEAT_MAX);
+        s390_feat_bitmap_to_ascii(bitmap, qdict, qdict_add_disabled_feat);
+    }
+
+    if (!qdict_size(qdict)) {
+        qobject_unref(qdict);
+    } else {
+        info->props =3D QOBJECT(qdict);
+        info->has_props =3D true;
+    }
+}
+
+CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType=
 type,
+                                                      CpuModelInfo *model,
+                                                      Error **errp)
+{
+    Error *err =3D NULL;
+    CpuModelExpansionInfo *expansion_info =3D NULL;
+    S390CPUModel s390_model;
+    bool delta_changes =3D false;
+
+    /* convert it to our internal representation */
+    cpu_model_from_info(&s390_model, model, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    if (type =3D=3D CPU_MODEL_EXPANSION_TYPE_STATIC) {
+        delta_changes =3D true;
+    } else if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
+        error_setg(errp, "The requested expansion type is not supported.")=
;
+        return NULL;
+    }
+
+    /* convert it back to a static representation */
+    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
+    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
+    cpu_info_from_model(expansion_info->model, &s390_model, delta_changes)=
;
+    return expansion_info;
+}
+
+static void list_add_feat(const char *name, void *opaque)
+{
+    strList **last =3D (strList **) opaque;
+
+    QAPI_LIST_PREPEND(*last, g_strdup(name));
+}
+
+CpuModelCompareInfo *qmp_query_cpu_model_comparison(CpuModelInfo *infoa,
+                                                     CpuModelInfo *infob,
+                                                     Error **errp)
+{
+    Error *err =3D NULL;
+    CpuModelCompareResult feat_result, gen_result;
+    CpuModelCompareInfo *compare_info;
+    S390FeatBitmap missing, added;
+    S390CPUModel modela, modelb;
+
+    /* convert both models to our internal representation */
+    cpu_model_from_info(&modela, infoa, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+    cpu_model_from_info(&modelb, infob, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+    compare_info =3D g_new0(CpuModelCompareInfo, 1);
+
+    /* check the cpu generation and ga level */
+    if (modela.def->gen =3D=3D modelb.def->gen) {
+        if (modela.def->ec_ga =3D=3D modelb.def->ec_ga) {
+            /* ec and corresponding bc are identical */
+            gen_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
+        } else if (modela.def->ec_ga < modelb.def->ec_ga) {
+            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
+        } else {
+            gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
+        }
+    } else if (modela.def->gen < modelb.def->gen) {
+        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
+    } else {
+        gen_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
+    }
+    if (gen_result !=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        /* both models cannot be made identical */
+        list_add_feat("type", &compare_info->responsible_properties);
+    }
+
+    /* check the feature set */
+    if (bitmap_equal(modela.features, modelb.features, S390_FEAT_MAX)) {
+        feat_result =3D CPU_MODEL_COMPARE_RESULT_IDENTICAL;
+    } else {
+        bitmap_andnot(missing, modela.features, modelb.features, S390_FEAT=
_MAX);
+        s390_feat_bitmap_to_ascii(missing,
+                                  &compare_info->responsible_properties,
+                                  list_add_feat);
+        bitmap_andnot(added, modelb.features, modela.features, S390_FEAT_M=
AX);
+        s390_feat_bitmap_to_ascii(added, &compare_info->responsible_proper=
ties,
+                                  list_add_feat);
+        if (bitmap_empty(missing, S390_FEAT_MAX)) {
+            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUBSET;
+        } else if (bitmap_empty(added, S390_FEAT_MAX)) {
+            feat_result =3D CPU_MODEL_COMPARE_RESULT_SUPERSET;
+        } else {
+            feat_result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
+        }
+    }
+
+    /* combine the results */
+    if (gen_result =3D=3D feat_result) {
+        compare_info->result =3D gen_result;
+    } else if (feat_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        compare_info->result =3D gen_result;
+    } else if (gen_result =3D=3D CPU_MODEL_COMPARE_RESULT_IDENTICAL) {
+        compare_info->result =3D feat_result;
+    } else {
+        compare_info->result =3D CPU_MODEL_COMPARE_RESULT_INCOMPATIBLE;
+    }
+    return compare_info;
+}
+
+CpuModelBaselineInfo *qmp_query_cpu_model_baseline(CpuModelInfo *infoa,
+                                                    CpuModelInfo *infob,
+                                                    Error **errp)
+{
+    Error *err =3D NULL;
+    CpuModelBaselineInfo *baseline_info;
+    S390CPUModel modela, modelb, model;
+    uint16_t cpu_type;
+    uint8_t max_gen_ga;
+    uint8_t max_gen;
+
+    /* convert both models to our internal representation */
+    cpu_model_from_info(&modela, infoa, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    cpu_model_from_info(&modelb, infob, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return NULL;
+    }
+
+    /* features both models support */
+    bitmap_and(model.features, modela.features, modelb.features, S390_FEAT=
_MAX);
+
+    /* detect the maximum model not regarding features */
+    if (modela.def->gen =3D=3D modelb.def->gen) {
+        if (modela.def->type =3D=3D modelb.def->type) {
+            cpu_type =3D modela.def->type;
+        } else {
+            cpu_type =3D 0;
+        }
+        max_gen =3D modela.def->gen;
+        max_gen_ga =3D MIN(modela.def->ec_ga, modelb.def->ec_ga);
+    } else if (modela.def->gen > modelb.def->gen) {
+        cpu_type =3D modelb.def->type;
+        max_gen =3D modelb.def->gen;
+        max_gen_ga =3D modelb.def->ec_ga;
+    } else {
+        cpu_type =3D modela.def->type;
+        max_gen =3D modela.def->gen;
+        max_gen_ga =3D modela.def->ec_ga;
+    }
+
+    model.def =3D s390_find_cpu_def(cpu_type, max_gen, max_gen_ga,
+                                  model.features);
+
+    /* models without early base features (esan3) are bad */
+    if (!model.def) {
+        error_setg(errp, "No compatible CPU model could be created as"
+                   " important base features are disabled");
+        return NULL;
+    }
+
+    /* strip off features not part of the max model */
+    bitmap_and(model.features, model.features, model.def->full_feat,
+               S390_FEAT_MAX);
+
+    baseline_info =3D g_new0(CpuModelBaselineInfo, 1);
+    baseline_info->model =3D g_malloc0(sizeof(*baseline_info->model));
+    cpu_info_from_model(baseline_info->model, &model, true);
+    return baseline_info;
+}
+
+void apply_cpu_model(const S390CPUModel *model, Error **errp)
+{
+    Error *err =3D NULL;
+    static S390CPUModel applied_model;
+    static bool applied;
+
+    /*
+     * We have the same model for all VCPUs. KVM can only be configured be=
fore
+     * any VCPUs are defined in KVM.
+     */
+    if (applied) {
+        if (model && memcmp(&applied_model, model, sizeof(S390CPUModel))) =
{
+            error_setg(errp, "Mixed CPU models are not supported on s390x.=
");
+        }
+        return;
+    }
+
+    if (kvm_enabled()) {
+        kvm_s390_apply_cpu_model(model, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+    }
+
+    applied =3D true;
+    if (model) {
+        applied_model =3D *model;
+    }
+}
diff --git a/target/s390x/cpu_models_user.c b/target/s390x/cpu_models_user.=
c
new file mode 100644
index 0000000000..df24d12d9e
--- /dev/null
+++ b/target/s390x/cpu_models_user.c
@@ -0,0 +1,20 @@
+/*
+ * CPU models for s390x - User-mode
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * Author(s): David Hildenbrand <dahi@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "qapi/error.h"
+
+void apply_cpu_model(const S390CPUModel *model, Error **errp)
+{
+}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index ec73bed524..84c1402a6a 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -28,9 +28,13 @@ s390x_softmmu_ss.add(files(
   'mmu_helper.c',
   'sigp.c',
   'cpu-sysemu.c',
+  'cpu_models_sysemu.c',
 ))
=20
 s390x_user_ss =3D ss.source_set()
+s390x_user_ss.add(files(
+  'cpu_models_user.c',
+))
=20
 subdir('tcg')
 subdir('kvm')
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 171ecd59fb..e4ec5e55bb 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -265,6 +265,8 @@ static inline void s390_cpu_unhalt(S390CPU *cpu)
 /* cpu_models.c */
 void s390_cpu_model_class_register_props(ObjectClass *oc);
 void s390_realize_cpu_model(CPUState *cs, Error **errp);
+S390CPUModel *get_max_cpu_model(Error **errp);
+void apply_cpu_model(const S390CPUModel *model, Error **errp);
 ObjectClass *s390_cpu_class_by_name(const char *name);
=20
=20
--=20
2.32.0


