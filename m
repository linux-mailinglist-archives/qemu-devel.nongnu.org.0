Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736F2B1037
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:26:10 +0100 (CET)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdK6b-0004EJ-F8
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK4d-00036F-9b
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:24:07 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdK4b-0000qt-Lj
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:24:06 -0500
Received: by mail-pf1-x433.google.com with SMTP id v12so5697005pfm.13
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+c+nEH5RZA5FbHxIemk6neVIeXGWavnY8Y2HpDTAW3I=;
 b=chIM5z1d78MQ0mxSNh/byboGWwZYXpJE30LwQN1V2XEOzhq4iHXczHSrm7D2DXwsiK
 J/7arII8zWoGxZOoKKBrCue94FYOZpDvvBrFP4pmHvNW9RWyRJiM7mDDVCaG54BRGmPE
 7gorIb6P1Lx81JiXOaGjb3DJJlgF3Snzq0Sus0gA911K2/EVNNkm6y/y5wDLjCym+FzD
 FkAaKBSSYCXdxYZMMyAoSksZABo0edr1NKNiiR+wFeUYzKCcODESvZ0c8rITrH3VgxZH
 cg7BEcKi5+63yS5Dm+0d0uH5rBB3PYt3KIXnPABabEAfJ/vHMgR5UImaNm3iwpZILMMS
 GozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+c+nEH5RZA5FbHxIemk6neVIeXGWavnY8Y2HpDTAW3I=;
 b=QTYYNeJhrQ+2VOjWon6O2jdzhw0szYaHZIrPMwe7QrpNprnigA5kQC/y7mWqTsbrdW
 JJ9VR1dFpjAJLTifq61pcpuEaJV9T//OLnFAE+IS8w87V9NkRi8w2mXre2kKs9Kr9eUg
 cQC4RMysQ38kwb+ReCyx//4XbnGeEYTX+7gnRcl1fflY7nX6bEqvGbtxhdZ0OHbsa/uT
 e9rJOscal0XrHFlHEgtfLkesDHQmRqsDfIDNgshP2rao6NaLPoPCVSYSNjrAgYOnQfiX
 CgMi1EVCnZh/x0H9vk7IwUUs6A8zGxATBg/5fX/TAMDfnogeEtY/0dsXBt+Ipv3qAp4n
 KFyw==
X-Gm-Message-State: AOAM533GMX4cvhSwpWRImd9v/022rJemiJkeb34wJTMqILSr0Ey1ESn1
 DNIMIo/6SvONPZAQJiz1zj/Iqw==
X-Google-Smtp-Source: ABdhPJwF6BmyS0SBayd7+Se4IwYsrtEym4EF2MnGpWpGxQGOZSrdXd8Evbi9dNkePjfxbFOgLourIg==
X-Received: by 2002:a05:6a00:14cf:b029:18c:959d:929e with SMTP id
 w15-20020a056a0014cfb029018c959d929emr1261004pfu.53.1605216244375; 
 Thu, 12 Nov 2020 13:24:04 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 35sm3954611pgp.26.2020.11.12.13.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:24:02 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v2 3/4] hw/usb/hcd-xhci-pci: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201109135300.2592982-1-philmd@redhat.com>
 <20201109135300.2592982-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17b2fb82-1d7d-81b8-3232-0e1a967b77c3@linaro.org>
Date: Thu, 12 Nov 2020 13:24:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109135300.2592982-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 11/9/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/hcd-xhci-pci.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

