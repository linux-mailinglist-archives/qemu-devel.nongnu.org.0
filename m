Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56048EC15
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:59:14 +0100 (CET)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8O2r-0003zY-RK
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:59:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8NRS-0008Pp-RM; Fri, 14 Jan 2022 09:20:38 -0500
Received: from [2607:f8b0:4864:20::42b] (port=39783
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8NRM-00053f-OG; Fri, 14 Jan 2022 09:20:31 -0500
Received: by mail-pf1-x42b.google.com with SMTP id f144so2104645pfa.6;
 Fri, 14 Jan 2022 06:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YpRb1ij/CPG7glc/r0KtFgu4hhX8la49MIJBpNXRg5M=;
 b=ShSBUlDmxB4K5cxN1gPufipujwiUsgQd/VIoXKpXW5h0NcSC4W9Q+Gx2HefZcDrhWw
 JZ6mXl3KTAPHxTk8C5vbEvv5NDp9xHwOylbOIbUZn+0yHZz2/m73j79vKzh6yWKVKrsK
 lJQDy/85xCZWozhQA4NiU5Ru+VNW/5004xARmcwj8ulvajQkaXoN9vMPoXWNdu6Ew8Bc
 vuCBu93LNdx9PXDeBWyziC+rk7R6nPgu8pf5VCi69QTV7vXlo3ZMYqlBS2/Z97YEJdtx
 SrlgBi4tAnjGsj7bbU07dQfgd54UA/xUGdBwXR1DG8EIXKuRv/c0pTRk5RPn9LuxEYTB
 JIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YpRb1ij/CPG7glc/r0KtFgu4hhX8la49MIJBpNXRg5M=;
 b=hJTr9woYDLwErgiqLUQIXpaXmQ46K8lTo72lNsPwcaHESYkBh+a17HN+Xd94m8cj/J
 WW76tOGv3tfUmZYl46s9WyToLPCoLt2SHch+G4oMeVsdQYfeTRvDSRHdZ+KpA4UdKNJI
 jRVQA5BOXSNBFRf1U79iwGPSkePRw4K4qHwqalcNs3z47jIrNN47ZvsBdheByUL0niCh
 wU0TrWolRYzRtT08Z8ejJHLRHnDRDtPOge4gLwUsx3frXHPKtqvB66e3WMzn4MMFCTVX
 /yd+VuAddKJj4mCPUlyW2VBOaYSwsed7yOVtv15Ft8gETE5brYrHbCLpPd5kWlqfXBoB
 tNCQ==
X-Gm-Message-State: AOAM533FOtjqbBTbkWLqQjylElC6Ak4nPF1iz15cMVjcUtF/fCrkvB2q
 HJcWV7mzhm0etR2963QfKto=
X-Google-Smtp-Source: ABdhPJzsdi3CshSSLk74y+XYqkoZZ0kTlIHevvBGPKVx5ca6u4I094I2eAZC+atqAFJML4zpAePgLA==
X-Received: by 2002:a63:7407:: with SMTP id p7mr8300075pgc.14.1642170024482;
 Fri, 14 Jan 2022 06:20:24 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id e7sm5906191pfv.9.2022.01.14.06.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 06:20:24 -0800 (PST)
Message-ID: <5812053f-f930-e478-f561-4fafbd099471@amsat.org>
Date: Fri, 14 Jan 2022 15:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PULL 07/16] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
 <20220114135226.185407-8-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-8-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 14:52, Kevin Wolf wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> When building QEMU with --disable-vhost-user and using introspection,
> query-qmp-schema lists vhost-user-blk even though it's not actually
> available:
> 
>    { "execute": "query-qmp-schema" }
>    {
>        "return": [
>            ...
>            {
>                "name": "312",
>                "members": [
>                    {
>                        "name": "nbd"
>                    },
>                    {
>                        "name": "vhost-user-blk"
>                    }
>                ],
>                "meta-type": "enum",
>                "values": [
>                    "nbd",
>                    "vhost-user-blk"
>                ]
>            },
> 
> Restrict vhost-user-blk in BlockExportType when
> CONFIG_VHOST_USER_BLK_SERVER is disabled, so it
> doesn't end listed by query-qmp-schema.
> 
> Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220107105420.395011-4-f4bug@amsat.org>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qapi/block-export.json | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index c1b92ce1c1..f9ce79a974 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -277,7 +277,8 @@
>   # Since: 4.2
>   ##
>   { 'enum': 'BlockExportType',
> -  'data': [ 'nbd', 'vhost-user-blk',
> +  'data': [ 'nbd',
> +            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
>               { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }

Markus asked to split this line:
https://lore.kernel.org/qemu-devel/87zgny37s8.fsf@dusky.pond.sub.org/
I will add a cleanup patch, no need to cancel this PR for that ;)

