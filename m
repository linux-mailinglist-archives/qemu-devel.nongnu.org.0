Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3C50C00F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:00:48 +0200 (CEST)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyWO-0001tz-2S
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLl-0000Tj-2i
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLj-0007tT-A8
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2tzE/02MCaSwB2Go0RbtCTiM2yjhoO24oCTmwipX3I=;
 b=CojZ8YztleNZUUbKoBojYvfJuHsugJz2H5oVQDqK1y17B8lluNd7CG2boHd0IrQ0X2kGVN
 QyRyLDZRMQCmxw9gRP6jnig88Xavaijht+MBfG+8TS/XyfqO8kVNrQjMlF4NcrTONj3quQ
 a2X2F/IgkoWaPNYEzgn9HwQLaBHd6rs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-To2zzA1zPBe0LcYaBBeEDQ-1; Fri, 22 Apr 2022 14:49:45 -0400
X-MC-Unique: To2zzA1zPBe0LcYaBBeEDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 539748002BF
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14FA41468940;
 Fri, 22 Apr 2022 18:49:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 11/12] remove sub-dependency pins from Pipfile
Date: Fri, 22 Apr 2022 14:49:39 -0400
Message-Id: <20220422184940.1763958-12-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we've got a Pipfile.lock generated that works, we can remove
the static pins from the Pipfile to allow various dependencies to be
added or removed as necessary when updating our direct dependencies in
the future.

So long as --keep-outdated is always passed to Pipenv, items that aren't
absolutely necessary to update will not be, which will help keep our
requirements more at the very oldest possible versions that still work.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 Pipfile | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/Pipfile b/Pipfile
index 595b83f..f44fd1e 100644
--- a/Pipfile
+++ b/Pipfile
@@ -4,42 +4,9 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
-avocado-framework = "==90.0"
-isort = "==5.1.2"
-tox = "==3.18.0"
-toml = "==0.10.0"
-six = "==1.14.0"
-filelock = "==3.0.0"
-virtualenv = "==16.0.0"
-py = "==1.4.17"
-pluggy = "==0.12.0"
-pyparsing = "==2.0.2"
-"backports.entry-points-selectable" = "==1.0.4"
-platformdirs = "==2.0.0"
-distlib = "==0.3.1"
-importlib-metadata = "==0.12"
-zipp = "==0.5"
-pylint = "==2.8.0"
-astroid = "==2.5.4"
-mccabe = "==0.6"
-lazy-object-proxy = "==1.4.0"
-wrapt = "==1.11"
-flake8 = "==3.6.0"
-pycodestyle = "==2.4.0"
-pyflakes = "==2.0.0"
-mypy = "==0.780"
-typed-ast = "==1.4.0"
-typing-extensions = "==3.7.4"
-mypy-extensions = "==0.4.3"
-urwid = "==2.1.2"
-urwid-readline = "==0.13"
-Pygments = "==2.9.0"
 "qemu.qmp" = {editable = true, extras = ["devel"], path = "."}
 
 [packages]
-urwid = "==2.1.2"
-urwid-readline = "==0.13"
-Pygments = "==2.9.0"
 "qemu.qmp" = {editable = true, extras = ["tui"], path = "."}
 
 [requires]
-- 
2.34.1


