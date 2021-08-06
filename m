Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDA3E3232
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 01:50:35 +0200 (CEST)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC9bl-00073T-VI
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 19:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gsoNYQUKCl0NOH5JBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mC9ag-0005M6-Ab
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 19:49:26 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:36390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gsoNYQUKCl0NOH5JBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--stmao.bounces.google.com>)
 id 1mC9ae-0002su-33
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 19:49:26 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 q9-20020a05620a0c89b02903ba3e0f08d7so7496339qki.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 16:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XqtZouX1dsK0xt45rvjPAiwNwuBYfTyHPKY1ulqPTHQ=;
 b=IxYduGmb/iRg2VKUziNtsrYOhCUqJ/g/WsB1BWUCEoiHskwJpxuWWYRzmJuyA5RApz
 r+dFXdZSOW4J0T7xxWgSf+sd0/CEUc6Fkw0K5xmFKQkmVS7lRSoXxaR6r592M1qjWuMV
 tNmyu0MBjRzORnNOus8NgRCmGo41mDplm7icx8/vfpPELjArnJzUXwN1mE2Rsh6GvNgO
 saNn41p/MRpKf4WWor9MAm5NVJk24OpCCoA2NO6z40i6k9TxIH3LC2C5gaD81F3onzVG
 zZuqlypernJBI+P05G7R32iZEfx6d39EWGPgEhTw/2cgxmYfOFRXa30NBY4hzFx3+h0y
 gRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XqtZouX1dsK0xt45rvjPAiwNwuBYfTyHPKY1ulqPTHQ=;
 b=owFjPN2k7rwUNdrfJZ/imgNGaUnwBSKq6us8Cff77P2s2qbUhe++mhKLnCoXQhb7eM
 qvyFhpp8to9rdfisAo9t2nxbpYGM7PqHmJV2yJt/Y9qx7aM9ULalvy9no303AHGx+Wp0
 n3bPC8pfIoB2guMmakVEGE3b/+Lyb72ITYqfyB/pDphx68ezZcrb1w0IoekS2FJv8hPo
 Ql1OasVCGU5Q7f0u19Gs1/pWguGXGMJ83okwQj67vB5DUDXOx/yID6BjcfsuI3KGiBH9
 ND7r9mrKBW5NO6QSOq0xbZaiPjXVM60QXWOTwCFh5q4TilaYkvfJbevukHyWohw15KDU
 QjgA==
X-Gm-Message-State: AOAM532mDieltHibQsiTH4XBT9EObEGPYfOlKnhPj3ZmJx+950QHSlFy
 nDBI05+MmD54GKjMHb7sObhJiLIGsA==
X-Google-Smtp-Source: ABdhPJz1NaT5aPj9HWxVvPjfjR5+klEEJTj801tF03jXnQXchAvagY8LLNIA3XKwR2jFV7RRn7IS494Jgg==
X-Received: from smvm.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2d5f])
 (user=stmao job=sendgmr) by 2002:a05:6214:226b:: with SMTP id
 gs11mr191005qvb.36.1628293762886; Fri, 06 Aug 2021 16:49:22 -0700 (PDT)
Date: Fri,  6 Aug 2021 23:49:18 +0000
In-Reply-To: <20210806234918.122457-1-stmao@google.com>
Message-Id: <20210806234918.122457-3-stmao@google.com>
Mime-Version: 1.0
References: <20210806234918.122457-1-stmao@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v4 2/2] docs/specs: add remote i2c docs
From: Shengtan Mao <stmao@google.com>
To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, venture@google.com, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3gsoNYQUKCl0NOH5JBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--stmao.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Change-Id: I4ef1e31c326dbb4f741bf65d9212ff10fc3c98c3
---
 docs/specs/index.rst      |  1 +
 docs/specs/remote-i2c.rst | 51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 docs/specs/remote-i2c.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index b7b08ea30d..ac496fb8b8 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -13,3 +13,4 @@ guest hardware that is specific to QEMU.
    acpi_hw_reduced_hotplug
    tpm
    acpi_hest_ghes
+   remote-i2c
diff --git a/docs/specs/remote-i2c.rst b/docs/specs/remote-i2c.rst
new file mode 100644
index 0000000000..7f3b1e46bb
--- /dev/null
+++ b/docs/specs/remote-i2c.rst
@@ -0,0 +1,51 @@
+=================
+Remote I2C Device
+=================
+
+The remote I2C device is connected directly to the I2C controller inside QEMU,
+and the external I2C device is outside of QEMU. The communication between the
+external and remote I2C devices is done through the character device provided
+by QEMU and follows the remote I2C protocol.
+
+Remote I2C Protocol
+===================
+The remote I2C device implements three functions of the struct I2CSlaveClass:
+
+* event
+* recv
+* send
+
+Exactly one byte is written or read from the character device at a time,
+so these functions may read/write to the character device multiple times.
+Each byte may be a command or a data byte. The command are outlined
+in enum RemoteI2CCommand. The protocol describes the expected behavior
+of the external I2C device in response to the the commands.
+
+event
+=====
+A subset of the RemoteI2CCommand corresponds exactly to the enum i2c_event.
+They are:
+
+* REMOTE_I2C_START_RECV
+* REMOTE_I2C_START_SEND
+* REMOTE_I2C_FINISH
+* REMOTE_I2C_NACK
+
+The event function of remote I2C writes the command to the external I2C device.
+The external device should call its event function to process the command as
+an event and write back the return value to remote I2C. This value is then
+returned by the event function of remote I2C.
+
+recv
+====
+The recv function of remote I2C writes the RemoteI2CCommand REMOTE_I2C_RECV to
+the external I2C device. The external device should call its recv function
+and write back the return value to remote I2C. This value is then returned by
+the recv function of remote I2C.
+
+send
+====
+The send function of remote I2C writes the RemoteI2CCommand REMOTE_I2C_SEND
+followed by the data to the external I2C device. The external device should
+call its send function to process the data and write the return value back to
+remote I2C. This value is then returned by the send function of remote I2C.
-- 
2.32.0.605.g8dce9f2422-goog


