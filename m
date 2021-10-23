Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4A438573
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:52:29 +0200 (CEST)
Received: from localhost ([::1]:42106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meO0C-0004Hm-Hz
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNxr-0003A8-NJ
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:50:03 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNxp-0004pe-Ox
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:50:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f4so2434360plt.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ygqZho3R6xdHGN6T8aURsg15MBN/k+X5HHbi2+pZbrU=;
 b=EkwKjw4skZe+OUjGipcLp7I2m986tUIwEaUCynCcZLbm0y7Vgp/QlALez/lTjvd4g8
 jQu0p6wNE2VKJd7o/WEC87cPEepZd0oY0kixQYFzElzuu567AsXFnZO2/BkPdd2ADeDW
 y03rsqsavw9AYxz2sYEEs79an3YieZtM995dwEkfoDsmUDDV9UGU+ntMqJrguQIkqGu3
 bOfxceqI0tYJbw/g+3KDBLnaw8x49AzYwrRJm53P17sR3HAvYZ3PE64wiQZ3Wbqe4dal
 8J5lVCbGmIORssicBRI1j3sUwar+kyE2/7aIplQQ36Msc8P3AYTEVblCSwRdYRCCB5m5
 PPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ygqZho3R6xdHGN6T8aURsg15MBN/k+X5HHbi2+pZbrU=;
 b=rI/5k31PcmeO2qw6zn3MAl8EbpNxtcs1jyE/tLdT65He1qVZEVo6rxXnLa3xn61wnK
 3pTMvx6h3CvYejVtnO0Fr0UlQzz2sHLVmdN5SvJOGUKu/s9g2QZJ5gMYZ9IsVUgnH1zc
 4lOEG0b3e2O7ewyAYWzId/gcYXOKRL/KioldCF8az0dKaA70iG6wmxYBOokv7Jf2WerY
 cctqsFQ+LzXvFBrTvzYZ3/3X7wKobq117QYgi+eqd9CG34OPKL0A9H7e75P2EunyWlpN
 ek8OuwXuEaLGWbNPyDB2Ha1i3SfZ/gD5wPQmI3A6NrAjXY+NaqmheaeviE4JnMJEPIcQ
 JsuQ==
X-Gm-Message-State: AOAM531ERW9wOydChLGJf7HH5eb6o4m0YduLYgwK9UAp29Aow3LQ4stM
 yPpBPvA6V6n8OyoX1eixm0z1XQ==
X-Google-Smtp-Source: ABdhPJwxNJH6ihklXTfFpvz5UZCHOb3BIy8y1vBV2EOs12638ixEe0gw0b4o/kZ+WqeK3mgoYTL9Zw==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id
 mh9mr24318713pjb.173.1635022200259; 
 Sat, 23 Oct 2021 13:50:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 141sm1064496pge.23.2021.10.23.13.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:49:59 -0700 (PDT)
Subject: Re: [PATCH 24/33] target/ppc: added the instructions LXVPX and STXVPX
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-25-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <111cdbf2-61e3-c56d-2b5b-925417fbc8bb@linaro.org>
Date: Sat, 23 Oct 2021 13:49:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-25-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Implemented the instructions lxvpx and stxvpx using decodetree
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.castro@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  3 +++
>   target/ppc/translate/vsx-impl.c.inc | 18 ++++++++++++------
>   2 files changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

