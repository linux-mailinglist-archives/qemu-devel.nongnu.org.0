Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C259F830
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:53:14 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo0X-00007R-Ih
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvF-0004d5-4K
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvD-0001vg-Dk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id u22so15173826plq.12
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gKxyDa7lKyWG5WkBmx+APlEruT/rzwWcMPKdz4TXZxE=;
 b=SFoZENIBmBu9tOpu74KvH9CSn7EwhCAtdV9yo82+axZchtmdoe/1UO4Ry2tfRRlz0k
 k0tFUc8h3SdH7xiEE/tM5LX2YXpYfVADc5FHT3AMbxc0/EHSU3mSsB2xl6vpaZoOpC/x
 jAH/eQCO2wR28Izp3fKsPQaNZiRU/D9+W0uDynCwkstakbmbV5eCsiqudBPEM81LttHD
 alMKZ9NM7v40a5Wo9ycEte6Rg6u7xuteXmsxEo4ZFftVH5yKlDgy4phCDhs9Ma8tvWu5
 CsxRj3acSgqlFIVT8D9TvuqmLY4uSkRm7SiviVB7zfFS9EbQzMwmnO49KLY+4QadQva8
 131g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gKxyDa7lKyWG5WkBmx+APlEruT/rzwWcMPKdz4TXZxE=;
 b=K/OycWdR5kVpHwMYb96fAdH1mJIKDn6v0EnKWfdYcfHnvU+yg2xR08h5CGlWSzxTdK
 bcKMa0Pj1LyneFAmcgk2nU6DliAOIgO+twrdGBs1zRruUkVJqf8as7YT22EPVxBxJ4aT
 4kS99RsWoCecr93H+IZOyjmohJUNB7mL4g0GQVEc8nPT40/Jj1+vht6KaqgAuZ3B83ov
 hR6glgVhQYByme5hBBoc+WWhPqZyCLVtJ/OBnuMNazPCmfNWDdG7mfGHRPcOQBhuErVm
 MMY6cLnJzMIM3g1AUUcXU1dDtxFtpwHtEqx1laSElM2XiDtg1QDra9TCY70We/j0XG3U
 nphg==
X-Gm-Message-State: ACgBeo3JmCpZBI1MWxTkn1/1mv1dRc6+7/lyLCcahj2yFjC/IGt8h3mj
 LZ56lfNvDf8maqrIbDJhn3IukwGvMZE=
X-Google-Smtp-Source: AA6agR7R4Ggo59qr8j5X0/6MA331SC6M7I85cNMVBFA8PFo0pfmlhLeqMbnUmN5vQvJ6PsNZx1DfFA==
X-Received: by 2002:a17:902:e851:b0:172:dda3:77d3 with SMTP id
 t17-20020a170902e85100b00172dda377d3mr15775461plg.19.1661334217828; 
 Wed, 24 Aug 2022 02:43:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 49/51] io/channel-watch: Fix socket watch on Windows
Date: Wed, 24 Aug 2022 17:40:27 +0800
Message-Id: <20220824094029.1634519-50-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
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

Random failure was observed when running qtests on Windows due to
"Broken pipe" detected by qmp_fd_receive(). What happened is that
the qtest executable sends testing data over a socket to the QEMU
under test but no response is received. The errno of the recv()
call from the qtest executable indicates ETIMEOUT, due to the qmp
chardev's tcp_chr_read() is never called to receive testing data
hence no response is sent to the other side.

tcp_chr_read() is registered as the callback of the socket watch
GSource. The reason of the callback not being called by glib, is
that the source check fails to indicate the source is ready. There
are two socket watch sources created to monitor the same socket
event object from the char-socket backend in update_ioc_handlers().
During the source check phase, qio_channel_socket_source_check()
calls WSAEnumNetworkEvents() to discovers occurrences of network
events for the indicated socket, clear internal network event records,
and reset the event object. Testing shows that if we don't reset the
event object by not passing the event handle to WSAEnumNetworkEvents()
the symptom goes away and qtest runs very stably.

It looks we don't need to call WSAEnumNetworkEvents() at all, as we
don't parse the result of WSANETWORKEVENTS returned from this API.
We use select() to poll the socket status. Fix this instability by
dropping the WSAEnumNetworkEvents() call.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---
During the testing, I removed the following codes in update_ioc_handlers():

    remove_hup_source(s);
    s->hup_source = qio_channel_create_watch(s->ioc, G_IO_HUP);
    g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
                          chr, NULL);
    g_source_attach(s->hup_source, chr->gcontext);

and such change also makes the symptom go away.

And if I moved the above codes to the beginning, before the call to
io_add_watch_poll(), the symptom also goes away.

It seems two sources watching on the same socket event object is
the key that leads to the instability. The order of adding a source
watch seems to also play a role but I can't explain why.
Hopefully a Windows and glib expert could explain this behavior.

 io/channel-watch.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 89f3c8a88a..e34d86e810 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -115,17 +115,13 @@ static gboolean
 qio_channel_socket_source_check(GSource *source)
 {
     static struct timeval tv0;
-
     QIOChannelSocketSource *ssource = (QIOChannelSocketSource *)source;
-    WSANETWORKEVENTS ev;
     fd_set rfds, wfds, xfds;
 
     if (!ssource->condition) {
         return 0;
     }
 
-    WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
-
     FD_ZERO(&rfds);
     FD_ZERO(&wfds);
     FD_ZERO(&xfds);
-- 
2.34.1


