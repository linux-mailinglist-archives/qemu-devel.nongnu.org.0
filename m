Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A343BA8E3
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:21:20 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgWF-00087S-VD
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgUs-0006tE-4P
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:19:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgUq-00008u-QA
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:19:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id f14so15764947wrs.6
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m66YsPnAjbUFRPjZjWssOAfXhqgM8r1DxGapJ+NRUNg=;
 b=vGBoQA+KpFwhRdrsOWhuE/Yesh1a+P9pV2n+36pswl0z9SszYR5B7OozdHDwfES7BK
 VO0oIkympLSDLsA0zP+SsDLHUlo/14F6X5fqnl3UqRAU8aI5CxtEHKu2edj4d7qGgsy5
 DDiQ5LLRe8TD6EPFA8Dlh84/zX1aHE8YZ/LwGtYxzBCGIx4wqwlOzQeweRfJPOf5sxye
 tUpoNKO75hlzgRSrh7JV22KnGtU+TsFM814naI3DeIW9k2R6mNB81qqSDIEAYrgh7Q6n
 JHrqLKFP+9fmNSEWcdD5e6nk/TgWqHpfIKos861oEO9YjIPq/MOHHw4BscmOLbPQdzf0
 tM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=m66YsPnAjbUFRPjZjWssOAfXhqgM8r1DxGapJ+NRUNg=;
 b=nMQ6L7AZmCmbFjnpSErDa+Yf3cK6OZC9kSWMETTpA4gZIx3vAbAZQ7WciajO2bOspv
 HdjW+Sl2flbItXs6fjUjAb2Q8Gf4327A2PvvZOnnrC+VmvLgPScyS2MbgAElD6IcYzSu
 qtLtvd2f/lQWvxJ8ypoVuLURwNDWB9/ie7WqK13gNDRbhIl7jL4KOnQiU2rVuhoctSBU
 Ap+nrgHfDxCTCKUd6E+Nu6TmWcO79+rFD9p71gJDIxAEXe+X5UXLptK1fZKaNkZT5vDy
 P4D0zRiELAyBfUI/zaQSNByb/eXFRliX5VkCTuhHzaF+EaSFSRa/1peFAmB5GJj0Yivj
 qveg==
X-Gm-Message-State: AOAM532uyzEP7KdRZRPczbqMq9YDNZdhKdVkB/2M2QASJzjg6hbCEllI
 CQ9VkcdKFrP/ktRr5eO5vK1U4Yf+0/qIxA==
X-Google-Smtp-Source: ABdhPJy4ulPROJQThJSO5mPeb1MeRiZeg3SsVisL0Ng5no94Kurz6jMykFttMgQ+aq9eOWTwy9yvfg==
X-Received: by 2002:a5d:6b06:: with SMTP id v6mr5701650wrw.146.1625321990704; 
 Sat, 03 Jul 2021 07:19:50 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id z24sm6139105wml.10.2021.07.03.07.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:19:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/6] dp8393x: Housekeeping
Date: Sat,  3 Jul 2021 16:19:41 +0200
Message-Id: <20210703141947.352295-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Housekeeping while reviewing Mark's "fixes for MacOS toolbox ROM"=0D
series v2.=0D
RFC because totally untested =3D) Just compiled.=0D
=0D
Mark Cave-Ayland (2):=0D
  dp8393x: fix CAM descriptor entry index=0D
  dp8393x: don't force 32-bit register access=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  dp8393x: Restrict bus access to 16/32-bit operations=0D
  dp8393x: Store CAM registers as 16-bit=0D
  dp8393x: Replace address_space_rw(is_write=3D1) by address_space_write()=
=0D
  dp8393x: Rewrite dp8393x_get() / dp8393x_put()=0D
=0D
 hw/net/dp8393x.c | 191 +++++++++++++++++++----------------------------=0D
 1 file changed, 76 insertions(+), 115 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

