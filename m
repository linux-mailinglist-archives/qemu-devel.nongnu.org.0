Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724FA36BC9F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 02:25:34 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbBXh-00071R-J4
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 20:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7Uj-0007QC-IW; Mon, 26 Apr 2021 16:06:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7Uf-0001Ng-Np; Mon, 26 Apr 2021 16:06:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id j5so56203284wrn.4;
 Mon, 26 Apr 2021 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuhuR3UqIjFb4yXds2SdFCLnbq4LjC/3ZCGuCZSVLxE=;
 b=UlTnEb/0o3ipOyCz1v/eOvrtnfrkpJVqOEwqIu+lQmSqBF6GF7th0g/Gi9k4RL2R6W
 uZJSRsIJ+Dqm+0rEBzkJjrlA2w9AMd0+5F+gENxtzJGAeEd8OGIwEovgjsFSbOMEfSD8
 MqwbIVYbnmNrq7o20gnupqlV3yhLICPpEjv9iq4ZF61RVZY+SnN25WRTLKObeRbgiMk9
 zCBoTCfol2DHEDMpaJC56DcNBP2TTy173Pd21vLStkN/Oyy6y2+KSP01GNkVlcpW/KSj
 YGVgMM/+LqaL1NTRdC3IhuOeQMvmwGh7EfiuGsPmjV6+xJBYR89v5ZmU+3Gt8E7G4heM
 Efng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuhuR3UqIjFb4yXds2SdFCLnbq4LjC/3ZCGuCZSVLxE=;
 b=GMvQdNh/sysMscEvVo342Eqw4FLqiqh8mRHS76MWSQfwivcYzI+JBS1xDFVu+VG2Rd
 FXefsGr19Y/lYY6+5wco/tpUkwRBRZ7xr+1zB8QuLF1sLORpTm8w1DYY1gPD25cKbKSM
 QWv1m5Ux3W6M4f91IZMokCsTFC78qUuLBSzxd022Ob6D8BpnCpUPz3YsnGBPu4GpQ8c+
 3gSxU89Ksv75cOrONWyt9qixsk/veRDF3UIeBa4Wq/JFrNNftAoae9WHk/bCQwo1OJ/r
 ksw/04Xhw2u1X8eKF6PvAUs/9unrAYXjh+LfARtu1sBluURcQ7MwUp8/LUz6fZw0++2F
 c5tg==
X-Gm-Message-State: AOAM5323ihheBATCL7BPgsPJ7X9oXPJnMO9LfpAAAC8a+HN5rebW23vD
 hiQHzi8TmjAyb1RpOTTCRzNmG0Ab6w6KJA==
X-Google-Smtp-Source: ABdhPJznmNXCiQJK9g8sX3XvFURb8phM4qCOFJ8LX5nHAzxPFnl0MrgOHYtfkFaSy3B4kokZWaamiw==
X-Received: by 2002:adf:f506:: with SMTP id q6mr25231359wro.65.1619467563425; 
 Mon, 26 Apr 2021 13:06:03 -0700 (PDT)
Received: from ubuntu.localdomain (host-92-0-155-74.as13285.net. [92.0.155.74])
 by smtp.gmail.com with ESMTPSA id y11sm1396792wro.37.2021.04.26.13.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 13:06:02 -0700 (PDT)
From: Dev Audsin <dev.devaqemu@gmail.com>
To: qemu-devel@nongnu.org
Subject: 
Date: Mon, 26 Apr 2021 13:05:52 -0700
Message-Id: <20210426200553.145976-1-dev.devaqemu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:21:43 -0400
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
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, dgilber@redhat.com,
 dev.devaqemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


virtio-fs with DAX is currently not compatible with NIC Pass through.
When a SR-IOV VF attaches to a qemu process, vfio will try to pin the entire DAX Window but it is empty when the guest boots and will fail.
A method to make VFIO and DAX to work together is to make vfio skip DAX cache.
Currently DAX cache need to be set to 0, for the SR-IOV VF to be attached to Kata containers.
Enabling both SR-IOV VF and DAX work together will potentially improve performance for workloads which are I/O and network intensive


