Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447BFD7E6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 09:28:08 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVWxb-00048U-KK
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 03:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <teemu.kuusisto@gmail.com>) id 1iVWwl-0003cQ-JX
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 03:27:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <teemu.kuusisto@gmail.com>) id 1iVWwk-0006Rg-Ja
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 03:27:15 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <teemu.kuusisto@gmail.com>)
 id 1iVWwk-0006RI-9P
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 03:27:14 -0500
Received: by mail-lf1-x136.google.com with SMTP id j14so7358118lfk.6
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 00:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x3N3pfWAuR0wfYqlvml+CllinbXTcYh8KS49S6oDEqY=;
 b=T0QLyewFL1LbpCsfn8s2LJBdlOWmY4txaGBHT1XvHmeSGAjQFxSxORgoY+AsNnDEGz
 BS1KxejhS3kVrgC4xrtGSdGR0/Sm506bLlSpOHchKf7coSovW/mJd7ediGL8ASDXLL5F
 OyKn8/fYfl9takf5f9EDgUB8ClyfSVf/yBiClm7PLUaPLfIBZXdRGOVUBM+QUuC0TiYo
 mYH6RCM3XwXmvD7JNhiNPH0IiMUyNzt+UzNKUkbIndfOwgmWW8R7PVdbMZoa8l1dPR+f
 rMxcFrS7TRg4ve/MqReMIccwYGi5UTOGSnlvrGikEJqGyewc0fKFRa9h9gF8i9n9ZwPO
 hzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x3N3pfWAuR0wfYqlvml+CllinbXTcYh8KS49S6oDEqY=;
 b=hXQutluKN2+Y4IWIbdDMNcxsoxPWMWv/dygnBJw4QtoBtY/EBwSt++U1Vps5HlVq6S
 wgRBdsoFOcARJzPqVH9QkNX/JispVfLofri1y/A0DA5tgPbt1WTPZV0f743Po6AXDFdo
 vxdTwbUCQfF76PjvWMr6ofRSHnQBwhg38F67BLCeGVnBxRcHV800HY6lvGEkqJzcsGiO
 Bxmqhbs9BDxzM0K7i2swtQRL7v9YupOvIiQ7h3vqJcI2As1OJae2awOdgNu/FyPxkPRX
 u/Axye2K2DJLvBS/iztlbHo2yT1orVqnVXci1Eu99kuTkExQIos4Hvx+XkG7T3GI14/N
 6kDQ==
X-Gm-Message-State: APjAAAV3qk8JrrsLbvYzQuhsbsToHV0CJhSN40euT4E0hl+yO+HB4Esc
 rgtO6Rd7TUAmHk32iPLUIwo=
X-Google-Smtp-Source: APXvYqyqGGfWMncG7E2rlXEPCA4ltMp2Ay+3f5vhTDThGpIeA3q/HDKtundGYfSRHxRyhuA3PqtVaA==
X-Received: by 2002:a19:5f44:: with SMTP id a4mr9675992lfj.45.1573806431924;
 Fri, 15 Nov 2019 00:27:11 -0800 (PST)
Received: from valhalla (guest.anygraaf.fi. [62.44.192.148])
 by smtp.gmail.com with ESMTPSA id n133sm4199738lfd.88.2019.11.15.00.27.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Nov 2019 00:27:11 -0800 (PST)
Date: Fri, 15 Nov 2019 10:27:09 +0200
From: Teemu Kuusisto <teemu.kuusisto@gmail.com>
To: Samuel Thibault <samuel.thibault@gnu.org>
Subject: Re: Braille device (chardev/baum.c) is unable to detect the TTY
 correctly and does not act on graphic console connect/disconnect
Message-ID: <20191115082709.GB11020@valhalla>
References: <20191114120915.GA31365@valhalla>
 <20191114130841.kxgorkvtinyaahdm@function>
 <20191114132712.rpqzq7jvl32beduu@function>
 <20191114133125.o7bc27kdvkduygrt@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114133125.o7bc27kdvkduygrt@function>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::136
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I totally agree with everything you said! That would allow accessible use of remote virtual machines, which I initially thought of as rather unnecessary but it definitely is not. I just did not dare to even think of the new possibilities it would offer!

Brlapi already has a file descriptor. Could spice just grab that and proxy its contents as a channel? Only brlapi's open/close connection and enter/leave tty needs to be called by spice. That does not sound of too much maintenane for spice. I just took a look at the header files of brlapi and noticed that you are involved in that project too, Samuel.

-- Teemu

