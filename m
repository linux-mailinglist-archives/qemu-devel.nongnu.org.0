Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6265A6346
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:26:18 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Jt-0008M9-VT
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT07W-0004Cp-2i
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:13:30 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT07U-0007Nq-IK
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:13:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id l3so10905968plb.10
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=azxX8DQotjUpRkIL701uWfK9BXbxrQr+NwSoJrP9yyQ=;
 b=m2eQDzoFquLlp3faKXFLGaSysbCJIKuywq2gcn1wMmA9OiOkHGVDpVcwbZINY39lMK
 2cNc8e6XGxhE+Ws0LitMyTAv6C9vwwgA9rtMqqtttEg1D9m6VbI13p1M4eqmIXCqyPUw
 4X9z2waupY4VOZ26tOIf1D+9RtWtvilgMQUBOP3/RVx5vVQA4/UYBUGRwv2TNZyJRqH/
 Cq3XQatzkGIDEIpuxLxvr9n9CK0EGShUY4aoTCPMttZdt2MbhAr0IImA5iPOkgE7Tw0a
 pIUlM1IeZx9CrJkp+dO9oHAo7ie/FnJLtn1UgFpKmJldQxIb02+sWLukT5OJ3fzS2JZb
 ipLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=azxX8DQotjUpRkIL701uWfK9BXbxrQr+NwSoJrP9yyQ=;
 b=nxFXAmdHLvamECmabmrgYvfudpb7NiTgwr+nuz0Emyr4Uq4YRkRJTihO8w2E4wkbrR
 Vf6144VT9E0lpn+1VyU+W76jQV6vwXEROLksk4mSNJTJwf0e6EKv4dBDxZMRTMjp4YP9
 VxfbnWl/CkgJTWdLyYmxkX03eLI1TZngvUo8MJ+ZAzUVDNeMgBrw6S/E/TNo/KAICRkU
 Dd1IojE7MkEJQRwrdVABmsLMzqK558tuApwfEP2l6NzANLuCWUsYEHJpSYqlG3nX3cJ/
 JHcChd7VgYj2wn7rlKF0dPS+qF6Xd5jFRIcJ9wUF6k8wG4CkXvOaDyj5i0pOlErCDC4f
 fl3w==
X-Gm-Message-State: ACgBeo2h0yK8XbvxZL12U9TdwPxhIgOGbMcfES2ROx7ley/JKO42HQvY
 kmNdOaNqYI28jPuRIUt58PtORvJoDfk=
X-Google-Smtp-Source: AA6agR4ib6I83OhNfnAMTeM3GAhz45coGrx5QdVY073NSgKIQq0cfm0IIi0qlUT0iUIHUMCN4u5LHw==
X-Received: by 2002:a17:90a:4801:b0:1fa:98ec:fa2 with SMTP id
 a1-20020a17090a480100b001fa98ec0fa2mr22717724pjh.41.1661861607097; 
 Tue, 30 Aug 2022 05:13:27 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a63c041000000b0041a67913d5bsm1491628pgi.71.2022.08.30.05.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:13:26 -0700 (PDT)
Message-ID: <1b56c62b-4a13-98f2-eb65-133f080c71b8@amsat.org>
Date: Tue, 30 Aug 2022 14:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 5/7] configure: Remove use of backtick `...` syntax
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
 <20220825150703.4074125-6-peter.maydell@linaro.org>
In-Reply-To: <20220825150703.4074125-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
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
> There's only one place in configure where we use `...` to execute a
> command and capture the result.  Switch to $() to match the rest of
> the script. This silences a shellcheck warning.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index d5b6546ae81..5c1992d5bce 100755
> --- a/configure
> +++ b/configure
> @@ -2317,7 +2317,7 @@ LINKS="$LINKS python"
>   LINKS="$LINKS contrib/plugins/Makefile "
>   for f in $LINKS ; do
>       if [ -e "$source_path/$f" ]; then
> -        mkdir -p `dirname ./$f`
> +        mkdir -p "$(dirname ./"$f")"

Nitpicking, easier to read as "$(dirname ./${f})"

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           symlink "$source_path/$f" "$f"
>       fi
>   done


