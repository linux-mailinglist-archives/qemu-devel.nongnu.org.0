Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C948348556E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:07:17 +0100 (CET)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57sh-00019m-He
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:07:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dorian.bourgeoisat@telecom-paris.fr>)
 id 1n55Mg-0008CB-4y
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:26:02 -0500
Received: from zproxy120.enst.fr ([137.194.2.193]:44212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dorian.bourgeoisat@telecom-paris.fr>)
 id 1n55Md-00005L-RV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:26:01 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy120.enst.fr (Postfix) with ESMTP id 1C7A280EDA;
 Wed,  5 Jan 2022 13:25:53 +0100 (CET)
Received: from zproxy120.enst.fr ([IPv6:::1])
 by localhost (zproxy120.enst.fr [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id EaMwmmlZ7LUE; Wed,  5 Jan 2022 13:25:52 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy120.enst.fr (Postfix) with ESMTP id 0965A80ED7;
 Wed,  5 Jan 2022 13:25:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy120.enst.fr 0965A80ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1641385552;
 bh=fBy3uWw5dAGXUafOHKO2/i5DX0Ppbgozy0HrqWbnSxw=;
 h=Message-ID:Date:MIME-Version:From:To;
 b=ucwjL25AATAo2+7Fyz9lUiSEdygK84yOrrw6fbJo2P9CVUg4YYOnWa7rjrmH1W6b6
 1kZn9BDMZq/uaBN2y97jHfmKa4td58Psj0HO7XBV9qTkwc5H76RSoDaGOy8y2wkEKu
 8eOTqIQ/jjPv8N8CscqtaqWk7EVUQkas5qvkL6d0=
X-Virus-Scanned: amavisd-new at zproxy120.enst.fr
Received: from zproxy120.enst.fr ([IPv6:::1])
 by localhost (zproxy120.enst.fr [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id IHgZBFsiGeBE; Wed,  5 Jan 2022 13:25:51 +0100 (CET)
Received: from [192.168.1.213] (rezel-backup.enst.fr [137.194.240.17])
 by zproxy120.enst.fr (Postfix) with ESMTPSA id D0BC480ED4;
 Wed,  5 Jan 2022 13:25:51 +0100 (CET)
Message-ID: <589feb12-5abf-a247-96f7-d8603a35e5ae@telecom-paris.fr>
Date: Wed, 5 Jan 2022 13:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: Dorian Bourgeoisat <dorian.bourgeoisat@telecom-paris.fr>
Subject: [PATCH] fixed argument order for keymap-get in build
To: qemu-devel@nongnu.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=137.194.2.193;
 envelope-from=dorian.bourgeoisat@telecom-paris.fr; helo=zproxy120.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Jan 2022 10:04:51 -0500
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
Cc: Dorian Bourgeoisat <dorian.bourgeoisat@telecom-paris.fr>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, trying to compile QEMU on the latest ArchLinux update (2022-01-05), I encounter a bug where keymap-gen is called with the wrong argument order.

$ ../ui/keycodemapdb/tools/keymap-gen code-map --lang glib2 --varname qemu_input_map_linux_to_qcode ../ui/keycodemapdb/data/keymaps.csv linux qcode
usage: keymap-gen [-h] [--lang LANG] [--varname VARNAME]
                  {code-map,code-table,name-map,name-table,code-docs,name-docs} ...
keymap-gen: error: unrecognized arguments: --lang --varname linux qcode

This patch makes the meson build file compliant with the new argument order.

Signed-off-by: Dorian Bourgeoisat <dorian.bourgeoisat@telecom-paris.fr>
---
 ui/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/meson.build b/ui/meson.build
index 64286ba150..87ecace041 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -161,9 +161,9 @@ if have_system or xkbcommon.found()
                   capture: true,
                   input: files('keycodemapdb/data/keymaps.csv'),
                   command: [python, files('keycodemapdb/tools/keymap-gen'),
-                            'code-map',
                             '--lang', 'glib2',
                             '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
+                            'code-map',
                             '@INPUT0@', e[0], e[1]])
   endforeach
 endif
-- 
2.34.1


