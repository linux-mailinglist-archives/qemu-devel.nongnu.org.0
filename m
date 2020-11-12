Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCE2B1041
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:26:54 +0100 (CET)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdK7J-0004pI-6V
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK59-0003Va-D0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:24:39 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK55-0000s8-8w
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:24:37 -0500
Received: by mail-pg1-x52d.google.com with SMTP id i26so5304779pgl.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PIkFeiL09oNqMiAlqAEwPhZMk4m2SmNOcGBBCyHk0vk=;
 b=If8z1+tVzLBeMdGCaEjaHFz6B0czTXs2grjzZhFFgMaZI39TnmerInHlwSzIV5ALmh
 1bCtMdQqAVAGhD23YN2vABLwd0wV5dxHimTBD4wehoercS8tn+1ogXkljyCGJKnqyLhD
 0sBgKv2CvivJG4L1F7yZATwr3o45F/nu26wu8aRVjXTcppQEELSWzH4l+NcoJcwwWIqK
 nTYxuKExJoMNXW6gxy6eX5eQ7tJuqNGFsSU4y5gqzzKyiVu6om1agzmZHxY/9XCErWNT
 3OOZaHSDg6eNKTr/ZIe0nxz3u/lIQ063Dk9eTKyAHUMJhynIRE8jaPmXtFSuzwEHqwTl
 roEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PIkFeiL09oNqMiAlqAEwPhZMk4m2SmNOcGBBCyHk0vk=;
 b=tM4i69tapEOaU5YGXqL0omMN7/ik0/bjEax2WxNMqfvtGpG92gT8AregUR22Px+49o
 Dim3PXSWqkJKIXC3wA3i6Zzp3H1g81LDVlpeFGWeB6bhiy+H5hghqecK1WHsiFI01/B3
 Z53GPXSgAU1eos2TjvNY/66AoiGBnnb8ib6K9P9tCbvGuFoEMaWrWXJlj2ny6vXBOvuk
 gmWnRRzKssedTG/e76wPeOJZXp45sv/1rQ/NMb0AdQGIllc/M1I9XuYpCzSzDWgPhA9O
 OTC9GhSh6lUWSpSkX2nx4dy0qoqLeBv2eIIdwzAg7Tlrju2NFKYgSQTatvu692ZImo4e
 m/XQ==
X-Gm-Message-State: AOAM533PC3TU49cvbuyxHjYFBti1aRAg8YnHEWEefVQ+Uh25h9mKlStl
 gdEw3tLhlKvyK7+BX2O5V4N17A==
X-Google-Smtp-Source: ABdhPJyowXQ1xcmJkVEFydMKuioxpYdlN9ZIvec6NZuANczN2fLB0hYL6KvTuyWbGAVG3tPCYL7A4A==
X-Received: by 2002:a17:90a:a81:: with SMTP id 1mr1101954pjw.165.1605216267934; 
 Thu, 12 Nov 2020 13:24:27 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id js7sm7756837pjb.46.2020.11.12.13.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:24:27 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v2 4/4] hw/usb/hcd-xhci-pci: Rename "pci-xhci" as
 TYPE_XHCI_PCI_COMMON
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201109135300.2592982-1-philmd@redhat.com>
 <20201109135300.2592982-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59016aea-1df9-19e3-867f-4cb71599e2a2@linaro.org>
Date: Thu, 12 Nov 2020 13:24:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109135300.2592982-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/20 5:53 AM, Philippe Mathieu-Daudé wrote:
> Follow the code base style by using the _COMMON suffix to
> abstract QOM types.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/hcd-xhci-pci.h |  4 ++--
>  hw/usb/hcd-xhci-nec.c |  2 +-
>  hw/usb/hcd-xhci-pci.c | 16 ++++++++--------
>  3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

