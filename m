Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88892F41C3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:29:28 +0100 (CET)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzVua-0002Yt-1p
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVsZ-0001W4-0d
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:27:23 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzVsW-0003Gu-6l
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:27:22 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3D0D35806BB;
 Tue, 12 Jan 2021 21:27:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 21:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=P
 9Z8a777Zon0jsw19A9VERok9N2lat3JYvc6eUa0hM4=; b=poUB2qsS6U8sPGPQl
 ok/1/SuRKEPhL+NleEKv8+C8rxDWRSqYspwvP3IpcYbI9Zs0SI8hxWoBCiZmAP+b
 MXj/pYvyQUQxzyq28+fs7OaUVm8A7ZW9B7BNWHw0hHVuiQpvH0yc+7EsJekDD3S3
 8gleGB8iDzrzIrKRqbANUybMQuvxnHFroo/aVWXlKU5FM4N8SLGq+7Aj1mGsjiCL
 YnYV5l6a2v/I9fbm1PWm45tFZaVLRXWCgNWR3i/2IOjmEdaguk+Ng4a6xxltrHtX
 AKMT5Q1O3OS7qulXvlgrFwTY076xZG08Ml1oS+qszlvi2fWlMIQQEC3rvtwgzlTh
 woEIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=P9Z8a777Zon0jsw19A9VERok9N2lat3JYvc6eUa0h
 M4=; b=RPrnewnHze5D6CrTEmchkIHF25rmAgNToRS+YfVt6V3ZdN+0CrHxdu2yc
 ulUjsBb5dkIt6gcoiCr4M0L/hxOnIVOv7qaRSzrdE8iXzhlxjUKmQ6EWCSAVhM/I
 ijqrIsvLMWRmBm4uIfwRSpl+CjQ/VuG/PuFUtCn9zm4jEv1PnVqjeKtYXcDDHNOp
 5bim3GWqA/KmFoNZ5wzbb6D3s9Bw/pvP4li7VemPk0YwBsFGVEruGB5yX468OHWn
 UZPxBzeOwGfuPuQybGx5YWFarW1sqqgkPMu2o3Tt3C1krsYIeYQoc+PqtClKkkRg
 A3Y9/01nHw2Qi+EtkhSrVKmfRqpng==
X-ME-Sender: <xms:hlr-Xxi4-EtoJYIZ92G-LuTWY388e8uZDAQ8qF_kV8PR6ews03G-bQ>
 <xme:hlr-X2AOYpw9kiZjiQrfzOwysV2h_corCmPz3k9H0ued8onvf9xS06MzGb2N360Ga
 f35YDJ03YAZnmw0tAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
 ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
 ghhorghtrdgtohhm
X-ME-Proxy: <xmx:hlr-XxG3iiYlcW-D_OcRTZ__fsu5hEy-wVTKaeAsEX9dONJV6hxL3A>
 <xmx:hlr-X2SkGNBS0dDTAfpZ0cnLinGbdTWmRbraQSeGBCGtkDeD9R5p9g>
 <xmx:hlr-X-yaoz6uHp6jp5NX0qLoz_BxP7Z0CAV2eunuIUxr1RVqSaHxSA>
 <xmx:h1r-XzpYEht-m_CorGgq0ndtHJquFrKHtSkGvlR3POwxcQMB6xyUTA>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D23D1080059;
 Tue, 12 Jan 2021 21:27:16 -0500 (EST)
Subject: Re: [PATCH v2 05/13] vt82c686: Set user_creatable=false for
 VT82C686B_PM
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <d0a806fed5e8055aee4fcf5b2f4790e6dd0f9dc6.1610223397.git.balaton@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <3a56f9b0-a852-356a-e86b-f67a04c50a51@flygoat.com>
Date: Wed, 13 Jan 2021 10:27:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d0a806fed5e8055aee4fcf5b2f4790e6dd0f9dc6.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=66.111.4.230;
 envelope-from=jiaxun.yang@flygoat.com; helo=new4-smtp.messagingengine.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/10 上午4:16, BALATON Zoltan 写道:
> This device is part of the multifunction VIA superio/south bridge chip
> so not useful in itself.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   hw/isa/vt82c686.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index fc2a1f4430..9b16660e9d 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -200,8 +200,9 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
>       k->revision = 0x40;
>       dc->reset = vt82c686b_pm_reset;
>       dc->desc = "PM";
> +    /* Reason: part of VIA south bridge, does not exist stand alone */
> +    dc->user_creatable = false;
>       dc->vmsd = &vmstate_acpi;
> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>   }
>   
>   static const TypeInfo via_pm_info = {


