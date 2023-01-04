Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E075B65DBC3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 18:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD82s-0004Vx-Bz; Wed, 04 Jan 2023 12:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD82q-0004Vf-Hu
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:59:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pD82o-0005JA-TL
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 12:59:20 -0500
Received: by mail-pj1-x102f.google.com with SMTP id o2so31373342pjh.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OJ565hb2jG1NmebIm316txOxSPQTP8ht5Pq+SOq/l/8=;
 b=f7pU47GjyaN7FCmP11XwkCowuv4rRO17D+yg/8aHwBB0xVz1hMyIh0S5UvoDbCE5eR
 AateIpVKchYsvD/pt/GW4lwuGAMO5naPNElRjtIw9skimDNRXBubmnDPEww6FF/4eFba
 7/P2JOYut7vCVWDem/7/YJLaVEIB1z5/mT1xzUrgwHjQmw5JZzzSVOJiNDQjTEIeCz57
 HxrhoFaMCnxH9LXIJO4igaIf7jvmaIP2Di3eUd1KriO2swbGAXiySEM3FA8IqneyaGLA
 cJcsMd5fpX5yhIIzVTiwUyUbKEMer2cRNITH18vjp9GtOv+TZfmygkQfg6s+yhwCnBJr
 f6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJ565hb2jG1NmebIm316txOxSPQTP8ht5Pq+SOq/l/8=;
 b=EecHNC/nKbmLZYzmawTrnDOQgwsuQfLLj0mAKCTycaN9B5muewUYGL2N0Cn47pOgxl
 WnyrpsazWORYvbeAjp+MhZzsf2QN54BgGc4MEFvXRGgDHd9rdjQFcRSGIqQNY4tHQ4xr
 0U4yuO0Qz/DuMqC6C+vqfG8wcR8GtmxrkQW5NF+8ZmKGqaxPFtzzy9DnTuhD2BVsXLQh
 Idix3sveGCBAYZ7pZy5Xl8WOD+85tzfPSFKoK22rOGWS7oIlCnvFFHnuKNMfxurOr/Hy
 +Bw+TvLDlWXEU24UAmEpPFvF+1c0v+1YMsJbTrouXQZsIfAK90aSGrsokDje4NclUuRB
 Mk8g==
X-Gm-Message-State: AFqh2kqSvAjceaVzjQDAsUP6gN6a7cCbrbLXuQ6u0Kw6gQxaTbA/pYiy
 w+++PSD1QhKCqOYrWXbOdtwU/Q==
X-Google-Smtp-Source: AMrXdXvBi9YRjd2jl67Xm8lZG1TUQBJFMVDysq+mV5DMkgFNYMwgAZoqnwVf4nt3aPmkXMI+hhxdvA==
X-Received: by 2002:a17:902:c386:b0:192:709b:9a6a with SMTP id
 g6-20020a170902c38600b00192709b9a6amr35974320plg.65.1672855157031; 
 Wed, 04 Jan 2023 09:59:17 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:92be:ce91:1417:6686?
 ([2602:47:d48c:8101:92be:ce91:1417:6686])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170902c60a00b00178b77b7e71sm24587054plr.188.2023.01.04.09.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 09:59:16 -0800 (PST)
Message-ID: <3231f828-ae88-e567-dc7d-5b51a7bbf5c7@linaro.org>
Date: Wed, 4 Jan 2023 09:59:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/4] target/m68k: fix FPSR quotient byte for fmod
 instruction
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-4-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104134554.138012-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 05:45, Mark Cave-Ayland wrote:
> The FPSR quotient byte should be set to the value of the quotient and not the
> result. Switch from using floatx80_mod() to floatx80_modrem() which returns
> the quotient as a uint64_t which can be used for the quotient byte.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   target/m68k/fpu_helper.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

