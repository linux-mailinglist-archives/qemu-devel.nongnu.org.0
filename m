Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89C2ECB9F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 09:10:01 +0100 (CET)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxQMq-000773-3y
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 03:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxQL1-0006Fp-Hp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:08:07 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxQKz-0000nA-Ht
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:08:06 -0500
Received: by mail-wr1-x435.google.com with SMTP id d13so4642748wrc.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 00:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QeO8f+4cj7hV4u8LoLyaJlIuJ8U40ngQvs5rvL6pSco=;
 b=Ps/Cu/yoaJwmPgy5/CxryYZ2zWbI2cPMlmnRtixGG3XA4e8NS2FY4PRMcDTimchZpX
 FefusJcqNUJZmzhaxvT1/4t+5O1TO9ZBkwDdvyRKSCepAitGODPBGIdKQ1ylyE/GvWdd
 hPuWu/6WIwOzealRU+tfHvGKc5ShjMNpyTlwtovuKiZZCrG/K6aJAT8awR7CTm8lPq0B
 fHft0nfeDCGss/PX44AmbsRTpxjjCaS9LkLGeuxlufbVbaUk4qbBESc1Dmn9ShNly59P
 7W6Qq0i85/ez2LQ6k+MREQO85G3dNA0QPh9KEyuulNOhwXg7BJKHdDeHLPgnhyQqbmoS
 IZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QeO8f+4cj7hV4u8LoLyaJlIuJ8U40ngQvs5rvL6pSco=;
 b=hsJB5J1FpFAy3xFJEdSoCTdF8LaAxQtP5YBHqcXw5/6cyw8cAaqmilKms/1fo8WnSi
 Je/YPb4UTsE9titDP4kLbDVOXV++HqsteNKnXZVaRX8XE7ECpe2U33vebDuwKlxMoIqT
 9xkVdJyZMEgtDVgBMEeOvqBxurquvdNloHwHKhUbg0EPaqnNFHyECHSY4e81L1y6mF0D
 bHCjer3/KStyJlBlOLnNwCj6elHuMz/caU5lXXwm48yd3BqpgYB5R+3g8lLVrF8lANMz
 Nrttsyvr8oqN/qXIADPyJF/g8uYd2Zh+o83HMkKLaJx51uMNZQ+i4yJRPwhEZxf9FOmD
 +nww==
X-Gm-Message-State: AOAM532mZUhjohXDSUcbtQBnfsrH1kmNsU6/4BpwPSyKTWqUmODHxYoV
 VDcIUtPNZ5ZWkEdunmJNil0=
X-Google-Smtp-Source: ABdhPJy1zZueU4v74pxy6xu75W2eXh5smE28NKMdOyWgP2bLU536ooJipEbyg7ZBCNa91nUFZqbIMQ==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr7733469wrb.13.1610006881241; 
 Thu, 07 Jan 2021 00:08:01 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h83sm6799116wmf.9.2021.01.07.00.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 00:08:00 -0800 (PST)
Subject: Re: [PATCH 02/12] vt82c686: Reorganise code
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <a3d10c3daf6e8746b985c9fe776ae314fd10499b.1609967638.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <77da4dfa-896b-3dbc-a648-6ddc472fc043@amsat.org>
Date: Thu, 7 Jan 2021 09:07:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a3d10c3daf6e8746b985c9fe776ae314fd10499b.1609967638.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/21 10:13 PM, BALATON Zoltan wrote:
> Move lines around so that object definitions become consecutive and
> not scattered around. This brings functions belonging to an object
> together so it's clearer what is defined and what parts belong to
> which object.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 279 +++++++++++++++++++++++-----------------------
>  1 file changed, 140 insertions(+), 139 deletions(-)
...
>  static void vt82c686b_realize(PCIDevice *d, Error **errp)
>  {
>      VT82C686BISAState *s = VT82C686B_ISA(d);
> @@ -354,6 +353,7 @@ static const TypeInfo via_info = {
>      },
>  };
>  
> +
>  static void vt82c686b_superio_class_init(ObjectClass *klass, void *data)
>  {
>      ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
> @@ -372,11 +372,12 @@ static const TypeInfo via_superio_info = {
>      .class_init    = vt82c686b_superio_class_init,
>  };
>  
> +

Spurious extra-lines?
Reviewed with 'git-diff --color-moved=dimmed-zebra':
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

