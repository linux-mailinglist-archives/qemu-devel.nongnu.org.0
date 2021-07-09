Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AC3C26A1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:07:49 +0200 (CEST)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1s6W-0001yy-Ab
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1s52-00005P-Cm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:06:16 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1s50-0004Pr-8s
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:06:16 -0400
Received: by mail-pf1-x433.google.com with SMTP id a127so8944970pfa.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwlG2rTNKOWsSLdqO7i+lCd/tdr2jIVWhpZ8b4LZXOY=;
 b=tyb2So3SxOC1T2tLhLCF7XiqA8Z5g4aZmIe6ZBLgW+oBzQgVWesK0ehYpsPr1GjuBK
 F881LskwHcY3SNFms1IlTj3L+215rilEy3w5LqKYjvnffxMK/UKmgsOvv28QP3aiM1nJ
 5gY+z03HAqHtGb/hQK6VnByEfIAWW4Db5r7hpDsCp5yVesotoDVwiow4lI0LiideOYsv
 Qz+Q3oJEC1KYJP74HQ2D36eF4yRmRUujH9TxzAp3kdZC0FmFrbC19mwz9KI1Hp/AumK5
 mKrh+xXbmKU4plkXWL1lWIrFsUUwbUOIiC0JXPn1m0Bnll60pMQspgSRUU5oR9rBsR9E
 RlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwlG2rTNKOWsSLdqO7i+lCd/tdr2jIVWhpZ8b4LZXOY=;
 b=l3JL1BRpHI+zbZIniz0hXjo7gqlI1J/gITqCD/6TktDJ9rrRZR0KE8uLU9v7yxVlJ2
 Od/v1rfHHx1XHXSIJazhUIvOg/vBKkwxfXVD3i7UoDaDeKPU4kAGIPFpZFYOnSFkQMW0
 kEQ6Ff7F3LXOvAg2qOY+JRyuGiiWTBueK7VBy5CWWcK/vGrwH/xgOyoVUnQjIH6D/59G
 v7XpjjuhiTeDs/24IpluhfBwLQ5C7SBLK9Vc9p58rNAQ4yLnAB1J697Ju3jlcKxJTxLN
 qH8fd0C2HnVdRdF3ljvkeRCes94thfAyOPOUEUiRLMay0jSX0llPPuRwx2hgklbCnmwV
 PrRQ==
X-Gm-Message-State: AOAM531WSob8DIp4t+xFD3NCH6ZXNtVMSdvkSpwAjvuHYq/hbpMVKAbR
 K1CE3fsMjwjl1lf/jY/KUinWMw==
X-Google-Smtp-Source: ABdhPJytqwgjg8HbskOevBu0HKJFGsKbE3D9CNMSiUvhc8NL+XCV/iGkfpK1hT3kUvgf4/+Ecsdjhw==
X-Received: by 2002:a65:6641:: with SMTP id z1mr38692726pgv.44.1625843172688; 
 Fri, 09 Jul 2021 08:06:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z12sm5801640pjd.39.2021.07.09.08.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:06:12 -0700 (PDT)
Subject: Re: [PATCH v3 30/40] configure: add an explicit static and plugins
 check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210709143005.1554-1-alex.bennee@linaro.org>
 <20210709143005.1554-31-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47224e4d-6116-222e-e302-68c3afa621f0@linaro.org>
Date: Fri, 9 Jul 2021 08:06:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709143005.1554-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 7:29 AM, Alex Bennée wrote:
> Moving this check earlier will make the later re-factor for enabling
> by default a bit neater.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 7f906be68d..25daabd0ff 100755
> --- a/configure
> +++ b/configure
> @@ -923,6 +923,7 @@ for opt do
>     ;;
>     --static)
>       static="yes"
> +    plugins="no"

This is wrong.  This means that

   --enable-plugins --static

will not error out.

With that line removed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

