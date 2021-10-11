Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19850428FF4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 16:01:35 +0200 (CEST)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvry-0000iD-2V
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 10:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mZvpl-0008G5-Dh
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:59:17 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mZvpj-0001o2-Ls
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:59:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 099445C0156;
 Mon, 11 Oct 2021 09:59:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Oct 2021 09:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=Q
 0KVaiXdVI2KyORz65NnKTFNOz0fRs7STOHvWV7wobo=; b=SXJ3soTGKwrP5O5EU
 HcR8oydNTR/UwpADxRqP0Eq2XgraaQ+slewcaeJ8vPGnYByy7cfnKvDWl+8jFk1L
 DdFFYftDR6/EvxnDp7Ofl1EkifRny9wzTEFAX0mfxjHr8RkBF+AQi+kwx9djf1+t
 jrp9c0cqEEnwzH3X0eATMThdiztbimHOQqXCVI2PEXC7AXL51v9ZVrpU+e6mLxG+
 1SiUUjwp2d1NTas3e5N4OO1FrWCh92GycY4+coDuLIrgW3WBxUPTS5+tv+8mlnmc
 NhA3RLOUQ3OMfR3SSJyaDqwDezPRC6YNMJjUY4invCrjESJvhS1cERq35NbzvUL3
 4yJYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Q0KVaiXdVI2KyORz65NnKTFNOz0fRs7STOHvWV7wo
 bo=; b=fswmD88gdhxdIal4DgrTdcD3pEfcWXVHCECiYK8K0nF8ZOxVd0fnlm3Nf
 ZpzqWPV1qwGaFeP4ysB6MtvS8jKdsD6KYBC3CfW406sh2pdXJDQVq0JfwYXjr2PR
 sZ1R0522yleL3iUG6mZNPL5cZybZIy7ODpZhgd6upJmMqeM44UocfyIJ0HsUeP3c
 8IJP1KhltlirMer7i6lYiHsschc+ZOQQwYk67VR0Wbu9EwZbGyGvUIWB1j7tl0tp
 ZWXCzO12wC59e+4Fv1HxzJq1VnlYME5VuLcRSZWWFgG+WfD/pLaUJ5wGPkgGqrs7
 NvFh3Ps7T5wC7zegbmQCtR04WJE8w==
X-ME-Sender: <xms:MENkYcMykpq6Hff22ml-2glkKYsGxNDne96NPmvGItv2tXK0sQXk0Q>
 <xme:MENkYS_rlFdhtJQwofCYO3j0l6bxNY9ht_88ACn-fdJHFbf-5-mitNPtK1gnbQbEx
 uxeGbjhqoIVPNlxbF4>
X-ME-Received: <xmr:MENkYTS1aJ6B5XE1ceeurv2mmNgLHV7Y6LzHLu7-KeKda_j_8KUChrkKeiAzzk4gnDxE96wdmyO7yu6wNY0aio-L9mkACuTO4I8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtiedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtke
 ertddtfeejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepheeiuddvvefhkeejfe
 dttdekieethfdukedvieeuueelgfelieejgeehvdekudelnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:MENkYUtLNe5DtS2d7gc9g_qNPQsr4mFBIjEtn2Pci3ImRRi2DChoJA>
 <xmx:MENkYUc1vv1RWLQOLweI15qBzyZZM4LiDWPuphAUjCOoLz6ffT0R7w>
 <xmx:MENkYY0VNR6DrGf2j_XwDFoooUhvneWl1WrsF26COkbtPvFAU4YkTQ>
 <xmx:MUNkYc6_Q3Nmp3y1mdnUwDJe107BWzJJKJupykzBux_kcXk0KKCWAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Oct 2021 09:59:11 -0400 (EDT)
Message-ID: <b039e68a-e591-a5d3-9e95-cde45c7d0bd8@flygoat.com>
Date: Mon, 11 Oct 2021 14:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] hw/mips/boston: ELF kernel support
To: qemu-devel@nongnu.org
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211002184539.169-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

在 2021/10/2 19:45, Jiaxun Yang 写道:
> Jiaxun Yang (3):
>    hw/mips/boston: Massage memory map information
>    hw/mips/boston: Allow loading elf kernel and dtb
>    hw/mips/boston: Add FDT generator
>
>   hw/mips/boston.c | 348 +++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 320 insertions(+), 28 deletions(-)
>


