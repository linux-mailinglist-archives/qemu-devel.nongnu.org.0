Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1732E04A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 04:47:57 +0100 (CET)
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI1RU-00015w-4N
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 22:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lI1Qc-0000at-Mp
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 22:47:02 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:38927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1lI1Qb-0007a1-7U
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 22:47:02 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AE4F35C00EE;
 Thu,  4 Mar 2021 22:47:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 04 Mar 2021 22:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=m
 HBdDiVQKRaoDxQSLiv1haLuqAzIAfSyK13ZMsFiWno=; b=0ufkgLzDya1NAfs6/
 sQB55Syj5iGucyyc+muUww1z4Ivyo5GuOP773I0y68hs1+cp8IccXyCZZLmHY8Pc
 D8IaRi+MoqapkL1nXxSCRlOyRY/8TYADV7vmwNHN/80pmIukYD0CgeY6YHaY43qm
 XcUh20hGNSHcxTdcOj1Fhq3swr1bfG4jnMCy/Q5AV/Qq96bxD2myq1IrytKs7nNC
 pHeXj0ohJuZCEAQTXPPAlCUnLe7+szfYnWpzbrJKmqvYrF9nfrRPUItNp8fJG4Rp
 Rk4H4kLZCJ38t20a0ykh+iIQzQk0X0ZlVwLDKjtzSVvJur4nW6zr6Td6vqFDNSmx
 isO/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=mHBdDiVQKRaoDxQSLiv1haLuqAzIAfSyK13ZMsFiW
 no=; b=G8PyqZWtiAr6EZD79FFw4P5jxbei70R1qydQHmskmHpD7OC2J0hF4Ttuw
 FXK/IId7fyheW+DI8evUovCGV4xCYvtGERkfLJgHg8fdq+ZlIlE4NeP5VWmtTmww
 yP7unpMY3Pjhq4P6vpG2rsWGOlJasXrj3UiVM8Lenb14pH/i0KG6QKJXjeEJzBaB
 R1+EfW7VKLZ6syeg79LqrlsHzkc9h4pYOKgjhAcoc04iZak2sPU59BZZAqPxdr4n
 kvAsvLECrFvrYObkKTsi0AcIpbiO+mqi0oF+b+jzhG0i1DQK59/q45DB7G4DXF17
 BrxA3opyF0dWzXxu+ctKaIp//9I3Q==
X-ME-Sender: <xms:tKlBYE3GXel1bOoQY6SY9jBxhQ93XcgDCffV1LYcHbCqEQFvqPCX-Q>
 <xme:tKlBYPG4CHrMk3ogigF7qbIEAh-gGz05n5FSen50dhAN203urHP2eUJnWktBc0ifI
 KavMSaMDS0HAoeM-94>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
 ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
 fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppeeghedrfeefrdeh
 tddrvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:tKlBYM6caz9vBeFiuIlf3DKYF8ed_XhmfF2xEMuiBmKvdzOgbb402A>
 <xmx:tKlBYN1DfiYPhmGKv902Pka1wWskNVbA8USFlr7kdN4y4bd9SlSl4w>
 <xmx:tKlBYHE3u0bMwjOC6zuoVZ0R14Y2-Nkigfejp5mUxOn0tNd9t4PIWQ>
 <xmx:tKlBYKNFVsf4XGOtpHugZnuBwWmUA2_-clQTIlzn_44axk3SB-g7NA>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA6E524005A;
 Thu,  4 Mar 2021 22:46:58 -0500 (EST)
Subject: Re: [PATCH] linux-user: add missing MULTICAST_IF get/setsockopt option
To: laurent@vivier.eu
References: <20210305033510.8600-1-jiaxun.yang@flygoat.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b699536d-e2e6-0e7b-a883-4ba5de067e9f@flygoat.com>
Date: Fri, 5 Mar 2021 11:46:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305033510.8600-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Yunqiang Su <syq@debian.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ÔÚ 2021/3/5 ÉÏÎç11:35, Jiaxun Yang Ð´µÀ:

 > {IP,IPV6}_MULTICAST_IF was not supported.

 >

 > Reported-by: Yunqiang Su <syq@debian.org>

 > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

 > ---

 >   linux-user/syscall.c      |     4 +

 >   linux-user/syscall.c.orig | 13305 
++++++++++++++++++++++++++++++++++++^ Sorry ^ ^ sorry for the noise...

I'm drunk today.



- Jiaxun

