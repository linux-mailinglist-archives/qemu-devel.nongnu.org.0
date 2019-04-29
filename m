Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14062E75D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 18:12:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL8tI-0001n9-71
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 12:12:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hL8rk-0001BH-Sn
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:10:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hL8rj-0003qM-Ty
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:10:52 -0400
Received: from mail-it1-x136.google.com ([2607:f8b0:4864:20::136]:40012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hL8rj-0003pL-Md
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:10:51 -0400
Received: by mail-it1-x136.google.com with SMTP id k64so9777174itb.5
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3t8thYSykPOt3evLHsj2Me359Tq+7SnvH1AtuRkDAoI=;
	b=ipfEL11jzs82Frpm2omtLpEsaA1SdoRmY+4+TNvIR61IAc1P+qMU+QHQRI3mU9pn+P
	0amqrspqXgsag1eYZXPzeZ+8RyrNdx+Y8vpgZv9v+GBBxa0Mjd8oRGEAkPFQlVRtoMOw
	KhRDyFvorEAkA/vBib/03XVj+5sXqF8jAlvz1avQMGDLao1n8MBLnNjfjKuSEXpoP1Zh
	rvi4yFEN5sIjD+JLWDz6FK5pIa4BQYz/0mA3UTjYqA1LEhL5irBE6qZ+f0anBWVYs3VP
	xn3RIE4L3+WodCHBnqyD2LsU87UDYiRk97Is5ZHq8hjzebUvXmmlUBlu5Rw6GAaPRnhj
	2diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3t8thYSykPOt3evLHsj2Me359Tq+7SnvH1AtuRkDAoI=;
	b=dlcNpHqLvQ9zMQVApnT5PVpzgKd6s/MIou8BMiH5wVHlAEpA5jdyb3yC+o8sZbT3fd
	tmVDc3LnZ+oQWH/nBA2RxeaIYM+Bt0FGBeLm1Mza0yRgqK4qaLCsi8erwi1kgRTYKzLI
	ki75wJihjLax2k6gVC9vCkQPFKQK57iGlC60bJLTwIhvzuOYiOyEDJAxvYY8hAsny3p7
	bZZHJFA1thO4hk7MIrMu72Mr5Z362Sba7mtB9AhcSCcGAeNdAHWFzzK0l1CHFEyscfkT
	xQL51FRxFNWYGkmhX+p/54o3CBOdRNX9RpwfNd7v+kiqy8yiPnmWOMU2Vm1Hh4J5wYe/
	+gNw==
X-Gm-Message-State: APjAAAWzyoc7kGXuU6p7OyZa/Jj4FmTHqOJCtSs+717X7tiOodrpOIia
	lb1u5v7yrKTwjKS9iaYr2WCVqEGpktE=
X-Google-Smtp-Source: APXvYqxXWBFM0CKSf0BcE/68lR7YePynb5mh2HHBS3Caalv1d1lHcrTKLpkFkYNK66ZD460FYITeHA==
X-Received: by 2002:a24:4d06:: with SMTP id l6mr18718224itb.140.1556554249996; 
	Mon, 29 Apr 2019 09:10:49 -0700 (PDT)
Received: from localhost
	(CPE64777d5479c3-CM64777d5479c0.cpe.net.cable.rogers.com.
	[99.228.64.175])
	by smtp.gmail.com with ESMTPSA id 15sm16278734itm.6.2019.04.29.09.10.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 09:10:49 -0700 (PDT)
From: Stefan Hajnoczi <stefanha@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2019 12:10:45 -0400
Message-Id: <20190429161046.10527-1-stefanha@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::136
Subject: [Qemu-devel] [PULL 0/1] Tracing patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e0fb2c3d89aa77057ac4aa073e01f4ca484449b0:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190426' into staging (2019-04-28 11:43:10 +0100)

are available in the Git repository at:

  https://github.com/stefanha/qemu.git tags/tracing-pull-request

for you to fetch changes up to b1939fcd438b7140cb8f2685dee026bb112819d7:

  trace: fix runstate tracing (2019-04-29 11:57:19 -0400)

----------------------------------------------------------------
Pull request

----------------------------------------------------------------

Yury Kotov (1):
  trace: fix runstate tracing

 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1


