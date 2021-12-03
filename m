Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F14673A9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:06:28 +0100 (CET)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4WR-0007ju-KD
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:06:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mt4Tl-00069D-Jj
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:03:41 -0500
Received: from [2a00:1450:4864:20::42d] (port=44994
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mt4Tk-000071-0D
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:03:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l16so4210621wrp.11
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 01:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1hHeRqCYFKsptslpicEqzcW+2wevuoxxQcOegRTYcDo=;
 b=ieFSUFOaPnPFAJ05YTeNiq8JiKZKrZ2UXFX6v18fBHc8npzSL5waHiepyvBuekFfsP
 ib4OX0PWd7OR+OzXyv2lf7U1NR2mVjzill93XJNSCkl+dqiSNCQj2j0Ok4VTvqI8tBOc
 IIK+Gd2AGS2oej4mHtAHyzbyFt7ytQ9x6n3jnUVqQmrzqb4i1Gg1lgT6l8JfNSoCfEf7
 ULAehDmMp4XnNHmE1YtSDyykiHWY41NJmwoATRDWbqnLOIvmBVG22JzH5Vec0qFncIaq
 mw3gZWCVihjeqZtngKkrzTHwWlVbbp9Zd9QbcM5sMZPrBmBDZx/K4Pumh60+45PhFWYy
 5qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1hHeRqCYFKsptslpicEqzcW+2wevuoxxQcOegRTYcDo=;
 b=2njGxYdDjSV0QV2b41xOmw7/Ji3px2FIOClrj9RsiYHfreCtV6fOJjrx7rtOcyn8u7
 2x+n7TBMocMS+OLkQyPUcjOGYye1Yyoocep95XJzHRKkd0vAi9m58aT9bRaEJnY5eaOb
 1N5ZUxtV4V4JSOvlqC6uSy6aEHjgIxDkSX+BILdrt54ZvyOeAkVo60K17E3JZn4XaVtW
 +OSRISRO9HY+79L3x08nXQod+C49dZOt8wf8Frc9jqDpAPDgqBuxRCbTKNlvYxXapVTn
 nrcYwzaXl5Tvk9rzOl7u4kyfgmA9XwjdVKUB4XurpQRbAsnrQxq16BVkq3pNbeEnhleV
 ZmTg==
X-Gm-Message-State: AOAM530JuhJDWrRC0i+TUP2ZvMZWK6mtTrEql/tnPunuajcYzM/sz4Hw
 Xj4FJB7upqys3v81BJtGkYyCP8E/6OLBBA==
X-Google-Smtp-Source: ABdhPJx4vJm3nk/Eo+JHzBP32bcNqdS4S4/hfpk37fVOYsrpl4A9WwImdqHZXRrkVU/rOyvRJsYLWw==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr19935821wrr.365.1638522218664; 
 Fri, 03 Dec 2021 01:03:38 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id l5sm2623017wrs.59.2021.12.03.01.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 01:03:38 -0800 (PST)
Message-ID: <719c1c47-06aa-d1a7-5b52-7d4b2999bc1b@amsat.org>
Date: Fri, 3 Dec 2021 10:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 05/15] target/m68k: Remove retaddr in m68k_interrupt_all
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211202204900.50973-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 21:48, Richard Henderson wrote:
> The only value this variable holds is now env->pc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/op_helper.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

