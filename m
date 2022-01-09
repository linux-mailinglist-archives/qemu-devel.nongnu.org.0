Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A984889E4
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 15:32:03 +0100 (CET)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ZEo-0008Ph-TT
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 09:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6ZDB-0007bb-FL
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 09:30:22 -0500
Received: from [2a00:1450:4864:20::32a] (port=46761
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6ZD5-0000GR-K5
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 09:30:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d187-20020a1c1dc4000000b003474b4b7ebcso5116885wmd.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 06:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uzv3872ydLWOZ9Zxc52Monwq8vVW4ELAlEZmpTeza98=;
 b=Wz8h8WKXMTRNNPw4qp8vtDpA9xeowLlvDnikGQA9Cz30MB6As8t2s8lSK7ZzLISxrz
 5IqNKv441Nf3i8z5zqN4XD2pp5HVyUDPWgsUR2r9fUl0mjcizBOXI+4A8NVWewZ3boLA
 uCCZw7gYFUfy+eNqKYDLAAP9c0L3K1KSSPHHERWCiaoURkiL0/5eiAZRBbLZX36jB+kB
 FJR1q6//IDrhRwZG9dojM1j4IdCxNoTXCpCz7aq3PtEsbs1n6RcnGSnqAi/TVN+XmUTI
 P05IpovT9u3zIUGhvOvna56hLsxUA9QCrjz050yF53dVcVka/Hv+AB2wKlRPrkzjpztT
 GUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uzv3872ydLWOZ9Zxc52Monwq8vVW4ELAlEZmpTeza98=;
 b=g5N1STd/ODcnhoZfGRJh7m71M9QlEZySd2WmNegHTTu7kQRuRhpByeXsAyFVIQ+1d7
 4i6ym3SkqJ4xUhZiqRMt22yRZzwZm+5EIYvVIZB3Mt5gNF7Dskg2gBl0GTWv6W4tL0C+
 xC2Yp+G1MeF7oFDhVv1AaJPYygT0frS6LVijaUummzXsVkhlBasp2wQNA093qhFjpYZV
 VcHxSB3Ggd4/59YQiW4/cNJ57RYmqOEoN5mPbQs8SMScqOTtggUbR3qXx5VCju04ld2d
 HpGvlBU6NC/oCWTNBgI51Of0rnqsT3M7FoYY2T/E7DPllLIkJ05muQl0+cAhqXbzcw1z
 gvng==
X-Gm-Message-State: AOAM5307t6G5ZATRn0m6Ef7dinNYoV0uFCiAYu0KMsT4yX0EWrRe5nci
 +x12nMe6UkJn70z/t9xYGZ0=
X-Google-Smtp-Source: ABdhPJyIN5bhuJf8ElDBy+IhD/kD1cMalAjB5612Ivy7h/CBb5Y2+6q+mXa8qN+G46pFBL+7rQAxsA==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr18904071wmc.104.1641738612692; 
 Sun, 09 Jan 2022 06:30:12 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id m6sm4696795wrp.34.2022.01.09.06.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 06:30:12 -0800 (PST)
Message-ID: <9b2d7aa1-3105-f38a-69db-c0311f9b651f@amsat.org>
Date: Sun, 9 Jan 2022 15:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] Limit lockdown to qemu
Content-Language: en-US
To: Josh Soref <jsoref@gmail.com>, qemu-devel@nongnu.org
References: <20220109061708.21481-1-jsoref@gmail.com>
 <20220109061708.21481-3-jsoref@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220109061708.21481-3-jsoref@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/22 07:17, Josh Soref wrote:
> Signed-off-by: Josh Soref <jsoref@gmail.com>
> ---
>  .github/workflows/lockdown.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.yml
> index 37c6065..b924b25 100644
> --- a/.github/workflows/lockdown.yml
> +++ b/.github/workflows/lockdown.yml
> @@ -12,6 +12,7 @@ permissions:
>  jobs:
>    action:
>      runs-on: ubuntu-latest
> +    if: github.repository_owner == 'qemu'
>      steps:
>        - uses: dessant/repo-lockdown@v2
>          with:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

