Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188143066E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:59:41 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4sqi-0006nb-5k
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4so7-0004M9-Pm; Wed, 27 Jan 2021 16:57:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4so1-0004ei-Ly; Wed, 27 Jan 2021 16:56:58 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so3423159wro.11;
 Wed, 27 Jan 2021 13:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sOqH3ausLFrKn5ovRJAgVsa8REkaF6VtAspx+wVS2rA=;
 b=nVd3ba0z8GAeDqOfO33sTo3i2I5K/oYXVgu8BBxX2C1PkR+uW1U0A5F6z98vbsfVL8
 SAg1COmSNXFlJ6IKxMPGqFefnFuvUeHfMfz/f5RGVrrvC5yr1QjXRCAFqMZN4d6yVkYF
 xyW4nTREvkSIl+TzNBbISWBVXDJnbvPwTqWI7rBxtpx3u49Zn+QuqM399FXYQfFWTkPr
 A1q2EZgf0XrnY2pSCpHlGqice2fpm7OtRtx1nesi/RFdrWkPCH1JIvcn27in+S2yeZz+
 pi/YMiee7RPljgYOq+WxecbGWkl8LpXYvUpQLM+4J6Ehpd8Dtj0QVDlkA9QeSn5MtIT5
 KK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sOqH3ausLFrKn5ovRJAgVsa8REkaF6VtAspx+wVS2rA=;
 b=fKwkS9NmbL7WfSWCxqpvhyCTfvikZGlWkPEcl+Vg7Bf2YqWXmO1VK/RDZAO+Hcxw3Q
 z5pU7iDW/4Pr8F6a4/NZrOvpdVu5xKJNCMLoi0R16MTM6pl/FNe0C9eECTBMlDOK4eVw
 Yc8PRHhiWUblrAY+nJ7xvE/UZxi888aIcNltDclqAT8c+SAShwg31/DxKgVY4Q4gIoy0
 b/LpG+M06KkXSFXW/5U0pUzy+/R4O6zJTLsEi/cHsfYDFXF0vITq38CcjBxOyjhUmJWB
 Fe1YHNvdn/1tQQpA5VT3RLN3ok8uUdbxOjPkqTLFgEHAt08RXBIJYXK261AELkmNnbJY
 Kxag==
X-Gm-Message-State: AOAM533kBGW5sxQune4BfrLGvroefYh5uYTkv17tkdhwaoqM6LVDHBey
 k0tl07SnJl9URqzfWUN/1ipjDsDImBc=
X-Google-Smtp-Source: ABdhPJz0VyH3gljvUsHwTVkG7hpp58xfAizjxZqQMnzw7xfSK/KyIoF539aHHKWGx2L4Ung0xiV1ig==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr13572646wrw.145.1611784611650; 
 Wed, 27 Jan 2021 13:56:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z63sm3724567wme.8.2021.01.27.13.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 13:56:50 -0800 (PST)
Subject: Re: [PATCH 02/25] clock: Add new clock_has_source() function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1917a3bd-4b4c-e4f8-1c0e-9efef18d80f4@amsat.org>
Date: Wed, 27 Jan 2021 22:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:05 PM, Peter Maydell wrote:
> Add a function for checking whether a clock has a source.  This is
> useful for devices which have input clocks that must be wired up by
> the board as it allows them to fail in realize rather than ploughing
> on with a zero-period clock.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/clocks.rst | 16 ++++++++++++++++
>  include/hw/clock.h    | 15 +++++++++++++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

