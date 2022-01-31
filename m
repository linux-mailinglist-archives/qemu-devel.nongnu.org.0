Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E484A3E35
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:28:56 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nER7O-0000pi-QF
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQbY-0000Eu-8o
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:56:04 -0500
Received: from [2607:f8b0:4864:20::42d] (port=45596
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEQbT-0002hR-QX
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:55:57 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 128so12077572pfe.12
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EGLBiewxA4ODMDJfHjfpEX1VUMbqdhTUkvXm9+aeWf8=;
 b=c1MJvQ4jObhRrkpO5ufCBfJ5l3BVdpcj85hKCxsyq3t6S7LxlVJK9s01u2qIwLHzTc
 5ZL0U9L989JeGDCzRuYeHapF67qUWDhS7enq1HMstzW19Gbx3EaQ64wHHyuuDqVZRwl/
 QGtRXvij+Ux0euxotI2BY+X10FnjFEzpVnsG/C4RDptiKn7Htb+nArr8nlwrFsXlVJzv
 eeMtahn7AQ1s0lPk1OPD5qBQqX3Lu7xsl7Zh5cwO5pY5WTO4tT9pFS75tWx8jF2ktdXd
 LlaLztHREY6BUioM801cpI78trMDV85elIng0OkAlCl46mGHX90z2mVJfF3xdgsUxrdb
 7oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EGLBiewxA4ODMDJfHjfpEX1VUMbqdhTUkvXm9+aeWf8=;
 b=nKnfSn2yvE5kgF3ckPltcNRZEpoGKO8M2NUbSWSSNRpLE7BCVX29VA+U3RcIuUWvKO
 kthyk5mtd2a7SQl22nQAO4jNqVNxORIaIiU5QNjutM1rRWGegJslVgL58ynYkVgHlnfz
 6mLADSg/NNfyCVgXVSOLeinkZJ1COiOTWnWALkj8Qt452orVjxp+pi7Voit8bfIF1NSH
 QJMHWcMaoL0iSLKjBHNtdUFNI+S+WPelyVm3wAq5yZeiWamQSb9tF2pzCar5XSh4uNvE
 6oEZOuD1L/aB7mRmlIrInEVhRexec04bphKP61gL1tLtAHWLWNl6H+zZ8XPqSEmlQq0W
 sX9w==
X-Gm-Message-State: AOAM533uGXkOrYcwITtbz7gPaQ7cijZCrFJyTiFIS4vPvcmd44/AqBwO
 oRW/BosP5/NZwtDGNUCHE8cCOw==
X-Google-Smtp-Source: ABdhPJzsoW/wrFNdNCw6JHtv+IraGqSuplt4lY41XMVRLk94y0pdvm9w0NqRcLx4takANS/eJcTzhQ==
X-Received: by 2002:a62:8fcb:: with SMTP id n194mr18934256pfd.29.1643612143612; 
 Sun, 30 Jan 2022 22:55:43 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id mv10sm9703027pjb.45.2022.01.30.22.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 22:55:43 -0800 (PST)
Message-ID: <37d67db4-9617-8fb5-b80f-eaef9d63e24d@linaro.org>
Date: Mon, 31 Jan 2022 17:55:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/16] hw/arm: highbank: For EL3 guests, don't enable
 PSCI, start all cores
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> Change the highbank/midway boards to use the new boot.c functionality
> to allow us to enable psci-conduit only if the guest is being booted
> in EL1 or EL2, so that if the user runs guest EL3 firmware code our
> PSCI emulation doesn't get in its way.
> 
> To do this we stop setting the psci-conduit and start-powered-off
> properties on the CPU objects in the board code, and instead set the
> psci_conduit field in the arm_boot_info struct to tell the common
> boot loader code that we'd like PSCI if the guest is starting at an
> EL that it makes sense with (in which case it will set these
> properties).
> 
> This means that when running guest code at EL3, all the cores
> will start execution at once on poweron. This matches the
> real hardware behaviour. (A brief description of the hardware
> boot process is in the u-boot documentation for these boards:
> https://u-boot.readthedocs.io/en/latest/board/highbank/highbank.html#boot-process
>   -- in theory one might run the 'a9boot'/'a15boot' secure monitor
> code in QEMU, though we probably don't emulate enough for that.)
> 
> This affects the highbank and midway boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/highbank.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

