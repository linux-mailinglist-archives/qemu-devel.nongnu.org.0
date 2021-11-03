Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357704445A9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:15:14 +0100 (CET)
Received: from localhost ([::1]:41524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIuv-0000By-Br
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miIt7-0006gg-52
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:21 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1miIt2-00045X-Bm
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:13:18 -0400
Received: by mail-lj1-x22f.google.com with SMTP id t11so4719245ljh.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wa0v1U2LuDNoL48v8vrhvNK9WtkHaOZ+dWUnJrVugPM=;
 b=qVd2MAm7sZTuJJXnNFvbVroZvIN9D9gyGv5nzrdnngYXvqn2FegNxA1Ez0s1wxklaz
 eHLwzdy2/eqrX1oN2bzsvMnFkx8enH0PxkHnRGxj5Q+pw/C1/34NHYdzduo3nwKi5wkb
 WBKpt2A7vgifIu83+yPOLXTV830G2GOgat0zXtWw2r9kt/F/Za/ZBYK11HcFRZTa020l
 jQ1QnEY3RVTog3toWhSmDRBOyyk3mlv/QKkW9OSC15VbnMjKhtSgQv+0cQs36WZgYB/E
 yl3QR08kspOZRI/fbhgNCswQqZhwdsf1WtpMS+6MNjmb9mGnYt3ln8ln2QXXkbU3Vrez
 FpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wa0v1U2LuDNoL48v8vrhvNK9WtkHaOZ+dWUnJrVugPM=;
 b=gDGn9hP1sByuryt0L8pLyePI3mSixEW2TY9d1HOQUdnJ86kMAvBSVj/imDNcbzomuz
 GvY1zZDhc6Qr6gPlLoglq0q38+4VHNQLeRE1SBPBgzjXxBm/lKCEYITE6V66/nhwwvem
 QNsRa40k6F5h7hzsOI8Hz2QAZlqk0gzmrVptzwHFAf3Lk5UVb/zSnSLDHZ8jXWBnL1tP
 bG/CKVk06lUH7EYkLZktY85OkMF+uoEZc3u92A6qVmqQcbq6y5r7l4BiSECpBbqhWR8z
 GoYcc4VdJSzB4X0FKTcGbi0GD6MvHYg7o5QHaAjGZJc7EeenABPyDollfOavoNl8vAe4
 baOw==
X-Gm-Message-State: AOAM532yCKYXEit4DLzc/DbXgTOVa4OQ5JKU3hV+yFn22MiyVaY2W36P
 dndyJERtkOzzBvVLAk8rBbbn6A==
X-Google-Smtp-Source: ABdhPJzl3T/5xwuiiqBnNEiQvJ3qnMrA9wKPRxPskwuvPP+mq1xEsasP+NxcYqD2jYuMNcjCETsUAA==
X-Received: by 2002:a2e:9e06:: with SMTP id e6mr46924658ljk.190.1635955993181; 
 Wed, 03 Nov 2021 09:13:13 -0700 (PDT)
Received: from vp-pc.redhat.com ([2a00:1370:810e:bd31:a3af:f811:c4e:52b8])
 by smtp.gmail.com with ESMTPSA id a3sm243337lji.48.2021.11.03.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 09:13:12 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: peter.maydell@linaro.org,
	yuri.benditovich@daynix.com,
	yan@daynix.com
Subject: [PATCH 0/3] contrib/elf2dmp: Windows Server 2022 support
Date: Wed,  3 Nov 2021 19:12:57 +0300
Message-Id: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
Windows Server 2022 guest. This patch series fixes it.

Viktor Prutyanov (3):
  contrib/elf2dmp: fix code style
  contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
  contrib/elf2dmp: add PE name check and Windows Server 2022 support

 contrib/elf2dmp/main.c | 103 ++++++++++++++++++++++++------------
 contrib/elf2dmp/pe.h   | 115 +++++++++++++++++++++++------------------
 2 files changed, 134 insertions(+), 84 deletions(-)

-- 
2.31.1


