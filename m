Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F25EF31C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:14:00 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqYI-0001LV-PW
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odq9n-0001af-LF; Thu, 29 Sep 2022 05:48:40 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odq9m-0004IT-6R; Thu, 29 Sep 2022 05:48:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so5437327pjs.1; 
 Thu, 29 Sep 2022 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=88a+p4hKtnSbJ9xNcEs7czmAqe//VjXtLSTzwRxNysk=;
 b=cBn8VtINpL9V9hBM96NHPSLFvaAIJ52mhC8ISjwPkCvZdQr2PRHaYpAe5q3CjG10Rt
 zhIQYQX/8ceMnCpmtp26CFPMivzqgdYh/2oULVTbpoEF+5ieo/na9S8R1dBFii5vYPXw
 csl/R/hPm2lem+i6cGHgIPDJxItxvfdH1H2vYKMmouNM8loSPNcV1fFu48jeH0i67qCZ
 tZuwd9lc9mSyxFGAkjfvh4+m1JJD3BaCEu0kdAYLUDoDNJgBr5PRt00Bj5WXNqCTLv4U
 HzzUSmis+ni36olacP5sW7HXVcHsFYTlxZ3DDgGEKweLKgFwNjis+k7wg5PPNOwi4h42
 aPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=88a+p4hKtnSbJ9xNcEs7czmAqe//VjXtLSTzwRxNysk=;
 b=kGQ2xHonNbgESIQeYmmukSQN66FUWb1BDSoO4wa0XVFn1XKjofdDevtCeB+HcTECOe
 3fl+hoksPdk3DxT1hFy3KpTtK/0C7z5oGJm3P6e3XhCh7BxJdNmEt1ITDwV2goG4shCh
 Z2fevakk/auJ2Gjz3gK5waOUpcyNLhNVUsQ/K0JAVUiiacutZqnoNUhX5M9q6u2GhfE9
 H43lFrnUwxK2ljfthRwV4d43p2NA6GglCGTBJ7oOf7nfBi9Spop9jMRU+jLvjkYfgG+5
 /yRMWBaBBuCln/YnamDB5W6DOJGsKBj6X4agSPvMkAl0jQ+1YLrJoEzs3hMoLDBLDwln
 VdlQ==
X-Gm-Message-State: ACrzQf0Ny8zLvWCkNl/dDLoPneOCDbWh7A4vwgdSB9j6kHfLnHApyjef
 Mtq2wwbKdFKv5LfW6kORnG2u/Fh/6txtJg==
X-Google-Smtp-Source: AMsMyM6i4x9EQg5XHvAzreRttdYHXBPWx/M4PYJ3TttLNjl+Z2kUOqbi5H+C2Tky8nZYp+zW55WNQg==
X-Received: by 2002:a17:90b:1b52:b0:202:c1e3:7e9f with SMTP id
 nv18-20020a17090b1b5200b00202c1e37e9fmr15370495pjb.68.1664444914966; 
 Thu, 29 Sep 2022 02:48:34 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 f4-20020a170902ce8400b00178b06fea7asm5574515plg.148.2022.09.29.02.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 02:48:34 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v2 0/2] Add zoned storage emulation to virtio-blk driver
Date: Thu, 29 Sep 2022 17:48:19 +0800
Message-Id: <20220929094821.78596-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- change units of emulated zone op coresponding to block layer APIs
- modify error checking cases [Stefan, Damien]

v1:
- add zoned storage emulation

Sam Li (2):
  include: update virtio_blk headers from Linux 5.19-rc2+
  virtio-blk: add zoned storage emulation for zoned devices

 hw/block/virtio-blk.c                       | 393 ++++++++++++++++++++
 include/standard-headers/linux/virtio_blk.h | 109 ++++++
 2 files changed, 502 insertions(+)

-- 
2.37.3


