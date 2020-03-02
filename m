Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1302176277
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:23:49 +0100 (CET)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8pjI-0001zz-PW
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pfD-0002Wd-8r
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pfC-0001DO-6g
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j8pfC-0001AT-0c
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r7so1016247wro.2
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KU3LOvTwsyaeX9nvxbxSpYARm+tonMTUIfAMh78os0=;
 b=fDGgYIm+GYDEYqSOL9F679XDxp7ueHS06DJNbu43+qlVBd46SgJk4AdBBD5VL0cXbj
 ardI9ITnMqmmkDt18M9I9q8Q0/Pv1i02DwqVB4dYDb+bMGQlrYrI45QDfMg3UnAc+mqg
 ynxD2333GXZEUlpnDs9FYCDGUWNJhUVHN/EPQdhD5v6429NrDa+B6LMEJHEJ9YclbWrl
 Wp/UhiYyeeEthwazigaqMsNLahSIOzWgKPZbn33pYBr808POehvUg3OSPBxEj1Cw20gs
 0Ks3z44yTx/RR51uCIoiJ6/N/dfyhRbd9eANIrI3ylu8uOfoAJvzC39QJBLINtayMi33
 tIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KU3LOvTwsyaeX9nvxbxSpYARm+tonMTUIfAMh78os0=;
 b=roOthYhT9fUVxApDMwVRMie6wL2/zzd8/wGIf989sqrvhE+tgcxBI79RyTjeOvcvAp
 c3uFu7mWW58IJ6aY3qHzgauJCUCDsMiLso+bKmB70daCcd+VQ7Nw66xF27mqP4obRznU
 vd77ENh/KfQ+IWgvXw1mWBgTKdKXBw9/L3p+kPZ4nwv3DjilNVjEw6nMGpQtmcFpehtp
 hBxojjMLimNNoT/REehzW3YiFh3ZyON+VnL+jQYeHn9YeTEDXKQ7vXnsJ+pZsSkMIGFd
 IYt/DRFmwSPXPd0MfgZWK4KEoBoIgGVUS/m7WpiJSUq4cdlxTg5XJxCxRvZcDodpJftQ
 casQ==
X-Gm-Message-State: ANhLgQ2vsPfuZNg1ijTCJKm2YwUD9rE19eTIL1WxZDgFHbHwKWUwlof9
 j54DmKCq3CWi1KCvG3uA0/KcOw==
X-Google-Smtp-Source: ADFU+vumkqzfedaMN/LJvYX8rTj5WZhHfRQryWFhLXja2qkRmFQcnklE4Cd53PV2gta0jcSdt0iGHw==
X-Received: by 2002:a05:6000:106:: with SMTP id
 o6mr818424wrx.120.1583173157967; 
 Mon, 02 Mar 2020 10:19:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm3011901wrt.19.2020.03.02.10.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:19:13 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25C1F1FF96;
 Mon,  2 Mar 2020 18:19:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/10] configure: fix check for libzstd
Date: Mon,  2 Mar 2020 18:19:04 +0000
Message-Id: <20200302181907.32110-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302181907.32110-1-alex.bennee@linaro.org>
References: <20200302181907.32110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 3a67848134d0
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 7b373bc0bb8..caa65f58831 100755
--- a/configure
+++ b/configure
@@ -2464,7 +2464,7 @@ fi
 # zstd check
 
 if test "$zstd" != "no" ; then
-    if $pkg_config --exist libzstd ; then
+    if $pkg_config --exists libzstd ; then
         zstd_cflags="$($pkg_config --cflags libzstd)"
         zstd_libs="$($pkg_config --libs libzstd)"
         LIBS="$zstd_libs $LIBS"
-- 
2.20.1


