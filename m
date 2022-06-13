Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C408549E37
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:58:54 +0200 (CEST)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qD7-0007FF-Jx
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q9Q-0001s1-MW
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:55:08 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q9O-0005bs-D2
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:55:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y6so1015393pfr.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kbYGhX04x6Qd8fU1YRsl97ZwAL/0EVyQIL7QmAdG/+k=;
 b=Kjy9mVaAK0UoIV2NjJz5o/C4lbtm2sicbIjfFehlCZfhFIfIXT4odffwE042uhsDXQ
 Q5mCWiyqty7KvfbKLFgqavHWIYZ+rDEh9vDxN+epaoprqwnD//JJK1C7wcMNuDi3x76I
 X2We4WS5mFUcVqWqgBhJklwykkV4HNrBYXGtvAxe+ghxLvPYX/IPJ+bJFZhtGTrr2IEq
 31u+rQ6T2PcRIOZX3wuQp88v9iKwEpAM22bBIgLMDhv7byPdU2TlBZFDubypWSD1Wmk+
 08L7yniY4RO50heKAfq4C7eeja2iTL2hxbfQMNUWRXSsnMzMzhTMk+wtr/hhtrlZS2SB
 IZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kbYGhX04x6Qd8fU1YRsl97ZwAL/0EVyQIL7QmAdG/+k=;
 b=rmGq3Lpx8yvt/bzqw7GUkIqx4QLNnUWm6tNa1eNNQ6yaufu5BhQuPLZc/RoBj380/g
 Oo5r8qM1mVcUHNCB6QIAyYP25it9oN22e5RdqbjeW+yO1u7DICw7K0Stv2ah7FKReNhz
 qDHorQOjG3TEvXfZJVVTH1ELTTLjDAeHgpy6N5Na1x8CTVXL2SJcKvSvlBN0A7mgJVbQ
 rj2DqfBN+RlbYjqg/QuRXn/Kq3xU414Gp4XNeBfzyjhbJvdTBadpFwDR0tguFOvDs0cG
 VmmafFV7bidiyyR0OU31MGsx5dS7/BJiui8PPL03As+jLWR/MXXPh4nYTIP8JdzNcnSJ
 845Q==
X-Gm-Message-State: AOAM530ZaOf8goBoG6A55yPmugsmn9mgvowPTKN5mUWWdrB0iUZ2NUQr
 5ilI5gz3+dR76KuyG7fZg8IAYQ==
X-Google-Smtp-Source: ABdhPJxluEZ/NUCURC5V+b75UUKfmeer7+E+u7tJGyGhPZ3uUhph4SrfVlIzElXma3uT97QYieLuug==
X-Received: by 2002:a65:554b:0:b0:3fc:159c:823e with SMTP id
 t11-20020a65554b000000b003fc159c823emr1061586pgr.33.1655150099974; 
 Mon, 13 Jun 2022 12:54:59 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 jf21-20020a170903269500b0015e8d4eb1d1sm5533018plb.27.2022.06.13.12.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:54:59 -0700 (PDT)
Message-ID: <8560d670-5f19-f5a3-50e1-965fc390caa3@linaro.org>
Date: Mon, 13 Jun 2022 12:54:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/11] bsd-user: Implement acct and sync
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-12-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/22 13:48, Warner Losh wrote:
> +static abi_long do_bsd_sync(void)
> +{
> +

Extra line, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

