Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F8E369D23
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:07:21 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4tM-0003jY-D7
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pv-0000KG-6L
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4ps-0004Ot-Tx
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 j14-20020a17090a694eb0290152d92c205dso2009618pjm.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fzRxao+l5YOz+yn3TW3zXFj7W1ISncTRuCD3GURtb/Q=;
 b=syKx3sJQrfQvirj9WBzO6tS3pSpQhrVHmIh3Pe5eWObKgbAO0bnca4X6V/XFOSFXFS
 IgTNwCUB2LOUNNyzv3c6dnpP46+24JzDQstw7xpnTzI9gxcKOdrKmfxXns2nf+qa1uzh
 SRtYeOhRI+isHy90TjxkXQb568xAE/9/YjxmGfBIf03XhAP/487S+AMli2qNaiEpnvRR
 FG0WIU9RzSywKivZxNl8xU762mx/mV3Nt5tqlUOIMXigessOtYn2U7x0IAYrXvpnJgF1
 BrTE1qk1dkCnfvc3UFiL/MgVuxphbmH6kBWdnVq7BmdIenlaYZKQJB8Y6nsxVIGV9CoL
 S5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzRxao+l5YOz+yn3TW3zXFj7W1ISncTRuCD3GURtb/Q=;
 b=Vux2NQqWwzEwEtgOkUmuzNGuwCQJiHkqSTi5BgKcrM5eJllPn8SJAQ+ZdCHO9pLaq5
 ZWYCt5TJ6hLmdgyV8mqMpodve9nZ3hQRkpynxt7em+gvM5zDBbB0r3wOZRKGt3MRO8bc
 iHAgqpPSzu4TV34mQvZfvCd5V+gU/VQXsHfj+JvfD+nCk9QvFD/AIkmM8mfX7oFMM27m
 LLUgZJ6yelD6QAgMqldgRas12+u8gUU0M1ADvDPJtsW5iVXh/pTuMPBbj0p2nwv4q202
 7r65y3aihvSPFkTFPNqqu8S+xGl0BOblQkGpjQWBGR4Kxcr6Pz6GsA2iMYLGxAPmFLpN
 G34g==
X-Gm-Message-State: AOAM533RuckymIUScJO1lLxG95CEoIhQGhd9YeAJ/AvNwF84+F3MPdOA
 7hUzhrHl+lUFgu9wpwAwamGoWg==
X-Google-Smtp-Source: ABdhPJwr3q7wChmXegGApMa20lVKPNcupkXg8mi0y38gmgr2BmEcWaFDXIq3I4eXm2DActtAvAtGvw==
X-Received: by 2002:a17:90b:1b0d:: with SMTP id
 nu13mr8053167pjb.149.1619219023594; 
 Fri, 23 Apr 2021 16:03:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j27sm6160404pgb.54.2021.04.23.16.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:03:43 -0700 (PDT)
Subject: Re: [PULL 06/24] bsd-user: style tweak: keyword space (
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08f78eaf-9338-0aa4-6516-5d5daa4cb281@linaro.org>
Date: Fri, 23 Apr 2021 16:03:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


