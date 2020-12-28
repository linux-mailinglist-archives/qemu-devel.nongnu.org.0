Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059E2E371E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 13:29:23 +0100 (CET)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktreL-0002xM-QB
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 07:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ktrco-0002Vq-Ul
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:27:46 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1ktrcn-0005rb-7l
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 07:27:46 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 61C1A58032E;
 Mon, 28 Dec 2020 07:27:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 28 Dec 2020 07:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=V
 eE3urBzmODdNuO/7hK7VGRL+LhKYAKW3TT5MBiKpx4=; b=NXutpD9wX7KO6+upr
 guSZm/vStpPNvpPOs4cyM2WENlcEtf8CFS27KVP+BiOeoBkEp8DtCnQJMku4bY1n
 KjhlfT3coJ1vLUgIcwnI44fUVBudccnXvvD58fTfa2Pe2dwvOm31n1RqUaIUedgX
 KNFaYlaKrNnS0WM04UXAK9nzj2HW9Rns7s1oRTdfUu9AP+hvGFid6ggkp0K1aq71
 RrGV3qh4StJDnWWcz8dkvh7EtH+90FwEgGs59FTFjqEiPiwBG1Lfg9SGMnWUFYJV
 kjI5TN/lJAESeHn0lZAs4FC19FqIqGPZUYd9zIaWB6N2sWrz3L1T80CPjGJ3VTBy
 pFzrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=VeE3urBzmODdNuO/7hK7VGRL+LhKYAKW3TT5MBiKp
 x4=; b=p+Yi4i8LcBascBLZmA6JXWd/tP5eN+VAVbvRHnb2t4TRVVSyripQ0AIXL
 ZwlufOGCP4CzQI9eN4UaKiKmEdjPqUZ3hgG+ZxVQPlf1UAFVY7n9O8drK1uKtHXK
 s+Akqis+gl8dAsq5SFVl3D34Zg4EWPJpLr10m+BD1f4vCjnIRf+4FqxsXJa8qm8t
 /AOT9OHlHCaRId5kgtwrAuDY7xrD4H0KhGBn6ZFSIb0bBO0smobe9qpZEkgJnvHc
 q9KujxlftHpA8tdesatuxpFdWeumZFnD1wTkhdtoiVAwGPNYHcPzsIx47iTXHSVD
 WiJqyO8vEaKkRQYE79DI9P3IZ4pQg==
X-ME-Sender: <xms:Pc_pX8oZVsFuWJu7Z3eQQsimOi4cYwiP_dye4HS3_3aAHBFmmTW1cA>
 <xme:Pc_pXyqTAuepu3D9ZTpJ5Txdx8Q1lEZdNO3j3oBIghl_YMLjWMwWsS36zycCYc_-i
 UwmupWbYyWQ_cz7ya8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduledggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
 ffeugeevfefgfeenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
 hihgohgrthdrtghomh
X-ME-Proxy: <xmx:Pc_pXxO9aLrAnUkNXX7zaneRoWA3Hv5max1QWy-m6bALn6NTrnH9WQ>
 <xmx:Pc_pXz7_3oT4zT4WdUJ_Ce3bVwWnR_p7o1hKfNoZJ0O_Ivb7y0e4Wg>
 <xmx:Pc_pX74lsDlI5zqpuo_qmuiOdsdoFfZbcJxiIpXbQ4sLi3Ep2SdMtA>
 <xmx:Ps_pX9nWpKb6wTJdlbIElebz77Ku_pcMhG9j54m_pMJBMyNaN2FJCw>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 83E351080057;
 Mon, 28 Dec 2020 07:27:39 -0500 (EST)
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <9f4cb580-9d3a-3048-d3a4-80bfd7628bb7@flygoat.com>
Date: Mon, 28 Dec 2020 20:27:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.698,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 f4bug@amsat.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2020/12/28 上午6:13, BALATON Zoltan 写道:
> From: Guenter Roeck <linux@roeck-us.net>
>
> The IDE legacy mode emulation has been removed in commit 4ea98d317eb
> ("ide/via: Implement and use native PCI IDE mode") but some Linux
> kernels (probably including def_config) require legacy mode on the
> Fuloong2e so only emulating native mode did not turn out feasible.
> Add property to via-ide model to make the mode configurable, and set
> legacy mode for Fuloong2e.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> [balaton: Use bit in flags for property, add comment for missing BAR4]
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
> v2: Reworded commit message
>
>

