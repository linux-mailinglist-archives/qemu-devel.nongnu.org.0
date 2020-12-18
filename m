Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF542DE98B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:03:19 +0100 (CET)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqL26-0005pY-Ie
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1kqKzP-0004Uf-Oa
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:00:31 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1kqKzN-0005Rr-0b
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:00:31 -0500
Received: by mail-ed1-x52a.google.com with SMTP id b73so3379913edf.13
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=i9AJ6nO4jP04Q8/Iv4STMQfNJv4r8xYCybyynOVPMDU=;
 b=uVCtfj4rNQNZlVkrr0Kzp4CvGGMkVNMzAwA5n38bY8HBK5fNS11k/Cl8lxjrVWldmC
 ewWZ1/MvjQzH30jesJNZFHR7Ezn+ZNZ1noEhpUweYJ6XB8fX3AnDpL3Ul0JBu9Zvrzvu
 Z4EVkOzukAf5kKrsxXBD0knq/k+9Kv/GGPWj8Md9cvC1edvDoUpDAPlx4K55nn4rqFfh
 3X0oSy7y6kOYK1WHLLlTtSVz2a6ODGIXvqQ9GG58Fjrg+DlPmNAK2ZrZ5jqSPy40oAp+
 emMulztJfsybQY7pqUj61tAIUU7blHkO41QHiiXn5+0WRsmqEC7vJC5FZETZCJok/WAv
 oI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=i9AJ6nO4jP04Q8/Iv4STMQfNJv4r8xYCybyynOVPMDU=;
 b=DxEKCJbiYnnnv8kwrwr8fa8jk5ZOxU5uvuqVqG/k+Jp25UbY6GAJ5wFFG1Oqsv1lDj
 UFdYmx5aN53YkozuJOHiUUCE+NqRwHh7PA53IIslg4zU4FgMTGB7eCAm2k0Fwa/89xWT
 mR4FwwZwGNGDkd2f6JSOaAD8L4hviP5nt6i4DmN/uFzuGvVhJLigL3XN1NqEU+qcuyKD
 2ywSGUYt0e3Wxg+m5KW0WqODa3dxxuT+mo7NHXpmoRXj3tIAKwDUr3Ep5tuwNSVS3y1l
 jFoWISPDi7uQKo2e/vBS6SUo4R+7tnxRf9wmhdRC/R6EekM89gsm381Ie3f8o5DsEU8A
 wbIA==
X-Gm-Message-State: AOAM530HUIBTQ0hiC8uc4cGIS+cff/a4LpHrgxAFYCx/cnnVWU+kLQcB
 vkDfRIQxdUHRDGe42T+8jVbH3V6ilts=
X-Google-Smtp-Source: ABdhPJxJqiZJwd4fsEg5WqLsKGIts/fEYCFE+09Vr11T79UeZB2XiwtzsvLJWjGG1K2gmB7jqa7v7Q==
X-Received: by 2002:a05:6402:13d1:: with SMTP id
 a17mr5797748edx.202.1608318026387; 
 Fri, 18 Dec 2020 11:00:26 -0800 (PST)
Received: from localhost.localdomain ([77.137.149.240])
 by smtp.gmail.com with ESMTPSA id o13sm25094633edr.94.2020.12.18.11.00.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Dec 2020 11:00:25 -0800 (PST)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [Qemu-devel] [PULL 0/1] RDMA queue
Date: Fri, 18 Dec 2020 21:00:21 +0200
Message-Id: <20201218190022.31214-1-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: alex.chen@huawei.com, yuval.shaia.ml@gmail.com, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)

are available in the Git repository at:

  https://github.com/marcel-apf/qemu tags/rdma-pull-request

for you to fetch changes up to eed31bc5e2e9cc68626d51e7a10914dc52c370f8:

  contrib/rdmacm-mux: Fix error condition in hash_tbl_search_fd_by_ifid() (2020-12-18 20:15:42 +0200)

----------------------------------------------------------------
RDMA queue

*  bug fix in contrib/rdmacm-mux

----------------------------------------------------------------
AlexChen (1):
      contrib/rdmacm-mux: Fix error condition in hash_tbl_search_fd_by_ifid()

 contrib/rdmacm-mux/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.2


