Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47E9401020
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:17:35 +0200 (CEST)
Received: from localhost ([::1]:56906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMsxi-0003LX-Jo
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mMsqK-0003rn-VZ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:09:58 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mMsqI-000788-CN
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:09:55 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 425DF20787;
 Sun,  5 Sep 2021 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1630850989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fY8kNs7ppq0GLwT8JV4132+OVKvLEDFzph4aJ8wV9rY=;
 b=aVxGUTWG6tFWZyoqVi2tpP3MsmezqhAVbocN7vLWhck0hpCQPZTa2N/a/NljKOuaBo8KQW
 0FwDxrhCnGnGNEpa+ps1D1va+H3kX7lWedQoz8MJ/5VVcXi/907xy/k+pnk4OKvwbAXL9u
 b65hYq7JRNztVp0viy2gijKR4WD32EQ=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Add missing function names to symbol list
Date: Sun,  5 Sep 2021 16:09:38 +0200
Message-Id: <20210905140939.638928-1-lukas.junger@greensocs.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.junger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

I have been trying to use the hwprofile and cache plugin on
qemu-system-riscv64. They failed to load with an undefined
symbol error. It looks like some of the plugin API functions
are missing from the symbol list, so I added them. Afterwards
the plugins worked (eventhough the cache plugin is segfaulting
on shutdown, but that is a separate, unrelated issue).

Hope that's okay.

BR,
Lukas

Lukas Jünger (1):
  plugins/: Add missing functions to symbol list

 plugins/qemu-plugins.symbols | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.31.1


