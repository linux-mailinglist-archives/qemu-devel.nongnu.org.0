Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F283BACC1
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 12:58:24 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzzpP-00034Z-2d
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 06:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzzny-00013F-Ep
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:54 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzznw-0000Vp-Nx
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id j11so19769815edq.6
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xuxeHeoUxcuqbq2weyQozI0FUtPzMx8nYq3tLSLLTiw=;
 b=GM7Nzrgu2e3rRwY6s/IQ4fuJZqFDbHu8ZVbZCU2eK8sdTrg455t4ke3B9AWF35a70X
 wE2mzKoZ6qRHziJbnuoe/oYQiIVBkgqxU8im12L83WbWQPiZI4V9CZVOt666hN4sk0jr
 453ABe0jkdnHCxRUsPIyvByhtLbLQN2j7FJ0QtXz1X4i1Pw13vZS0eyLgkxo++c6gRen
 7LObdoCfaxjIa2cayINtKSkUNVIvGGHPIELR5SxqJt/a977AAphHnJ3bGj1b/xWbHEEr
 /VrUFW0HCTc7cVz/cf62DYQVX4qUBKQvVxTCQy0lh+nQLuapcPBGhmhwfx5vSq+JD2vv
 cIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xuxeHeoUxcuqbq2weyQozI0FUtPzMx8nYq3tLSLLTiw=;
 b=RHUYhsBGimBDl3+4e27dAzGWQgumbvwFVxFVPm0ygDNdanNUArHwhuafuaJ3vMds/K
 mX+Gz3cTHy6caC6QIxgsESDMy/UTWiABhE8PFTbimAoT6NT0/oki7FQCPnsS3RSCGQIn
 kF+acw908Oe2+Xpjj3EhB5YqTiIWynivs64LunP1m5seyOmWwSJiu1zLad20LNsBw1xE
 JUxBLuNQz1nKq0vAo6jF3LOsVz/jOCH/vaVb7SsAhbWMuNHXgGDhutdWOI8Eg5De8sJ0
 NOhKjKw2TkSC13BoJ9O0JWX4SZICNB12uH9ePEspHjRerSeM8iMx48Atgxk/Gl0GqZ8O
 s1qA==
X-Gm-Message-State: AOAM533XtslcNqkl0ZcLdKhJaLTUkhrGb9MLPM6ETuAG4+N97YdUe0T2
 Gm8PotDW35WLIXm54yfdDRDJHv+7Nk8=
X-Google-Smtp-Source: ABdhPJzrVM6hkhQmzoMjytQQ0TzCtY9ZdrOH2mHvW6VbPUqKVUvt2TtaIPGjY/hjoy+Tf6WnU/0uOQ==
X-Received: by 2002:aa7:de12:: with SMTP id h18mr2833503edv.108.1625396210294; 
 Sun, 04 Jul 2021 03:56:50 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id o21sm3795839eds.10.2021.07.04.03.56.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 03:56:49 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [Qemu-devel] [PULL 0/3] PVRDMA queue
Date: Sun,  4 Jul 2021 13:56:43 +0300
Message-Id: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: mcascell@redhat.com, pjp@fedoraproject.org, yuval.shaia.ml@gmail.com,
 vv474172261@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:
  
  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-02 11:46:32 +0100)

are available in the Git repository at:

  https://github.com/marcel-apf/qemu tags/pvrdma-04-07-2021

for you to fetch changes up to f6287078c2e41cd8de424682cc86c2afccbf3797:

  pvrdma: Fix the ring init error flow (CVE-2021-3608) (2021-07-04 11:14:02 +0300)

----------------------------------------------------------------
PVRDMA queue

Several CVE fixes for the PVRDMA device.

----------------------------------------------------------------
Marcel Apfelbaum (3):
  hw/rdma: Fix possible mremap overflow in the pvrdma device
    (CVE-2021-3582)
  pvrdma: Ensure correct input on ring init (CVE-2021-3607)
  pvrdma: Fix the ring init error flow (CVE-2021-3608)

 hw/rdma/vmw/pvrdma_cmd.c      | 6 ++++++
 hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
 hw/rdma/vmw/pvrdma_main.c     | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.17.2


