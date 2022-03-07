Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEE4CF0A6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:29:27 +0100 (CET)
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4zu-0004eI-Gx
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nR4vk-0001bT-JN; Sun, 06 Mar 2022 23:25:08 -0500
Received: from [2607:f8b0:4864:20::736] (port=40852
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nR4vi-000186-2P; Sun, 06 Mar 2022 23:25:08 -0500
Received: by mail-qk1-x736.google.com with SMTP id c7so10992178qka.7;
 Sun, 06 Mar 2022 20:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=fTf3GhxR2bhJZVaSy4GLSmPZyZhZL4SSDZrg40eJ9xs=;
 b=L/v6xCeOQFI0Ez2cZydBJIqLo2XbHutZMkhJdNVD6Y8shL7AfTCtvhHx5Ss0Jc18fI
 /nwN0l+O9eAolKGcSOd4m59AWt+eMzlNDwlzpmC/e3ESbSZsfnwjCa6E42aNwOFqsaA1
 Z0ZCqctOxmPts5ySseKx8B+A1KZGmWhUqtkqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=fTf3GhxR2bhJZVaSy4GLSmPZyZhZL4SSDZrg40eJ9xs=;
 b=JvQZr75+uTTnYdjXdi1M/g/DGCxYpGBZ+mTl6xKGMdTowzwhKNwxNF4vv1HKez0K34
 H5yy24DCoqdwpTz8Xp4pmQbhfIaYstQ7tqdHqHvgECB1NlxNcCD9bSSHCayccMOB+rlP
 T6q0+DBagBgW0ykOmVZIe6rQM26GRjxFESU96tqbqaSigeb+/B7P44EHGHwsz41agrpj
 rUwpr9WXmNXxAB9+wj1dO5jMeTBUW8pvJdHkDzMWffuZ9GaRHMdlJB0Qnn2WeHb3USpz
 u6Q4EWVmJfboJpbF9PypYmAp50P5UK7hPG18vkNovlYfmT32qVHdPXi23epDly579XKo
 EbNQ==
X-Gm-Message-State: AOAM530vb8KQF9YbiqGrnT3sVC+0m+kbAr8XWNY+Ny+VcM5ijvJKnZNr
 vGmNBhcyHdeMJrzh4t54x9D2PbHuIEI7rwQaNblkFdzVTbFSZQ==
X-Google-Smtp-Source: ABdhPJxuYGLNSAY2IuhyFb6F6UnlxPQVHJHH7aI/99Oe9ZWw8S68YkhDrs6clsJPnDTeu3DBNnCxywM5gUjjIZurbTQ=
X-Received: by 2002:a37:3cf:0:b0:67b:1bd3:bc09 with SMTP id
 198-20020a3703cf000000b0067b1bd3bc09mr2449506qkd.165.1646627104443; Sun, 06
 Mar 2022 20:25:04 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Mar 2022 04:24:53 +0000
Message-ID: <CACPK8XfoKNxr6_KkDFFZm0P5w9m_ddD5E4SeuAkypXXr7swR7A@mail.gmail.com>
Subject: [PULL SUBSYSTEM qemu-pnv] ppc/pnv: Update skiboot firmware image
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch
'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05
18:03:15 +0000)

are available in the Git repository at:

  https://github.com/shenki/qemu tags/qemu-rom-skiboot-v7.0

for you to fetch changes up to 76b349cf7b40349069892bbc0bdae5e5363b27c9:

  ppc/pnv: Update skiboot to v7.0 (2022-03-07 14:50:50 +1030)

----------------------------------------------------------------
Update skiboot to v7.0

----------------------------------------------------------------
Joel Stanley (1):
      ppc/pnv: Update skiboot to v7.0

 pc-bios/skiboot.lid | Bin 2528128 -> 2527240 bytes
 roms/skiboot        |   2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

