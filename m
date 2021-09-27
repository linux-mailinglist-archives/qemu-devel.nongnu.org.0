Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8134198A7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:13:02 +0200 (CEST)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtFV-0003Ei-2t
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43@lizzy.crudebyte.com>)
 id 1mUtDR-0001lZ-Cw
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:10:53 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:46877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43@lizzy.crudebyte.com>)
 id 1mUtDP-0001HP-J0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=cEB90n12CFLufNveNchkBneeRL/hOHPUm8TTP0y+nII=; b=nRfHp
 5LDbiuUjhBa0evbtR4/gGVaP0AEGycSEHX/Vq0hbv/2mrC77d+GPHuMXyZQyz0XplPog1m41SE/gb
 5bD/xo4GFpdIVbDZ2BijRGZZCTz4cO0h3VdwYO75W83PMXVq7QQLv79VRbUyuRNkF8iE+GxChudJF
 cRnPp5DXaX0W1IKe4zRTDMQOCinFeqo57jfAsjcotGOL/pRfnDFAysFVa+HypMNS8zDexk7gnRaIF
 3tdveiv9r+tY/vgoShXo4K4XTLUCPoMbkvmxuUSInj+AjpyH3EAoc2yYGFCmQGBVqy/Zhz6oIVqXB
 ppmFWzFnsNmpDryCrAVW2VEGfRTEQ==;
Message-Id: <cover.1632758315.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 27 Sep 2021 17:44:59 +0200
Subject: [PATCH 0/2] 9pfs: iounit cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
    Philippe Mathieu-Daudé <philmd@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b84eb324d2ebdcc6f9c442c97b5b4d01eecb4f43@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Two pure refactoring code cleanup patches regarding iounit calculation, no
behaviour change.

Christian Schoenebeck (2):
  9pfs: deduplicate iounit code
  9pfs: simplify blksize_to_iounit()

 hw/9pfs/9p.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

-- 
2.20.1


