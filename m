Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595D6EACE7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:29:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprl8-0006Gl-8P; Fri, 21 Apr 2023 10:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprl6-0006Ag-14
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:08 -0400
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprl3-0008Cc-I5
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:07 -0400
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 275941079
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+htIIKjs84VKLd3wnjlU9T+aX1613hIKZh0ujC45NGQN5FlHY01je
 htvC2mCa/nbZmvyeNwgPY6y9BgEsZfWmNVmTgNpqi5mRikW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZnPakjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZcd67lpIUBKz
 tFGdRRcZ0mfgbORh5vuH4GAhux7RCXqFIYWu3Ul1C2ASPh/EMCFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNUqYJUQeaj/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuewYYaMIoPbLSlTtnSVu
 mvAozj4OSMhC/eF82eO6myRweCayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW3F5zzBkzo5nGDuREYVpxbFOhSBByx95c4Kj2xXgAsJgOtovR33CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:ta0bsaDWZCtOJ2DlHemR55DYdb4zR+YMi2TC7ytKOHlom62j5q
 OTdZEgvnXJYVkqNU3I5urwXpVoLUmxyXcX2+ks1NWZMjUO0VHARL2KhrGC/9SPIULDHsk379
 YDT0BEY+eAaWSTtK3BkW6F+t8bsaC6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3A1YU+RWotA2OURrqBclfM/GrmUdogYyLD7FbUGGL?=
 =?us-ascii?q?mVEI4QeSJTw63v4oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AABWXkg8mb+nGvHF5dMTWNeaQf/Vl/62oVBwMqqc?=
 =?us-ascii?q?9hOKeD3F7IymgyzviFw=3D=3D?=
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:29:00 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ef3ca5b5afso24693631cf.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087339; x=1684679339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcnsS5hH3fd48+wZ4Mw4pHdWARMrICQedOg8BHCeD6U=;
 b=RTjktdTt5NUe0BX9cQX7vCcKG0p2lvnfUZOC2ZoZlciILkTAaRaVcjr3j3z2JCB+q6
 DjXOSxMyxBv8USjuMFzTztBWHF838Cb/5yFJMJDYpKHroh/QkS3hXiHCejg8hHTo5ZkR
 wI4cpVsypOEcmxitJtgw4JRHHgVU5GXL2zciJetmWLSwe1O+2rg73/mDcHp5ZuJl0k1K
 z5PYZ7xrebFWTISQVqrqEawcdgXe5Stux1tlvQkkoszIlkX1oEwDy83jsksrk623GFxd
 nTtmeNM23kY6eNhv84U3xJb5MuYCeTkvKGtnyv9pxxU8+ZUes/T/2praG2ZESmyK0tLS
 nYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087339; x=1684679339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WcnsS5hH3fd48+wZ4Mw4pHdWARMrICQedOg8BHCeD6U=;
 b=eT08tCeRgMyWEHLNxqzQI33aD+YkMjZtPZcR+YPdw/KXSDei3Lh4SNex6LG768yhw3
 HY3GQWe6LgtKI/3v9yDpNjVedlu6ooB4GjiDr/66t9E84a/hncMo/+99DHMlFnBaL0UT
 hKoSJNkjUmmaV1f5QRwwpg6TvO0wr6gIJXzKACGO/UDgvuUiwLdn8O73H/aCWOnqKM3C
 Z9PcGM1t2SC8SW4es0FTiGMsBmLA3aNUXnjh4JgC2If1njvHEagM9rC5cM5VvmOwFjYt
 +dy7e7R9U7EGLrvZZXTORfq3jnXpZj0b4pqR+ZDKZxn+Yu5ucWtmxxnOsvl3FZ8oT9ey
 nVfw==
X-Gm-Message-State: AAQBX9f4buolFC5Krr4+E0VqrKJMaGrVZ8Jn6oHNZHu0iZeVq/q7jiU3
 NtWBeaecZ7fJt7EHgofn3qRcbF/WgR/JkYizgQDv4HaQ8yjE8TAbdoYlmwGtDyERGo878pJ0937
 dBzDHM8x1OSJAuDr9N7xt6/LXA2fFI9/sKTv7QHN0olw=
X-Received: by 2002:a05:622a:1cf:b0:3e6:4e5e:89f with SMTP id
 t15-20020a05622a01cf00b003e64e5e089fmr8677897qtw.18.1682087339313; 
 Fri, 21 Apr 2023 07:28:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350YzKufQweeF9FPq17hEDFaSO/CiMBa8VTmCwLeAVR6ASkzMtfr7ZicfxtcJUYgPefcZzkMfoA==
X-Received: by 2002:a05:622a:1cf:b0:3e6:4e5e:89f with SMTP id
 t15-20020a05622a01cf00b003e64e5e089fmr8677864qtw.18.1682087339142; 
 Fri, 21 Apr 2023 07:28:59 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05622a148a00b003eec85171d6sm1350964qtx.61.2023.04.21.07.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:28:58 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v8 5/8] memory: Allow disabling re-entrancy checking per-MR
Date: Fri, 21 Apr 2023 10:27:33 -0400
Message-Id: <20230421142736.2817601-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421142736.2817601-1-alxndr@bu.edu>
References: <20230421142736.2817601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 include/exec/memory.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6c0a5e68d3..4e9531bd8a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -793,6 +793,9 @@ struct MemoryRegion {
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
     RamDiscardManager *rdm; /* Only for RAM */
+
+    /* For devices designed to perform re-entrant IO into their own IO MRs */
+    bool disable_reentrancy_guard;
 };
 
 struct IOMMUMemoryRegion {
-- 
2.39.0


