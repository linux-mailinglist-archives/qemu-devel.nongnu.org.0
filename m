Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B252B1026
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:23:37 +0100 (CET)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdK48-0002Fn-75
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK2y-0001ni-Fi
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:22:24 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK2w-0000XB-Ms
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:22:24 -0500
Received: by mail-pf1-x430.google.com with SMTP id c20so5720460pfr.8
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b44MAZzTwLSCUtwlToo9LraXRt4ReBjeuOQyLCwEX9g=;
 b=ZbJygWNkOOC/I0YlgJIPK1ZeLiFPPFD0NezD/6WtR6XhfLqkl1ZD57rA4XJOhxpfHB
 BMKq9QjN0i+QnAbxYL16ngP2CYu060y6ep9+wNvxrq+iJK7K6ok0VJfJWfCFR5guM6jo
 4iPy/1Op3UoK9R6s3pkwZlan0BIvgcV57xacF1iL1piRUdUU90PsdUwKvRFdVlwovg5+
 NLX1IHo84eKJGKArf4CbwjoI6nV3SpUKQ5f/FsofWJWaj1nWhMcX1BYULQ3V+yLcNNTf
 J1AUrPz7uHR9ytXqX+CrXzU2G4p5ZgjPxLxbhgrYF4ozBobNpJ6MgWHuFu0vpjFekqN+
 UPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b44MAZzTwLSCUtwlToo9LraXRt4ReBjeuOQyLCwEX9g=;
 b=lfiAcnmtd3ejrJ8cfKCksT3rpVvQBeugV5Ly1NQHbRGegvx0drHaIdL4qSp90Xbb4y
 MN5WOPtkhX4Wg/S9WAv3HPwXFvTx1RUChtastZdRacHodxxkj0hU5pLf1he1cGpMxdUS
 Huf2gTGDQTKfJs73grepwudYw5EdZdIwk5wqvfJBqLUvlNYzG5M4SbSzj8FTvZ72wg0D
 JuN4dha08lztlGu/3KVWg+fGAI31dZNBeBMfUdBH5KaK9gkV78WWGSUqqdoeby9ms/Fs
 GtbDl+//TNyh2muPmooUeHfQ2ROQi9w15jL+CbEfifBFurTlhukkMfZZnxs1eRw5PUOm
 6M3g==
X-Gm-Message-State: AOAM533FzkmDvs/V0aHMGp7ZKvmuQZnD6mqHWsD/0ayBgF7a3cVgHUK7
 JXRH8CPZCRgdso4xYANVIJdgxw==
X-Google-Smtp-Source: ABdhPJzA+IHlTMmYfai0xyxR2mWGvnGqJB6nMg5oRc4is1B+vmpa+Qcvr35YVzn8ejYWwbFO+CSUEA==
X-Received: by 2002:aa7:8e87:0:b029:18b:cfd8:261c with SMTP id
 a7-20020aa78e870000b029018bcfd8261cmr1194616pfr.61.1605216141085; 
 Thu, 12 Nov 2020 13:22:21 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t7sm7974900pji.27.2020.11.12.13.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:22:20 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v2 1/4] hw/usb/Kconfig: Fix USB_XHCI_NEC (depends
 on USB_XHCI_PCI)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201109135300.2592982-1-philmd@redhat.com>
 <20201109135300.2592982-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b28c34a-77d5-743d-6a51-fc79f80c82b3@linaro.org>
Date: Thu, 12 Nov 2020 13:22:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109135300.2592982-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> Since commit 755fba11fbc and 8ddab8dd3d8 we can not build
> USB_XHCI_NEC without USB_XHCI_PCI. Correct the Kconfig
> dependency.
> 
> Fixes: 755fba11fbc ("usb/hcd-xhci: Move qemu-xhci device to hcd-xhci-pci.c")
> Reviewed-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

