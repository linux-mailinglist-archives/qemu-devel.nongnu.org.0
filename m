Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B945236B6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 15:07:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSi0V-0008Ap-Jl
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 09:07:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hShn6-0006Z5-21
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1hShn5-0000pe-4k
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:53:20 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:45832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1hShn4-0000nV-Tj
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:53:19 -0400
Received: by mail-ed1-x544.google.com with SMTP id g57so23664304edc.12
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 05:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lcyudD+YHiLETyo03LrCcptJpEIAkkzDHtaRg2ZKb3w=;
	b=OVB/EfvfwJ1/ILkFnpEC5OB2F/wOeG1hojAYphm/Ivd7WGXP1ihEpnspUujdTDyg3X
	/8b20E5XBrCtdAfq9x6hxFqRBALr8sCnjwcgDoqMsSBd376IIh4sq0m66KNHX+RBTxnc
	e6Jo3X2+2Fyb4N8XD9scWoI1VD/LVoXShRcscrSTzPKbiG7rPqw4K1z2FAjKDTGgLj/x
	3a2KoittXdhexRxe5a1qG2Fl9Bm7htl6sv57uQm98nmhPHhdFu2y3WJy3jWDRfxnmc5I
	qC8xTtAoKweTZ57ihZXELZKxbkp3ir/RBlw7d9VW0+q27477zNdylsYdsVnjLAW1rzX6
	RUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lcyudD+YHiLETyo03LrCcptJpEIAkkzDHtaRg2ZKb3w=;
	b=JgdCX+5+uZJbZglgBfFroQbbZrxxtH9rQY3rt+e/aoYRYdVI4/Ve9E6it+dtBtHiti
	pZtO5JH06qqZWKKiALWzWZbLpBL4l00e2wXM2HBELhiAKwLu9VdDVLvrp1ieB24y8p3w
	juehHOxTbCxESN41+hoAfVj420xLiG9ysqaz/73OPLygMg4eRzumGtTOqk1VQ2+sDu/9
	7ayWOmDoD0C4RlErwTE5prGRegBs3bvW4TW4TY/SugyT8JWNn9FAoNyyFj38HM4q5etg
	Yvto/PShdP1s0XJjn4qteC0M0zuyBOmyB3VlJytvCLP4d+flP9nsR9scZk8bKQqxiEMX
	uN7w==
X-Gm-Message-State: APjAAAXwU6BQPQKwfy0wf2DbDlBb2ZdLQ6btlaoEqHw8yS/wXRrZllYG
	AHHOcTM/ifn6a2pt9G3OZUY=
X-Google-Smtp-Source: APXvYqxCujIXVXO/vtoL5p0ldOouXtOGTYmGzbX6YZ5Yuxns9vLdXnn6qTwc41bjyVST27kFyEjaGg==
X-Received: by 2002:a50:87ab:: with SMTP id a40mr73129497eda.188.1558356795070;
	Mon, 20 May 2019 05:53:15 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	c49sm5638205eda.58.2019.05.20.05.53.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 05:53:14 -0700 (PDT)
Date: Mon, 20 May 2019 12:53:13 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190520125313.wiiut3u7mkdedib4@master>
References: <20190515121544.4597-1-quintela@redhat.com>
	<20190515121544.4597-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515121544.4597-6-quintela@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v3 5/8] migration: Add multifd-compress
 parameter
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 15, 2019 at 02:15:41PM +0200, Juan Quintela wrote:
>Signed-off-by: Juan Quintela <quintela@redhat.com>
>
>---
>Rename it to NONE
>Fix typos (dave)
>---
> hmp.c                        | 17 +++++++++++++++++
> hw/core/qdev-properties.c    | 13 +++++++++++++
> include/hw/qdev-properties.h |  1 +
> migration/migration.c        | 16 ++++++++++++++++
> qapi/migration.json          | 30 +++++++++++++++++++++++++++---
> tests/migration-test.c       | 13 ++++++++++---
> 6 files changed, 84 insertions(+), 6 deletions(-)
>
>diff --git a/hmp.c b/hmp.c
>index 56a3ed7375..5732c34249 100644
>--- a/hmp.c
>+++ b/hmp.c
>@@ -38,6 +38,7 @@
> #include "qapi/qapi-commands-run-state.h"
> #include "qapi/qapi-commands-tpm.h"
> #include "qapi/qapi-commands-ui.h"
>+#include "qapi/qapi-visit-migration.h"
> #include "qapi/qmp/qdict.h"
> #include "qapi/qmp/qerror.h"
> #include "qapi/string-input-visitor.h"
>@@ -435,6 +436,9 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
>         monitor_printf(mon, "%s: %u\n",
>             MigrationParameter_str(MIGRATION_PARAMETER_MULTIFD_CHANNELS),
>             params->multifd_channels);
>+        monitor_printf(mon, "%s: %s\n",
>+            MigrationParameter_str(MIGRATION_PARAMETER_MULTIFD_COMPRESS),
>+            MultifdCompress_str(params->multifd_compress));
>         monitor_printf(mon, "%s: %" PRIu64 "\n",
>             MigrationParameter_str(MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE),
>             params->xbzrle_cache_size);
>@@ -1736,6 +1740,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>     MigrateSetParameters *p = g_new0(MigrateSetParameters, 1);
>     uint64_t valuebw = 0;
>     uint64_t cache_size;
>+    MultifdCompress compress_type;
>     Error *err = NULL;
>     int val, ret;
> 
>@@ -1821,6 +1826,18 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>         p->has_multifd_channels = true;
>         visit_type_int(v, param, &p->multifd_channels, &err);
>         break;
>+    case MIGRATION_PARAMETER_MULTIFD_COMPRESS:
>+        p->has_multifd_compress = true;
>+        visit_type_MultifdCompress(v, param, &compress_type, &err);
>+        if (err) {
>+            break;
>+        }
>+        if (compress_type < 0 || compress_type >= MULTIFD_COMPRESS__MAX) {

A warning during build:

hmp.c:1835:27: warning: comparison of unsigned enum expression < 0 is always false [-Wtautological-compare]
        if (compress_type < 0 || compress_type >= MULTIFD_COMPRESS__MAX) {

-- 
Wei Yang
Help you, Help me

