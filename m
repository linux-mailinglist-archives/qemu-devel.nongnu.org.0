Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C332421831
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:09:42 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUHM-0005uV-UN
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUF4-0004SC-SN
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:07:18 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mXUF2-0002AW-TU
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:07:18 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DEE2D5C018D;
 Mon,  4 Oct 2021 16:07:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Oct 2021 16:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=J
 jqOj8liaXK731VRdKMZohtYsfyCvYyhKkxvsOhVDeU=; b=HnzCwKXXtzVTxEDwE
 9B+oBpZpS/n9MOanlwabKV9fICkZqf9EJMpwIaghY0O/fP7R9HoF8cwUtZiewR+9
 p3WrUJSa8PPE4N8gvEmb3WFBct4dl6SpOXI69k/l/+4iLEHMGwSTG9a81bX7i11j
 9jgn+nipPBMuJ0b0ZCGqqAVmyx0AGMZZX3mWwifAe0lRK92TCS5exi1l3wgdnU4m
 d9voSZrstjvQTYT/ptGklhvs8oDKbRjx9aBphe/CA9ZorP1CJW2uGcFqnfA+RBUq
 T2ZfmhGV6qXnc3SK39n1/Hetlm1lPdBYAEk/oFzZ6IWSoU6tUIPokgMcjkddwhKb
 hxVqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=JjqOj8liaXK731VRdKMZohtYsfyCvYyhKkxvsOhVD
 eU=; b=h+hLxU5I1ofVFdXmlX0GGbZAKnpbSYWgmraYDajNRyCHDq40pz//iZfwU
 dziZcdga4LWQsizTon/DKe4YxyiuVB6uNICgKCbtUkrSonWWHxXeNmJDr0+H4/hf
 SAGL1jsS0dc0N/BXvQOX09kyYUX3D1TvDfiUu3zyZBIlw+8tAzgMoMjmnIx46fM2
 i8gSD6aoFoilPTqM4frmpwpO/nZZa5QUyB/3KXUzYDeWeJitfJFtFb1bOBtDh+z3
 zUG9x7zjHSshKE2lVCvsOuC8zhrItf0BEteYdKT7MPIFpz15Ru6TP7suJKU8K6jK
 aGQWJg7Z4PW2uda2CrCekikcRbMMw==
X-ME-Sender: <xms:815bYWf8pU6mpO3RsdyMNXya974YAwPZYPOeOCEyMCLJMy7WeCRKPw>
 <xme:815bYQMeW-Y1jJ7Z1Dkq8Snu3BE67wFV-Y6fXHDDE8_m8sbHGzZ12QfqlRYqiHslr
 1C02EjgxMtW9s5xfrM>
X-ME-Received: <xmr:815bYXjR5i3WtCP6weT2MqdZzeE_GS97c7-k1SKLFgxJYkfsDbCWVbxotpQQ2x8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudegvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepjeffffegiedvfeffgfelffeuieefveeujeeufeetgedthedv
 kefhgfevueduvdelnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:815bYT9s_FomxyLmEPhbi48j3Lp1-6-I9IGxg-tewIeArwobbLZ6Tw>
 <xmx:815bYSt1Ei-e45rbYhjBofB_bZOxSnmDUkdnFXVmGre0RWIeDVmvvA>
 <xmx:815bYaEhq26acXmS1SqMt6BnopTI9_eg8DmTO6HZlvbfXNFgrajxzQ>
 <xmx:815bYb7cKOk1_vjXqlKt4NUpwpyXIFH9B-KSDunAC6fS9b181fYYEA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 16:07:14 -0400 (EDT)
Message-ID: <ba946f6b-b795-3779-69bd-b277ac9994ca@flygoat.com>
Date: Mon, 4 Oct 2021 21:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/4] MAINTAINERS: Add MIPS general architecture support
 entry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-2-f4bug@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20211004092515.3819836-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/4 10:25, Philippe Mathieu-Daudé 写道:
> The architecture is covered in TCG (frontend and backend)
> and hardware models. Add a generic section matching the
> 'mips' word in patch subjects.
>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.
- Jiaxun
> ---
>   MAINTAINERS | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..cfee52a3046 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -109,6 +109,12 @@ K: ^Subject:.*(?i)s390x?
>   T: git https://gitlab.com/cohuck/qemu.git s390-next
>   L: qemu-s390x@nongnu.org
>   
> +MIPS general architecture support
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +R: Jiaxun Yang <jiaxun.yang@flygoat.com>
> +S: Odd Fixes
> +K: ^Subject:.*(?i)mips
> +
>   Guest CPU cores (TCG)
>   ---------------------
>   Overall TCG CPUs
> @@ -242,7 +248,6 @@ F: include/hw/mips/
>   F: include/hw/misc/mips_*
>   F: include/hw/timer/mips_gictimer.h
>   F: tests/tcg/mips/
> -K: ^Subject:.*(?i)mips
>   
>   MIPS TCG CPUs (nanoMIPS ISA)
>   S: Orphan


