Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7919DC45
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 06:03:21 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2ShU-0003ni-5Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 00:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1i2Sfh-0002lg-MN
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:01:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1i2Sfg-0005AS-Mr
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 00:01:29 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35196)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1i2Sfe-00059m-0T; Tue, 27 Aug 2019 00:01:26 -0400
Received: by mail-pg1-x541.google.com with SMTP id n4so11867532pgv.2;
 Mon, 26 Aug 2019 21:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LoljCxasXQr8gEYD+Q8SANmO4hCFYq0yLIjxP2rk0U8=;
 b=d9BnNFVZqD+KKzofeBZGdTXb+caLVyQIc/02sdH7r5Khr3Kr0AXb5UXskcyC0BvMQf
 EZz1VlXfbULCm6W0eosl7sTDxUWEvM0Pfk0MmFoX0YZ0jXLIwfGbbfvmtaA6+0s5ioei
 t4NFF1rrsm9mQ2P+wHA2q3GiCK1S73QRbhPv283Nfn8vtKHS6Yf8AaQ4tWEbOO+dtNGx
 W93G87niNL/bm78WKa5rkZdyIXZQcXcF88yn/MgcyFkDsouKCriIQAr0ST5fHb3MkBWw
 Zxj+TDmcmpvQPZUfUL3VrTJ8Jio1VU7AE/CGs1vjevGEa/HHDQ8kj8pYSzeKFVlSPYs/
 TycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LoljCxasXQr8gEYD+Q8SANmO4hCFYq0yLIjxP2rk0U8=;
 b=FYYbuCklbvPU9e0EeXjYLhRxs3iljM8Y89j498bXZYNNoveSU9dUwjNOO7wh51umXN
 TXldfmaFQ5naF7Z1r3giHU6eMjlT3fe1Y+H87NLn4ElACo13qsCTgQERje9mKvWPPlOi
 EJj/37sg+3D76duloCe6EvHlUAPN37w0PIf8rCVj6w4VyrOFQg9F/cit8Ym0hLijxY6i
 +V/PZPiHbED6PT4c7UJqHl1Nwyu6k786hkMRMGJuo+h43n/BK82MUjyxV7jjqY3MBHyi
 HOlBnIpAqKSepLrgirGSgo+9Znk4WxnFMcrgeqRCKCFuwhQIQjUNo9znEmVXfTxocZFM
 6IAQ==
X-Gm-Message-State: APjAAAXr7njk7yOBdq6o1jeb3SZDh4qBiFVJE3p+bSUR6OpD+kqxeJU3
 ZvVhfvgBB/WokOFNYPL7oR4=
X-Google-Smtp-Source: APXvYqwE5gz7da6qAA6F70xqhFSQxGDq89kdTXLkHnzLg1x11JrmQpM1Fz/F1eKAkNEEh7xdX7CX3w==
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr19080840pgr.156.1566878484847; 
 Mon, 26 Aug 2019 21:01:24 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s11sm12004814pgv.13.2019.08.26.21.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 21:01:24 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Tue, 27 Aug 2019 14:01:11 +1000
Message-Id: <20190827040114.23390-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v6 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v6:
- fixed bug in get/set pin
- added error checking that Cédric suggested

v5:
- integrated AspeedGPIOController fields into AspeedGPIOClass
- separated ast2600_3_6v and ast2600_1_8v into two classes

v4:
- proper interupt handling thanks to Andrew
- switch statements for reading and writing suggested by Peter
- some small cleanups suggested by Alexey

v3:
- didn't have each gpio set up as an irq 
- now can't access set AC on ast2400 (only exists on ast2500)
- added ast2600 implementation (patch 3)
- renamed a couple of variables for clarity

v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
read/write to minimise confusion with a 'set' of registers.

Rashmica Gupta (3):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC
  hw/gpio: Add in AST2600 specific implementation

 include/hw/arm/aspeed_soc.h   |    3 +
 include/hw/gpio/aspeed_gpio.h |  100 ++++
 hw/arm/aspeed_soc.c           |   17 +
 hw/gpio/aspeed_gpio.c         | 1014 +++++++++++++++++++++++++++++++++
 hw/gpio/Makefile.objs         |    1 +
 5 files changed, 1135 insertions(+)
 create mode 100644 include/hw/gpio/aspeed_gpio.h
 create mode 100644 hw/gpio/aspeed_gpio.c

-- 
2.20.1


