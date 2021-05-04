Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4423732C0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 01:34:21 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le4YV-0003dn-OS
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 19:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1le4X4-0002r0-Ji
 for qemu-devel@nongnu.org; Tue, 04 May 2021 19:32:50 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1le4X2-0004kX-NE
 for qemu-devel@nongnu.org; Tue, 04 May 2021 19:32:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BB27A5C00D6;
 Tue,  4 May 2021 19:32:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 May 2021 19:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=mesmtp; bh=/4kYL8m0coYpbcmZAOH23YM
 Du3uGbHVNeaMGL4y7IDA=; b=OGBGrw4/E3UtUO6JBVuazvnrpzXhgpj4FLioy3t
 WeuHPN+5ylvU2CAoUbjfM65P1wI+iyEhUIbr+lWjlOL+tkTYBHOriXbWgwSr6ZBe
 a9t6uD1nQVqxw2v58sIuzr7Jn+PikQ6tU/lAADqHiRD1gKiL39hkUOWKUu0pcIM6
 L1Dg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/4kYL8m0coYpbcmZA
 OH23YMDu3uGbHVNeaMGL4y7IDA=; b=lpLiYFBu/fU5wVCAq/Qa4edXUgErn2Bme
 WuTnCwfznR0to7BVdOek3oLwmq6/1oN7ZI0sKyrcbnHd6KTQG7srhZdDOcg3gaev
 /K5FDES5MPzd/CbDO3RjaMMly17pzBnWVovMIltsY/lMJfo7PH0p2Tl5vugyGKMG
 xFQla+z4h0Vsra2G3HqUzR+yGnizrQQ/WXl4h3OuzlZQ+qMSR6k4RYdRVmdcSyDK
 pt05DqrdD6H9rn9OwoB9iJ4pMQJ9Nl9/z2vtBX+5pCTmkdFuJL22Tc7JoKvYG807
 XwzdAMPlE4WS8kOHvUWUN6DeeL/GPyYfARbv2lectjn4Fci6q2phQ==
X-ME-Sender: <xms:ndmRYFnySMwBv4wYom7bbBNrQEre3cAcRnyuTX6JOMMSQFi0HLM_lg>
 <xme:ndmRYA1CzWTpy0IK8LgXQdzn9Njjigj3kq4c0gEd2lqz9UKFWFP2zfA6nJ6YE64Ib
 tnW_5ADKE2TlVbvcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefjedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgrvhho
 sehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeelhfehffelffetue
 efieejveegjeeitedvfeeufefgheejtdejvdehgeekvdeiffenucfkphepvddtuddrkedt
 rddurdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epghhushhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:ndmRYLolGXYZRqa8pbs3IrZsufgMU52HmbOtBtrASnR_cpi_U0Zlxg>
 <xmx:ndmRYFmY9Th8oKT2Hh7CZeAWhuJWsgE0ZCdGRCJZfsNHTXXZAb9-5A>
 <xmx:ndmRYD2YwcOjWHjqafg2kRlYMSpGOYxOeFINl8g_4hBmdEn_UpiYOw>
 <xmx:ndmRYOTHKdLg3lCiRyiejxQZPwnXv52QcVaQBWBjuGLNHK8gyZoolg>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue,  4 May 2021 19:32:43 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] cocoa: keyboard quality of life
Date: Tue,  4 May 2021 20:32:30 -0300
Message-Id: <20210504233232.28423-1-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=gustavo@noronha.eti.br;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.eti.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

v3 removes a rogue ; that made its way into v2 and makes the
swap-option-command parameter off by default, so existing
behaviour is maintained, as suggested by BALATON Zoltan.

-----

This series adds two new options to the cocoa display:

 - full-grab causes it to use a global tap to steal system combos
   away from Mac OS X, so they can be handled by the VM

 - swap-option-command does what it says on the tin; while that is
   something you can do at the Mac OS X level or even supported by
   some keyboards, it is much more convenient to have qemu put
   Meta/Super and Alt where they belong if you are running a
   non-Mac VM

Both are off by default. For full-grab in particular, it is off also
 because unfortunately it needs accessibility permissions for input
grabbing, so it requires more deliberate action by the user anyway.


Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command, enable by default

 qapi/ui.json    |  22 ++++++++
 qemu-options.hx |   4 ++
 ui/cocoa.m      | 135 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 152 insertions(+), 9 deletions(-)

-- 
2.24.3 (Apple Git-128)


