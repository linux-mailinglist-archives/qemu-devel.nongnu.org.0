Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016D4EA247
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:18:06 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwkW-0004C3-W5
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:18:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiH-0001Ve-UC
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:45 -0400
Received: from [2a00:1450:4864:20::22d] (port=42742
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiF-0003oe-VQ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:45 -0400
Received: by mail-lj1-x22d.google.com with SMTP id c15so20932887ljr.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkOFRzzgp2TSh6W+JlMMVZrAD/0t9qIZPITg/HhClFE=;
 b=b0u84X0UWTNDxWBvlN0iq2j/q97XzWr474utoZDbQpy+OftAY0CiQwwJxft2AsL+em
 f5p4ZzY7E8dfX2oTmcIcqTx3nv3VsS4PUPWRvAW6WMp/u1LTdRiMBuQ01VG4JCfIrOJw
 bKH4fk6jTmMGjVD/Ark4QY+Ghxjx/xtzucLouQ+ifvH8BnMqkkQt36+LqQ5BjlPOleAF
 PIz5lYxb3gyFY9RCR2ecO+PgT62U33c56Kq9hoZ2jfWYjxRs/OwJeSOEoyHnn852Kg/e
 mSi7dEUl/YmRCbAZHKXMAWAb5a31oy8bwimRStJ+6EFJuQbA0oFUQb+X0U6kx3AmdrGj
 V+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AkOFRzzgp2TSh6W+JlMMVZrAD/0t9qIZPITg/HhClFE=;
 b=dpinSIjVeEVSgKwy2l+g+293AZzuxz6pfxD2D/bcSo2POz7BGo609IG2fYEMn5WiVW
 xYYcJu0I5GqA4TnTYrcEYwqLM6rWo7b5jSSSxQA5x1M6MSH0mq24AlyK7wZtybNvgwZt
 qhR49uV21CudB07zTZjxjz7YzUlOI+fFL+NdwwmDdROYAgd/+vzDmbRE72oD49gkb9A+
 TO8TNOg3QAzz7Kk2DwMvhXkDmfd8lIWNUnzkStPz4WG6ZxrutKHYhUc5RCdz+lID4alf
 4k3qBW7hXtRO2avMKaozm7ECGrEyEHSgo0kfYz2POCAB6hvq3ODVb2RIBu5kP10p8oib
 odFA==
X-Gm-Message-State: AOAM533hpcaHfmSUtYuYJ9mbx/6iJ9wWxeezADQE/GH6QRacJTptcxzU
 LPUL3upBoX9HfDfk4Nr7MpkdaWQ/Vb7sWA==
X-Google-Smtp-Source: ABdhPJzLwqzf8tcVvOR7HabibC/WCgDwVtP2aGY2njP5zrXvO+1OsBzBcNrKcAxkYiPo9pU9rguTmA==
X-Received: by 2002:a2e:8851:0:b0:249:9504:d19e with SMTP id
 z17-20020a2e8851000000b002499504d19emr21598620ljj.153.1648502141308; 
 Mon, 28 Mar 2022 14:15:41 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:40 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/9] Machine type compatible properties
Date: Tue, 29 Mar 2022 00:15:30 +0300
Message-Id: <20220328211539.90170-1-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to be able to check machine type after its definition. It's
necessary when using complicated inheritance of compatible features. For
instance, this tool can help to find bugs in the machine type definition
if the name of the device has been changed. Also, this tool was created
to help with MTs of other projects such as vz branches.

Maxim Davydov (9):
  qmp: Add dump machine type compatible properties
  pci: add null-pointer check
  mem: appropriate handling getting mem region
  msmouse: add appropriate unregister handler
  wctablet: add appropriate unregister handler
  chardev: add appropriate getting address
  colo-compare: safe finalization
  qom: add command to print initial properties
  scripts: printing machine type compat properties

 chardev/char-socket.c       |   9 ++
 chardev/msmouse.c           |   4 +-
 chardev/wctablet.c          |   4 +-
 hw/core/machine-qmp-cmds.c  |  25 +++-
 hw/i386/sgx-epc.c           |   5 +-
 hw/mem/nvdimm.c             |   6 +
 hw/mem/pc-dimm.c            |   5 +
 hw/pci-host/i440fx.c        |  17 ++-
 hw/pci-host/q35.c           |  17 ++-
 net/colo-compare.c          |  25 ++--
 qapi/machine.json           |  58 +++++++-
 qapi/qom.json               |  69 +++++++++
 qom/qom-qmp-cmds.c          | 121 ++++++++++++++++
 scripts/print_MT.py         | 274 ++++++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/qos_fuzz.c |   2 +-
 15 files changed, 613 insertions(+), 28 deletions(-)
 create mode 100755 scripts/print_MT.py

-- 
2.31.1


