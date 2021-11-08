Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513AC4499BA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:29:45 +0100 (CET)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7Wi-0003JD-FV
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7M6-0002E9-UI
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Lv-0000st-AU
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDng3rtDhMlL58W7zS3aIpWMI+GR3niTjki+q/as+es=;
 b=JTfC/yEvoWJ2qjqjngesBw70ZoDTks+Tf35e5mAqJN5BhDH/G7tIEcP64YpdV+QP/1bEbl
 u4dtRYQMLnv38az3V+SXZXZTMdhUpMgnwOsTQqK6ns6QU1usyrF24heedXy/CkLjL9hhOW
 0kzaNulTPgTzQI7EsbEj/TiSI9OYgfE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-IEtyXrj1OCyFwuoLXY2TCg-1; Mon, 08 Nov 2021 11:18:32 -0500
X-MC-Unique: IEtyXrj1OCyFwuoLXY2TCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so61104wmq.9
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yDng3rtDhMlL58W7zS3aIpWMI+GR3niTjki+q/as+es=;
 b=RxZKN8G49y+LpYBjAV/v/glKKt/pwohkrWdm0vnrJkU4e+0zpaPmdf+MUtscYXqsXx
 WUS97AFTQr9BSFS3tIwbhZJAiseqGCPnkbT0N0P2pALRK+wzL7jLIyN0Fo6vZIr8oG0k
 EzCqFi5UxpX2M6T/mc74Y6Boq6b4TTmgDhJNK52t2Xx2Ajam1KtOuKfO/clSbT70WZvE
 NzhejfsWUEX3QZXm6+DttIYH4cOT7urDCA+yRrWKrBzx2cBtptbtwMZdyfu0xDrCE6d3
 EgQiCHN7ZcHJ7IjjE4oV7f2mKYguqKYjwiZB3cBWuKkF9CQzk7T6XQfTpkthJJlmU5BF
 ZgQw==
X-Gm-Message-State: AOAM532TP1LaLok9CasxHNT/EpYHUY7WcnY+rs/XtdAbtk2/B7bBBW7u
 c0Uu7BntxWp5p5B2VHUJuQ87O4+3mZNgwznrEAv+955fU0fMnPioqWd7ThjHW6NWd+x+XuxJF4j
 uEj0WSKfRlnjHFpV9Ubl9iQF96ugLzPOK9cQqKESezE6ZF9LZFEy+YoPCeBHGbgvK
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr37706041wmf.185.1636388311136; 
 Mon, 08 Nov 2021 08:18:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS4x2ccmdc2bTTksQ4uzVFFnLKQv0NUl6SHBnXoPxon/E4TqvzPGHPWxUKsCaDtXXkF+iL+w==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr37706019wmf.185.1636388310973; 
 Mon, 08 Nov 2021 08:18:30 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id z7sm19519765wmi.33.2021.11.08.08.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:18:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] tests/avocado: Remove p7zip binary availability check
Date: Mon,  8 Nov 2021 17:17:39 +0100
Message-Id: <20211108161739.1371503-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108161739.1371503-1-philmd@redhat.com>
References: <20211108161739.1371503-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single use of the 7z binary has been removed in commit a30e114f3
("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
we don't need to check for this binary availability anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20211106091059.465109-1-philmd@redhat.com>
---
 tests/avocado/boot_linux_console.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 4ed01ed7893..9c618d4809f 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -22,13 +22,6 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
-from avocado.utils.path import find_command, CmdNotFoundError
-
-P7ZIP_AVAILABLE = True
-try:
-    find_command('7z')
-except CmdNotFoundError:
-    P7ZIP_AVAILABLE = False
 
 """
 Round up to next power of 2
-- 
2.31.1


