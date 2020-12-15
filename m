Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67962DAE94
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:11:20 +0100 (CET)
Received: from localhost ([::1]:34276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB2t-0007JF-QV
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAxQ-0002CN-Lw
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:05:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAxP-0004dE-5a
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:05:40 -0500
Received: by mail-oi1-x244.google.com with SMTP id 15so23407600oix.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VSRvCLif/VkHTYroZqEOAGuvTQPetTsTqUTNTy/jVkM=;
 b=jrjvLjX2n581qSAqun5wgJAuTyM2sX/yweYKkNiZNP4ZXeXZ5ZxJ0WEdfTrKCYNlTl
 MACsREBonOcktvmQhuOIIvIA4bg7IdbmIqwGqX0Iz41NIkhWgvJphs9G5dfsc2H0WWMS
 ZLiJqGSA695Q/P0mLYohhsiPNUfjdyTg7bXwBkI++0qyPNM7SiXtOuDPq6pfvDTptmD5
 vqotmogVwyH1mVqe149MBv6EAzxysWPg5AjbwMxZ2QDHDNZUonEbnHtCUI/+KZiSD+mm
 +bEKUzflQlrT/83+LtzMqdD1Xfa+QXBIrBh9QGw40kDaaOYb8yFYgmgqyxhy60Fq7U2Z
 DsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSRvCLif/VkHTYroZqEOAGuvTQPetTsTqUTNTy/jVkM=;
 b=bVKADXoJJgjDgK2i1imbU4DC74VB+hmOodrN/gzWAgrNGZg1UAUeSIGlN3Myqzi9Ol
 W6Zh9JzTQrRSt/s58VrKYx8lYZ6/fBiU1DKvRWIgoGMhzBDEm5qERiD1mCfKkGUAcYRs
 YT81mwt8MpVXqXDZ52QREZ/XuU8RIjshP5qkyruQ/rWcG0HU5lGD/B7nb+7aBUtsGHj3
 YX/8aEIABwpOdMIzfhU5S+wcRIthNmVOOAsYxWFcvFe8hM+FYGSxxMqgEwhGxEt3MXW1
 kSAaSlm3IW2oCopbBCWJ8jHZ+k6uxcBkCuwYEzYalWkA90F8Pn/+DeENDYaemTEYD8ap
 ZXqQ==
X-Gm-Message-State: AOAM532YPuprwcMa6jsTpb/Ci/WscrZykrARqxiiEOK7B7u2+oPW67mw
 jEnhiCNXPu4r7EIpEFzipNKNrw==
X-Google-Smtp-Source: ABdhPJxarFw7t8qWVR5d6DyLSUnCvKtPx9VtvA9+047G+Poi4o/XHjpYAX40w4SXIuYyrMQvWd87nw==
X-Received: by 2002:aca:61c5:: with SMTP id v188mr21574182oib.66.1608041138156; 
 Tue, 15 Dec 2020 06:05:38 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 8sm438153otq.18.2020.12.15.06.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:05:37 -0800 (PST)
Subject: Re: [PATCH v2 03/16] target/mips: Add !CONFIG_USER_ONLY comment after
 #endif
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f004fbf0-b46b-52c6-3890-9f4aae402698@linaro.org>
Date: Tue, 15 Dec 2020 08:05:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> To help understand ifdef'ry, add comment after #endif.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


