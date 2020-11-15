Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923452B39F7
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:45:18 +0100 (CET)
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQlp-0000Tz-AX
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQX8-00043V-W8
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:30:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQX6-0001jh-6k
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zTT+QspY2RC2p8vFIONzBrHlF4S2EYY9M3J05nONmoE=;
 b=YF+nqasi+gOPh4F52c4AaLkDvc5Z0tqSfh0a4GbuPYsVYBS9JjpJ+kKfscj0MxpL+8lwsW
 Yf/T+ZsuyVu0MJHCvps/6pXHtFQ4SyHI6FYV8frlMQngKeGDdQpacXyiSqpI5J/WwwQ0o4
 L12HxPNAT7i7aVS6BMAcAL4mIxHD7fg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-kiIrGab5Mxyws4ec5Lwppw-1; Sun, 15 Nov 2020 17:27:40 -0500
X-MC-Unique: kiIrGab5Mxyws4ec5Lwppw-1
Received: by mail-wr1-f69.google.com with SMTP id e18so9854874wrs.23
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zTT+QspY2RC2p8vFIONzBrHlF4S2EYY9M3J05nONmoE=;
 b=QsUUvjMNwKth0smgx5SDf6XylZ/Z+fA3M7JneXGCqrTZYInHPspkIZKkJVXativkJ9
 wE4O5Jzl6tml7DkN+c4jJ+LG9O9chnZwaMcpmvEFJpiSLApPx5PVgx4sjjvGnTRXlBOi
 lSLiIG8bpeK3OqCuF/joHAYaQaZ54AU1iGJ3euSTpjyvmZ130ki8WkmxD3+PFmGjKptt
 BpmNMikYOXSKYO9hLzskmwKei9Q23Ot3992hFn7XSfmP38POAHasij3Y9KE/ba8NDELy
 rqiwaSt8jbOWdyT1VL/jHBfL5SSMqM4lrhltasK1nj7JNpgaUTwXAcipHvbnLGj3tu5O
 LvHw==
X-Gm-Message-State: AOAM5336+kwtJSpyFqDTMgeOGA5lu4P/aI2SR8bCpliEwCdr+utvt8F3
 Tfkm99OroYp0Ih/sMpmmUkUVJ5kz52lGy+c45xos4a+RlEDXDNaJ7M8FkYUJp6Y7NjvdL9iIhc+
 /h0MQPqA1jrXSXBAKvPRHov0p47bALQHz9QV4JN2rZWD8MEY85q+GZYzeZpJG
X-Received: by 2002:a1c:b387:: with SMTP id c129mr12182645wmf.58.1605479258879; 
 Sun, 15 Nov 2020 14:27:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDAjNpFaEpSUIaOmdiyt/vAJY33DSesloYMeHiqAHxxAeumfF6Rb4yIhJhC8WsKDcNwQvD1g==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr12182630wmf.58.1605479258660; 
 Sun, 15 Nov 2020 14:27:38 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id n67sm17534557wmf.25.2020.11.15.14.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:38 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] vhost-user-blk-test: close fork child file descriptors
Message-ID: <20201115220740.488850-11-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not leave stdin and stdout open after fork. stdout is the
tap-driver.pl pipe. If we keep the pipe open then tap-driver.pl will not
detect that qos-test has terminated and it will hang.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-6-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index f05f14c192..4019a72ac0 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -749,6 +749,15 @@ static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
                    storage_daemon_command->str);
     pid_t pid = fork();
     if (pid == 0) {
+        /*
+         * Close standard file descriptors so tap-driver.pl pipe detects when
+         * our parent terminates.
+         */
+        close(0);
+        close(1);
+        open("/dev/null", O_RDONLY);
+        open("/dev/null", O_WRONLY);
+
         execlp("/bin/sh", "sh", "-c", storage_daemon_command->str, NULL);
         exit(1);
     }
-- 
MST


