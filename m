Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3863B2B0FC0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:06:45 +0100 (CET)
Received: from localhost ([::1]:38446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJnn-00027e-NV
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdJlr-0001Oo-U0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:04:43 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdJlq-0006bL-7x
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:04:43 -0500
Received: by mail-pf1-x443.google.com with SMTP id z3so5670377pfb.10
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J+iQ/qX+E5AomkiI2PkzVSY1yE6MIvYipPNvO1GA16M=;
 b=mqaigA4uIiWNHgUKqD7YZbum1X6X7l2M3TmdDx5OCZU78auKL+wC1f0Kr7d3DdAh52
 vgZ2P/yHwoUYQ+/EaMrBw7nz5zCARGK+EOnURrVXpHNSx4uLOgd/vFoi6ffwk3wlwg8C
 8pk75NZhqbCVXbL1nRuum001IpZry8Wd468uCtuRjvohKG1GD20iNzF+bavOMEA1kC9T
 cyVBGipsFhqOPxmnmQVKoQM+s5c6OsrY1QxuVRA7LN2J1Fw8PbapdhKpM6xx7g+qvwFX
 yWvgJ3SPQ+fInIHr8B+8U6tC1QeiuMXWDkteOhKUtO0XhgniLSZa3l1YFB1aT2h1TKDM
 W1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J+iQ/qX+E5AomkiI2PkzVSY1yE6MIvYipPNvO1GA16M=;
 b=JcBXnZqByPVIR0oSiBDAasVg10W8oo02/jiqrKSFyr1shZ8Qy7X7H6CnGkG5pH+gMy
 Chkb38Pnmk7bXKZM7dtsNfLfWb94bZLGNjKJ0F8LZoHj8tbT68KEm6XWd+FCEHyy777j
 ODrAooPARaTu2Vzax/5HMidXchJT3frdWu5GeaZAuDE+/Zv8YVK4CK/3Kxl/uB/vTW/i
 kzN0PE2DbMo1CaDl2qyxBh9vB5o4ETQg2DQNChSrzixQ3+JM2fSO7LZRpvI/Bp0EP9lp
 vM3hPTstvcMlGiqYILQcUiyccy3OqySi2DVxKee602ilOvN0TPYQIN6eds0jhnHWJ4+E
 fa5w==
X-Gm-Message-State: AOAM531xXnRYYqBE6+pBUzZWxqkO+RtOHsMk+q/eQRs2v8e4pgy3Uw+7
 bcTHFPJ8n70PX9xf08ueB+a7ww==
X-Google-Smtp-Source: ABdhPJwXQzmrLnf+7wGk2f6Prs7nP8EvExCSisRbEsMU+E4ygW1wU5+AHN25mIKGjkeZ4y2Bn6X37g==
X-Received: by 2002:a17:90a:f492:: with SMTP id
 bx18mr1075061pjb.123.1605215080207; 
 Thu, 12 Nov 2020 13:04:40 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t5sm7701943pjq.7.2020.11.12.13.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 13:04:39 -0800 (PST)
Subject: Re: [PATCH for-5.2?] nbd: Silence Coverity false positive
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20201111163510.713855-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da36e556-bc7e-70f3-73c8-3dc0ea7c48e4@linaro.org>
Date: Thu, 12 Nov 2020 13:04:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111163510.713855-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 8:35 AM, Eric Blake wrote:
> -    if (!full) {
> -        /* last non dirty extent */
> -        nbd_extent_array_add(es, end - start, 0);
> +    if (!full && nbd_extent_array_add(es, end - start, 0) < 0) {
> +        /* last non dirty extent, nothing to do if array was already full */
>      }

Casting to (void) is another way to get rid of the warning.

I dunno which makes more sense here.  Definitely the comment is helpful.

r~

