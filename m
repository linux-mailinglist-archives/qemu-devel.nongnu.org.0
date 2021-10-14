Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFFF42DF34
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:33:20 +0200 (CEST)
Received: from localhost ([::1]:52760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3fT-0006Mp-FA
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c2-0003Km-P2
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:46 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c0-0000Vx-VP
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:46 -0400
Received: by mail-ed1-x529.google.com with SMTP id y12so27677326eda.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0R8344mGQ6SPe6NhWtj1MzuMX9sSmu9aHAIlZPLSqOo=;
 b=cvA2zxsRDVsXVzJfMH21IfrM7/oDFy1OR0P4BA+O4auhb/g1JIoXkZySaVUN7co0E5
 PyvtjU7o52L3tjU3tpxw1iKVP35kf+nDgwWPfCD5yHvf6tydFuWcJ0P0IhU1pUBKduxX
 CBbdF0s6/ZmvKfgCVgYHamS83V6lBf8eEW25e6sXqxgb5XE3s83TD52jEKjaYRDklkhe
 f2xPnDTStwIZlS2z+hLq7i/0bpXDH+HniQWy4P/7dcX7ZqkphqEdc0bdManswYhu6PGf
 1gU3e2cWFQFG/JLsvOMZTF3gaqyIb2Felu66sLdlr+XA8+DpA8iTxsPfcjDLixCCA0mE
 EMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0R8344mGQ6SPe6NhWtj1MzuMX9sSmu9aHAIlZPLSqOo=;
 b=MRZH0VRF+LwPLCzuKmYhcwuAyU9hpETQULd1YS2pCvaYmU2DCeXyf1ByrTfSjUEdMY
 q/xlNMd2bEl2KrJ8HM4O79dFspyO5N70ZcoGpZcIY+io6vBkEnGF7keLvPYIzg/aXkZQ
 kXKQ9V/LJmVnr9UKSW6KkyXdodYun6SffQv5Ky7NHZFguYW4XvHqsj5es/BElwyVI8Z/
 mbz/pwG0N+yNf8mFYx/larwy/zlYpuex2OGApNJ8jeh/tOzL58Bonkq3eMNu75nuQvVp
 e5nFDhV0BAGpalW21S6xUVai4uYGbC3Y/hMSDYUBqPt000XD2QlfXOjqJGvqB3ShVucG
 C9mw==
X-Gm-Message-State: AOAM531XsdHqfn7f9ifLt0ijJklNoLjeNbFeYSRA2XVQLJDarTZXDT1o
 DPhzNkdfjNjTDb6jhnIggBQff4WHMr8=
X-Google-Smtp-Source: ABdhPJzUmMLTzrwgLEcp4jmqpzNTdCVOT5vTG9ypA5kfeln+jJs9aaL3C/UODO/FsWmLn1S+zggpMg==
X-Received: by 2002:a17:906:ae53:: with SMTP id
 lf19mr4948822ejb.97.1634228982460; 
 Thu, 14 Oct 2021 09:29:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] audio: remove CONFIG_AUDIO_WIN_INT
Date: Thu, 14 Oct 2021 18:29:14 +0200
Message-Id: <20211014162938.430211-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since winwaveaudio was removed in 2015, CONFIG_AUDIO_WIN_INT
is only set if dsound is in use, so use CONFIG_AUDIO_DSOUND directly.

Cc: Gerd Hoffman <kraxel@redhat.com>
Cc: Volker Rümelin <vr_qemu@t-online.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130630.632028-3-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 audio/meson.build | 4 ++--
 configure         | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/audio/meson.build b/audio/meson.build
index 7d53b0f920..9a95c58f18 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -8,8 +8,8 @@ softmmu_ss.add(files(
 ))
 
 softmmu_ss.add(when: [coreaudio, 'CONFIG_AUDIO_COREAUDIO'], if_true: files('coreaudio.c'))
-softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'], if_true: files('dsoundaudio.c'))
-softmmu_ss.add(when: ['CONFIG_AUDIO_WIN_INT'], if_true: files('audio_win_int.c'))
+softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'],
+               if_true: files('dsoundaudio.c', 'audio_win_int.c'))
 
 audio_modules = {}
 foreach m : [
diff --git a/configure b/configure
index c280c0e4b5..174fa84b60 100755
--- a/configure
+++ b/configure
@@ -245,7 +245,6 @@ block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 block_drv_whitelist_tools="no"
 host_cc="cc"
-audio_win_int=""
 libs_qga=""
 debug_info="yes"
 lto="false"
@@ -3077,7 +3076,6 @@ for drv in $audio_drv_list; do
 
     dsound)
       dsound_libs="-lole32 -ldxguid"
-      audio_win_int="yes"
     ;;
 
     oss)
@@ -4562,9 +4560,6 @@ if test "$libjack" = "yes" ; then
     echo "CONFIG_LIBJACK=y" >> $config_host_mak
 fi
 echo "JACK_LIBS=$jack_libs" >> $config_host_mak
-if test "$audio_win_int" = "yes" ; then
-  echo "CONFIG_AUDIO_WIN_INT=y" >> $config_host_mak
-fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 if test "$block_drv_whitelist_tools" = "yes" ; then
-- 
2.31.1



