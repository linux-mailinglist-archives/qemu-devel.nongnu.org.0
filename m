Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F930218C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 06:04:17 +0100 (CET)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3u2y-0003cq-C0
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 00:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l3u1A-00039p-U2
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:02:25 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l3u17-0002fK-VJ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:02:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 15D6E58065D;
 Mon, 25 Jan 2021 00:02:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Jan 2021 00:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=Y
 veSQT7oxZn7qNxlWF5yZQBN0PWgzLyd0d173TUs6Js=; b=xpj0JtMVvSRJgkfnm
 TYsyK+lZnzyL3xdCMS8wrtBjyMT/PUneRn5Q1rOln7YYMly59sR5zmZxTyXyS8hc
 t5CWFdwTRy/jBPj1D4PWeJ+T+tWQKX4ufA2Kyh5QVvc2z1/tmTMPTdCn6R1l4zW+
 42rmEN9hnv4oqNQzTU63mHR/wilwtbdzhF/uhu5PzElJtTSy8salcuoir4lFamLQ
 AAZ2gxxI91z2o1YSzo/TR8bm4e6udVL+o3DZDHTyngWJ1Fp7gjPyv6fXYXyoD7pM
 Br4MJ92Vl5N+53kzB4FxSS/GnBDHD5KpzH3tp5R1l3OIkCITRMwEGcI6cPQDAlRa
 2bRTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=YveSQT7oxZn7qNxlWF5yZQBN0PWgzLyd0d173TUs6
 Js=; b=lCau5htvktzSdSJxxINvAIFT7RznftzJxr9cjOfTTxeiexpieULcp8UJB
 WSO5l84siQ86VeDkO7WAr1j6u9Z05oHvmrOh4yglYzRHFYCBX+uK4gbe++WtFd/L
 0sFGEiGh1n7XBW6MUP+nkg8XAXIM1Z6DImj2VlQnpp7U+RbFcfZ98D7JNa53VW6R
 UF4gJd87/iRN0oPawGXnzjXXb3ZGuoki0c7UV9US7iO6omfQcW+jbyJaUUzBaBvh
 kOp6vpqrrn++xhLQyN+Wchp7UeWYMbgDgnqtpfgmUd/Jpb00DMdT2TPrlzYCHTXh
 7gdORsFFtkMQr/GArp8uN5ryNhhiA==
X-ME-Sender: <xms:21AOYEB2BBycaosZE7abpBIE9SMRotgo46AFQwbnkiDjmaFcFBeqqQ>
 <xme:21AOYGj1GbsGI2_BLq99j9Ve5B0UaAAqegx_EQ-eSPOFXv3NQAVY57-6ieHrm190U
 XaVx7WTb_DXP89BcfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppedufeelrdduiedvrdehhedrieelnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:21AOYHlFyV9Q3Cm2HeIREadHSRiD4Kt061XVD-lacxoB48mcWC7Ksg>
 <xmx:21AOYKy2jNtEkG9v7u3AfTsIMgE6C9UDqQ-F3yP4_czOMODjr0cbyQ>
 <xmx:21AOYJQT3LETrD4XR7ebcdA9lGBBDnhP5hHGH0-go3hLAIEoJH0U1w>
 <xmx:21AOYLcEgUxAOUHa_qdKNzwe9WRabfBZWITWgpZakBsf2Sl_2KY6LA>
Received: from [0.0.0.0] (li1468-69.members.linode.com [139.162.55.69])
 by mail.messagingengine.com (Postfix) with ESMTPA id 98C771080057;
 Mon, 25 Jan 2021 00:02:16 -0500 (EST)
Subject: Re: [PATCH 0/6] target/mips: Convert Loongson LEXT opcodes to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <e0385d70-81d7-fe70-b5c3-6607c1212ce9@linaro.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <5480b040-4e84-95b2-cc5e-da28ac83e3e2@flygoat.com>
Date: Mon, 25 Jan 2021 13:02:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e0385d70-81d7-fe70-b5c3-6607c1212ce9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/22 上午4:07, Richard Henderson 写道:
> On 1/12/21 11:54 AM, Philippe Mathieu-Daudé wrote:
>> Based-on: <20210112184156.2014305-1-f4bug@amsat.org>
>>            "decodetree: Allow 'dot' in opcode names"
> I'm still unconvinced about this.  I've reviewed the code without regard to the
> spelling in the decodetree files.

Should we use '_' in decodetree to replace dot?

Thanks.

- Jiaxun

>
>
> r~


