Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81454E1F72
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:13:05 +0100 (CET)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW9Pk-0006Rj-83
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:13:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nW9Nm-0005AA-M8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 00:11:02 -0400
Received: from [2607:f8b0:4864:20::c35] (port=35806
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nW9Nk-00082G-Sh
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 00:11:02 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so17759598ooj.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 21:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPXr8GSk9j+/bnukFc9RZ4mzis9YYVlpcwRt3ZzWOrA=;
 b=Lj+46dJdAtXwLvCMu2zqGSVxqF6JRwP3wHg61qbaTOKneF+LIe32RbCAa35RMYO0yr
 byM5RxVz+Kh+NGQ88WqC6Brq4KV85ph2IcdrFYQPJtgo1LUgtOqncU1GE0UeUbf9Ja6n
 t7XGRU4mdarK1DyugZVSb0EBxYBVdWi5E6ga8ulQiFI0fVa3aVnyUPSLiAwZn04GZ2x5
 LAgStc17G/FexVtlD0DiqzJYyRWwmkp3QbYNqKRSTZPemCotnp942kGw0zT6x+KgZirW
 NNqBNP3Vs3PmiJqYauFzP819SdmERHG0oAqykcyWYDRFhCa0zY+DH2wIHvJjASIe12q4
 JOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rPXr8GSk9j+/bnukFc9RZ4mzis9YYVlpcwRt3ZzWOrA=;
 b=NwPiBFDtqXpMkiZMfUpeY+MaSIT6TRH8Q9D6Q/mwgCGc1vKG9KklYm6Tgu8os68xS2
 KbAVsGA7HBT9rjbNYEvqP9hkxZORwSum8dBX9kcskJkABLivmp8iImW6wf0F+BG3NfkH
 ML8xJG2B6EK3aFBPMfFevmgiSWlKklwB0bYnZxkeKtF7wvckvWxds+p4wJc+r7eTEdlY
 Ec2sPMdKZzjN5DoSWA9njub6GJfDb6HenOCAQh4+Ve2SreekENvThqvN4AtPvZ/ta56A
 NbH1hEnZ96XivzLFa9Wmry43rXfqpcVoZmU4Y/dGDSdam11S1PCDqfC+pz0sPJ+uuKiU
 rJmA==
X-Gm-Message-State: AOAM5314DPPSoIRVkfB61QorLNIAgDENJ7NpwOFTWbQ9r2XeE5G7mvRe
 3E2y/mxN/U4hSaor2mi538RXFCMPP34=
X-Google-Smtp-Source: ABdhPJzfFlQPtdTdnJrtOquhlJEtJDgUXRuGmCfUMYy0A1O9bEh8KnHQaayzd5E9nal4JG/jhhTKwQ==
X-Received: by 2002:a05:6870:c21e:b0:dd:be4f:5dec with SMTP id
 z30-20020a056870c21e00b000ddbe4f5decmr6437714oae.66.1647835857898; 
 Sun, 20 Mar 2022 21:10:57 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:e0e3:734:1053:5eaa])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a9d4d03000000b005b236de8911sm6936593otf.24.2022.03.20.21.10.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 20 Mar 2022 21:10:57 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 0/2] Create menus in iothread
Date: Mon, 21 Mar 2022 13:10:41 +0900
Message-Id: <20220321041043.24112-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
assertion that blk_all_next is called in the main thread. The function
is called in the following chain:
- blk_all_next
- qmp_query_block
- addRemovableDevicesMenuItems
- main

This change moves the menu creation to the iothread. This also changes
the menu creation procedure to construct the entire menu tree before
setting to NSApp, which is necessary because a menu set once cannot be
modified if NSApp is already running.

v2: Separate a change moving create_initial_menus (Peter Maydell)

v3: Rebased to commit 2058fdbe81e2985c226a026851dd26b146d3395c

Akihiko Odaki (2):
  ui/cocoa: Move create_initial_menus
  ui/cocoa: Create menus in iothread

 ui/cocoa.m | 209 +++++++++++++++++++++++++----------------------------
 1 file changed, 98 insertions(+), 111 deletions(-)

-- 
2.32.0 (Apple Git-132)


