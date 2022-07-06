Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636F3568741
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:50:03 +0200 (CEST)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o93Xe-0005Te-Gf
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o93OM-0000vr-Md
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:40:29 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o93OD-0002uv-Qe
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 07:40:21 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMXDj-1nqYnY2uAB-00JbKt; Wed, 06
 Jul 2022 13:40:15 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/2] M68k for 7.1 patches
Date: Wed,  6 Jul 2022 13:40:11 +0200
Message-Id: <20220706114013.340537-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ENs9UXvODjge0UCAYPOosy4+KA8reiU1VT93PdZRawM2gDmGPgp
 4QVlI7OuH+vPnkTbDpgHd1Sjf3kXwqGVUJPSQ/tWg8JVHmewG5OTKLE5aHedegVEGSGHYxe
 YIZNECn+63eyLBaj+n6qZ5T0bALveVSWAEtBtP+UPKWPoVCcROWlUPBwz1EIVYG3k16a836
 16pYOdYsufCzRTbxwcojA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y4bUSfjOjr0=:pJ62sl08q/nQNE/v4l5Duj
 S1KHmihn9Eozj0KIaSWfGWFmJF0MniKFWvmqYcfKuexgivM4KY9HzoF3Z41MWWvWHUs+Ga2Fu
 A3XmOqDHa4dNHLtYJnAQS9fKJf2JLMyD1h3FMHZjS8zye4pQrowvNuiDTKzjURtownmC+DO4a
 evEB/yiUcNExUiw4Yh4CWKQJ4Ahkt5cjI89W1CsgLPGskzDzqouaz+xbNLDClQgk0pQcnH2rQ
 yqeXfsY5/Y6Kj7+bfu5UKMjJB3EXE0UGana5HUx5+04BTdbMKxbhZbMjRo4fY1yQNeXCB4XbN
 Gf7BYbzAgETmJkY7x/AsrKNkzk+dq8x+xKCKDCqdJggAGoLqGsilPueyjE9xSzm30CFha/2eg
 URuR/828M/dyNH7SVOtptoAddJ77ZLpT0mVN6lYe4C93DIzUigdbmjgu0Y2IH4RxWMEo/YBT6
 x1wYBhXgobcIJlF57ze9ApTIYhgxYhEsAamcRAGIXW4KXgSeuZzTPIOhTnmdzk59bvfls4Yuh
 pVzLEj/rX/0aCw8alXZMK4ksrko13zTipjnNUMLNKOqHfsSxtiknYYo4ecsN+XJdiAKmfoB5J
 Ogry0Ppv4wDfV6EJ56FuTl/Y/z3SdVBZPj6wBQH0Ze5/W26KRdk5QMtZnOlWWlSMPhrOQM/t/
 qWXuZfGIVLJIIssKRGJcpr44OwwxLdtMm3F5Y1HCf2Ocaie2zitJs1TZjO8QpSoQZY0TC5AyB
 f6yLduCzUhbln708zn0Oc7ClXrpPeiU6zChiFQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

The following changes since commit 180c2f24d5e8eada41e012a3899d29bb695aae06:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-06 10:41:34 +0530)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.1-pull-request

for you to fetch changes up to a988465d0eb7e2ee31a3679bbe3fbe71681820da:

  m68k: virt: pass RNG seed via bootinfo block (2022-07-06 12:30:41 +0200)

----------------------------------------------------------------
Pull request m68k 20220706

pass RNG seed via bootinfo block

----------------------------------------------------------------

Jason A. Donenfeld (2):
  m68k: use correct variable name in boot info string macro
  m68k: virt: pass RNG seed via bootinfo block

 hw/m68k/bootinfo.h                             | 18 +++++++++++++++++-
 .../standard-headers/asm-m68k/bootinfo-virt.h  |  1 +
 hw/m68k/virt.c                                 |  7 +++++++
 3 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.36.1


