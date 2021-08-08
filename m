Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB053E3875
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:38:05 +0200 (CEST)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaZY-0008Ks-LS
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaYp-0007gX-FC
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:37:19 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaYo-0002NJ-0O
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:37:19 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso24367947pjf.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=99ADGKK6segoCR7RvP79lHjNWLyTQosYjrtFcpJU590=;
 b=Ci8jw+9TaAHjOcUflvSxTsRMpFxmYX3T/BuPuv07n/6kSZMArRh6gxiSUYdzlfRmlB
 6dm0TTQvcAaSQ40ouoqRO44TfW1MdWtZ2tVcoKogzjA1wvhabih5Tk+vivGzZGl444DJ
 kPMrJUNFKGDmbUWgoKJrTi+nEs52h33+TaGXyCfZB2G6VIrULjZiLooR89iRNrllQUwd
 CjS2DlWdzusJYPteOtaTslBPV+LuKL9PGWGhCJAt34epDmJqgcH4skaYlI6CAyJFtYk7
 loL1Q7GDocVZSTSoMdLdw4pdJI3dyVt64uQLnB8T8qL3fQnUjvBwh7vwLYpZXOO2ugF1
 olFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=99ADGKK6segoCR7RvP79lHjNWLyTQosYjrtFcpJU590=;
 b=Pg1f8Qks7716QdHxLmQw3ygffTF9hJzG2Jlrh2VOkmV5OUvyz0vMLsF9k8LD/he8jc
 wG6DnLFBzeddImnSrPT2n2qV1iJ+4mgZZevx7HzfF9BEbaR+N8D6OJxoIm5gTNltiVtL
 e/duXb+3kEGPSfgs3m3UW1o9FuY+ecHIbjbfwQ/9L3fyT8u9Nb0FCbXa8x2Cmr0pgo4E
 36smhBZmDAj+IO2vLYRA1TkwXn9jSWI3YOt1rlgSUWtlt0cGl3Qt6RwB0E21gr3H3l8j
 9mMfFubDnc+hpHlJ7eeaKZA8VbEgTqOr6hzT1WPiB03KNyg+rx4/plVirKcR4BAPfskM
 rqbA==
X-Gm-Message-State: AOAM531Tqbv+g8s045TDpge5lOV0orWGF+Ud/fNdAN2VuoJy4KkpnEK1
 XAVzuuV5oNZQ8TfOvGy6uRmZ0emrhFwwkw==
X-Google-Smtp-Source: ABdhPJzk38tMg0JzREZdiS8f+Vwe482kNA2/1Mb6k70Fpt75cwUjIipCHYa7bxHkRtiWmWPYJ8l6hg==
X-Received: by 2002:a05:6a00:26ec:b029:3c6:2846:2bbd with SMTP id
 p44-20020a056a0026ecb02903c628462bbdmr12286481pfw.49.1628397436268; 
 Sat, 07 Aug 2021 21:37:16 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id v30sm18250099pgk.25.2021.08.07.21.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:37:16 -0700 (PDT)
Subject: Re: [PATCH for 6.2 06/49] bsd-user: merge comments and guards from
 bsd-user fork
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea8ef333-1a97-a3a1-c83f-c1d1e0f5c108@linaro.org>
Date: Sat, 7 Aug 2021 18:37:13 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:41 AM, Warner Losh wrote:
> Diff reduction against bsd-user fork: bring in the copyright/license
> comments, and guard ifdefs.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_elf.h   | 22 ++++++++++++++++++++++
>   bsd-user/x86_64/target_arch_elf.h | 23 +++++++++++++++++++++++
>   2 files changed, 45 insertions(+)

Could reasonably be squashed with previous, but not required.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

