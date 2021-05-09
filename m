Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416137760F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 11:39:53 +0200 (CEST)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lffuh-0007E4-VS
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 05:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsl-0004X2-Ei
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsk-0002Ck-5N
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id m9so13538706wrx.3
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p7aXcytDRT+Ln6FCgm7sqxy4tVdNMZN99Ev/wDOIsuc=;
 b=R7esiG2HMnASyua9bbkhNEWV/3NrIicJ3GV1d9b6chrw4xMhYqZBwkAmlWYRZZGADA
 l/P4CTYkxSEF6hzD6dgWlNuHpWXxTzwM1LVVDC4ElGSVM74DEMudGg2zbpwkaeRAEeYr
 s1c9U48S+5/hihcFunCoIWSjlowqZaQ61b7m7kgqLyX098hVm53TLQmHeegBFIdobW5g
 /AAkwgOELfonHX7FWk4fMnqC1wT1RiMsyr/+Za+BzvaHp3RAaH5jWLb/Rvb0XpCK2Wyg
 MD0CUGKUnr7w28nxe4XE9+gqZCXGYv5F5EBN6JTZ7Egup4N0MFzhfeuzhBy2Lt1hDHX3
 deNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p7aXcytDRT+Ln6FCgm7sqxy4tVdNMZN99Ev/wDOIsuc=;
 b=qqnjEyL70ouG57bc3X4S4Qh4Lo4mncUezmuGqnWnT4kDfr67IayiX0e3lisrOCF8jY
 dlS/WIrTU0l2MWm3Hz0qZq7X2wRdRbGlE+C5P+GlPvUr/LjMjuVYpJRRSclID8ZpsJqz
 YnOBUZVHikTODc0Da/K6EGzo8DTJfM3Ib8WLBOGHOu/TdgZLeMiG+cipURBYEIy9OB4k
 TFVVBVyxmrj5hOZfjtROmZ58JPAs9c4q2hlf768L5gWIB3IuVYHHCD7IUxSfVPaBaPUW
 awWyuyT9XKfebETjLEpujpgcSedGM4EGw5OcuZD6Pfg+NLKKnPQbUvRg4SkLsCp9dypv
 7R/Q==
X-Gm-Message-State: AOAM530OQJe7/zI4iKCc722m4cQIUBZrU294lWb+/x8kTAyRm14xbkZ9
 e8akym7D2F9NKCLedsfPccc=
X-Google-Smtp-Source: ABdhPJxTnPW0RfkZLsi67e/JatWZ5E7b2oHkVTomr1augV8d08QcUUdb51B1z7XJJh1PCKLQFl4IJA==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr23929154wri.74.1620553068984; 
 Sun, 09 May 2021 02:37:48 -0700 (PDT)
Received: from [192.168.43.238] (45.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.45])
 by smtp.gmail.com with ESMTPSA id o15sm17264442wru.42.2021.05.09.02.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 02:37:48 -0700 (PDT)
Subject: Re: [PATCH 15/72] softfloat: Rename FloatParts to FloatParts64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <456d87f3-2691-763e-5dad-31c744af5587@amsat.org>
Date: Sun, 9 May 2021 10:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 3:47 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c                | 362 ++++++++++++++++-----------------
>  fpu/softfloat-specialize.c.inc |   6 +-
>  2 files changed, 184 insertions(+), 184 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

