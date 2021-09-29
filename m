Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC041C82A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:18:49 +0200 (CEST)
Received: from localhost ([::1]:40752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbM7-0003M8-Eh
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVbFt-0005ZN-UD
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:12:21 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVbFq-0006MZ-9P
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:12:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 11A875C00F7;
 Wed, 29 Sep 2021 11:12:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Sep 2021 11:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm3; bh=EAnYyJRDM7hnrAoH1dPIinX4h5
 VUskBpPxMf/dz9j6I=; b=Q5A3+axUQwxt/2RysQRHpty6l6Gym0XC58PRByaUw3
 e8JXThmdLkFPjriHVPz8oFFT9uf4r0SOyh1WMKvmXoluIM54wFIhm159KV5I1exv
 7rFFCvO+n53p2kK7nGo1FQ75AN8I5k4uNCDUhmtVlG24Qr0u89G0jCm3K66C9ZBd
 Ks5/Ve31bZ0l7NDFL+Pch3+UI65pOw/WBXff2/GGm2chxUSesH5sNGz+QPqxTHw/
 BVeZT9TLm+AyI0xdZPRHR3n4LtBwyVXErePBzwxdXJYhGF7/qhCdwF60uAQOoADp
 fab4mRi3WdjkBzGWNPwrddTelrgfkejzaUGSTxY2tZPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EAnYyJ
 RDM7hnrAoH1dPIinX4h5VUskBpPxMf/dz9j6I=; b=J/PAc5gdustlbUrxbqge9r
 Rih5b2yylZz3GODN2QFIUowCF9mpqKG6ivxnbbIMlJsR3WmCl463+3ouWrFyDxeH
 83ThrQSJfgbbUfwu+M+fg3VbqwBC4atJvKA4OvVHdN/8fLKvUfWmyCq5u2VHPAKX
 FrNN9su3WM9zG7EZLvFX7AZZwISPTKVJZ9REloWvW5wMJ/PHCIMP3NN30a5btih3
 NmvaYzXj/3/CMkcUfOCYc48PoA+efRPkMWIf7/TIFWGUKOsbhm8jYuPNCejjtmv1
 uxoD6ExtVmpKLXlIB80hBdF4k8sdaFHncMYj/QBx8UNSzaocbD6TMoSBS7PC1S6w
 ==
X-ME-Sender: <xms:T4JUYfFNaYFC6bfQH3jdWvwZB3J1GD7IskTXthgziTcObQIqCaiRbw>
 <xme:T4JUYcXR_tUQld8ihLJexuwU-clsebyKJXcjfrbnmP6aIqhmJT8JYaxycvXmdfoX8
 LawVcYLu8slijE60Dc>
X-ME-Received: <xmr:T4JUYRKn8jzRhAfc3mZRohoye036nkAnlanKI-LlJHf1n7IPvhOm7J2OC3fLOPNWxlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertd
 ertdejnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepveegueefgeeltdetuddtte
 etfeekudegtedvffeghfeludegfeegtdehvdegveelnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:T4JUYdG65tp6AX_op6DY6TSseXw_dFjvQa3VFruj99ZgeSOVHEusRQ>
 <xmx:T4JUYVUVBTO6ZTJpVEsGaoTaNfec7Zgko9w8iNQ1q2UZgrx0OXLaIw>
 <xmx:T4JUYYMPlyuiEl7GJiyOuEkaxWNUykwehICRHiDHLIxeW9vR1blkag>
 <xmx:UIJUYYTCsvGFAj-i4s1OBofdkx7KOH51gjMBkJcSA-dRGZu-gfsR2g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 11:12:14 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/mips/boston: ELF kernel support
Date: Wed, 29 Sep 2021 16:12:08 +0100
Message-Id: <20210929151211.108-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jiaxun Yang (3):
  hw/mips/boston: Massage memory map information
  hw/mips/boston: Allow loading elf kernel and dtb
  hw/mips/boston: Add FDT generator

 hw/mips/boston.c | 349 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 321 insertions(+), 28 deletions(-)

-- 
2.30.2


