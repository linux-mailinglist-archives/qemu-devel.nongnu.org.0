Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26138DF86
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 05:05:07 +0200 (CEST)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0tu-0000gM-U8
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 23:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jR-0007og-1w
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:17 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0jK-0003cD-Sq
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1bD8lbroU7w0T6aZeqbMpc+mUEYl6AsIsKGoTnKAbU=;
 b=jFxEvbd5F2o5KO3RMIRk2Exj1EbYPVvE/jJnSf3oiuvPT3rjiKKyLtj53XcUNW7qrV5zu6
 /t/sqvfB+FMrDLnFYoJvI/0NP+vNhXFFTJYvlArPe5pzj6TbYjwZ6C9S62rqz5xU5QLu3o
 x+Segvz0Wxe7LCGYZ0L0eY+o8gQt5pQ=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-QQIClprDMPWUQRMXEecM-Q-1; Mon, 24 May 2021 04:54:08 +0200
X-MC-Unique: QQIClprDMPWUQRMXEecM-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqQrqav8cpUfZ9Pf8cFRsHbMwbJBlkFFzdG9T7C/WOnk1EFZ9bRi2ZC3EQaj5YoM1Hz3Tz9zpPewvj7eCGt4Q5ycEbMRawJgtYxHFOEdJC2C8xwUr1w+TjSwW173m0bngdqSyPTTrJ4ovK0ooNIyasL7yKW0wNEP0NGGfeeq6GSOebI3nir7HZYfzM+nZhFustDDZQ8q3NoWM42xZ0ZsPd+x33so3nwzoUzNBrLqdILumSvJnp353ZpdWrHwIzFPLQbX3TiiE0nG5B1VfPJzlurElvn3naTAygIIRqLNjuZsDh805hEfeeRTwssFJcenjJ+KqRu15n0IIkzRQ6Tk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38RfK1UhrPpqfBfWGuwnrNO07s5HZTRpLK41BNjEM9o=;
 b=ShxuUl7LVkGMS1vNjuzyUVDAGwIb5ZAs1xp83TIlGvtdgPANH9tdnwXUcnLVescceiXgdW0N7mdmW/xxeA8nEhII6f9I3LqvUPkxPnRUmzZJkO25NtySd2Pjmm9w/Gvn/5RrH+5gQ/DJLXMoqzptkWJwBwhrkIQ+5CB1n5OShQeFSXYpUq8FXk06c3hGXFdg1heAezrHK1dinBmqmpS8k1h5PkQTFCwA7IZQQme/d33go3DXCdmD9Ie+oZIe8uJwvl7Nd+RFkmMIKwrW7BsU/iafbO80Ubmhss4XG6U9TsbxyyMh99aIqMAT3YErYFOmOiCqxh2ZqIP+j6oh438Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:54:05 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:54:05 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 13/14] target/s390x: split sysemu part of cpu models
