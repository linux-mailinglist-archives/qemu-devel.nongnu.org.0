Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA337034B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:58:20 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcb9P-0007XH-7F
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcaq8-00033Z-Uj
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:38:24 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcapy-0002eB-44
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 17:38:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id AE9671DBD;
 Fri, 30 Apr 2021 17:38:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 30 Apr 2021 17:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=mesmtp; bh=9CXeSO+Qa3lGl/y4cqZ+oFy
 0XdYB+P8+wIODRXGI/UQ=; b=DzJqgbc7nr8IC3XtI8oRUTUDyfCXFBFm1oePpPx
 YfaV+VRDeCe5QzhaBit73J5GlzG/EQAp+MLzI/5TC+sp9AZiWAphyzDgQ/hYzlyJ
 V0zPui9LnEH92hVVHnDer3pVMtSvDJ8czPwk82TiozDY0VgmNlVJVyk+MdkrB5z/
 bGYA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9CXeSO+Qa3lGl/y4c
 qZ+oFy0XdYB+P8+wIODRXGI/UQ=; b=Z559xgXNY7HCMv+UkI+ZUIamNiJCVzgY1
 XqhVFi1+Tk6/svXCsXzrYcEopo8iq+rx1lJyxwtNegCdNmJP82UeOMmN7gBOxQb5
 ClNe0/aVv0Lu4RiN/yP1FsHhvQ4iA1xKonn7QBrtTbBIbVvbdXwNEX2xt0ctQ5PX
 QrNUl0qOfD7l8s5XrJTPtMDx4HVuIz7O40mcEGLK2Fk07Tpjq6QEH8OVJxphBldH
 g/49FORA8wZUv0gUZDeFJJpxacErGFNob8s97frJ14rh7ip9scgc123/GVoJhknm
 raTNg8AeKRN930cgIp/32/RbmUGUkCUpiAUxLGCtHL4L1aRdwLZZg==
X-ME-Sender: <xms:wXiMYKmT6mbR_fp-tZv_oTBrgmB5UzjeZuJekfZB5grXuStwfTVVgQ>
 <xme:wXiMYB3RTIhRf5G-xdw1F6a994ysjm8s_XC5-_8hg83Ae6Mg68NHnRfqnMfknr59v
 JDNonai2dAb7gHTQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpehguhhsthgrvhho
 sehnohhrohhnhhgrrdgvthhirdgsrhenucggtffrrghtthgvrhhnpeelhfehffelffetue
 efieejveegjeeitedvfeeufefgheejtdejvdehgeekvdeiffenucfkphepvddtuddrkedt
 rddurdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epghhushhtrghvohesnhhorhhonhhhrgdrvghtihdrsghr
X-ME-Proxy: <xmx:wXiMYIpvsfDOQkJtlS_PGwDlD8T3IM1rKeqHSQQHgbUClQKYMe4SVw>
 <xmx:wXiMYOnl3am1X7rX1XJCLTQMuWCKDjgkIjrZLPV0DwjA_aKeYATWxA>
 <xmx:wXiMYI3-Ge1woruy8DLGKygiknw-KfptVQLZTJ_WC8teSjaOaWinbw>
 <xmx:wniMYGBwn89I8xymvOYilXzkvjT8m6Q1iF-PCigEK14ue77xJ0uROQ>
Received: from Gustavos-Mini.box (unknown [201.80.1.6])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 17:38:08 -0400 (EDT)
From: gustavo@noronha.eti.br
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] cocoa: keyboard quality of life
Date: Fri, 30 Apr 2021 18:38:04 -0300
Message-Id: <20210430213806.81457-1-gustavo@noronha.eti.br>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=gustavo@noronha.eti.br; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Noronha Silva <gustavo@noronha.eti.br>

v2 fixes QAPI issues pointed out by Markus and comes with his
Acked-By. 

I tried also applying Gerd's suggestion of flipping the flags
on modifiers, but turns out it is more intricate than that,
as we then also need to flip the keyCode that is used on the
switch, but we can only do that if we are handling a key event,
so things get hairy fairly quickly.

After looking at the resulting code I decided to leave the more
localized checks in place rather than going through with the
alternative.

This series adds two new options to the cocoa display:

 - full-grab causes it to use a global tap to steal system combos
   away from Mac OS X, so they can be handled by the VM

 - swap-option-command does what it says on the tin; while that is
   something you can do at the Mac OS X level or even supported by
   some keyboards, it is much more convenient to have qemu put
   Meta/Super and Alt where they belong if you are running a
   non-Mac VM

I propose to enable swap-option-command by default and leave full-grab
off because unfortunately it needs accessibility permissions for input
grabbing, so it requires more deliberate action by the user anyway.

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command, enable by default

 qapi/ui.json    |  22 ++++++++
 qemu-options.hx |   4 ++
 ui/cocoa.m      | 137 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 153 insertions(+), 10 deletions(-)

-- 
2.24.3 (Apple Git-128)


