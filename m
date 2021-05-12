Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20E37BA9E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:32:48 +0200 (CEST)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmAZ-0001f1-9T
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgm0p-0006ew-PR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:22:44 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:60723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lgm0m-0004UL-Qs
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:22:42 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0C35211EC;
 Wed, 12 May 2021 06:22:37 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Wed, 12 May 2021 06:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=eW22RI8HLTr9nFmp45qCNvxXB
 RlOCPoafIa1FkZnfvU=; b=c5dgKzh4e5jE4J8Jl52FctgAmutv0ExCTWarIpTJK
 MLCJMZ5MK9lMyPj+edQ4+qBhrDSrHDEpBP+EAMkf8IB457wu5uaMmK2vzIH7qciu
 YFVTVrc58FLUnJRCkhssmjrweGGoFZPQqAISP829maR4D5i+A7Ud76XdFP1Apza3
 4U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eW22RI
 8HLTr9nFmp45qCNvxXBRlOCPoafIa1FkZnfvU=; b=ZlZG+DYeut/AznO1++aU2e
 8AxL5fVNPLV0g6vCIkJC/kbzCL7uCiK+FXugXYSeHNE451b6vhsiKZFER09P0htQ
 ktCXVYRj3KZcjn+ngGMlw0WPIVtMrTdZFG31EM1SIbF1/fEIHn4JOTe8zg03v7ig
 KGNWODPfNxlQ/NvevpxnYUEaZz4gDtUB8L3qVoQt2Jx0ExeqSm6G2ZA08eg3DXNY
 IVVXdGIiXrL47Ga5fR5tYPUoKFmEgTrIL5x7q7asxgp4/Hl+MX0iS4nxUbIouC+e
 luhFlBBmAZj1Nx1VNY8iuxBDMaTcswYAcAit/rn2sInDeaJNbuLt/+g1vcnHdGTQ
 ==
X-ME-Sender: <xms:bKybYOmLGn75TzTlzKE-KTskyiRaBCVTL33xlZ1IdnalbwcHjOaWeg>
 <xme:bKybYF0Ew9uwKJSjs40wEmGPiGvBk6cbFJirYlVpvBWew0MQvIf7R2Y30BOJXe3jw
 3XuJrUGJ63Yl8CPZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhephfdvvdefffdvudejgfehvdegffel
 leetteejieejudehgfekgeffueevvdehgeetnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
 uhhsthgrvhhosehnohhrohhnhhgrrdgvthhirdgsrh
X-ME-Proxy: <xmx:bKybYMrBEGs2wL-U2YCcEFC-so6vm4qF2c80blO34V-WNTEi4vdofA>
 <xmx:bKybYClrWbtsTm4ee3eWuyBzIb6HZUPUJf3c2MtkVi37IkSyAQyDnQ>
 <xmx:bKybYM06aa8f-iuNJlHEClxhq5WtQ-3nfRwKzK7tEK99FnYrz7P_3g>
 <xmx:baybYPSm24fXGxnWGN4NIK0HlEhuHUHx7K6bmxYzkTA3bgh6r8MsEA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CCDED10E0089; Wed, 12 May 2021 06:22:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <75c3eec7-81a5-4bc6-9f1d-2348390a9217@www.fastmail.com>
In-Reply-To: <CAMVc7JUQSM=9Nkyv-EZ86iozfyD6otocCjY3quOwzPMavNuL2Q@mail.gmail.com>
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
 <20210511185538.29344-3-gustavo@noronha.eti.br>
 <CAMVc7JUQSM=9Nkyv-EZ86iozfyD6otocCjY3quOwzPMavNuL2Q@mail.gmail.com>
Date: Wed, 12 May 2021 07:22:16 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "Akihiko Odaki" <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v4 2/2] ui/cocoa: add option to swap Option and Command
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
 'Markus Armbruster ' <armbru@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>, 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

On Wed, May 12, 2021, at 12:06 AM, Akihiko Odaki wrote:
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> 
> I applied them to my personal tree:
> https://github.com/akihikodaki/qemu/tree/macos

Thank you for the review! That top one I am still to submit here, by the way. Will do once this series is through.

Cheers,

Gustavo

