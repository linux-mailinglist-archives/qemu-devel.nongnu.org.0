Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41C37AD55
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:48:04 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgWUF-0008Rp-Cr
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgWRY-0007Ru-W0
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:45:17 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgWRW-0006vF-3Z
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:45:16 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id EA4C45C0161;
 Tue, 11 May 2021 13:45:10 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Tue, 11 May 2021 13:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=MPpSMRW+toSjNcRTFbRYq6jdj
 uEM8+S4OBk20f/DoI0=; b=IVfXlzMsnvgwjopMXkL/7kJtDQYMa0VV7dVAU02uE
 jURdE4UQrHGazklAH15/8XnxeYVLKHad9D8UN66W0PMrz9TiAk5K/iPzpDY/NFGs
 zE/SGoR5XZ8VOlX5d5qCZAU2tWzoHoF0IYhRgqnIV3EYfnTUpIRtRaZGJOrMVr4N
 oo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MPpSMR
 W+toSjNcRTFbRYq6jdjuEM8+S4OBk20f/DoI0=; b=KFiM2X/Ys4YcOTVnnt8n9n
 tYB00L2torJH5bZ8oyIgZrkVhQLlloZ0AyilCTk7q/GOUH3XyHPpO0QTJSNhY+/y
 q2b9PQgsQZBOzPpC37kdaSKiNiiusQDHynvLBWxroNUMgW+ZUoVoYzxoTKXordMq
 eDmcrxlDj/YRmaKwvsCG6HYnRkLwMHibey9RPzZY8HJk6WhbaUTMZFL2KDYMmSHT
 bpftb31VMsucLEnxriEz+FtlTl2SSJazwumso/3ZO+f5qFY8AqqFxsR8tTGoBldl
 xg+EN3BlocE4057kMfh3c7Qeg9gWSlCjL3u3SjsGEaH2GIfeObGyHjyKPDJFKqVw
 ==
X-ME-Sender: <xms:pcKaYCXcC8EL3nQrxgzjHzlrXeqh5_w-g0eL6Hk6xBGWkN47SVYHkQ>
 <xme:pcKaYOkV6Cllz-LghPVvSDcpmPxdABDpzHZGYBB1scEVZh7mAbAfKCpC2JXil9THO
 CJ4R4Bdivuoqk4Qcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfifhu
 shhtrghvohcupfhorhhonhhhrgcuufhilhhvrgdfuceoghhushhtrghvohesnhhorhhonh
 hhrgdrvghtihdrsghrqeenucggtffrrghtthgvrhhnpeehleeufedvvdduvdehvefgueeu
 udefhfeliefhkedvvefhteegheduvdffieduleenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehguhhsthgrvhhosehnohhrohhnhhgrrdgvthhi
 rdgsrh
X-ME-Proxy: <xmx:pcKaYGYCrZMBjAT5Ws87Mc-Te_nn_m45dAWqmSn6JixxsVuotJxWEQ>
 <xmx:pcKaYJUVvT954WPAJMjW6sTNl-rB4np-uZqaP47qtnuA19EpLDavkQ>
 <xmx:pcKaYMnShVxGuDxWe46-TNAoDsXnmEdRfAuJ3iCYw7rRkoAZNFddYQ>
 <xmx:psKaYBwQAxYaRURmCi8L_BDFNH5UU_hKnmEfYUGrUJw6NaqmRITdMw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1F03110E008C; Tue, 11 May 2021 13:45:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <4fe21fc7-38a9-4a5b-a5d3-901cb6347736@www.fastmail.com>
In-Reply-To: <12f86bf7-8059-eea7-a03c-1ac1abfd4ab8@gmail.com>
References: <20210504233232.28423-1-gustavo@noronha.eti.br>
 <20210504233232.28423-2-gustavo@noronha.eti.br>
 <12f86bf7-8059-eea7-a03c-1ac1abfd4ab8@gmail.com>
Date: Tue, 11 May 2021 14:44:47 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "Akihiko Odaki" <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/2]_ui/cocoa:_capture_all_keys_and_combos_when_?=
 =?UTF-8?Q?mouse_is_grabbed?=
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.26; envelope-from=gustavo@noronha.eti.br;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

On Tue, May 11, 2021, at 12:08 AM, Akihiko Odaki wrote:
<snip>
> > +    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
> > +    CFRelease(tapEventsSrc);
> > +
> >       return self;
> >   }
> >   
> 
> These statements should be in "if (self)" block which they follow, or it 
> may rely on "self" even if it failed to allocate and initialize "self".

Good catch! How about an early return if init failed instead, though? I'll send a v4.

Cheers,

Gustavo

