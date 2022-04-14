Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FBC501AAC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:01:39 +0200 (CEST)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3mk-0007Lj-2K
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jL-0004l9-S5
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jK-0005rv-9b
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m33-20020a05600c3b2100b0038ec0218103so3713503wms.3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BclqmxMc9GnSufJEBHJYPewd+2XyZYBc6vcujepgoqc=;
 b=acotvsfn4t/MTwylV/X1am+O1GJbh3iyl6qXehPWTaoTUc6icxpjyWqTcnYViQ0EY9
 ZtJYG6SiZ4a37E3oFPQQWW4txE+MEzhybX1mqfQhvRcy2qtdK5N9prIuf2GaWjgRJSht
 RdpQl9iIzJ+PMMZaJd2DjqR0Y4tnJW/1Cm37/BUYuBPITjYNu97shZIUF6kjpTqKjFW7
 Nu4uvSHezYUwaRCeNTCSisjb9Bc2Ekgmx3aGkFgWBgTCtnG88tV/+HD0+getp/x2z2mX
 Bl1wfhcgYKuKiRk8WF3Mjd0pmMFsoiHW7UMpPQCDZQMVWn+w/EkvoSek8Ba1WZwJxUq3
 qUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BclqmxMc9GnSufJEBHJYPewd+2XyZYBc6vcujepgoqc=;
 b=tawzs4g6de9JqvLsDQzktjgJprBw2yRq0dB+8qfj+JsBLpWkq/TIm7xbN06X5mQhgy
 S+izTo0/R61KG+DIUBLOvKKzN4Hs/7NNvOvUjbzP+EsTlXAecDKKnkgQfAGBIbTZSXBD
 mmFR4pQQiU1kW2RRwK22Hwn2P1Hp6ZCusnUpmClHeqIeOIhw2DNwa/zb6+GKZqkr5HWx
 Q7JQxeTbnDz0s4nNwL3NWAtgX5YI1n734BYmsyzb9EmzlIqKUR41LlI5RgKRsYPbvOVz
 g0jqR0uDKdB4BJxz9gAyAG2qd2bjrnsAINSWjCSlfnu14kTmBf6cAqKGtt/tua1F3FQn
 TerQ==
X-Gm-Message-State: AOAM530aCNn+1ttfQEkRaAHKxAxturJuglOjk1AhvQKAQL+kJjl5ft/T
 EhYjphiHKr4vxo0Z7GYDmzNrJTLPE2qcjA==
X-Google-Smtp-Source: ABdhPJwuhHIDH/kMRsMjZEKr6sDj2ik4Nm3JU8N15fCnL8ArdTCveYDWTGdy9L3JiqxmLtmHRRUyVA==
X-Received: by 2002:a7b:c057:0:b0:37b:ebad:c9c8 with SMTP id
 u23-20020a7bc057000000b0037bebadc9c8mr4622640wmc.61.1649959084256; 
 Thu, 14 Apr 2022 10:58:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 0/9] nbd: actually make s->state thread-safe
Date: Thu, 14 Apr 2022 19:57:47 +0200
Message-Id: <20220414175756.671165-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main point of this series is patch 7, which removes the dubious and
probably wrong use of atomics in block/nbd.c.  This in turn is enabled
mostly by the cleanups in patches 3-5.  Together, they introduce a
QemuMutex that synchronizes the NBD client coroutines, the reconnect_delay
timer and nbd_cancel_in_flight() as well.

The fixes happen to remove an incorrect use of qemu_co_queue_restart_all
and qemu_co_enter_next on the s->free_sema CoQueue, which was not guarded
by s->send_mutex.

The rest is bugfixes, simplifying the code a bit, and extra documentation.

v1->v2:
- cleaner patch 1
- fix grammar in patch 4
- split out patch 6

Paolo Bonzini (9):
  nbd: safeguard against waking up invalid coroutine
  nbd: mark more coroutine_fns
  nbd: remove peppering of nbd_client_connected
  nbd: keep send_mutex/free_sema handling outside
    nbd_co_do_establish_connection
  nbd: use a QemuMutex to synchronize yanking, reconnection and
    coroutines
  nbd: code motion and function renaming
  nbd: move s->state under requests_lock
  nbd: take receive_mutex when reading requests[].receiving
  nbd: document what is protected by the CoMutexes

 block/coroutines.h |   4 +-
 block/nbd.c        | 298 +++++++++++++++++++++++----------------------
 2 files changed, 154 insertions(+), 148 deletions(-)

-- 
2.35.1


