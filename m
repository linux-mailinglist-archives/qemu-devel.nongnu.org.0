Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0FB3706F5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 12:48:47 +0200 (CEST)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcnB0-0004je-48
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 06:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcnA0-0004JL-3N
 for qemu-devel@nongnu.org; Sat, 01 May 2021 06:47:44 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:60057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcn9t-00022T-Nl
 for qemu-devel@nongnu.org; Sat, 01 May 2021 06:47:43 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 887C01F60;
 Sat,  1 May 2021 06:47:33 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Sat, 01 May 2021 06:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=NRxyiMkWZeWVB5Ca4AkKumyu/
 NOfSmIEq5Utz8vWvR0=; b=rCPckQOd6e4tVYhZ4svRq+I7EbqRI4DdkMmuOaOqR
 xB/Xb/XZnZ0N2pWBgap1fpPnjKcFCPSUQVxjs6YU5/YFk8Ui6Rc+prJNI5dXCgZH
 UJP+SBLWjPhV9/6MJz8npiO30Nvp6SxvYNL4gd6gSrwcBp8QXltTPEZeI/jaRgv+
 s8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NRxyiM
 kWZeWVB5Ca4AkKumyu/NOfSmIEq5Utz8vWvR0=; b=EQf8RyWVRwy6dZwAq3QB94
 v5BgfNqr8Iqsvsr0GV8Jk4eOGlVlicWAgn5lqVv8ed+8eTklyLDQZRphIZ9hX+IP
 yMwcoNTdUwi/NH6PT99fWPq663hM3Zn6Vr2HaB7PtoEmqqWDd3PwL9sqRfQuoWog
 gnw8VsOHA1RGA5y9BX8vSeOBIL8nDkUZPgobvlGtE2DHMHivJc1SeJywa8eYdel5
 DTR6i/jbJn1Sjt0/gNBtfXw15g0dCKfcT2lvo8gxs/iiVr7+KOkf4DT2GN9YbpUz
 5nZAT8cFIVNtPKckRcV5rOBnuJraSGbBZIZFW0ufePnPScSWQ8cUGyxkKjUCVj8g
 ==
X-ME-Sender: <xms:xDGNYFdZen7D3Fph9kWV0UCfVsqoygvbCFyej_bwXow9pT3p00P57g>
 <xme:xDGNYDNQhtxFH130Al9HqkUe6YW7DOL7sToRudLcMruKsKTcl8ignlE9CqDVo-fUn
 RyeDH9RYSpV2fP04g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvkedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepheelueefvddvuddvheevgfeuuedu
 fefhleeihfekvdevhfetgeehuddvffeiudelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhhrgdrvghtihdr
 sghr
X-ME-Proxy: <xmx:xDGNYOhPorEbEUQTGCo_b7aYWmPQScork_U3NUmtVeBZhRWsiHjzNg>
 <xmx:xDGNYO_hqZSO_mx7nvEqHZ1PV9bAEYsKfLJSFQjh3la-FWzAu5KcgQ>
 <xmx:xDGNYBux6bP9vy_78Gy2OSiW1fcTayuloW_AAljpDQ3h1dyYDibNyQ>
 <xmx:xTGNYK6m0XA8hRWQjwV7Uf3GrkxIzbwHVrrSUsWPW-8x6x_uxmzpVw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 177CA10E0089; Sat,  1 May 2021 06:47:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <14dd5acb-e943-464a-938d-043f40c8e5ec@www.fastmail.com>
In-Reply-To: <89cf53fd-989c-ad9b-2657-3171a8527eb6@eik.bme.hu>
References: <20210430213806.81457-1-gustavo@noronha.eti.br>
 <20210430213806.81457-3-gustavo@noronha.eti.br>
 <89cf53fd-989c-ad9b-2657-3171a8527eb6@eik.bme.hu>
Date: Sat, 01 May 2021 07:47:10 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "BALATON Zoltan" <balaton@eik.bme.hu>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_2/2]_ui/cocoa:_add_option_to_swap_Option_and_Com?=
 =?UTF-8?Q?mand,_enable_by_default?=
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.21;
 envelope-from=gustavo@noronha.eti.br; helo=wout5-smtp.messagingengine.com
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
 'Gerd Hoffmann ' <kraxel@redhat.com>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey there,

On Sat, May 1, 2021, at 6:39 AM, BALATON Zoltan wrote:
> > On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
> > swaps them around so that Alt is the key closer to the space bar and Meta/Super
> > is between Control and Alt, like on non-Mac keyboards.
> >
> > It is a cocoa display option, enabled by default.
> 
> Not sure it's a good idea to enable this by default. That mixes up the 
> keyboard unexpectedly for those who don't need this and also different 
> from previous behaviour so better to have this option enabled by those who 
> want it than annoy everyone.

That is indeed a good point. I can certainly switch that off by default and enable it myself, anyone else would like to weigh in on this one?

Cheers,

Gustavo

