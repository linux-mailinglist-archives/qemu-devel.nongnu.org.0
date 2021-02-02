Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183D30CD87
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:02:45 +0100 (CET)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72ou-0004Fh-6z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lK-00029D-9m
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lH-0006u2-Te
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rv5my3HSU2RkuIlLbBGZUl/Fhu0zFPDOiXMImWA+5ZI=;
 b=UYZUm1IdOn7QkTfOTANlNI8MgI1gX60BPiG6MjgW4cqthlAyamLHIAVxbC+yMye6K68suF
 bMOFGY/VW8PgcRGKm3/qYGb4BuudTQdkWvSa/vIdZxbKe5ioOkldqVyZCYQ3NSHHLglvPv
 Qb4wrZBhha8gQT9d6yxZvHIOEOpuCBc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-edoxJaRROkOABoTBQOXi-Q-1; Tue, 02 Feb 2021 15:58:57 -0500
X-MC-Unique: edoxJaRROkOABoTBQOXi-Q-1
Received: by mail-wm1-f72.google.com with SMTP id s10so1237397wme.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rv5my3HSU2RkuIlLbBGZUl/Fhu0zFPDOiXMImWA+5ZI=;
 b=bBC1Lv2rXVb3F4Ql19lovR5obMIPNhdPCspX8DHWExtGO/BoKMfSyU9JGTKuPiZAim
 rzWT3AyBBxR6XyB+VRXLRjsLa59MqhXdWe/YkfmOBJKuPI8GCCdl+Ij4kKFUrFk+BEfj
 dpP95gCy2LZI3S3z647f4RBF6R4V8Hgkr5s/BE6P3InT9kNivlDyJqp26sMTO54APSKj
 k8lxWn83y9dwov/3QxyOSQ7Oc9p8clf+teFOkycWl50M3+haJJFwzjkvGISN5P/F9r67
 AMbBoSYuBGb/YfixEAyRwYRYA6vyaOCBi/UGGE6+izNUCaA+zDNAyXhzaYQMJN5JcV50
 Nzfg==
X-Gm-Message-State: AOAM5334uq5mGlo/Gk0SC744gEKTsdwgE5qK9NtQOwblExNM4wJIKoZn
 n/aYzJTe8cR6shLbxzm4w4Zurndb7VGcGFjxhObA+4Q9fxD8rMaw0mxSU0kUq9g+glTya5soGKm
 qI8bK8JJQumqEpZc+GqDpZTUJaz1iP6AE40QmLrjrhrgtypbAE8clIXJFzWSqBqOv
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr5458547wmf.150.1612299536404; 
 Tue, 02 Feb 2021 12:58:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmQ06aMoRrIgRRrbMW/I6RMZgQD04A5Ja2YIOdLOi8cQzOd1xcgkLTgGTPUpM8KDc5bLFOww==
X-Received: by 2002:a05:600c:2281:: with SMTP id
 1mr5458524wmf.150.1612299536146; 
 Tue, 02 Feb 2021 12:58:56 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id b3sm5776109wme.32.2021.02.02.12.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:58:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/12] qga: Replace '--blacklist' command line option by
 '--denylist'
Date: Tue,  2 Feb 2021 21:58:15 +0100
Message-Id: <20210202205824.1085853-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

Keep the --blacklist available for backward compatibility.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/interop/qemu-ga.rst | 2 +-
 qga/main.c               | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
index 9a590bf95cb..89596e646de 100644
--- a/docs/interop/qemu-ga.rst
+++ b/docs/interop/qemu-ga.rst
@@ -79,7 +79,7 @@ Options
 
   Daemonize after startup (detach from terminal).
 
-.. option:: -b, --blacklist=LIST
+.. option:: -b, --denylist=LIST
 
   Comma-separated list of RPCs to disable (no spaces, ``?`` to list
   available RPCs).
diff --git a/qga/main.c b/qga/main.c
index 249fe06e8e5..66177b9e93d 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -257,7 +257,8 @@ QEMU_COPYRIGHT "\n"
 #ifdef _WIN32
 "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
 #endif
-"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
+"  --blacklist       backward compatible alias for --denylist (deprecated)\n"
+"  -b, --denylist    comma-separated list of RPCs to disable (no spaces, \"?\"\n"
 "                    to list available RPCs)\n"
 "  -D, --dump-conf   dump a qemu-ga config file based on current config\n"
 "                    options / command-line parameters to stdout\n"
@@ -1111,7 +1112,8 @@ static void config_parse(GAConfig *config, int argc, char **argv)
         { "method", 1, NULL, 'm' },
         { "path", 1, NULL, 'p' },
         { "daemonize", 0, NULL, 'd' },
-        { "blacklist", 1, NULL, 'b' },
+        { "denylist", 1, NULL, 'b' },
+        { "blacklist", 1, NULL, 'b' }, /* deprecated alias for 'denylist' */
 #ifdef _WIN32
         { "service", 1, NULL, 's' },
 #endif
-- 
2.26.2


