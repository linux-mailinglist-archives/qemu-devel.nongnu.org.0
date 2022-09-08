Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D185B1A3F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:43:06 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEzx-0005f1-Sn
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oWEuZ-0006pP-Oq
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:37:31 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:48050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oWEuY-0004Un-7Q
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:37:31 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 796DC2E11B4;
 Thu,  8 Sep 2022 13:37:13 +0300 (MSK)
Received: from davydov-max-nux.yandex.net (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 U3HXU6koyH-bCPS5l6f; Thu, 08 Sep 2022 13:37:12 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662633432; bh=4rKmXz6j1gueI6IV7cJLrTPo/xqBsha99cjqUz/yiq8=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=gr99usYumA5MQTulHFSvzIhBCj4Dz7gNwRhlZ3e1aCVpoas2wvj7wQgLx+bU9G7p4
 BGJYe+/LvgsPx20X2OBdntIAKdUbMLQxexc4VuCAKBVlUUR6HHv9IdQP3bXyBZTySy
 oIIhdvujog6DG3/ksXn/j5ReK36OnaixloqUHAYg=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, yc-core@yandex-team.ru, pbonzini@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Subject: [PATCH 1/4] qom: add devault value
Date: Thu,  8 Sep 2022 13:36:47 +0300
Message-Id: <20220908103650.9518-2-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908103650.9518-1-davydov-max@yandex-team.ru>
References: <20220908103650.9518-1-davydov-max@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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

qmp_qom_list_properties can print default values if they are available
as qmp_device_list_properties does, because both of them use the
ObjectPropertyInfo structure with default_value field. This can be useful
when working with "not device" types.

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
---
 qom/qom-qmp-cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 2e63a4c184..1d7867dc19 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -217,6 +217,8 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         info->type = g_strdup(prop->type);
         info->has_description = !!prop->description;
         info->description = g_strdup(prop->description);
+        info->default_value = qobject_ref(prop->defval);
+        info->has_default_value = !!info->default_value;
 
         QAPI_LIST_PREPEND(prop_list, info);
     }
-- 
2.25.1


