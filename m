Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE21BD74F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 10:31:13 +0200 (CEST)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTi7c-0004ze-1K
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 04:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTi5p-0003jK-P2
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTi5p-0002J4-AR
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:29:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTi5o-0002Iv-Uf
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:29:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id d17so1375434wrg.11
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DwPbxu23lkjyUl5B0qgGKA8zAjYZIJItzWNye25rgBQ=;
 b=O2QoJLrjysCNKN6oJKzFwY9zKog7X3tENWgF+PGhWpA+vaii/rvI2mzXFamMtwBne3
 aXwZ4WRslIw9fw7UEcwUc36uwwMYtPM90dLnGs9r55cvyBxS80GqKGxdr8cYBuuo0Mpq
 zrb37U6cV/HP52m3eyH3Aj2FS3yntJfs+LusIgXtojDun3IaX3gUQfhoQjsz0uuDiTU6
 egFQN281PqEjiKYtP3h7NkR0vj4+E8luTSnyEfANr3wCB7uyhitlUYNzkU/BeDwx4Cki
 VvIZqksm71swfEYDIbyxuC4v9Z9GPQZWa/tH9x3VHNIaZnx49k+0/skdsLNvqmkIkEco
 Nxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DwPbxu23lkjyUl5B0qgGKA8zAjYZIJItzWNye25rgBQ=;
 b=HhTC+GzrA2npGPiqvDvABYKoFlOnZzNcjunchrkPeYMjigFxTCAzCKS5QvLlko+Z39
 fP3N8aRoa+W6TrwY2h+Zy5a6norJyTC7ApXd4NdNX/jA04Vzu7olLBU+4bSESSX/6/HG
 0d3UVjPpQDm3Aj/F4PLIe1vogpR3l1GsypgSndanGEygDCG4HGswxQa3kIeD4sGcBsAd
 zVg39XsZDAyMvtoYii3Az9AythZxFpqk3a35bo+020U0NJ3F4NNAGmaoN17Yymt3/RKf
 9FtHyX5CLj+W4oUEXGSbsGSlxc+3kHPwbCV+HOnYfVu5XQkx7Pga/8ugM8OaFyg+VjlK
 KsGQ==
X-Gm-Message-State: AGi0PuZsuORt4BoZ+DHGzLEXnwXPET+q58ujs2TMCOg9F4dNor8a+RDT
 IqoHqwXfrgi4/KWgrpJB0TuHkUhwyoU=
X-Google-Smtp-Source: APiQypJRps+Y3wGpDH6nRw/7042oXxDpHezPO0wd05kUN98asGHqIkkJiqz4yLKqXCcvNIjQy0iaHQ==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr37645574wrq.14.1588148959214; 
 Wed, 29 Apr 2020 01:29:19 -0700 (PDT)
Received: from localhost.localdomain (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id a9sm6373615wmm.38.2020.04.29.01.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 01:29:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] mips: Minor simplifications for KVM use
Date: Wed, 29 Apr 2020 10:29:14 +0200
Message-Id: <20200429082916.10669-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::432
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
Cc: Huacai Chen <chenhuacai@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A pair of trivial patches while reviewing Huacai's
"KVM target support for MIPS64" series.

Philippe Mathieu-Daudé (2):
  hw/mips/mips_int: De-duplicate KVM interrupt delivery
  target/mips/kvm: Assert unreachable code is not used

 hw/mips/mips_int.c | 11 +++--------
 target/mips/kvm.c  |  8 ++------
 2 files changed, 5 insertions(+), 14 deletions(-)

-- 
2.21.1


