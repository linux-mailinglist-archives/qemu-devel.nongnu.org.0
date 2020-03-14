Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC4185696
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 00:34:54 +0100 (CET)
Received: from localhost ([::1]:49330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDGIv-0000Gt-7F
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 19:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGID-0008JI-9z
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 19:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGIC-0000Sq-Bm
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 19:34:09 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:50456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDGIC-0000QG-5Q
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 19:34:08 -0400
Received: by mail-pj1-x1042.google.com with SMTP id o23so241682pjp.0
 for <qemu-devel@nongnu.org>; Sat, 14 Mar 2020 16:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pDw4VV2ffMQG3yt5Zv/YbUVKu4oDT8jkTF9gh1DDSJA=;
 b=TZVdkgyM09OIVtrnDMIIOM37DdHjl5N2yLxmkVWDk557g/5cZd6V79lDUKO/4FMjZO
 UdY0mj0JMiPQWGAuOce5BItRIEtx2mnC/UdtvvstPOj2r5j06+b6xBL0BuZ5S4cHnqo4
 4kZhv6fXd+hJh5DWNtw2uz6ThIYRVUbqs5HvQjV+FzfukcZL4hiOjunPb9V+V/ZG3J97
 1X/bew/4eMxQ4QGpRAusGM39sdI5WckN1W5E2DHKWQZM1zSSaH4ZA3164o6eQKtrN1WT
 bX+7PbQcO6aPvRIywARTrkUMLIaoYiUxO5q8lSu6JezfUORs0gr8T5PFaoks9P/qT/Vp
 +DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pDw4VV2ffMQG3yt5Zv/YbUVKu4oDT8jkTF9gh1DDSJA=;
 b=DXw7fSpeHSK+jnxzjxTBb+it/EH8G7eW2DonUfbyONMtlF3brNGZMcSg6zNylpsj4Z
 zvip2oGKsgAQWNM8Dwqq5XkLy3/UF/ZPj8zhKXJfglcSaH/TJuReRRKsR5QC1UYd+jdD
 IAcdmJEmWR9vdRe/pWInnMAw3ZmYYKMw+KhMSz51s1LGHOU2hZElHTOazXVpFHfsMQz1
 tygNBWLzlzljTkwPByRpsccGzoTJh87YwytArJX+YenlkbVcPaSGDrwc8FmZ10FI87Gn
 38O+jfmHdUmHU4pqiATPziEZY7cgWXgXqKXpSy0BwUABbUn5qAQW1vpFAaLDUyRg62bA
 NfOg==
X-Gm-Message-State: ANhLgQ2dZewke2ZsWv4z/3/FyakK9AUyAsP3lTxr9pXY1HhY3+Y+cdaQ
 jDKGa9pXkLEEn7Rz1KimRBSfAg==
X-Google-Smtp-Source: ADFU+vunJQrMUv6vH3qc7rs3w/NwZbgHyO7w7i/2GPJBoGh+NdvoyEdrQOjLbNtaxLgJC0J8bDEg0A==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr17008019pjp.108.1584228846947; 
 Sat, 14 Mar 2020 16:34:06 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r64sm15647109pjb.15.2020.03.14.16.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:34:06 -0700 (PDT)
Subject: Re: [PATCH v5 45/60] target/riscv: vector wideing integer reduction
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-46-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5586a9a0-a068-d51a-4a2c-1a779d6b85cc@linaro.org>
Date: Sat, 14 Mar 2020 16:34:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-46-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  7 +++++++
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  4 ++++
>  target/riscv/vector_helper.c            | 11 +++++++++++
>  4 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


