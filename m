Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2601698DA3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYUa-0004eB-PS; Thu, 16 Feb 2023 02:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYUN-0004VL-Ko
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:15:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYUL-0005fS-GJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:15:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3426473wms.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mII12rk/pmpzzS8gvTS6atRlEnr9HC2MtMWuGecGnQU=;
 b=M6Nrp9KrppVL5n+72JhTnOCWMGMCvLyHM3hny8stIY+rwgxaVHcIiUYNEQzA1NlZY4
 sDsLC3Hyf7V5by0Vq/4Z9XNFCqWAYFGOQ5EjR+VRQlNuDDfoQvp+boJVz0H5APt6Dzvd
 Vs+/MBtACQ23PoarSva+FyjoHi6xQscuCa7h3/xym2l9ygJDXX02jgfeJcX1d+za05Kv
 ieuv4awNcHgOinCY/ker8qyAuB38qu1ksZ7BOULS0+hueULURGRISQ0bhdktQmH5zBov
 8V4VYIhCJmXmggx+BDx9VQyyZOvUjBpt2SmT9VB+jhQCnbSYt8Gre+fmt2j18ALns7tv
 +N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mII12rk/pmpzzS8gvTS6atRlEnr9HC2MtMWuGecGnQU=;
 b=m3vqV0ZHo+nb9jUVRoP8LYkipFO849ZmEFeL6E4x8RCWoaFdTNh4aZ249p5YH1jvwc
 EmR89pz8dKbPXD89g4poFz7hX6EL7nKUWU7o6bMUssXt+r5SFE6xReAyJA4r/fiF1mfN
 cUMahHL+CNqjOySw48lYQjRd1FOo1n/z/J4T/rqIUktSd/58NJsBS8Q+TQ2nx1Mkm4SH
 D9+ToTd86M97CQpILnTpz+gjsHdwQC3wN1o1ZuHC1JWyOlFTvuen1BvNWdD1EpuxGTYm
 DXcREGMLccLZA2ENMEbtfed/Ix47eUtLknA6Yzhqt3Gqni16/a4VhpxKjjhzIYa3qugz
 wvaQ==
X-Gm-Message-State: AO0yUKVdYjkfnqPJ9s/r5QobHEJ4gSgqY9YopPTLLWlNyGYzz5/FX6Jm
 KR8/eh05WR8d/0exphjYVCB9yQ==
X-Google-Smtp-Source: AK7set+G7xMxWEORIOb6p0wdXRdpePoFcU2OSvjPV0gXcqolR0b4ON8f9DYVqTqr3A9C7zc+sW6DrA==
X-Received: by 2002:a05:600c:1605:b0:3e2:1532:bb47 with SMTP id
 m5-20020a05600c160500b003e21532bb47mr402352wmn.27.1676531727324; 
 Wed, 15 Feb 2023 23:15:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d21-20020a05600c34d500b003daffc2ecdesm4426443wmq.13.2023.02.15.23.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:15:26 -0800 (PST)
Message-ID: <aa73e856-d35e-b938-ae44-a21a17b43abb@linaro.org>
Date: Thu, 16 Feb 2023 08:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 10/27] tcg: Add tcg_gen_movi_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 30/1/23 21:59, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


