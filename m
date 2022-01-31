Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6B4A53E9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 01:13:07 +0100 (CET)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgnC-000236-Ma
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 19:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgYj-0003NN-AI; Mon, 31 Jan 2022 18:58:09 -0500
Received: from [2607:f8b0:4864:20::62e] (port=33681
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgYh-0003Hr-St; Mon, 31 Jan 2022 18:58:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id k17so14023021plk.0;
 Mon, 31 Jan 2022 15:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Og5XYlvSKAysZ6wloxDeMWMu+3CfLlNTFb2IJGZ7mIY=;
 b=f7DuRPc4RIj7VOSNoeUJRIUBzQZkd0Z//bkNFej19WCIovqj/8+nrdUPpUdp/gDzNB
 kqNxW0+i9SH47UHwm+mAIT75snBDYqVQf1I5xuF37MhaTG9fOelRPRQwWg53ebIsO0+E
 YgSfItVW12ciuVqMXNDc6N768YDenPR+IaKfyGZvmtoHrifNdGNODqvUGOviUpq862xd
 b7u3XdEuLrc61kJozC53MvLgDfEfk6R9hecHJ3nivulp/CeoPeBFahj6zi6D8JPTHWk0
 n/YBf1iCJnnD7UdscmpC7zIvSOzg8KGwUhHUkElI3WwiAF1U9ZhRlhAEyeV+n3/q9fcX
 /Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Og5XYlvSKAysZ6wloxDeMWMu+3CfLlNTFb2IJGZ7mIY=;
 b=NG4kAPH13eaH+f7nf+0qmzGsRg5JWosVmoA21DomLckfOEti3wWPMprq7K/4SNzb8X
 XMPjECXN/qQp8F9AjoUHIiQz5B+FJDBRzdhqBj7lNJQRIyISua0JbMi4fKoClAPJnhg7
 uYsYG0ajBiAdoDNo1CWotgOQAA+x1EyKkr/F/PMiOOTp+xDyNaGtNw2k1AVXtt2BYjCy
 JeMF7vWe3XpVX5f33S+Vv/XN38b1o001t3WE1ibpXP6KZngmiM91QNukF8kmbik7Hvi1
 i3xWZK+f7yiK/HCXndHFxuf9qGkdaZtM0BYN5NFcWI+cnlNkM07WVejY3CeWaYLiLA3a
 RIXw==
X-Gm-Message-State: AOAM532cH3oXYL+zsKqv4uTcGeFmAcIEcC4/GIvgZWbc/Q2lUd48PwZS
 PQV5jJbNLfM3/Tk0Tl7ns0jzi1/4WXc=
X-Google-Smtp-Source: ABdhPJy+csxKA9NNc72x0wpyWyc39AUU/vVu6woB/8RjKGjJD26s9J3FqqJ+LyjnRdtpSXbFhCcb3g==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr17245516pjb.183.1643673486266; 
 Mon, 31 Jan 2022 15:58:06 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q19sm18884279pfn.159.2022.01.31.15.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:58:05 -0800 (PST)
Message-ID: <04efb0e6-9550-4ec6-df68-8deea2e60f26@amsat.org>
Date: Tue, 1 Feb 2022 00:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] block.h: remove outdated comment
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20220131125615.74612-1-eesposit@redhat.com>
In-Reply-To: <20220131125615.74612-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 31/1/22 13:56, Emanuele Giuseppe Esposito wrote:
> The comment "disk I/O throttling" doesn't make any sense at all
> any more. It was added in commit 0563e191516 to describe
> bdrv_io_limits_enable()/disable(), which were removed in commit
> 97148076, so the comment is just a forgotten leftover.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/block/block.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


