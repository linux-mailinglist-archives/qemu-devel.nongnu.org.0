Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4194CC041
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:47:58 +0100 (CET)
Received: from localhost ([::1]:35728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmkH-0005Nk-FO
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmhM-0004ND-RU
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:44:57 -0500
Received: from [2607:f8b0:4864:20::1029] (port=50899
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmhL-0004cU-CN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:44:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m22so4780018pja.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yr9x8V2calkDwnehTbsBBQiYKMtitPQymogBZX49Ugo=;
 b=lYQWYQK6PSGEmJvzqojy2brOJubS7qEgdo95mICnCIa2qng7oojot/B16wSPe2ur0o
 gw2bsDlfCD6l69pqHFwOEqo45JHyEDuNn1fu/9hu2OEr5s0u9PXkE8jq+Cs/4C2mmq7Z
 LpzDmBEbcuIFyTc4x/drRpwSMy5mC8V8VjrSpS9yBMHOt9vOn2I3txCAkaIINsnLXkvV
 5cIKRk1Ap9j8Vjl+mWzjhJ1gR8xNoarAIeY87Nm9DGw1M95shCtYJwgplV+H3aaGW0iA
 PCFmoocsN09aX68w8/GK57Y4hO20ks2+9AVfrl4Jqto+jjoFaCuCAuntQw6gUVNufDF1
 E8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yr9x8V2calkDwnehTbsBBQiYKMtitPQymogBZX49Ugo=;
 b=03RG5suEitl/rnwrMswy6GP4YHHyM56OcNtED4vParVTIW41Yd4Kj0S0hlddgrJwfQ
 kQAOuXLlHAho5jzALx2NB8NqKWCPcs5UyaE9Kyc4B2TDywFBVUK17lWsCzkrfgsRTqlr
 ZENvxjKPJNfJoi0S12pJqXf7F8JLq0U4U61MwIEsLnSINZC5LhYbszq/948v3HWxgbep
 0opU8Akq8eKN75t4NbHTS0berEjg1qdghPLRT/C4yJTM05IsyVn6Q/w2/GnBqeFLgdbc
 3rbjnxU6aavZQ5bjA/vu55k6nUJhCv+CVeMWzml6npv35YQp2k/klHsQ3oEAog2StqW2
 zv3A==
X-Gm-Message-State: AOAM5331I69PwylKWUZ/11s3wxXKI2swlJ3RlnJxgIdfdlxe7Aw+wUIg
 7lj7XFAcEfzV6AjlxPVAbLA=
X-Google-Smtp-Source: ABdhPJxrY7yzG9a83TFeOg0tU4Kiq3YIS95wnEoR1YYVBkNjKEitaW0pchpSAEMQKiQ9MXG17G/qog==
X-Received: by 2002:a17:902:7802:b0:150:baa:bc1a with SMTP id
 p2-20020a170902780200b001500baabc1amr36187874pll.110.1646318694142; 
 Thu, 03 Mar 2022 06:44:54 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2519771pjb.27.2022.03.03.06.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 06:44:53 -0800 (PST)
Message-ID: <abd92319-d751-3b62-a73b-674e12aab66c@gmail.com>
Date: Thu, 3 Mar 2022 15:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 09/14] none-machine: allow cold plugging sysbus devices
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-10-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-10-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:07, Damien Hedde wrote:
> Allow plugging any sysbus device on this machine (the sysbus
> devices still need to be 'user-creatable').
> 
> This commit is needed to use the 'none' machine as a base, and
> subsequently to dynamically populate it with sysbus devices using
> qapi commands.
> 
> Note that this only concern cold-plug: sysbus devices cann't be hot

"can not" is easier to understand for non-native / not good level of
English speakers IMHO.

> plugged because the sysbus bus does not support it.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   hw/core/null-machine.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

