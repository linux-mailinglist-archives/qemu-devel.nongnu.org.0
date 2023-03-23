Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8596C71C6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 21:45:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfRnP-0004LN-5R; Thu, 23 Mar 2023 16:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRnN-0004K8-74; Thu, 23 Mar 2023 16:44:25 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRnK-0006sR-7k; Thu, 23 Mar 2023 16:44:24 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17786581fe1so23887343fac.10; 
 Thu, 23 Mar 2023 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679604260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FPKiv4Av7DAX9okuawoFHj/Q4H5V/HnL1U0OAze6R6A=;
 b=GFkexIHLBI2Wo7k8NTIHWT65yb7WV5wiTX5waO/ckcRp0aLTAs17fTCgm0ETxekFSN
 7rP7NoA9deJBFlQDrBztAP+HvmGcDehGwXpIApUCaObX9mnLPOQ/58qQtK0W/i+DZMJ1
 muaFtH/YpTVk2CRsLpoiCZXQFxuOziVu5il5YbcFy0dbKZpO0B3mRj9KGxZYs/on7fup
 qpr3O7gqzyaarRMZKjd7xLbhI0pNq12i9NQCvUzyvNAtsAG9s9hb+Qy03TkZUQZz44WJ
 SlZZeocTWvW3QoRskjuPuGKkiwyqMpnqOzHT0iEY4lgqSlyO2jFaovNnOhm8gUTZO9UA
 +DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679604260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FPKiv4Av7DAX9okuawoFHj/Q4H5V/HnL1U0OAze6R6A=;
 b=jVFkcmbGdpuaex2N6zoN3hLKAU1EDUnB7W+QudbEC2ceEu7Bj6rrzzWbeZLXWlh+1n
 tPqUwnSF90VzBIXDKzjTheXfse8xke2rJ6elB76f2jOXgHHTf/u1YT38XZMSqhA2Wo+n
 atw0M7F9p4vMY/xhWecrgXFJ06DWnv8CMqyg2KHCSGXOetRSeWnYv+ZgYGar2shsKEP8
 IOYtSouvIjIHr1IUkowN3RNK0txBqiIyIXOcGva/CI0nhNG1+0hAp4JRmjUJK0ZczlFw
 Nlrn30zNN42Qi09d3RU3Gs+KX+e2xJm/OT9kojJcACdY25b26muVv61PRYDxf3ocwcF7
 omSQ==
X-Gm-Message-State: AAQBX9eMZxAwec/sN87YJilDZbb/QB3JFPXRNd+H0fyagHSD4d9uTG2E
 E9m8CJUM2Kj4Q6APXNib+1hrpdoRJE0=
X-Google-Smtp-Source: AKy350bGaMaZ7mN1VCe6+FkyhzhPXHMEhZe/8gId1HgDVMDVK/wn5tVwWor4k/AVe972+BeXSde/Bg==
X-Received: by 2002:a05:6870:972c:b0:177:a8a8:660 with SMTP id
 n44-20020a056870972c00b00177a8a80660mr446308oaq.9.1679604260328; 
 Thu, 23 Mar 2023 13:44:20 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 vd21-20020a0568708f9500b0017ae1aede32sm6442081oab.46.2023.03.23.13.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 13:44:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v2 0/1] fix dumpdtb crash with ARM machines
Date: Thu, 23 Mar 2023 17:44:13 -0300
Message-Id: <20230323204414.423412-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

In this version I fixed a mem leak that was happening if the user inputs
a fdt via '-dtb'. In that case we would assign the updated FDT on top of
the existing board FDT that was already assigned to ms->fdt.

Tested as follows:

$ ./qemu-system-aarch64 -S -M virt -display none -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 7}, "package": "v8.0.0-rc1-37-ge573ef31e7-dirty"}, "capabilities": ["oob"]}}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}

{"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
{"return": {}}

^Cqemu-system-aarch64: terminating on signal 2
{"timestamp": {"seconds": 1679603324, "microseconds": 62159}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
$ 


$ ./qemu-system-aarch64 -S -M virt -display none -qmp stdio -dtb fdt.dtb 
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 7}, "package": "v8.0.0-rc1-37-ge573ef31e7-dirty"}, "capabilities": ["oob"]}}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}

{"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
{"return": {}}
^Cqemu-system-aarch64: terminating on signal 2
{"timestamp": {"seconds": 1679603344, "microseconds": 145748}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
$ 


First we use 'dumpdtb' to dump the board FDT in fdt.dtb, then we use it as
an argument to '-dtb' and do the test again. This covers both code paths.


Changes from v1:
- g_free(ms->fdt) before load_device_tree()
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05930.html

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org

Daniel Henrique Barboza (1):
  hw/arm: do not free machine->fdt in arm_load_dtb()

 hw/arm/boot.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.39.2


