Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB015546918
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:10:24 +0200 (CEST)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgHI-0006uG-03
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgEh-0004wq-DT
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:07:43 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgEc-0006TV-Pm
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:07:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id u2so24105340pfc.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ed6iYcw+zy42GQgWD4t4UzexjFBZsRCcS6YbcGO2JMQ=;
 b=aLhWPmCYpcw2XfG4S/BcrVjjlxghi/Bf6Afo0lxX6j1CC62ZCOYbHRL5yFQnoMtY0u
 68F+9erNGFSxYjJxx1ZjZ0tvTxL3TV5vAtD7Q97IEAiWd86S2ZpxRXwFIH1IRB8dCUDS
 FOq+0qWSav8k7IpjmZj7QLUtGiHNQvvjT5hVSKR2aAM7vLTmBYH4ia8JAZkYQrwYUAQd
 aJf60U1JMdxVVEEzA0zaky1HiDo4L+s79Nb+144lt8u4yZjCmUZ9/vc04FtS1EzKr/SW
 hVIAQFACCrRwb80hbxQOpltRMZi20jYwf6BXMlnvn73HnJ3Q7DAsxtbUIHnqgvdUpiQj
 IWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ed6iYcw+zy42GQgWD4t4UzexjFBZsRCcS6YbcGO2JMQ=;
 b=MfzsnfRKEBgcJl4StxKwsKowdEP6tjK5UNAap9WEK56tfgQg7RuexeVS4Z/WiH3pfR
 mC1U781Pj87TegIxdvljWJhVEmv6cXNOsuawPE4PlZrA+XK7fvYAGmVY6eFpHr90pB3P
 /OaHePfXI3nx048YkjyWBbdYm5UDJ/LTKKCxOD7j8L0BH0stalM6/J+0HqoXe/l6Vwvz
 Kb4DAOFUzjZwOsT3NgaHZt6eBzotrqFPNWUJa/PQb+g+7q/gA7YbtoMG+WSQvJCT53yU
 CTgWoGv+S+m/QXHCDl5iNTxKcHGN9/vbOd5/XL8R86Gcbtc90kYf9aDg2OhOyoIw5Oms
 ByJg==
X-Gm-Message-State: AOAM533Sihk6LF9NjYY1MpQWbriuTPABPNUF0IE4tpnO8YdZN1p+kStv
 sqYXGEHDVLHPYrXu87FgHZ1kWtoHrSk=
X-Google-Smtp-Source: ABdhPJwB79z97UxTygklbNj+nZPQCEWaIehZ0BXOM2NIR4XBQ8XzSqlekGNjU6JbSJV/foW1mLTvmw==
X-Received: by 2002:a62:8e11:0:b0:51c:445b:5ae6 with SMTP id
 k17-20020a628e11000000b0051c445b5ae6mr18906420pfe.48.1654873657556; 
 Fri, 10 Jun 2022 08:07:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k197-20020a636fce000000b003fe4836abdasm4884703pgc.1.2022.06.10.08.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:07:37 -0700 (PDT)
Message-ID: <67994cb2-5948-fa91-71b9-8f08f1e2085c@amsat.org>
Date: Fri, 10 Jun 2022 17:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 02/11] target/mips: Add UHI errno values
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-3-richard.henderson@linaro.org>
In-Reply-To: <20220608051945.802339-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 8/6/22 07:19, Richard Henderson wrote:
>  From the Unified Hosting Interface, MD01069 Reference Manual,
> version 1.1.6, 06 July 2015.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 40 ++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


