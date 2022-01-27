Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E251049DC45
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:11:45 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzse-0002bW-Vm
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzYu-00089N-Aw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:51:26 -0500
Received: from [2607:f8b0:4864:20::62b] (port=42509
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzYs-00005E-PV
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:51:19 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i1so1778680pla.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Pce3KNZVZv/3RqLSSTC/yV+ziF7PJ8fhXyBt8QNrUPQ=;
 b=ouK0R/Jye+USMY+dWOl3MJRYS+xVvT4c3/LLDiI3+mhGIahSWH29dMM9sZb66LJkcy
 x3EUVIdhbp2ZIzOS3qzd6zQZxmW7qDWi+wcRtAHUvSomYiLlLtKum836ED4jp/h4/pYM
 oYZCDc/hdxAiorb8+rDbatrdKlFhoVnEWHiDxms3ztkJfrPv3/gxehHDHYZ5KH4nLKfJ
 0JJX7BL5JXu7BO4xJhNL8luegeXi8isw0fhf+ito8Wo/dJN0C/PSQHGWdXdjzFRjN1Ga
 /KJ3TgE7s5NjiOON+Lp8lMhNEEwU5DvPVo0xavjw6Ugs8aIZCHuiOHwaxSL68AqY4rJQ
 xyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pce3KNZVZv/3RqLSSTC/yV+ziF7PJ8fhXyBt8QNrUPQ=;
 b=5K5rXQTOxDDfnZfKfkv0tgsOLu7ADpoDqD7R+OqoNtSrseXSREalXB/FYrfO4HoPdD
 WB6xnQcz2Hy4k8kI8tMswXp8zlaQHQcXJOuSLZ2yfr8BMcigFP+hO+rqv4JuIWsBVXfl
 MdD1hu3z0jNWjxGQRqhhZY6Q5z6QOsUUciREKcCt3wd96yzqchN3+8CIqI5j9imaGSL1
 s4TEmlzTDZhqG/bn9vHWtWd4hieHWW865V5aLKfj3zHlVnOVpjMG3U36A2yxEjHoQJ5k
 iHgY9OgxqVx6+802hcNQeEn1AdaP7pEh1KuPWlDu4F/d1ZhDzkmhwrEBdckPjxuspYa4
 mGVg==
X-Gm-Message-State: AOAM530g6ru1eeRvq6+wr1+MMlZjYzDPT5DLxZ1LvheNEoSpzME9/uEu
 8D3Jm/0d/zl9O1aNyD8MF5SjSQ==
X-Google-Smtp-Source: ABdhPJyu9V5EHbGndezacIIog2kxnKlkAXMlvdt9qd5snGHstZQf4gKRBbRWThFJL6vyI9A4/5KXhw==
X-Received: by 2002:a17:903:32cb:: with SMTP id
 i11mr2190657plr.68.1643269877430; 
 Wed, 26 Jan 2022 23:51:17 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id z27sm2283071pgk.78.2022.01.26.23.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:51:17 -0800 (PST)
Message-ID: <d2da9625-146a-1def-7354-db01a4c22a75@linaro.org>
Date: Thu, 27 Jan 2022 18:51:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 32/40] bsd-user/signal.c: handle_pending_signal
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-33-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-33-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Handle a queued signal.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h   |  7 ++++
>   bsd-user/signal.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 94 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

