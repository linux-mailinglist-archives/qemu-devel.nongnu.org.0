Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552F35C907
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:40:21 +0200 (CEST)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxjg-0001Q1-8j
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVxhM-0000BU-5K; Mon, 12 Apr 2021 10:37:56 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVxhK-0001TM-MB; Mon, 12 Apr 2021 10:37:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id s15so15374882edd.4;
 Mon, 12 Apr 2021 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5UU0sWMP+/5ocT1SVByqSumpER0tBoBJzwi5ifiFY1s=;
 b=tYXyrfaolWBNft7FWYWm3FWBtdDraqmAcaIl7OlEZocR3DiLIPxo+bh8sWtuQGig3B
 SIMZNbTdG533Zj21FsqFqvYU0vehSSqBOUJvuK6gQbc9dv96rxCXyjbSdKQcDwjs86mv
 zcSaTcmvPJpRgK8ZelMxXBPB44QLublppm/2aQtp6D+iqbCsd7zQQkXabHcraaqRixKp
 lnFrCPa0RO/eA4bnkRii5CCGI1Yio+2RNdJKG4PZX3kVHYCLX+N2VVWjY8Lnc3vH4pEY
 KbLiJa197LE3fh167shByLvEertW6XNlsKJsauNM1JAqGykKUTL9g+rv+Vap6MQNScnN
 U6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5UU0sWMP+/5ocT1SVByqSumpER0tBoBJzwi5ifiFY1s=;
 b=AWHJEP4/fQife0J+7Ym8XO2re4nDbIKhSPFKxLXc8QgHQXRHz0PokwtvizoTTyf9Gf
 yHibqoQ5q0/d2V1gVXIdoIExAt3/60rn5HAqeE+0j7hEMMpboQghKmmcK98YXKMIJyi2
 +7BRph7ipf+GkhY1ToHQPfRgbSMa4E+2tADDOgcpRfd5+Sylqitf1gfm4zkoYF7nm7Ya
 GBn0aFq5L39uHXlAMfdAvBSPmjfOAqGFGwBsInAMitzk0MtBPtmW+XiSjitihjBta0Jm
 4VIhYFVB9WC34+2Az1sDUMf4IleVOeWDb4DzQCxFY9l0xeWYshb1UdBAvzKWEXB6DcVy
 q+xw==
X-Gm-Message-State: AOAM533lnNUWuZUizh8cfthVgL7AXeMr/Ge4odn3rylGb7QNDyblX4Fs
 egRTmNAfmE0EcHnhWWEIOgE=
X-Google-Smtp-Source: ABdhPJyWB/BRLS/jg+cVeq3cXkUsG9Hp/TbVATIeTzbXrQEImhoHSq//awLoEqwKjV/rMdWIoeP9zg==
X-Received: by 2002:a05:6402:5113:: with SMTP id
 m19mr30238469edd.78.1618238272981; 
 Mon, 12 Apr 2021 07:37:52 -0700 (PDT)
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net.
 [83.51.208.63])
 by smtp.gmail.com with ESMTPSA id um13sm5978534ejb.84.2021.04.12.07.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 07:37:52 -0700 (PDT)
Subject: Re: [PATCH 0/3] mps3-an524: support memory remapping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210412134317.12501-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5ae470a2-d10a-13a3-4dc6-62490a940e13@amsat.org>
Date: Mon, 12 Apr 2021 16:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/12/21 3:43 PM, Peter Maydell wrote:
> The AN524 FPGA image supports two memory maps, which differ
> in where the QSPI and BRAM are. In the default map, the BRAM
> is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
> map, they are the other way around.
> 
> In hardware, the initial mapping can be selected by the user
> by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
> in the board configuration file. The guest can also dynamically
> change the mapping via the SCC CFG_REG0 register.
> 
> This patchset adds support for the feature to QEMU's model;
> the user-sets-the-initial-mapping part is a new machine property
> which can be set with "-M remap=QSPI".
> 
> This is needed for some guest images -- for instance the
> Arm TF-M binaries -- which assume they have the QSPI layout.

I tend to see machine property set on the command line similar
to hardware wire jumpers, externally set (by an operator having
access to the hardware, not guest code).

Here the remap behavior you described is triggered by the guest.
Usually this is done by a bootloader code before running the
guest code.
Couldn't we have the same result using a booloader (like -bios
cmd line option) rather than modifying internal peripheral state?

I'm worried anyone wants to add its own machine property to simplify
device modelling, but maybe this is the correct way to go...

Regards,

Phil.

