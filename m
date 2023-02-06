Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF1C68C91D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9eM-0004Y9-0o; Mon, 06 Feb 2023 17:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eJ-0004XU-KO; Mon, 06 Feb 2023 17:07:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eH-0007HW-Ot; Mon, 06 Feb 2023 17:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5x2upo3sM7EDddt+m8vnfXrN/Cm/SQ02jTxCtm9yl80=; b=YvbO95ztXPqXvBni+t0v6HJuKw
 5RVuIfy/l++vmFZuaTdITiJuy99GGIvBft3yY0gvPgl3a7iLv+BILHIx04dMYpMNbp/Pep+DPKsK5
 PgNRrlTnmlpmUaT1cUXA4+Rr9QVk4O6H/kMrIKyTfiqX5HyHfACBAb0YH1AGLwD6cSGF1fuinw6np
 Tisi8/f1G0+bbpFcEPgqN63RtddHGF7GB64Z5o1Jz45VVSSbZk+fk3DeJWVXf7YAUmalVPRIcRQrQ
 GIBZu5P85gP5VKrRfN3GXsBfESFg/ZONy2PqDoDJVXMFiDEALr3StWB+GDiRtuar0HxMRdWd1t3mj
 pY1N8qsiuQW9K329gA/5Xj1RyoFBQ42Dwzsw+JUUTWGlAn/ZpurPh5ZlujmCydyYR58/pWD+7M6n4
 q97Itribl7XBH28/AQMmshFts1u7b8SuXV36DcC/hCjWW0anAdpxmOB6TRq5pywWcRU9B3sEmhZ2t
 0e6bBQfBOcspeNOGS/NpEaOvwUwBcuQ5SGPPnKapIPnZfE6gthfWNMRoLCbc0JQDP39I+hogjMXlu
 K759fYHpDjzBTU0CqdtGSfAUOQIs9CX4WI3U23MkoxOZXiPWY6wvAPcNmWXfpDxM+IyV4+U1vE7l9
 1QbkrJyEIjD9MPqntq7ajX72XYFpeEh+/3CSFnSEo=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9di-00039N-4S; Mon, 06 Feb 2023 22:07:10 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:14 +0000
Message-Id: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 0/8] qemu-macppc queue 20230206
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b:

  Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into staging (2023-02-05 16:49:09 +0000)

are available in the Git repository at:

  https://github.com/mcayland/qemu.git tags/qemu-macppc-20230206

for you to fetch changes up to 5df3eb4d361fd609632281969b101f4f84f1c4d8:

  mac_oldworld: Allow specifying nvram backing store (2023-02-06 11:41:39 +0000)

----------------------------------------------------------------
qemu-macppc patches for 8.0

----------------------------------------------------------------
BALATON Zoltan (8):
      input/adb: Only include header where needed
      mac_{old,new}world: Use local variable instead of qdev_get_machine()
      hw/misc/macio: Avoid some QOM casts
      hw/misc/macio: Rename sysbus_dev to sbd for consistency and brevity
      hw/misc/macio: Remove some single use local variables
      hw/misc/macio: Return bool from functions taking errp
      mac_nvram: Add block backend to persist NVRAM contents
      mac_oldworld: Allow specifying nvram backing store

 hw/misc/macio/cuda.c         |   2 -
 hw/misc/macio/macio.c        | 167 +++++++++++++++++++------------------------
 hw/misc/macio/pmu.c          |   3 -
 hw/misc/mos6522.c            |   1 -
 hw/nvram/mac_nvram.c         |  28 ++++++++
 hw/ppc/mac_newworld.c        |   3 +-
 hw/ppc/mac_oldworld.c        |  11 ++-
 include/hw/misc/mac_via.h    |   1 +
 include/hw/misc/macio/cuda.h |   1 +
 include/hw/misc/macio/pmu.h  |   1 +
 include/hw/misc/mos6522.h    |   3 +-
 include/hw/nvram/mac_nvram.h |   1 +
 12 files changed, 114 insertions(+), 108 deletions(-)

