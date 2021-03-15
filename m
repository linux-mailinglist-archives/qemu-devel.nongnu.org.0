Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A333C5C7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:36:42 +0100 (CET)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLs53-0000AM-Oc
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZE-0002b2-Oe
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:49 -0400
Received: from mail-pj1-f52.google.com ([209.85.216.52]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lLrZC-0000qA-NO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:48 -0400
Received: by mail-pj1-f52.google.com with SMTP id
 lr10-20020a17090b4b8ab02900dd61b95c5eso12585435pjb.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y1rs2HPOtD5FKljEnDvYYS6MJHXjaTqMOoVOuF0UqjE=;
 b=qDLa26RBQ9BQfyOnO/CwP9+QMrGrwBUWbt6jySFPuDFNNRV2Zql98W0meCJPrMohuD
 uOmUU2Mz1QDelORsI8VcdqYuC1WQJq2xwtyrtgG1d3qh1WxKrSAroLYCjn58g7//X2VR
 LrFD9n4UJOGWzqoGFKdIK+h2o8yzRHWxLoUZV1KikXtaicCCcj+Yz/3EPwnITRDKUoml
 8AWLhzfzowo7IRNiiLitboXfk+j2XZ7NJROwTuiyhHYN+h8Q2NRV6CMk+iF5W4Gy3B89
 +zrtOcIdyaAXx4WqTUToMffKPG1mycmue4KUa6LAtASh20B4bwD+LC0Sfb9KJXnsgcZ0
 Oi2Q==
X-Gm-Message-State: AOAM533Hq3oiI0g1SrCXWyA/LqL4VCLlgiYM2j32PvXaWRPTs6SmZ4fd
 /evqsRMnKAp3me9vISFEup6QrY+arD4=
X-Google-Smtp-Source: ABdhPJwTmVwzCpGYq3TuO5JLListkzhYb9WpcuRe4CuyfnA1tHigaBtuc1G3OVLoY6Z25lA6M0VbOg==
X-Received: by 2002:a17:902:344:b029:e4:a7ab:2e55 with SMTP id
 62-20020a1709020344b02900e4a7ab2e55mr12916107pld.63.1615831423919; 
 Mon, 15 Mar 2021 11:03:43 -0700 (PDT)
Received: from localhost.localdomain ([73.93.153.95])
 by smtp.gmail.com with ESMTPSA id y194sm14267842pfb.21.2021.03.15.11.03.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:03:43 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Disable unsupported features on iOS hosts
Date: Mon, 15 Mar 2021 11:03:37 -0700
Message-Id: <20210315180341.31638-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.52; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches disables code that cannot be compiled or run on iOS by adding
feature/header detection at configure time.

Only the first patch still needs to be reviewed, thanks!

v3:

* Add braces in if statement in third patch

v2:

* Broken merge where config_host['CONFIG_SMBD_COMMAND'] was duplicated.

Joelle van Dyne (4):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use
  slirp: feature detection for smbd

 configure            | 26 ++++++++++++++++++---
 meson.build          |  9 ++++++--
 qapi/block-core.json | 10 +++++---
 block.c              |  2 +-
 block/file-posix.c   | 54 +++++++++++++++++++++++++-------------------
 net/slirp.c          | 16 ++++++-------
 6 files changed, 77 insertions(+), 40 deletions(-)

-- 
2.28.0


