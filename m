Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B243F7ADF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 18:46:35 +0200 (CEST)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIw2p-0008Id-Pt
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 12:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mIw1T-0007XH-3p
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:45:07 -0400
Received: from relay.yourmailgateway.de ([188.68.63.101]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mIw1P-0007mT-Am
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:45:06 -0400
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4GvsJv2gqxz57Jf
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 18:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1629909887; bh=Gfg4N8S8FowKhW8Kl+rqSTNLx6cGIj7+L/VGKBYFS3U=;
 h=From:Subject:To:Date:From;
 b=JbWSaOcHI3DgWcnepR4za8b8C7OSjPq9qdpcmlXovPVCzoPPJD4g6HuIprneuUbuy
 5H1Hy8bUVHvRPCmeJxRc+x6lyKlD5tAOZtqQ2EWeO1eE7wsg+h6pBL8QDjK+UhLyh3
 pdod3otvVlQ6YTOYl3HdTD/JJ0Bx4GRNx1SQDVGIiP+6Psm5X3AZCbwwaPD31Qpu2p
 DBU7XzKiyVApEk0ovSzZRDlHN+8tpPLOyMAPCtXpXSD9zl31EEgrt0SEySyqg+EMUS
 +f6pmpbYQDJbZS66usERtlLyr8fos3HD5yIyAUok7dd3ZKz8iJ5Twbbl3lH6L0Rcvu
 1mmz8GRXl86DQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4GvsJv2G9nz57JZ
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 18:44:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4GvsJt41shz8tKY
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 18:44:46 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-38.hsi16.unitymediagroup.de
 [95.223.69.38])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 58AAA630BD
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 18:43:57 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.38) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
Subject: [qemu-web PATCH] Fix link to Windows page in Wiki
To: qemu-devel@nongnu.org
Message-ID: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
Date: Wed, 25 Aug 2021 18:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <162990983768.1954.18379988049991209188@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: CK4TQ0B/kcQ9EnCIH2nlkdn9W0FjuM22pEoAsIFtrnVh
Received-SPF: pass client-ip=188.68.63.101; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The appended patch fixes the link to Wiki Windows page on Website 
Download Sources page.

Furthermore I would like to propose to change the instructions for 
Native builds with MSYS2 on Wiki Windows page.

Please remove the section which copies system binaries to match the 
expected file names!

Instead define variables for configure (gcc-ar and gcc-ranlib are 
existing copies of x86_64-w64-mingw32-gcc-ar and 
x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make install:

AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres 
STRIP=strip \
./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl

Signed-off-by: Helge Konetzka <hk@zapateado.de>
---
  _download/source.html | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/_download/source.html b/_download/source.html
index 35fd156..8671f4e 100644
--- a/_download/source.html
+++ b/_download/source.html
@@ -2,7 +2,7 @@
         <p>Grab the source code for the latest releases and compile it 
yourself!
         Detailed compilation instructions can be found in the wiki for
                 <a href="https://wiki.qemu.org/Hosts/Linux">Linux</a>,
-               <a href="https://wiki.qemu.org/Hosts/Windows">Win32</a> and
+               <a href="https://wiki.qemu.org/Hosts/W32">Win32</a> and
                 <a href="https://wiki.qemu.org/Hosts/Mac">macOS</a>.</p>

         <div id="releases">
-- 
2.20.1

