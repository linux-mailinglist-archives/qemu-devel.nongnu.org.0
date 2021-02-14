Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E231B229
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 20:03:56 +0100 (CET)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMgU-0006DL-VX
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 14:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLyk-0003QS-FH
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:18:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLyg-0006Uh-Ep
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:18:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r5so992038wmp.1
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uDNgjlXd9CDG3W+/aZkjQylleIUFydjLlR29KEQMsNg=;
 b=gSxePNOw1dx0zuYHotIYTcWg75WF9mj68it+TxCdxshFVFwkmIi92UkuGzjybn0oZj
 PiFeRFvxwyHgoTg9k+nkbzRHKyafu0xLO+TUdokr/BLxBi2WAAhrimzC3AOaNQe/ORw9
 HLzQdfEr/VisWTAjONDmP/5nQ2WHkZGop7+x6l6xkvUJ3gPEycGe9XSHKn0WJg0Fh/em
 VM1YDa7ULm3aNIhIMfuvWLM43F39oKqgrGrt/85+R+hhHFIi6hzgNgZcZWaoJ2vjEz7A
 mzk+F4eCYgVbizb9m7DBh4BVFVCZrdxxQMxx6+1aQc99pL/7OieJHfHVtL/YiUGLkI/W
 2NIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uDNgjlXd9CDG3W+/aZkjQylleIUFydjLlR29KEQMsNg=;
 b=AUAhTAbahg6tbGH2b5iRsDgOl5k5zv0jMyLF9/7n0Q0FL/fGQ7qLJ0HR8oAPR84GJd
 VVajr75C9wXWn/BELtrGndaX5+ChzX1pnGP2SG+C5g+/n2emffLLVnHcZ97TmqiFRAGQ
 fuGJqdNH9VB3CBat0qycVLyoRGI2L5TemyZifCiQluqRlZx7Ba37uM8yVJU89vc+QLFV
 HkDF5k3M0MjSbTb1j2AjYgntzoTouMIXBYILxGaSSFg2b4jL2TR7vriNWjZQOCD3IQcj
 aU/kBSTogqC6KDj/oE8LG+D8bQsIug30ofzBEZPn0Gx+kQWC3v/mhUdtUplgyH+qpcpp
 Y65A==
X-Gm-Message-State: AOAM531gAHYrfhygckg1bAuRuldmj+KX61VFPbV68HCrbrGKMfyBbEub
 Fyw4jB5sIPJDqO2MS/TLQKo=
X-Google-Smtp-Source: ABdhPJxvnXGX1QdGWPrCREPp5IRQvyWh+GZQQrR9NoelH8tKC22SFxujcE+gOmZSAIl2Pzu39XVnyQ==
X-Received: by 2002:a1c:3286:: with SMTP id
 y128mr11074838wmy.104.1613326717219; 
 Sun, 14 Feb 2021 10:18:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm24959717wry.90.2021.02.14.10.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:18:36 -0800 (PST)
Subject: Re: [RFC PATCH 03/15] qemu/int128: Rename int128_rshift, int128_lshift
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
 <20201021045149.1582203-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <44fef9a7-a619-bcd3-c8de-1179d9fb489e@amsat.org>
Date: Sun, 14 Feb 2021 19:18:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201021045149.1582203-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 6:51 AM, Richard Henderson wrote:
> Change these to sar/shl to emphasize the signed shift.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/int128.h   |  8 ++++----
>  softmmu/physmem.c       |  4 ++--
>  target/ppc/int_helper.c |  4 ++--
>  tests/test-int128.c     | 44 ++++++++++++++++++++---------------------
>  4 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

