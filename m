Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4E185643
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 20:49:06 +0100 (CET)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDCmO-0003MW-JR
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 15:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <programmingkidx@gmail.com>) id 1jDClX-0002qz-1V
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 15:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <programmingkidx@gmail.com>) id 1jDClW-0000e0-6i
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 15:48:10 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:40844)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <programmingkidx@gmail.com>)
 id 1jDClW-0000ds-3g
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 15:48:10 -0400
Received: by mail-qt1-x829.google.com with SMTP id n5so10753727qtv.7
 for <qemu-devel@nongnu.org>; Sat, 14 Mar 2020 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=JWbtVwjub4Ei5mBr87toBcg5Yr6GQPaoNlSMK73Qj3A=;
 b=UUsCSTdauyYC2upI9drsKPzXruhR2/kQgi6WLQb0WSVtMIN57BPS7j8B9dyJ8QCSqg
 Ni0kMcl3a4duwSxpZFJg+W1cl1Wdy05ruLWFcX1kUPynsz3s1j38MM2b6nQXot3OqT12
 1BENnQTm7vcl26seE2fqYd5l64tWUH2Vh+RocuLYhxnpZpJXqTJHQq7u1YJ/roLbDL9t
 4aOG/vwt0t1Fb03jjKxOQONDHtEjAcox83XDsp9BAKQ/7gUUFs+zHSvLQBok1Xbc0rsS
 Xbd2iSeJOTzkhuHqnW1IvH/mgsd5oTwSdVdwuw7SaS/GxZwb7TnVjaxqwKvpdIRrrlaa
 F+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=JWbtVwjub4Ei5mBr87toBcg5Yr6GQPaoNlSMK73Qj3A=;
 b=GDbzLEhUIPBlw0wbbwoQU443i29SG7F6mNKBQYo7y7T+gBERWd15of3GB/Wvm/4bzC
 mKbZK/9AszrT4GgszRqu7JXiQ1pdXpwL7oIwwpdaXD+wF9tMjPYWAtJPzzuc+ATzJEAH
 +iVEU6GR/fouhirlbKc/UbKxZtSIah9ncb9MdM0G+uzfmhS9bNtc9X0sQxGG/nozhdvy
 fkinYvlV2oqrpsM9R7KdaPdFKxQoDSusmwUwUtysy+9+GpE4a1ja/quyZfpFQpLoF2dR
 oRlvHjEbZ+p5r/X4dH/AKzC9ypHLC1mLiBD5DZ6hRmL8iJhabojkZOPKg7zjFgJzhb4o
 5JpQ==
X-Gm-Message-State: ANhLgQ19ZZlHkSu3fc5HsdOABD30Mn4S3uAWa3GgccdDbl6VifDAbAiP
 LsYuV7ttA4UTxPtXDRr0NjI=
X-Google-Smtp-Source: ADFU+vs0tc5thN1eTwymW7c9vsblJhSWvNJ755SSR7/nGiLWhdg7XM+YojIWuuztuH9btiLnGFQ9LA==
X-Received: by 2002:ac8:59:: with SMTP id i25mr18764330qtg.110.1584215289046; 
 Sat, 14 Mar 2020 12:48:09 -0700 (PDT)
Received: from [192.168.0.4] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id s49sm15071089qtc.29.2020.03.14.12.48.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Mar 2020 12:48:08 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: About dialog copyright date needs updating
Message-Id: <23616B70-CDE2-45FC-8191-F39445698F63@gmail.com>
Date: Sat, 14 Mar 2020 15:48:06 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3273)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::829
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

Hi Peter, in the About dialog for QEMU the copyright date shows as 2019. =
Can it be updated to 2020 please?

Thank you.=

