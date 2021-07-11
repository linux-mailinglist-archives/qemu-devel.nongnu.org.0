Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881B3C3B8A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:37:47 +0200 (CEST)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2WqI-0007ue-2r
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wos-0006Ab-5l
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Woq-00040R-Nf
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:36:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m2so9047346wrq.2
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7tqYYRGiuvQ56JEde0xugddht60zFo+FlRvB+xgS034=;
 b=p2DElWjtdnMR2S+UOufU33KgiFJ8hc7tBL6WEDQ0sGMdJzd2JGbuFBlS5B2HdhrOTj
 0nI5Jn0JFLfuPEYtHS7pArakTxitVAx9wNKIPDLCLUuZJc9NrV4FEFDI4mnoSf2SPrwf
 2khtuoKYlLi2SU9wlSS7U+x/XiwcmLC7aRZJBjG0AzUsTRdabO7/188iS4f7MQgLq6SF
 3DKN9f8IXV/gJGvzTxSoCkzjb24ur4SZ9kHQMzLS2mXLg2i5R68e+mhuQCnsbASDcIKG
 oNVr8YpiglE/JXesnU1uavbbonsRKeNO78V5YC8PhlGLN9eIJ5OExkVTJlz3MyNQJhan
 5Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7tqYYRGiuvQ56JEde0xugddht60zFo+FlRvB+xgS034=;
 b=Qx6aoUnAgXRMEKwNSSHRr8k6gFSUJRwDstk9F1wuQEiZ9LyfhbENLey6OY9R42u03b
 Bji32HO/iFtff/XTkUFuLfsgNVmpzaBzqGVrv6QolmJL7q3IaqTxpTcRXlc0ixtFetVn
 xnWpEPwiAJrno69Brmd/LmV3tXCZgOIV5rDKrhRu/GOKoKM854yuEa5ZJn0lFD+2REbX
 4EWyC701VBbtCpbUm94DXB9IoH5Un8Z9jYzw4KzbYlb9ewutvTXj2Uensphmb/ivPyI5
 lHlu5uIAxK5tU748q6gq8EuaQH2BrSBo8rE7O9CC9Zn5dolQDL+IfRObSp8HyYEDrYw5
 LZ1g==
X-Gm-Message-State: AOAM532IJnA/NWk/2E08v76PCEK0S6qipF88EDuJhJ4g311CUsI3ePIH
 My+Hr9KEBdegAtW9YwsExlyVlVJ7h1AKuQ==
X-Google-Smtp-Source: ABdhPJyMG9IMLdf0EL25KORDaaQT1eastMvctUBBq2w32Q3nTY+u6VKuJp95bi/9yc6UBZHh7FBpGQ==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr8386292wrt.126.1625999774980; 
 Sun, 11 Jul 2021 03:36:14 -0700 (PDT)
Received: from x1w.. (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id h10sm11921197wmb.46.2021.07.11.03.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 03:36:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] dp8393x: fixes and improvements
Date: Sun, 11 Jul 2021 12:36:07 +0200
Message-Id: <20210711103612.2661521-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Finn Thain <fthain@linux-m68k.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,=0D
=0D
This should be the last respin.=0D
=0D
Since v3:=0D
- dropped worrying patches=0D
- squashed migration patch=0D
- added tags=0D
=0D
Patch #3 (dp8393x: Store CAM registers as 16-bit) still=0D
misses your S-o-b tag.=0D
=0D
Based-on mips-next.=0D
=0D
Mark Cave-Ayland (1):=0D
  dp8393x: don't force 32-bit register access=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  dp8393x: Replace address_space_rw(is_write=3D1) by address_space_write()=
=0D
  dp8393x: Replace 0x40 magic value by SONIC_REG16_COUNT definition=0D
  dp8393x: Store CAM registers as 16-bit=0D
  dp8393x: Rewrite dp8393x_get() / dp8393x_put()=0D
=0D
 hw/net/dp8393x.c | 206 ++++++++++++++++++++---------------------------=0D
 1 file changed, 87 insertions(+), 119 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

