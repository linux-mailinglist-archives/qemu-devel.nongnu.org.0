Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E169962EE6E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvkD-0004o7-Vi; Fri, 18 Nov 2022 02:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvkB-0004mj-P7
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:24:59 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvkA-0005FZ-1T
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:24:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id l14so7960547wrw.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QFDGPU97Ix/lDYg1rerFQ4wq8bcbI0aQgCfebFCDcmQ=;
 b=DIYNgIzCnN4EHnMAA6oOWCiHV9nxHifd1u5jRQDprrhHkFqlQugzxEBo0FJBu21BC0
 xpanXlZ6mZYZahdYIW+KKYmqz1hZpNViOUGQzMWS3mskPf9MW7XyQDohKyKKUQNnGq9g
 KZWR51ciHyIMC2J9wTIJbDYqwOgNtrFBYVpcwPsUGC0Dgu3CyAgd4tGoK0njFlvSZ8jA
 9/CJD40+3kVCF4j71WxIhSL1mG4mrJm/O0u95kE8aK1hgcecaPpul0QXOobHZZ0rprQp
 dop7anA8lJctHZryqVyau2zXJBckYIY2LqZBTPRmK9UnnumUffbLt9ZkUM4AvzVaJ2o3
 9HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QFDGPU97Ix/lDYg1rerFQ4wq8bcbI0aQgCfebFCDcmQ=;
 b=p0804JW9Uvf6NzMHLdjo1JnEfeDE7UsFZ5od2wDev0oWWkXphES6MsyVnTrAa/EllE
 lp+3oyh0t9JQ2mUx9OrA72p7qDfUIEkg5OrADvrEe+9kNORKZPOAm+/7omrgnFoHRnbF
 khGjQDHD+XK0khRGhaR+7aK4PPE8YSxzsfWfsm75IpGrBS65zbAbe7MVGumCD+56rHau
 DEg4HAsJy+RbiI2hXFq56Sp3nz2HuQFDeF+eQbXvnKDxqo5ixMIJEVhcIU4+EDHLiB5V
 VO7lc2bBTcVRG+KRYjmOExRj0QCxQN475eE2P7nc4g1sMglj+wJPZOo5dH+VV+1ix6Dt
 WOSQ==
X-Gm-Message-State: ANoB5pmKC+0CKSMT/w7UOKgZ6FLHQCrYqueqp0JZs/dtA2DVcfCMUVgO
 17NQ2+dgwVBjXzFoBsx1c6FZIg==
X-Google-Smtp-Source: AA0mqf5cBSAJ3bHYEk9oGAUNpnrsc6uxNxBUT3NQzjCPv8YXKbbjv2umq74ivYx8lcSTKV1LPNti1A==
X-Received: by 2002:adf:f70b:0:b0:241:792e:237a with SMTP id
 r11-20020adff70b000000b00241792e237amr3505487wrp.511.1668756296230; 
 Thu, 17 Nov 2022 23:24:56 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 m28-20020a05600c3b1c00b003cfd0bd8c0asm4054220wms.30.2022.11.17.23.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:24:55 -0800 (PST)
Message-ID: <b6ea97e5-5b27-2765-cbb8-70a54fb1d268@linaro.org>
Date: Fri, 18 Nov 2022 08:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117165554.1773409-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/11/22 17:55, Stefan Hajnoczi wrote:
> The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a
> Large-Send MSS value where the driver specifies the MSS. See the
> datasheet here:
> http://realtek.info/pdf/rtl8139cp.pdf
> 
> The code ignores this value and uses a hardcoded MSS of 1500 bytes
> instead. When the MTU is less than 1500 bytes the hardcoded value
> results in IP fragmentation and poor performance.
> 
> Use the Large-Send MSS value to correctly size Large-Send packets.
> 
> Jason Wang <jasowang@redhat.com> noticed that the Large-Send MSS value
> mask was incorrect so it is adjusted to match the datasheet and Linux
> 8139cp driver.
> 
> This issue was discussed in the past here:
> https://lore.kernel.org/all/20161114162505.GD26664@stefanha-x1.localdomain/
> 
> Reported-by: Russell King - ARM Linux <linux@armlinux.org.uk>
> Reported-by: Tobias Fiebig <tobias+git@fiebig.nl>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1312
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/net/rtl8139.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)

>   /* IP checksum offload flag */
>   #define CP_TX_IPCS (1<<18)
> @@ -2152,10 +2152,11 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>                       goto skip_offload;
>                   }
>   
> -                int large_send_mss = (txdw0 >> 16) & CP_TC_LGSEN_MSS_MASK;
> +                int large_send_mss = (txdw0 >> CP_TC_LGSEN_MSS_SHIFT) &
> +                                     CP_TC_LGSEN_MSS_MASK;

Nitpicking/matter of style, the '&' is harder to miss if moved on the 
next line just before the mask.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

