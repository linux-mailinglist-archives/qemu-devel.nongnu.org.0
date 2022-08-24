Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB559F7F8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:42:01 +0200 (CEST)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnpg-0003Gw-Ql
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvD-0004YQ-GU
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:39 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvC-0001uv-1K
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:39 -0400
Received: by mail-pf1-x432.google.com with SMTP id p185so1501873pfb.13
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=k+wOqDGAd9uW6KVCk7h/YSoejf9awPSlxEfxhVeL2s0=;
 b=BlUUof9KV7lo3UYByGgMBl4hZCyN+BBdHZ2Tr1C+nPomC0ZFXokTWg/sgZ1Vt67zab
 wbF954lhuV7jSa27O1FYBqGs5mBsbsS40dYaxXiIcCy3AFtozhvOQPIVIK4fJSyZPkFl
 Ca+Ay23X4xMBxCJdc5QWPoRBNCDa5Ndt6U07yXpUOoXiFMh4K19CaunIuUYcO/KvNnoM
 sJrEG9Xxqz7m4uZjgix+IAiiRMxB6d4sQxH+nfr4o//pbAh1JZdf/wtkks9HCiCBwX5h
 0/PG9ge7kxvWNjtUmDZi0+LyN7O6rCZ+OCOMoWMmsjyvIM4TGjecn9aXr9zdeA+oHHbq
 xecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=k+wOqDGAd9uW6KVCk7h/YSoejf9awPSlxEfxhVeL2s0=;
 b=U7tAvCIXFRJ8uyirECI/bqjTSWFt4VFfcpKyauG0urL4nfxVoYqrdwvPITLrDFlCBk
 ZNAq9oegQ3/IVvZ6cTcvMlbN3+GKhHaAlSSzcGA3j8pZa1KMW2IBGyD+YmGiTUiduJl8
 4k3xS4e4L5gmet86XLk8QiQpvAaxDvgNTQa0Bfuhr1htKw0/F14Mc9mWDPa6fmSfp/cs
 So9t1pvejiyxu1sIfg1H3mrKoV3dXTUaBx052zOFInJwAgxo7Q/TgAoY19zvOU2SyC/Y
 9dk5rrBLsRKTJln0Fn1vzryc8rfFILVLC2Goe8ZnaXwyA5+8tRVssDNSHrCSs9OVe6h2
 B2yw==
X-Gm-Message-State: ACgBeo0PNSUuS1KKagXUUlsR8afh0le6TJt1VQ+H14e9y9asBr08jt0w
 xSRY+JpUFjSuYVmb+Kzp6sOkc4MTSqM=
X-Google-Smtp-Source: AA6agR7Ye5D0NyOAW6AHEspp+cycbkplrlSxx1gFwSzmM9NXktwH8s6xUlRHeUXDi66hDxhnNbhq4g==
X-Received: by 2002:aa7:96a1:0:b0:536:9a2:5012 with SMTP id
 g1-20020aa796a1000000b0053609a25012mr24572239pfk.24.1661334216073; 
 Wed, 24 Aug 2022 02:43:36 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 48/51] io/channel-watch: Drop a superfluous '#ifdef WIN32'
Date: Wed, 24 Aug 2022 17:40:26 +0800
Message-Id: <20220824094029.1634519-49-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

In the win32 version qio_channel_create_socket_watch() body there is
no need to do a '#ifdef WIN32'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 io/channel-watch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 0289b3647c..89f3c8a88a 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -285,11 +285,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-#ifdef WIN32
     WSAEventSelect(socket, ioc->event,
                    FD_READ | FD_ACCEPT | FD_CLOSE |
                    FD_CONNECT | FD_WRITE | FD_OOB);
-#endif
 
     source = g_source_new(&qio_channel_socket_source_funcs,
                           sizeof(QIOChannelSocketSource));
-- 
2.34.1