Date: Mon, 24 May 2021 10:52:55 +0800
Message-ID: <20210524025256.22252-13-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:54:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b80dcff-d0dc-4f86-2992-08d91e5f3177
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126435B951D1823F6FFC5EAA0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJffCREKytIbaPBnBr5+HjykD/mlfy3Wh8MqP1HRLC4PiY5zgyWHc29J7KjrPxQl726szjrScqDep390TErMsn79JVNBQLa3j2QA3EKuzTtVEJ4wmYuB1uDiAobmuSatpBHoEI3SYMmBDU+VmXiD1JAYC2qisaw562wTr9IqnZHwCFk2R58vAg5PEUs+2vt3xK/Umsu2UkHGAZvgZSTYHhb3qo8i/Cmmq5OazCWFj5Mb05o4+8Z/GgtiNygOhj/f1LkALixZB+7KrQcVkz4z+5t3vaCG28lKkhiZCIpWn+kj9t/6Hk3c4gYlpCvUe6tGYsbrECxv0J56BM9KEqOJWNCTw5uPGxfg0fx/j9/AX6FttL+/F3uuwbGtS0wZxIYUdAeGr9wdi/0ohtTlruxZy34e7ZDrp+L9gEB8qJ3N+lPKUwnIbxRLsKy160biKm/mwEA65FH0zJ2CbuTrbDmZk3I+HmjHzE2NdRD+Q30q1xF/IWfUeQILpRgb8oCIUgIeIDdL2bjoE4L02/LpaG7tO5h272btkjNF15CfQgirQb71xFz4/lLg1zSZGNgvyNT63UcNIiPkjCVJ1hoTKZMzIXUis0xPsetxzDKaVF0j4E3pnyKxjWM7JFVyfFS+SYksehRAWAEbOrgkf6TbF6vXZC//mPsMrGtqlaM9ixQjcutHXebc2bRt6UQFBMPcb04pG6LSCVZ+aZvDxyCw5Cf8bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(36756003)(316002)(66476007)(38100700002)(8676002)(38350700002)(86362001)(52116002)(478600001)(66946007)(8936002)(1076003)(2906002)(956004)(26005)(6512007)(30864003)(16526019)(6506007)(186003)(83380400001)(2616005)(6666004)(4326008)(7416002)(5660300002)(6486002)(107886003)(66556008)(69590400013)(170073001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Uxu3ewycjKWZMTCIeCX1IIXZCV/stS+/LbGc7mOybUh+qnITrqACutnWLMGH?=
 =?us-ascii?Q?ARk+d67tgGqV6NAESFNb8Up9brbZTNbUX0HwofTLTIjisWDvTno7mBD8GCMA?=
 =?us-ascii?Q?x0t9FXJC8Df1onyGivwSAYQFPOJBSVRxTDdg6I9APQq05rDm4MGUcJYA18Sv?=
 =?us-ascii?Q?8FyeYc2dr3YHYqblvhqsL5XyA4jrFqi9DJ+zgkK5TNXUNKkE+FdGXbSS3vtw?=
 =?us-ascii?Q?eVND4cehZ+rJY6YV9iKZ9srRK5D/1i5VTIEqgD30hqKRW6Yw620Ta1GrheiA?=
 =?us-ascii?Q?zldCTazf6pwbeiRpi3WqFlI4g9A3RmwyW9Vr/ofCNhj7DDst8p9m0wL+5INq?=
 =?us-ascii?Q?cLTNMLNsu8mXPKxqrR6FrsHxwQAbHn6UxPePM6uWiL7QFgn04Cdu9OmuCOEc?=
 =?us-ascii?Q?uQUp3V6skJwN5bWv6aoy7yxC/M9fOfckFCxHlffwEmvP2pwmaAZ6E/+jbowO?=
 =?us-ascii?Q?kBfmo/L7hoNyj64REb61xp94h+WeGltWWI60vs8qBTFq0e1ek5s+mckg5UTz?=
 =?us-ascii?Q?JKH/mIpiOs7jivadVQT8VE1iLY9jFdVBxM0IyjRtg4cHC5kPSgD6OT3CJA43?=
 =?us-ascii?Q?u3Bd8YuWC112fj2skBLXgNk0xoT14aRyti4XCKH8ms4OoEXxlE4kuvpmh8Xo?=
 =?us-ascii?Q?AZ5QnobitxF4GTQpNuiZwXDD0POunK+BiFYdFJ7ZGdLRWOtwPnxERjF4Zk4/?=
 =?us-ascii?Q?/067YllSkt2dvOy4seksNV8ScKeXHSI+VUPzMST3jUqB+TutJAYGLK63HgnZ?=
 =?us-ascii?Q?rC9lRWSEIh5FDmuDLpyVphFxDLFPykB3JYpmjG2UsK/E+UpVmeGDP/Xb4hZM?=
 =?us-ascii?Q?kaut+y6BAwmQmyy4GQP0kIv9g51XHMlWwIzcK97RBonXML4IZg8L9R32faff?=
 =?us-ascii?Q?9iNYbqiF1i+MG4HC8Qb2oDJQI3dkjtgTrUhcS8vx7eB9FsgKZoNWPcgPxyx3?=
 =?us-ascii?Q?Mx1X7nUzIKTyNg3mTFJ5B+MzE1Nh2guMQnvFtcQxN0ERCbAWlPMCcnKOwhZF?=
 =?us-ascii?Q?0DjCPG8iM+3RArF57pH7cPg6ssCo3gS8eCKjrD2rYWttatFeWX9WSW9pFyXH?=
 =?us-ascii?Q?vern+DQ//vzxE16isUuW9MIzgJABDo+qD71/Zluy1HNyRyLpMd+s0FdSO2IQ?=
 =?us-ascii?Q?eqCp+XlRd4etjpx4vUWhWdiqk2kAW+Y+MuU5G2gYLOAYV62/mOjmc2hj/DeD?=
 =?us-ascii?Q?79/mpXP6O0Lo39XgVda5atyU8XMQx8+dFvLr2RX25PxslpCz+Tyc1URMdyze?=
 =?us-ascii?Q?XzFvxyOvBOdryD0KVImoGbUzxoZikPm+G7tcJdGJE9i4rsPyEk5CJKT5bySN?=
 =?us-ascii?Q?+JthKxDBHEcafASIkH4lfUTg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b80dcff-d0dc-4f86-2992-08d91e5f3177
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:54:05.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2SbpsBEnol1PAkPYXHSIMVVM+1ZLZGtM7pk0Xcv9yz00I7wlwy+e0Vtn98Fgaqd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
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

also create a tiny _user.c with just the (at least for now),
empty implementation of apply_cpu_model.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 target/s390x/cpu_models.c        | 417 +-----------------------------
 target/s390x/cpu_models_sysemu.c | 426 +++++++++++++++++++++++++++++++
 target/s390x/cpu_models_user.c   |  20 ++
 target/s390x/meson.build         |   4 +
 target/s390x/s390x-internal.h    |   2 +
 5 files changed, 453 insertions(+), 416 deletions(-)
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c

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
2.31.1


