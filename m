Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B253743C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 07:12:13 +0200 (CEST)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvXhL-0004F0-6E
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 01:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nvXf0-00038k-2u
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:09:46 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:39851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nvXex-0001z4-Kf
 for qemu-devel@nongnu.org; Mon, 30 May 2022 01:09:45 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f83983782fso97836587b3.6
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 22:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:cc;
 bh=G1Vn85QDIoBciIGtdVyFLSZ7lkQFYiwDWYJxyDBtHDQ=;
 b=LjUIv7DSjGqN0fmtCtZ9Jdap8zYMpscUbUPsfbR5nhdFujsOYGPCUDLXfxDYVs8OFj
 UYsqCGoRoHvPSCG3XaquZRfQZHpprzCcT6VqyBb0GVsRc5uhJgRfbX1u8kDr+tka0DlN
 u5SA9vMh7e4iIStkZjXRTims8v9ojb6a8oearN8daBi8QgLffKAuJooGoxBU33IG8o2M
 uOAsE/2JVMdfak/ff+Jdgo2RazFVZJO4IWLfdCI4A8BGQ3Ao9+qs0QjXTznFq0ydtsrM
 rPykv4Bm62ExZAdli5rCdglvZuy2Fjfnb1bOlyrpk5t1Y8MpG1loB3sccYbPrHbHrIbi
 93Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:cc;
 bh=G1Vn85QDIoBciIGtdVyFLSZ7lkQFYiwDWYJxyDBtHDQ=;
 b=Pn5/WrXdK9SRxby9wQ0VibyRLctMAsaSzzIa4CmCGDR6RwsPV3VkIlBXPwgryM+++N
 Ksmj7Ci3PALpDf7oidh7Rfefgf0880XGUX+Gx5kXm78/luwer94cgy12n0VlWlesTh22
 qwFk5CthwC8ACZ5NMCYwsgb3n6ruLpQmmn5/Qu5mQh+3iDtc4Jy/P1ytfEeKo+xpy8vE
 6aaTUcyRmx6uc+DZkpiPQz8KJAJ21vUgFCPvFrzJUXRXHC330jJxFXt05IbU2leRtWSs
 Y/u6Ac0VKY5pXCSJZc+uSjGceAamUMH+Wc3sNLfc/STu4VOUVoK4SwIlQwNeH4951bim
 KtOg==
X-Gm-Message-State: AOAM533b5kKqmM1vi+TB7pIcK7Vlm4/r97qICbXxBkv60OQEk4gRqRDI
 o1zlnkslS6oBxBiURzr2vnjym9HuIsMOW5L/xZ4=
X-Received: by 2002:a81:12c5:0:b0:30c:3a79:466c with SMTP id
 188-20020a8112c5000000b0030c3a79466cmt3461832yws.152.1653887381813; Sun, 29
 May 2022 22:09:41 -0700 (PDT)
MIME-Version: 1.0
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 30 May 2022 13:09:37 +0800
Message-ID: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
Subject: Outreachy project task: Adding QEMU block layer APIs resembling Linux
 ZBD ioctls.
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi everyone,
I'm Sam Li, working on the Outreachy project which is to add zoned
device support to QEMU's virtio-blk emulation.

For the first goal, adding QEMU block layer APIs resembling Linux ZBD
ioctls, I think the naive approach would be to introduce a new stable
struct zbd_zone descriptor for the library function interface. More
specifically, what I'd like to add to the BlockDriver struct are:
1. zbd_info as zone block device information: includes numbers of
zones, size of logical blocks, and physical blocks.
2. zbd_zone_type and zbd_zone_state
3. zbd_dev_model: host-managed zbd, host-aware zbd
With those basic structs, we can start to implement new functions as
bdrv*() APIs for BLOCK*ZONE ioctls.

I'll start to finish this task based on the above description. If
there is any problem or something I may miss in the design, please let
me know.

Best regards,
Sam

