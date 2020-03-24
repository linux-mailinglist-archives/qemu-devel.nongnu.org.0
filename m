Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80441917A0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 18:31:03 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGnOI-0001dC-S5
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 13:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1jGmoK-00064o-Ob
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1jGmoJ-0002eo-QA
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:53:52 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>) id 1jGmoJ-0002eU-MI
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:53:51 -0400
Received: by mail-yb1-xb33.google.com with SMTP id x63so9530376ybx.2
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZGYIL2rqF2T6FtQL+8Y3D7X7iQJLL9+ey7r6yaKFq4=;
 b=bnvckj4eijjAchZuVR2iwSPdNl+Na2EGXQ7USWzj1MlJsmWerWntSp4uTTN/bzMXo5
 XcwWYMBur3xbprhRceR2Pz3U6hBDEfs222HgZhbOL9M4Jb+0JuF+5J+alGbYWOpjklqY
 5rQb/GK4UTibLS+udVVrttFvDgvLLUxABQyByN85W35rEy8uNU/KwlrE4OSleiZh7+e8
 gm+pMO1KNsDTMGD8ukriztvalvXMMbgf9NCDFiOkM/d2rCd9eAdKe3yXVKcGS6KWEszD
 VPyrwWw/91+CJ8RFQ0Mf1hTMkhJ6QD4n1PnA5BKwjqZHlX5yRgFM7zj5trRuseSQkov0
 Y+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4ZGYIL2rqF2T6FtQL+8Y3D7X7iQJLL9+ey7r6yaKFq4=;
 b=J+5NDuisF6fkw0P4C/0ZKxE8f8T6rriM7BhEDsJ/BSN49MNEGFOqEs6Rbj6lm+aXn6
 sz1JvOH1zoOUd+wUJgfpKspsCuMuOFhlra3W3eDCgzjljEgsj5n9FcwYj0u7nCJt5Jbr
 auz/k3/ZrQreCGaKZFqrP2O5GhQiREU/ITtYv7mRRpPVz4uq7Kg3kLWpkxQr0vFF/BZT
 eysMx6s5jepC6dxITlVckHgd8YOV04JPvkdKEVcqivmSUDfMxlxNUllf5ZukXK2VGjCk
 HJ3bq1W2mcmRd7zf2g8WeMdX14xoXJ0pL64M/u/4ZLhn7ZmV864ozp+I5na+apgTv8Ip
 kBFg==
X-Gm-Message-State: ANhLgQ2xUdQ6Wt7b45Jn9PVP02/JJZ0CjTT71vC4mJTOC9cDbqs03ZYM
 jsgwN6CdowB2fcieW29pY2pkoVsI4Rg=
X-Google-Smtp-Source: ADFU+vv3MsaBfr6KUtBVatPkxA9nAtP39hB0fboEoLwTU5jFqfSQrFElksaelS5yFKySqiIdqwIguQ==
X-Received: by 2002:a05:6830:1d95:: with SMTP id
 y21mr6324574oti.180.1585068461964; 
 Tue, 24 Mar 2020 09:47:41 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id z22sm339615oog.45.2020.03.24.09.47.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Mar 2020 09:47:40 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.0 1/5] qga: Installer: Wait for installation to finish
Date: Tue, 24 Mar 2020 11:46:49 -0500
Message-Id: <20200324164653.19449-2-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324164653.19449-1-mdroth@linux.vnet.ibm.com>
References: <20200324164653.19449-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b33
X-Mailman-Approved-At: Tue, 24 Mar 2020 13:24:24 -0400
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
Cc: Sameeh Jubran <sjubran@redhat.com>, peter.maydell@linaro.org,
 Basil Salman <basil@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Basil Salman <basil@daynix.com>

Installation might fail if we don't wait for the provider
unregisteration process to finish.

Signed-off-by: Sameeh Jubran <sjubran@redhat.com>
Signed-off-by: Basil Salman <basil@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 qga/installer/qemu-ga.wxs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 64bf90bd85..f6781752e6 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -81,7 +81,7 @@
               Arguments="-d --retry-path"
               >
             </ServiceInstall>
-            <ServiceControl Id="StartService" Start="install" Stop="both" Remove="uninstall" Name="QEMU-GA" Wait="no" />
+            <ServiceControl Id="StartService" Start="install" Stop="both" Remove="uninstall" Name="QEMU-GA" Wait="yes" />
           </Component>
           <?ifdef var.InstallVss?>
           <Component Id="qga_vss_dll" Guid="{CB19C453-FABB-4BB1-ABAB-6B74F687BFBB}">
-- 
2.17.1


