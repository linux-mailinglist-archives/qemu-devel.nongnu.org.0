Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7B39E179
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:07:45 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHmx-00011N-JM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lqHhf-0003qu-G6
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:02:15 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lqHhd-0000cy-LU
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:02:15 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t20so12952111qtx.8
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=L6hORcFQ69+6EgMyslddqzsU88ighsNVuQRp9+L8gZk=;
 b=Os0Z8da8CwFiWaoKIy84wakXKsY0tRvoF1fCiOs/7hAnDTwPbgzySYyBy0rafAiQWm
 rcuoctJrM97E7rVsKRBvR9lwujctEup2rWPSguuT4PcbH7KRZhW/uWVNO40qQ7oaRdXF
 cKJ1wsN0In7WVUo8O/M7dPPS68CVwUS3tEzZEmpiHOiSgJjvFEzi8mho7EAngJDtgDgo
 ve3Isqh3tIw2w/DSiP9U8do6zAjiAxtnSLTohxw+TfkmR0eaCdZLi6nNjQ+Wf5YsQacz
 GhnTPkPLMrkxpJp8yn26VPfj1eKSjHHQ117YO2TWcq6ED9U32hHbBA9JwO1HPXkk2HyP
 iRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=L6hORcFQ69+6EgMyslddqzsU88ighsNVuQRp9+L8gZk=;
 b=rGQndDl58nObHLI2aWXsoIqWE2MIiZ5G4M6sSzynKmTCIqnjOFT9N1J9VAanrblz3L
 +KKtfAYl5LKaDTbJuN+u8qB4bi4wlph5biHTL7KIhe+pEEDr/IIuBW1eue93ReW4sdxP
 HJQMrsw9WtkZltGk820DUlARSifjbXlZHoQI0wOscMts19Br34mxVRJWGYqLl5BmyOVP
 1lVFvehASk/expy0yCYKvky8zMEkpMBM/WNIC/FH7niC5DPX9WUP13duyMyYDqYLoitf
 ial84IHHayCm6ixmEvpBKjs0hwArQbORxkMvCxh2LoTZWtdZxrp3myqobli5Ztdpx4Iv
 cNsQ==
X-Gm-Message-State: AOAM533ScoBLDSIdUVXJUle9G5hB1VwVxSlrHjYs+SmMoLwje9ZIWqzO
 m87VOKnwAlIQibzmm1K7Qkc=
X-Google-Smtp-Source: ABdhPJyc8uW9u0ZD2Jas6M5uA1na3hBNSiwxG5dg6BPAycOvVDokDs2wSf3uewc4l3yP5DkjClQlQg==
X-Received: by 2002:ac8:7d15:: with SMTP id g21mr16873499qtb.351.1623081730715; 
 Mon, 07 Jun 2021 09:02:10 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id e24sm6172214qtp.97.2021.06.07.09.02.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jun 2021 09:02:10 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Windows 7 crashing due to patch: target/i386: extract mmu_translate
Message-Id: <BA7A5980-1DBA-4051-BC27-0DCDD1D1FC29@gmail.com>
Date: Mon, 7 Jun 2021 12:02:09 -0400
To: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Windows 7 is crashing a lot in QEMU due to this error: =
PAGE_FAULT_IN_NONPAGED_AREA.
After bisecting I traced the issue to this patch:

661ff4879eee77953836ba9843c74b202844a492
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Thu Mar 18 10:16:35 2021 -0400

    target/i386: extract mmu_translate
   =20
    Extract the page table lookup out of handle_mmu_fault, which only =
has
    to invoke mmu_translate and either fill the TLB or deliver the page
    fault.
   =20
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

 target/i386/tcg/sysemu/excp_helper.c | 151 =
++++++++++++++++++++---------------
 1 file changed, 86 insertions(+), 65 deletions(-)

Here is the bug report link: =
https://gitlab.com/qemu-project/qemu/-/issues/394

Thank you.=

