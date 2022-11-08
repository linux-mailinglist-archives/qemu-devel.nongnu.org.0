Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682606218B8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQnV-0007g7-2V; Tue, 08 Nov 2022 10:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osQnL-0007fe-J1
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:45:47 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osQnK-0001sO-1J
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:45:47 -0500
Received: by mail-yb1-xb32.google.com with SMTP id r3so17838480yba.5
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3WmnLZviTEtGOd04KwL6mismfEZmWFzPvbjT4L9wHzc=;
 b=PyrurgMiCSOMPjtWpQQibYYdz6w4YOWL+smQ01L99WmHlOWyZB6LEDiCXFuMbmG8LA
 WWbx3zVcdP1uF8iZlVy4hS3Zo5mAv6wZMFQTKygOrW7zJqU98v8oNQDQl2p17Hgnbva4
 7EZVXFMgLLccgQu/gU04QMDXhBzpwiQHajKrqfxBoRR9rRRJrrRpicJb611HLI3DSqCY
 SldvM4h14vHZzhTsGQLOEMbZG5lQzN/19GT9A//6BJ3PJs1My9j5ogViA//DoATAStJX
 k5a5YRvdXBwUNt3wHYsZrjExSxFtPSWGVezviYhJpU4eZxeqZr6Eiroupi+tAzKozpU2
 X6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3WmnLZviTEtGOd04KwL6mismfEZmWFzPvbjT4L9wHzc=;
 b=SnAxBpMIDx822nhM4hXQKXkx3p4JiCk++z1A8rr/UknnIU9aiQAYARvPtm01L3wIfE
 6DWnQDArUgLAfNYq5gFpW8/n0rnkZ7GnAgUJveVyw3u8Am7dm1BJviiYcDyNmCPM20nY
 XPdSR3wFnG44lqaRHb+H3sq+4N74chrzj/j5FEheF9rU2fHTn4qGYe4FHT9iT2H64hcg
 cKg3U2ipnARxhNu1t/wifs0upD1fEG42NkmFseHhGJHqRi0DSxP64BW0dayh16dlhEdH
 jKLh9NcPBNPpt3vKcsf7LFQZjw9MzzeoolXqzuvfhqdITsNy7OXbtNda7YsTTwyfMiII
 Nl1A==
X-Gm-Message-State: ACrzQf3//Ix0lJb+sauVCUQxpwdZRp+3RKnawilTx/B8QsEtomdDNsXx
 L22mVS8fg/k10/DfnRigHNb995giBmQLuYmAUhVpS6BJJ1QzJQ==
X-Google-Smtp-Source: AMsMyM44pzUqCnadd4VjJw/YK/lkra4pmBy7tfkDjxKZBo5QUsk/LvtkrTBpymYLNTuoxVfNQ54iGrcoK48xpYBaPXY=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr42710682ybh.207.1667922345030; Tue, 08
 Nov 2022 07:45:45 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 10:45:33 -0500
Message-ID: <CAJSP0QXc9MOUuU9amBorzV4hf9A9HWFZrtn3sZzJ-OkWMwvNPw@mail.gmail.com>
Subject: Call for FOSDEM presentations on QEMU, KVM, and rust-vmm
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>
Cc: Mahmoud Abdelghany <blackbeard334@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,
The yearly FOSDEM open source conference is now accepting talk
proposals. FOSDEM '23 will be held in Brussels, Belgium on 4 & 5
February.

FOSDEM is a huge free conference about all things open source and an
opportunity for anyone to present QEMU or KVM topics. Both in-person
and pre-recorded talks are being accepted this year.

Please consider submitting your talks to the following devrooms:

Emulator Development Room:
https://blackbeard334.github.io/fosdem23-emulator-devroom-cfp/

Virtualization and IaaS devroom:
https://fosdem.org/2023/schedule/track/virtualization_and_iaas/

Rust devroom:
https://rust-fosdem.github.io/

Thanks,
Stefan

