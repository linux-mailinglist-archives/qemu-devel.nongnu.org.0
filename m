Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7912E501
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 11:40:02 +0100 (CET)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imxtZ-00057B-IC
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 05:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jason@zx2c4.com>) id 1imxsq-0004hS-Hk
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 05:39:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jason@zx2c4.com>) id 1imxsp-0001GW-LD
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 05:39:16 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:40571)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Jason@zx2c4.com>) id 1imxsp-0001G9-Fz
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 05:39:15 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb6bc442
 for <qemu-devel@nongnu.org>; Thu, 2 Jan 2020 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=S7D1zVMReq8bZ3EKWj74lmVjmno=; b=kPgdSI
 VV/W72SwFm+m/uSIBdQ30oOxfqG/xLwtbMrpcAejS6w2OEsa8gPFv+1YHSx+iffL
 39imbwiBaBSoCHZWgcA0hJl0NQ0fS9NmXlRERY51P7B8kq7AxHknJIA+L7VioBBO
 ZTuHT3VOgjhlQXNpOco3yHu3JTFeSMLRjB0wf311052qv/Q9U4C97LNd4wtuCd1H
 u5dgnDIr642rHqkqlYuN2XMUuoEQMloJGl0YFlymASAPn+rO4aHZdPSRrxtpdNsf
 /UOeohQ5YBt2zVooMK5Qjy0aP5XWU6SbKwn+mHURsdS7hjvnzrPtm442DORO90s7
 wEEGKrerW76YbrNw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7e57df83
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <qemu-devel@nongnu.org>; Thu, 2 Jan 2020 09:40:44 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 19so44017858otz.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jan 2020 02:39:13 -0800 (PST)
X-Gm-Message-State: APjAAAUzWIpXf4Ih/wOPsA8S5Yf5+cQDWIWY8vIme0cCTJfbjioAbJ+3
 GDCo2qO2xGNaESN64e9hIy9/gIrSG4p/U4U70PA=
X-Google-Smtp-Source: APXvYqz7j/zxE8sQZTzfJU5SfMs7NLi2mqcjtqrl7niLT3bf3TGGe9LqJVgumK12296C0zRySup2iBX5/IBI3Acv78w=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr93232724otm.243.1577961553051; 
 Thu, 02 Jan 2020 02:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20200101215905.121298-1-Jason@zx2c4.com>
In-Reply-To: <20200101215905.121298-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 2 Jan 2020 11:39:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9qBRFAr1webkpL=C0OwiRikQJbCgbeePnJcwJWbWK9OLA@mail.gmail.com>
Message-ID: <CAHmME9qBRFAr1webkpL=C0OwiRikQJbCgbeePnJcwJWbWK9OLA@mail.gmail.com>
Subject: Re: [PATCH] q800: map reset function to poweroff of some random kernel
To: laurent@vivier.eu, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.95.5.64
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Superseded by https://lore.kernel.org/qemu-devel/20200102103644.233370-1-Jason@zx2c4.com
, thankfully.

