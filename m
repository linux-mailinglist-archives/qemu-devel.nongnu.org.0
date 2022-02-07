Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91884AC2F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:23:55 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5ru-0007K3-UY
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:23:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH5oi-0003bo-UQ; Mon, 07 Feb 2022 10:20:37 -0500
Received: from [2a00:1450:4864:20::434] (port=46979
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH5og-0007ou-Nw; Mon, 07 Feb 2022 10:20:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id r29so7473844wrr.13;
 Mon, 07 Feb 2022 07:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=icqAwlx/p0RCCy4cl6gq23RDkbEMrCQ3wCXsK60MWV0=;
 b=jxAr/8HRMEc0TeU/5zAeAO8He9Kvh9e4Y4wvbazqTSUAGvsQLtxP5lO6XHc6ZZZych
 h+kezNJKlJePBrtC1veY8Fz7PJOYd/SMK9l34q2OKzdbHtRHOdwbKtT2StWFpjlxMj+3
 RmBWBaBzMEJou8r69dFVV9jhm8/0urjrSE33Z46bXfr6i4pW3XphaSW6N3oSvu8v+459
 4J2L5UuuYxE9OL0tfgHQYq5cV17iK6/OAeKAnqGxa1iTyF+N9vG8p6ybgXr+5c2mlLTk
 RKHZCdsAhbVed/vwa6uCgdqGKitnfpyPJkQ/ecbG37HFak3+LONWJAPtXzUeCW7IWIJ8
 QNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=icqAwlx/p0RCCy4cl6gq23RDkbEMrCQ3wCXsK60MWV0=;
 b=uDtV6ZrzoNoN5MfOsIDY1O9fY9CJyhPWfUPEhS+w+aPigy5STrIRGpISuPxe5DdGyW
 0Oa/o1WxxdfRIjAoS+0uQizEPRnQQeaLDisPRYcejt3yFkF9caG0W+9kE8BxOyy4otx4
 pH9g1/bAgOhySOwyasycWphIXXJSHDTZi6hcTD3gFt5WXGHlHVSQS0LyZ+clJctyECiJ
 gVbOg6Kj35A2xTqLjh3D38QJwcPsFPchvsWbohleNl+LpThhz5noIvqj0NClgjewbEUK
 7i/E0Zjpwve4KowRVVTp02uHkPxuanUdaGs14xWPUVwBzXm5EsIO3+uEoJ8Wu3sCsMyS
 iCxQ==
X-Gm-Message-State: AOAM5311ESUsNvibzZSHZxXZDMPRDjWVrcCYxNU/oMVo5nCx6RUi3LRH
 k8dGAUWcgFKyUIEodFE0Tj4=
X-Google-Smtp-Source: ABdhPJy3+oZEg3BnPdDQxhhFTceVw2ORF+ti9Erkx58Hr5Aa/uuLGsFADiNfn0Jp2atkK64fjc2GwQ==
X-Received: by 2002:adf:f008:: with SMTP id j8mr10632005wro.131.1644247232542; 
 Mon, 07 Feb 2022 07:20:32 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t187sm2239344wma.22.2022.02.07.07.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 07:20:32 -0800 (PST)
Message-ID: <e427f465-81f4-8a2c-ddc5-602d891ad3fe@amsat.org>
Date: Mon, 7 Feb 2022 16:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] block/vvfat: Fix memleaks in vvfat_close()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20220207113716.31400-1-hreitz@redhat.com>
In-Reply-To: <20220207113716.31400-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/2/22 12:37, Hanna Reitz wrote:
> qcow_filename and used_clusters are allocated in enable_write_target(),
> but freed only in the error path of vvfat_open().  Free them in
> vvfat_close(), too.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   block/vvfat.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/block/vvfat.c b/block/vvfat.c
> index b2b58d93b8..811ba76e30 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -3213,6 +3213,8 @@ static void vvfat_close(BlockDriverState *bs)
>       array_free(&(s->directory));
>       array_free(&(s->mapping));
>       g_free(s->cluster_buffer);
> +    g_free(s->qcow_filename);
> +    g_free(s->used_clusters);

Previously posted / reviewed :)

https://lore.kernel.org/qemu-devel/20210430162519.271607-2-philmd@redhat.com/
https://lore.kernel.org/qemu-devel/20210430162519.271607-3-philmd@redhat.com/

