Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82565F13D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:32:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTAF-0001FL-1N; Thu, 05 Jan 2023 11:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTAD-0001F5-8F
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:32:22 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTAB-0007xm-Pm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:32:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1758665wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=udMW0dXb1X4I5fIy2V1VZk5HWRI1blMgwfxe2P4sDD0=;
 b=kLZsWw+bhNmilSc7qGHLyQboWHNVGAtcKdK4rNT9ax5spUQuGlZqrMJoaXihZ6heib
 Xq01+Ikro1yLUIYeYpFDtKWM9zXyT23dhzSXdioFYzpzytAImUwld9VWC9gyOMBsyCNj
 +QlFpgl5bkX4b1vrW08GVEQrXgoLlcWIfQFaMtIa7zrRczYMPb6MLTT2BpznnDIAkC1n
 U52n6FqqSoNXTk0lxtH13DmZivqb4M5zpYAmlOkWidvCBlsvXHWNwyQ6TFk1S+MWVRgr
 EbsSkIiauadbCm7xwJ6mv68WfqAMzReCB7blehj+5ku/66VZweUF6bXcYBhBlY7podgm
 ecnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=udMW0dXb1X4I5fIy2V1VZk5HWRI1blMgwfxe2P4sDD0=;
 b=tU8K3bpauormTJ2JXvS1rTKDvtKgPD2HVlSvP713tx+pgZQndQ1TwiJdVg+n6L56z9
 dyGNeVMyhvQpeuFzXqkhsjGZlrJH5OpiBlJsOxkxtAbxiHBTXqa2dVQcWHzUFQOS3vb7
 myGXWk3Rk5AZ329EQ7WBf+n+aJVqroKCjzVCPVVlTonD/lt955r3ev+eLUg2XC2QjVTn
 VNbX7DAqKJahEpvxUTvNcrc864VAiAzE2Az/1zRfhiP2iUiQ7zNd0Ow6rpMOn6YKEdVo
 p2nZNk+FznFqFblNg7YPS9GIKpHL1Mx9W+ksyjr29C2E0IeuBCLW31LaK4VcoNP4fO7c
 3m0w==
X-Gm-Message-State: AFqh2konVeootvjGDQ7P6OOl+gQUX6JriArSHnjs60LErC+jZkDx74TX
 diEcKCFDVDRc3X8s4TBchN9DoUR48rIP77Nj
X-Google-Smtp-Source: AMrXdXuSxbaM9cYFtwXjw5EzYaemnWJSq/+66a0vs4Uy7cBP2lDw8zQ36c143jE41p+GLvW+SGe76Q==
X-Received: by 2002:a05:600c:250:b0:3d2:2830:b8bb with SMTP id
 16-20020a05600c025000b003d22830b8bbmr40581047wmj.34.1672936338150; 
 Thu, 05 Jan 2023 08:32:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi10-20020a05600c3d8a00b003d9bd56e9c1sm2904344wmb.11.2023.01.05.08.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 08:32:17 -0800 (PST)
Message-ID: <0360a8f2-cf80-3fb0-51de-c2f249e2b336@linaro.org>
Date: Thu, 5 Jan 2023 17:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/2] Move Fuloong2e PCI IRQ mapping to board code
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105154440.259361-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105154440.259361-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 5/1/23 16:44, Bernhard Beschow wrote:

> Bernhard Beschow (2):
>    hw/pci-host/bonito: Inline pci_register_root_bus()
>    hw/pci-host/bonito: Map PCI IRQs in board code
> 
>   include/hw/pci-host/bonito.h |  2 ++
>   hw/mips/fuloong2e.c          | 22 ++++++++++++++++++++++
>   hw/pci-host/bonito.c         | 31 ++++---------------------------
>   3 files changed, 28 insertions(+), 27 deletions(-)
> 

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


