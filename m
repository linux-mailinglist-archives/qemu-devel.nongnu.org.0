Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955F474383
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:31:45 +0100 (CET)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7uC-0006gL-76
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7dM-00007L-8X
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:14:20 -0500
Received: from [2a00:1450:4864:20::42d] (port=41738
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7dK-0001C8-T3
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:14:20 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a9so32303782wrr.8
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v5dhjnTtPZ66rG1RC+UMtkchROHS8Npi+HQ1uY2sYyw=;
 b=od3OPT58VTVzSNRF1P3yfMZNv8P4f+0a/EB9+It1mclMHsD2CRYcyLXIPPjmcy1NS+
 cSaJciHxmlXL3I0a1RNocgpA1iEteVgUAVGRyX8whHkqzGmuxypSSzaqSYrdbZUY71sf
 8IMz8mkXSIcjFjebsDuWrGPP/QLTadWsqESPdsGxZZmek7WuqXwWs1/RQLRsxFv/MfKn
 ovkh18i2rQcIwhV+w2vG/rH3zDl6m1wtVKRRm4PucncF2xZOSVRL2qDr69DNBpYbP46c
 qZu/MvHu9DnuGHTvKfS+L4Tn/nGD2JG9qC7CZWQErKuNlNifiwEtgrGvIgxIBBNNh44R
 aHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v5dhjnTtPZ66rG1RC+UMtkchROHS8Npi+HQ1uY2sYyw=;
 b=XbNy9BCSsWpzs6IkX3UcCD9B0HDcs78y8XzKDy1okTLCjTfsdr/alC0kHEwNFbJC2x
 fj/u5K3pxmOBHt0OG08U747Oho/vnlRzARk9d34wmMc/Q9TfdazqUYcw2Z8tujrjMFlh
 6L6z0AlFHJUO53jJlnzSjj8Usl/dz7dA4AEpmBqJTwfJEiD38g93x52Yg7bUYngKs+Ld
 LM26as/EjQwRFZWUnDvjBmyiAv+hT3Tx5j1eawuobNb0FXqWtSvHR5torefgJaO1lk5d
 fROQ3l4BzOrIo1mtF3R52/pz4J2fnaG6mCFVbGtLYkCKCPCFKtPFmObhFGCIBglcdVI4
 YrNQ==
X-Gm-Message-State: AOAM533Uu9VVWJ0E86PfYR+gAItddaEbonQ1qO5mhvF4wQ1pCtg4mOS+
 P6S0P1469t9Ky8179tBAGyA=
X-Google-Smtp-Source: ABdhPJwnNvU1xEBJqAIyHvczTHOPGCZEb739qneyvnC71APNadduDAAlKv309MQJm5Lh+79HC2bIfg==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr5723363wrw.621.1639487657684; 
 Tue, 14 Dec 2021 05:14:17 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d2sm2192913wmb.24.2021.12.14.05.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:14:17 -0800 (PST)
Message-ID: <fe8291e0-9932-8ddc-e4f8-4fb0f076a0e5@amsat.org>
Date: Tue, 14 Dec 2021 14:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 14/15] meson: Move linux_user_ss to linux-user/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
 <20211214002604.161983-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214002604.161983-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 01:26, Richard Henderson wrote:
> We have no need to reference linux_user_ss outside of linux-user.
> Go ahead and merge it directly into specific_ss.
> 
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build            | 3 ---
>  linux-user/meson.build | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

