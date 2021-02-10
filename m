Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8CB316902
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:22:30 +0100 (CET)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qNx-0004PB-Go
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9qMP-0003M5-CS; Wed, 10 Feb 2021 09:20:53 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:42172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9qMO-000626-1R; Wed, 10 Feb 2021 09:20:53 -0500
Received: by mail-lj1-x22a.google.com with SMTP id c18so3030863ljd.9;
 Wed, 10 Feb 2021 06:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/DdGZsZIGWVIzVRPCh+Uk463K1NvqWsggymDZTzsGc=;
 b=uXYjAdONT4UBKfdaeZIX+g25yW/+SFnV8MWlzoYDiVNvEo8hriByWiE3LJgs6Fhw+i
 w95oQtvfP+8XA8ClgktX6+bsvz3C20LXBetmY9Z1SHzEYd89W3y+k5UfuwUQcXNTf4A+
 vqgF/HJStAEnBN8VFcRiNWTV6sRUZ6PaHsFLISDwfNUK1FjoZKBgSSMfhCUsvfZUBYOk
 ZopQcsK1FC8fzbIpf65E8vCyqDq8iXr5oK26h2g3oXsoRWQXCZknIDS9/AG6ABAw2Wp+
 iD7ElpjrhjxTr/ZWSIoiiqw/kC5iMk0mN9bu9wjtEOUELlh5mtDxAPTflvyGEWjuT1TF
 ulug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/DdGZsZIGWVIzVRPCh+Uk463K1NvqWsggymDZTzsGc=;
 b=edBQ1yCOXV+qlmVGQdr4ZN+kBJZm6GbfNDxD/SePOQFSM4QYgo0JO1GV1ZuXKzHJhA
 48vDoCEp9fnKNJcZQpKst4s99zGtdC9wgEn3IKL8abVrSwq73ZcQL5CBmAgWSQ4Jnf4N
 L6XYpY+VLjzmiMAS9Zhxd+iPaDvOYPinaq/6xGBme45+1tLzcqgWwOkc1ECdhlHbNcEW
 Iys8vEdBH470eCrnxrPy3JNA1ZLLjQ4R9fTYUIeFbqT9h3gmS+jjpW6mu4FassojfkY/
 cR2lSS3vlrCxBF3QXho49Zt/AFGqvudTl2b841pBQQxfT/x9ac5NiBbsLuVYvnbzFZQH
 jYgg==
X-Gm-Message-State: AOAM532rMuIKniS4Juo43d6xaPsgGPAJf7J4EfOiPiLUFUyl/uLc4O3W
 0q42x3NM8XqaOXMS4doHfZdMsL/fqRsBfA==
X-Google-Smtp-Source: ABdhPJyjeTlPi04lbjR9o+VeQcMfasnmecWlZIA9iKQBaKx0wXLMxpmszeI3Zv6u854k7hTxjJ88LA==
X-Received: by 2002:a2e:b0f3:: with SMTP id h19mr2009974ljl.233.1612966849851; 
 Wed, 10 Feb 2021 06:20:49 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v28sm502589ljv.66.2021.02.10.06.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 06:20:49 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
Date: Wed, 10 Feb 2021 15:20:47 +0100
Message-Id: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22a.google.com
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 komlodi@xilinx.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This is a minor clean-up making it a little easier to play around
with different CPU configurations.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2

 hw/arm/xlnx-versal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


