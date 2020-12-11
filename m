Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2572E2D804D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:59:47 +0100 (CET)
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knpVx-0005TN-9B
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knpRa-0003sg-Hm
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1knpRW-0008Qu-FX
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607720108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ8IJxoeH0LgL9jE63eFyfZZD5jfKxkEFxQgAWg5w40=;
 b=KNzWocEYCSPi2267SPYQ8qfJh3hGfg5yYGibSHuX91G9NCWPW7QdVQbGBAthvkQQVaiXd/
 7Gkvi91+TMy+6oYOffDDyB68QabG7bWDzzcPJb4/SVLMn3SK4nBhPJuEgMbGMXRu0UGRjs
 kapX4N21QqUB+P3bVTeKLJfF0+5n484=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-_LCxaQpTOR2GA3wFyIHhJA-1; Fri, 11 Dec 2020 15:55:07 -0500
X-MC-Unique: _LCxaQpTOR2GA3wFyIHhJA-1
Received: by mail-wr1-f69.google.com with SMTP id v1so3777821wri.16
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 12:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tZ8IJxoeH0LgL9jE63eFyfZZD5jfKxkEFxQgAWg5w40=;
 b=aslRV3rkuWneEPQmxDFbbML1BQccw34xSgVxKqCXCklzYuzdHm91Z+px6KwdMvCQIT
 97rsDJ/9wfItYJt+Cg85jEaWOgWa+ZWALKPuqQgh4FVjAxvP/Bi+9aOhlveDDQbMuW7D
 PsUV5bVTyLTUA1f2OrpGk0mpGZmwrUTAs4hmQ7nUf2ETlvGF0F4DTWNh/u9RiBZELzSu
 K+I8em6Z7Pzfa+lBGZa/ly8+L7xFeX24+ogEDy6EEl2G6NKK/WDKfA6dvPPXH278Tr8n
 QHJhCPNApkdPKpPZK6nxzupzheICOlcy/Ctw62ZNFkXDpta6Tm2KWwuU13/8YBbzYCNK
 ietQ==
X-Gm-Message-State: AOAM531fFYIdaQAfkZoIMIsriR5ag+N51n1GlvhApiASAzeKUJzScS34
 tRW0CE5aEX01YYh4Lwnjjxy6nDee6lT8CEO2Ou1j1iIjEk17eMlRZl/Q1/0/hbGTeRemihzLLZL
 C1RHX/sseyPnVD38=
X-Received: by 2002:a1c:b082:: with SMTP id
 z124mr15087427wme.129.1607720105837; 
 Fri, 11 Dec 2020 12:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCYNwUD2Z1qqjpDGfLx/nbjql1PGqFLu4Qq13mxWI/pSoRdwS4m2I793YIGKp+SyC8BO1KkQ==
X-Received: by 2002:a1c:b082:: with SMTP id
 z124mr15087414wme.129.1607720105663; 
 Fri, 11 Dec 2020 12:55:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g184sm17454183wma.16.2020.12.11.12.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 12:55:04 -0800 (PST)
Subject: Re: [PATCH] icount: improve exec nocache usage
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a019bf2e-c20e-3465-42de-44a8271d5828@redhat.com>
Date: Fri, 11 Dec 2020 21:55:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/20 10:10, Pavel Dovgalyuk wrote:
> cpu-exec tries to execute TB without caching when current
> icount budget is over. But sometimes refilled budget is big
> enough to try executing cached blocks.
> This patch checks that instruction budget is big enough
> for next block execution instead of just running cpu_exec_nocache.
> It halves the number of calls of cpu_exec_nocache function
> during tested OS boot scenario.
> 
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> ---
>   accel/tcg/cpu-exec.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 58aea605d8..251b340fb9 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -685,7 +685,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>       insns_left = MIN(0xffff, cpu->icount_budget);
>       cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>       cpu->icount_extra = cpu->icount_budget - insns_left;
> -    if (!cpu->icount_extra) {
> +    if (!cpu->icount_extra && insns_left < tb->icount) {
>           /* Execute any remaining instructions, then let the main loop
>            * handle the next event.
>            */
> 

Queued, thanks.

Paolo


