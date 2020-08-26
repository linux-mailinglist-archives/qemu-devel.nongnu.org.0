Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18676253016
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 15:41:11 +0200 (CEST)
Received: from localhost ([::1]:47180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAvfp-0002z3-S9
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 09:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAveg-0001mX-GS
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:39:58 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAvee-0006tO-LI
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:39:58 -0400
Received: by mail-pf1-x442.google.com with SMTP id u128so996732pfb.6
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m6o2OYLWWZ9ZSr3lRsbbAC6xk2CIgNPg6GkCfQwOpGs=;
 b=gcvDcuyX/gvXJLCb6Z6BNtuJwrU8IKaabEXzI1Plm9G2pBRuQfJ7mepQjawSd6mxfY
 Ep9Ne5nRKjnb5ufbuc58I1Pli0tKTLjYZ2NkUwtakZgYWFqTP72Zi1bqrmXfyofmAcZC
 OwsOKEvNKeXut1yZ1Mp6Oy/hid2rXqOFddFMWCfZDOkKtQOhWihP5sdDmJpNbJ/bfQZG
 hbbm6N5D1UtwiDXugicQzc4JUz6kr8gkSAtCGDLYPVjc8+yX96icZpzSn73Aj1DAGoJ0
 WEZknpcYmGsDmO/otz37dDAzYqvoFHWKv9zLfc4WSFuVNn+DVe1H4FfcrSuiOAV0ZhVQ
 wsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m6o2OYLWWZ9ZSr3lRsbbAC6xk2CIgNPg6GkCfQwOpGs=;
 b=OdU3Lyy/HrPIWAEMsnyw9UTeTfdnSohjW4sPtKP9sNFQS7tyz9O4RzYMGvYs9Nbtz8
 kTMjzXuwfsY939fvzjeQWeRO7U/RSVvN0b6CCp5W7+3U5g8C4y1gycRelqqJTexptuHD
 RF1ByBtHooFhLcXLeRzL4ueripVJ1O+HUZ6PX8Tj8svYIjfG2ZX33iV1p0Gig+myKDPZ
 wKhvscpZPC0MkTa5nKnrsCSCTeu4UfNJNxiZk7T31ueN0LD0YpLuqH+aCMeEB2tHXxHe
 TwP6EmwZGxK6s3ZzXunHZxJt6TkGAHZTUoypW+A36vNBPHy7vQ/V3vyjHh01UU2Ureg9
 UBpA==
X-Gm-Message-State: AOAM531JcPpDa2Iz4bLJUEYW1h13HpAyEkmpWcB5Idz/iGhZOKHdvpBQ
 V1X+cDKRnCbh8R7NbB+MhvNjmQ==
X-Google-Smtp-Source: ABdhPJzGUanfT6/1wb7NkPnThRzQR58CyAg6X+RNcln6CjAu7RboJLTkKaPdI5emV8kKdvqP345EBg==
X-Received: by 2002:a63:cd54:: with SMTP id a20mr10264267pgj.228.1598449195193; 
 Wed, 26 Aug 2020 06:39:55 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id x127sm3118614pfd.86.2020.08.26.06.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 06:39:54 -0700 (PDT)
Subject: Re: [RFC PATCH v3 05/34] Hexagon (target/hexagon) register names
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-6-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a45ad7e2-c390-8b1b-792a-3815df01fc8c@linaro.org>
Date: Wed, 26 Aug 2020 06:39:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597765847-16637-6-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.239,
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
Cc: ale@rev.ng, riku.voipio@iki.fi, philmd@redhat.com, laurent@vivier.eu,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:50 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/hex_regs.h | 83 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 target/hexagon/hex_regs.h

Noting for the record that this apparent out-of-order patch hasn't broken
bisecting because the build is not enabled until the final patch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

