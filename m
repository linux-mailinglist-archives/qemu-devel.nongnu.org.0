Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEAC5A6344
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:24:25 +0200 (CEST)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0I3-0005l4-85
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT09F-0006aH-Ax
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:15:17 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT09D-00082r-OZ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:15:17 -0400
Received: by mail-pl1-x633.google.com with SMTP id p18so10910810plr.8
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=3g5QStANU68qgNs/XR6eXxqEfg8hDtCsIC+xOuuYaic=;
 b=WJCUwoyIgCryyjg8mcY91k+rjbJ0NJQg9EqBOsYHlaYyDtE25ZsaXAKPhD6ecR1488
 cxb1LfG/xl/MemNqrgaNueV7TbKnN+IzkF6Rqqc6TK4EwvruPgufZ7Mt7WSkH19CAWci
 I8mWl+JfZ7kaM2An9GT2B4WUBe8c1qWSW8w9T0NRB6BzuUE4cHmwisb8ailJrQa279t/
 YZY3+9Go6OZca3zIRama5Q8+LNFGBb6ubYECWL6UU1Dus4ktwnfjMhKOLMDEuIQ37XVQ
 b08G2CF701sZygPpjjMJwhufo8k4/dNISHgiIqC+1rBBooLi6NdpVJEWEV3EI+jf8cNg
 Ehdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=3g5QStANU68qgNs/XR6eXxqEfg8hDtCsIC+xOuuYaic=;
 b=y8PhxnJ+ngxwlxQkp3m2u3swKsivVTGqf3ht/N23xdatKVwxZOLduoxkFmR/16ew6W
 hzpgkYrZn/UKmFbutt70ggPqdd4FtprxrRvfA1lRrUui+jvQPiBc9roy7v0cnCsjMy5V
 LBu0qhf4krW4NrtEArpK7st+ZWeD6jJZnMdsut1/1ng+bpiQUtJT4apYgAtVM9W4HcR7
 Sz8bONglDR2TsHpC1ZAgDp2cuccu2alR3gQ0bUMup2XcpsFljA/RcYhZbzlZRog8rJDc
 BwEDUPMHZKnxZM1mpEzSQXKFWTXjpvkBLYhEnBNSFJqNiQiWSHC/UNiMMwptRbpCdt4+
 qevQ==
X-Gm-Message-State: ACgBeo0/debSIN6X1X5sRn/7mApQd8wQPTBSFA9Ok6glXEi5w86LgYLE
 Hx4srQ7rV7H8JV3Nje0DUVeJ+G8BcCA=
X-Google-Smtp-Source: AA6agR6Uw0EFlgHxhNSluV54hKZsTD1sDp8iYCxpYH1mCF7d32w6Clw9KnIp3RSnGxUBOUFmj4Skww==
X-Received: by 2002:a17:902:a40f:b0:172:d0c7:ede1 with SMTP id
 p15-20020a170902a40f00b00172d0c7ede1mr21286710plq.88.1661861714283; 
 Tue, 30 Aug 2022 05:15:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g14-20020aa796ae000000b00528bd940390sm9240529pfk.153.2022.08.30.05.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:15:13 -0700 (PDT)
Message-ID: <39c79e52-7ea6-0bb2-b1dc-22dc32e8e565@amsat.org>
Date: Tue, 30 Aug 2022 14:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 6/7] configure: Check mkdir result directly, not via $?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
 <20220825150703.4074125-7-peter.maydell@linaro.org>
In-Reply-To: <20220825150703.4074125-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 25/8/22 17:07, Peter Maydell wrote:
> Shellcheck warns that we have one place where we run a command and
> then check if it failed using $?; this is better written to simply
> check the command in the 'if' statement directly.

It is also safer, in case someone add another command between the
two lines.

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 5c1992d5bce..f8d7270a60e 100755
> --- a/configure
> +++ b/configure
> @@ -67,8 +67,7 @@ fi
>   # it when configure exits.)
>   TMPDIR1="config-temp"
>   rm -rf "${TMPDIR1}"
> -mkdir -p "${TMPDIR1}"
> -if [ $? -ne 0 ]; then
> +if ! mkdir -p "${TMPDIR1}"; then
>       echo "ERROR: failed to create temporary directory"
>       exit 1
>   fi

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

