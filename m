Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C372954F8D4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:04:50 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Caf-0004r5-FZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliska@suse.cz>) id 1o2CYx-00047U-7b
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:03:04 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mliska@suse.cz>) id 1o2CYv-0003br-2h
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:03:02 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 685CC1FDE5;
 Fri, 17 Jun 2022 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655474577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dY4SqWj9zgyeFs7oxJJojcIC305s1RYaB9R9bSEcWj8=;
 b=B1x1Bbc/yBb6oxdyP8xyxyTy4ftpl+RODiizns6qCW+SA3FRj43vkdOCpiel167PisFgUc
 F1BGHgnHUT3tH8B38PIaYVgT9L5QhzB2F8/km52phc/XNykodEqlbo5RZ0YmwqbQAZF4K4
 nRREMlKzKz2otYN337CoSHmh4oG76lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655474577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dY4SqWj9zgyeFs7oxJJojcIC305s1RYaB9R9bSEcWj8=;
 b=1iaEUwWBopvu/vkdmf+zcuLEeKoG7EUX/Hq+Z/DC9nLUw+3XqXMZ+loZ+w/O/IJzmwvzVr
 U0dUZ242wWoY8tDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5284813458;
 Fri, 17 Jun 2022 14:02:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CgATE5GJrGJmJAAAMHmgww
 (envelope-from <mliska@suse.cz>); Fri, 17 Jun 2022 14:02:57 +0000
Message-ID: <e91e51ee-48ac-437e-6467-98b56ee40042@suse.cz>
Date: Fri, 17 Jun 2022 16:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: =?UTF-8?Q?Martin_Li=c5=a1ka?= <mliska@suse.cz>
Subject: [PATCH] sphinx: change default language to 'en'
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=mliska@suse.cz;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes the following Sphinx warning (treated as error) starting
with 5.0 release:

Warning, treated as error:
Invalid configuration value found: 'language = None'. Update your configuration to a valid langauge code. Falling back to 'en' (English).

Signed-off-by: Martin Liska <mliska@suse.cz>
---
 docs/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 49dab44cca..e33cf3d381 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -126,7 +126,7 @@
 #
 # This is also used if you do content translation via gettext catalogs.
 # Usually you set "language" from the command line for these cases.
-language = None
+language = 'en'
 
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
-- 
2.36.1


