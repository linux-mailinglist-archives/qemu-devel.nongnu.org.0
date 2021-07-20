Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A53D0459
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:15:04 +0200 (CEST)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5y11-0007Pe-P2
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5y01-00066w-DY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:14:01 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5xzz-0007DX-TQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:14:01 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BEC72244E;
 Tue, 20 Jul 2021 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626819238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=exs6pdXfv5k6hCFZOVPpnvwpsns3AeAKJX/jFRg3Jm0=;
 b=QFvTqDEIndGVcGLh3vCOkImvfGF1FBELiWUg/J48ldvZtkhMYlLqfhFO45wgUPzoZUohDg
 LrsGiFHIIxl26nuIsLS+5XDgdXKDOxPBX1VHHguKe9smyATWEWhNkT4Ufd8jfutMICjOBb
 7mUnBaJ1jKrCQTetWOEzIlEEvBXlLgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626819238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=exs6pdXfv5k6hCFZOVPpnvwpsns3AeAKJX/jFRg3Jm0=;
 b=SwVvZbWWgxRDfl1POnK2ikjkjvbLUEKMRkgoD/jj6PTun4Omhl9wImrnArOYRFD7+xXhJL
 GVsInUXNAVXjxnAw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EF43113BAB;
 Tue, 20 Jul 2021 22:13:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id VPUVLKNK92DjEQAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 20 Jul 2021 22:13:55 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] 
Date: Tue, 20 Jul 2021 19:13:50 -0300
Message-Id: <20210720221351.13354-1-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUBJ_ALL_CAPS=0.5 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 richard.henderson@linaro.org, kraxel@redhat.com, pbonzini@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

This patch gives the ability to build TCG builtin even if
--enable-modules is selected. This is useful to have a base
QEMU with TCG native product but still using the benefits of
modules.

Thank you!

Jose R. Ziviani (1):
  modules: Option to build native TCG with --enable-modules

 configure         | 12 ++++++++++--
 meson.build       | 11 ++++++++++-
 meson_options.txt |  2 ++
 3 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.32.0


