Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD036F80D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:44:29 +0200 (CEST)
Received: from localhost ([::1]:43882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPhE-0003JT-84
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcPgO-0002uV-Vp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:43:37 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo@noronha.eti.br>)
 id 1lcPgM-0004hg-Su
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:43:36 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 408C05C0065;
 Fri, 30 Apr 2021 05:43:33 -0400 (EDT)
Received: from imap36 ([10.202.2.86])
 by compute7.internal (MEProxy); Fri, 30 Apr 2021 05:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noronha.eti.br;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=mesmtp; bh=IZUYQPpVAnrCU9nbXbXNkwh1m
 ahAO73OkOOMD1Xs938=; b=PLx8xEtj82//GkqUCIQZ4QutnkIv96H4HHMXLaty/
 fSga7US9FWpqKyMawJBBMwFxXeLsxjOBsb6pgOPOk86NxDtVYVZf1+byXRh5NBge
 /BHxCaSi5925s314BX6xLuU3bOUEqd5lKWlKdAj7Mxr7PaHVY9xHMxuZtT5IrJwk
 hE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IZUYQP
 pVAnrCU9nbXbXNkwh1mahAO73OkOOMD1Xs938=; b=tBmbGSrkgOIc6GbizUbaTg
 rwo+HD713qyjoC9PAQNwBgk3YSuHpgr+uwsbLWNvjoovvOKvBA08LqBbtnN6vWar
 15JFP113CjeLs9jbhniXsurPKzna53R7BRMJGK/IraxgfXHusdXKf/JeQbjslwFJ
 RzWXoJn/87ovtlbcIE+RryG8MF+L4oV0meeC1UgFtBY9wkyps6uUtcgSD0lg/ZYQ
 nvjB0RXhJF+jf7bL35cBRPB5xOkdT9kjwjEwRpTy2PuxPDCuXdOMUBe0g8JVJDxp
 8l8aKjgIj0Qjdm1qd1ngLuGn2tykdZW5IEkCQjLE4XZ064/YJ5grMDcHHexGkkbw
 ==
X-ME-Sender: <xms:RNGLYHjWL0iCT39fdN2gTZc6TaxY4j3z9HQIXGEJJ_MCHuqzpQWtjg>
 <xme:RNGLYEA9pMXDVtWX4NdKZNq7UQbAlgFQRh3W596RUt_UWWjMCQCd6D-HSN5t-DlJb
 kLPpBK1nY1bim9xlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfiuhhs
 thgrvhhoucfpohhrohhnhhgrucfuihhlvhgrfdcuoehguhhsthgrvhhosehnohhrohhnhh
 grrdgvthhirdgsrheqnecuggftrfgrthhtvghrnhepheelueefvddvuddvheevgfeuuedu
 fefhleeihfekvdevhfetgeehuddvffeiudelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepghhushhtrghvohesnhhorhhonhhhrgdrvghtihdr
 sghr
X-ME-Proxy: <xmx:RNGLYHHsVaQeFrh6W1HO1IcUrem_59NXlyA9_spOYkAnhK06s6pK6g>
 <xmx:RNGLYESeEmbf-SngMj-o97GNC3vwzK1k0zkbVXKPg3wDNhIgTI_FNA>
 <xmx:RNGLYEw_EkvaXH8yg00VyceM020iBJHTXF0WfgFehTeifE2kARyyGA>
 <xmx:RdGLYP9pcRkPXG0wHJEtsJnRg8t4tZeUDn2SOJKW0ylSqpGh0MLVng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 693BC10E0089; Fri, 30 Apr 2021 05:43:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <82a04a0e-dafa-4a57-9dc7-d369d8c6304a@www.fastmail.com>
In-Reply-To: <20210430080550.twoujiljpcskvcla@sirius.home.kraxel.org>
References: <20210429234705.83206-1-gustavo@noronha.eti.br>
 <20210429234705.83206-2-gustavo@noronha.eti.br>
 <20210430080550.twoujiljpcskvcla@sirius.home.kraxel.org>
Date: Fri, 30 Apr 2021 06:43:12 -0300
From: "Gustavo Noronha Silva" <gustavo@noronha.eti.br>
To: "'Gerd Hoffmann '" <kraxel@redhat.com>
Subject: =?UTF-8?Q?Re:_[PATCH_1/2]_ui/cocoa:_capture_all_keys_and_combos_when_mou?=
 =?UTF-8?Q?se_is_grabbed?=
Content-Type: text/plain
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Gerd,

On Fri, Apr 30, 2021, at 5:05 AM, 'Gerd Hoffmann ' wrote:
> Looks all sensible to me, I'd like to have the opinion from the MacOS
> experts for this one though.

Thanks for the reviews, I'll send a v2 later today! Are there any other people I should CC for the MacOS expertise? It's the firs time I contribute to qemu (the first time I use the send-email process even), so if you have any suggestions on that front I'd appreciate as well =)

Cheers,

Gustavo

