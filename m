Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7805D686331
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 10:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN9ok-0004b2-7p; Wed, 01 Feb 2023 04:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pN9oi-0004a9-8R
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:54:12 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pN9od-0003Gj-S5
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:54:09 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3sNa-1ofKcW0kXg-00zo8q; Wed, 01
 Feb 2023 10:54:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/1] M68k next patches
Date: Wed,  1 Feb 2023 10:54:01 +0100
Message-Id: <20230201095402.1002350-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2iOvjAvtrCb14phKxcg6+lhjU3d2BXyz+xDY5gKZU9ivPBwcSgX
 iFc62XRjNe1rIb5ocy5ZAgQuRe4fQ35O+1EIOJALg5dH2cDFsvrLQSTsW7CwenNkitDyqVc
 4qCoSOtyNT4S6Xzep04ViY6h9rJqd65XM15WjLvgxnoDgNX9bGpuMVLxsvysjvh4PjmUvHe
 WonMyBTZwb/jGHkvR5VzA==
UI-OutboundReport: notjunk:1;M01:P0:DTjOj/mu5R8=;CwPItdPVHGW64+4TYbF3Bleim6P
 qIcEdj8jrB1x80CRGVNPRqFOj2FB5VHODz3CDxMI37f8+1ixti6YQMQis/mISLzUwrVRVoDlE
 J2j6sb0gOswjmB8UVJFsJWvpsv7bLSVa1G6grNk14tgD4HZFpc23hMY2aiy8mrZJYBu0D2tiH
 GIWhnzFL3EYh/efeDwUrJzqkDFwe+xBnbb5p/YWuxCmnnvTuHvAaN4RuCs2r55B3yT0v/t45h
 69Cod8v1onMWnBeqokB86trC91e5tIae1lPXHFhHJjSakpdccmAhF7mY7alXmxRUamAXIPIcg
 WqUP7EHjCE39pEjWwhhmvzVqzzqSLt8M7GQ0Kz8P3HErle9NkW18FaTYenAWJbD2BNO+a3bPa
 EfwPfnoKferPiRol/xmPHBdgwnSIN7u2lf8dFbznNnu7zvmjiZkFs8eu1CpxnqiphyFv6sNbv
 OIbHdJRVdDKFMC0P0X9rDTIOMMxZgNBzb+CjHQ5P7Ad0Vk1gDEz1+ZNSKF8EBPFIXslRhzpFX
 f/pG6jPHLkp52cO8RYJjBkkDCCktxe3anZ6ke/fFCLKmPTJC2GRiJl+FrntlkSF07q1LgPG5H
 gyw8V89uuZSXV06wB5OcQKm1tmU/ofd05RxTCcPVpa7fXtdeAyNSSZE0QWyZKV1A6vREfoKTz
 02fRfXbX68ziQJOHsuLQRMp15Cu7JTQxz6VrgwD05g==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the Git repository at:

  https://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request

for you to fetch changes up to c1fc91b82545a2b8ab73f81e5b7b6b0fec292ea1:

  m68k: fix 'bkpt' instruction in softmmu mode (2023-02-01 10:18:21 +0100)

----------------------------------------------------------------
m68k pull request 20230201

fix 'bkpt' instruction in softmmu mode

----------------------------------------------------------------

Laurent Vivier (1):
  m68k: fix 'bkpt' instruction in softmmu mode

 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.39.1


