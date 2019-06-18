Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DD449C6A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 10:54:04 +0200 (CEST)
Received: from localhost ([::1]:54898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd9sR-00083s-EM
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 04:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hd9qi-000718-5P
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hd9qg-0000fs-82
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 04:52:16 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hd9qc-0000cc-H6; Tue, 18 Jun 2019 04:52:10 -0400
Received: by mail-pf1-x443.google.com with SMTP id j2so7256500pfe.6;
 Tue, 18 Jun 2019 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=snit/yseUcrZq6RkNSA3lCMWYlX3mSDb0XLYFyqTCkU=;
 b=azRhhvmiI3kd7xWqp88u3iKomPup5W0cBu+g6bXixr1i/8VNCGMuW4+/PQs2GamLpz
 ShOHn67ujUtQe3oIwonoBHLTJV8yBzNm41soVAxuakZdP1OhPIjf/lioQVVL8kHRvR7P
 yv5IapvnbDKVVhT3LMU6D+00QUqRy4lcASxiGR52+L/sWtctZkUC337lt4OTZ1mIliDF
 78GTs+jF8r11XPGbWmYjikt8FrNdlP+sAkOVlbpuB2/xHTzsExRxuTJtiJid5Y27BQJi
 l/yi1jRTABiy2y5eLbl1o4sWMzR76wCrSvHlfwwOyhnIabhNUDoFGGMiRwFepn0k052v
 f4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=snit/yseUcrZq6RkNSA3lCMWYlX3mSDb0XLYFyqTCkU=;
 b=VNqb4L/2CeUuOJ42xlmX6zvhGZF7J/RHVSJ8IkH510vdwHJTY7MlMXjXxwatD0/Ifu
 a6+yYvA1xqqanTPDB3U6a5EHALXs+RzlCQk9QhoTUk8pgsX6So1d5i1LkaAxW33m8veK
 tDj8L407CzSoRE2ORFwA6yLs/vYM0miJaQG8lj5L37yx/UBC/lsB3Wj8GNENMlRFbd4V
 BGD5gQgkfxY8iMH8kNInk2TLNxHZKDsTNjnyMpYdHhEMAR9oMv44u6Okwn5kMW7azrpd
 7uWRB0GoIOdmtvgbHuq3JsA1np/fYcdjqvpLG/jOJ8Dllb45q3sR4CUNzP5VrlI5sdda
 uKZQ==
X-Gm-Message-State: APjAAAV13IE1Tab6/tG4U9mdPPKacVaiUoVXD1E9/JLKKczjAHxRChpw
 Y4VkkrSEunvZai3M5G18WkzV6q9K
X-Google-Smtp-Source: APXvYqzl/DKuIbm1iziCJtjFQWrgqy4sEqylu9Lsiz0hTbUbL2l3hGswV7VrbVd+L0Di91dRHaMZYw==
X-Received: by 2002:a63:1450:: with SMTP id 16mr1695033pgu.52.1560847928392;
 Tue, 18 Jun 2019 01:52:08 -0700 (PDT)
Received: from rashmica.home.majoof.com ([43.245.162.131])
 by smtp.gmail.com with ESMTPSA id p7sm27032616pfp.131.2019.06.18.01.52.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Jun 2019 01:52:07 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue, 18 Jun 2019 18:51:52 +1000
Message-Id: <20190618085154.21498-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH 0/2] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, clg@kaod.org, qemu-devel@nongnu.org,
 Rashmica Gupta <rashmica.g@gmail.com>, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These two patches add a bunch of the functionality of the ast2400 and
ast2500 gpio controllers. 

This is based off upstream/master with two of Cédric's patches:
- aspeed: add a per SoC mapping for the interrupt space
- aspeed: add a per SoC mapping for the memory space


Any feedback would be great!

Rashmica Gupta (2):
  hw/gpio: Add basic Aspeed GPIO model
  aspeed: add a GPIO controller to the SoC

 hw/arm/aspeed_soc.c           |  17 +
 hw/gpio/Makefile.objs         |   1 +
 hw/gpio/aspeed_gpio.c         | 869 ++++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h   |   3 +
 include/hw/gpio/aspeed_gpio.h |  76 +++
 5 files changed, 966 insertions(+)
 create mode 100644 hw/gpio/aspeed_gpio.c
 create mode 100644 include/hw/gpio/aspeed_gpio.h

-- 
2.17.2


