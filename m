Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302DD6F5559
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:52:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu99x-0004TO-9A; Wed, 03 May 2023 05:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu99v-0004Sw-It
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:52:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu99s-0001Nq-Vg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:52:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso30243255e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107543; x=1685699543;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A0/2ZyWnMrK94IQAqXF/FO5uKoSBNoMRFRvze0ygvUw=;
 b=lYvf2bYTjcTfpx215nLdk30ZUeNNr27avcVt2TzNhXe3PcTkHt7AE1bjJEaIxlck+B
 38gfGqZK9jX4d+OCK2Hbdv2EarnE0Kk0PQslv7lxaBvOjMiVFbN1pj7BielJESr61Uhf
 DnBN+wMNYoWeRtzsA78YS0Th8gLNUITYPzj2L+TP6vZSnFjaVp4A5igQ7HsoVATIUPJM
 yUa5ONiOC0JpJ+ruY0XrhSyPK4AcyhQWk27pULjLSRKo0bf80S41ZvAeDdONk9hAlyeQ
 UD2W1ri7NexvJQhjsigONi6oG/BJddlQ0yqUagNJ8P2ws5H4MRpkd6slrdlUOGjKVrUy
 fdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107543; x=1685699543;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A0/2ZyWnMrK94IQAqXF/FO5uKoSBNoMRFRvze0ygvUw=;
 b=gx2R5Zld8S85R0Wvh6+5419ZiT9UwYJ7U/Gws2OqmE7Rc/5Cc6CF0swAbGaaWFgaoT
 ZhmjkNwDsaa9832qyh4jwpnzAX0G8bwnbEF1ObSGF8DW3p8KFaC6yyetbl9ip94Pdm6Q
 maAQtTtgQK8J7NjN9aIv8dD+xiGtDovMjmz8mRpX3r9MM6WBRs07vdrHA6c/zSsCy6Dh
 8fRXrvvVrb9CKX+bNFsccyuy8ruXkFCteZb88o6PL1V3y0gYSYUSCzSz7Rp7rFJmtsC8
 BFCEx/P37L0jtTyTxUw2aGt/1v7uz0J2iUQZiuX9Mn7/qfe3CXYcYdcJ6BMR0DEnbI0w
 i0/w==
X-Gm-Message-State: AC+VfDydYTto4D3t9dssEMBPGVLtLsdqj7mkmrIgeo6lggRAPRIQtAuJ
 K+yYZ3Mq1wPNlP/U/o18CA8OP7t2GJ3LLS/rUnYV8A==
X-Google-Smtp-Source: ACHHUZ4nVkpFvgzlglsCOtP8oOvEkgNGmvXPewBNyLzMNseBwhfSseYPicytqNVwQ34+5Lj3dwAtEQ==
X-Received: by 2002:a05:600c:ac8:b0:3f1:72f8:6a92 with SMTP id
 c8-20020a05600c0ac800b003f172f86a92mr13854698wmr.20.1683107542908; 
 Wed, 03 May 2023 02:52:22 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm1362877wmh.33.2023.05.03.02.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:52:22 -0700 (PDT)
Message-ID: <8ccb74a6-58cb-adea-fde1-b62af33cc13b@linaro.org>
Date: Wed, 3 May 2023 10:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 03/10] trace: remove vcpu_id from the TraceEvent
 structure
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:17, Alex Bennée wrote:
> This does involve temporarily stubbing out some helper functions
> before we excise the rest of the code.
> 
> Message-Id:<20230420150009.1675181-4-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   trace/control-internal.h      |  4 ++--
>   trace/event-internal.h        |  2 --
>   trace/control.c               | 10 ----------
>   scripts/tracetool/format/c.py |  6 ------
>   scripts/tracetool/format/h.py | 11 +----------
>   5 files changed, 3 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

