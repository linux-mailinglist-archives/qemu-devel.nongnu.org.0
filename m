Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB14D8621
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:40:50 +0100 (CET)
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkwL-0000kc-As
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:40:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTknx-0007lq-1q; Mon, 14 Mar 2022 09:32:10 -0400
Received: from [2607:f8b0:4864:20::436] (port=33388
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTknv-0000hA-2Y; Mon, 14 Mar 2022 09:32:08 -0400
Received: by mail-pf1-x436.google.com with SMTP id s42so14424156pfg.0;
 Mon, 14 Mar 2022 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IYr3BnSh3HYPK5/1IEn/hV/ey+g51O8EYVhjFu3jJeI=;
 b=YmV60HICAZdZnOkB3sk+be/RAk1bqGAt08/klYbc/6Zk2aXkCKTHZ95Uhs+R74guj/
 Mk26V0m3DkC9XC6rCqbcALJUlPXH6ZJa36GlIW8r2uBjvMiD8rkm1Ih538TceHqWn95D
 LS3JnGemXoMP2xJ+51mGf+3zurRpH672NaFPHcm+zNrxn0dJHSCEXcD//UdeKsPKzJ/P
 8XyiSnpW/NVc4FgBwaAF7QOTyXIuujDZtRxaYyhuD+S2A7WG2GVFHhPEhL8IKkmBmqkL
 nEvW4QGP/TcxBHonkeQQ7d2GFfNLs+ro57I7bbvT5yPRfssSB0EoAeQwMb+NeY2pezu0
 aspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IYr3BnSh3HYPK5/1IEn/hV/ey+g51O8EYVhjFu3jJeI=;
 b=pbEAEF6MQvuUHrCGI1UX/tuFGSsan4o35Pc1N48hFKPijxYDhcnXBpOoHJu1CKq4g3
 QDwNe4h1dQGL59iC4ooapV25dsCrFb0zy6yiis9PnBdQbZ+5PB+j6ni9CViOEcMjKn2j
 xk5rKHSAWwlVb5gklPylNnQmD03jJxkIYS95KD+ohCifAe718SBzcsSww72fRKLQRVyD
 Iptu9VX0sGk1c/lkYtcE/YBB2xumzYaEo78kq3vTszZ5iSbWY7/56pEkrq86GWWPdU9i
 D7ScCSiz2yDt3ogSGkZL4FouCJ35+49hmKANOM8HvblqTkLEKtVgtukISz8/Gy18+Fw+
 oR0w==
X-Gm-Message-State: AOAM530+1gCa8ii344YwN8F/E9UqNkXqlwlJ4czobh+7R/GM+6o5n1kW
 Lc7zuTCwoiCCpVhODP8UjiGmIqlxJlU=
X-Google-Smtp-Source: ABdhPJzea0LtinKK4vdE6EbMSfCEy8GvrRZLf+8iqaE0qz0JnONhWBBSQ5bW3GvUE/hBNlwEzI3q/A==
X-Received: by 2002:a63:87c2:0:b0:380:9259:e10e with SMTP id
 i185-20020a6387c2000000b003809259e10emr19662469pge.521.1647264725525; 
 Mon, 14 Mar 2022 06:32:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a63aa06000000b00380c8bed5a6sm16576219pgf.46.2022.03.14.06.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:32:05 -0700 (PDT)
Message-ID: <3737c49c-188e-723d-9841-5c038ceae9e7@gmail.com>
Date: Mon, 14 Mar 2022 14:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH experiment 03/16] coroutine: small code cleanup in
 qemu_co_rwlock_wrlock
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314093203.1420404-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/3/22 10:31, Paolo Bonzini wrote:
> qemu_co_rwlock_wrlock stores the current coroutine in a loc variable,
> use it instead of calling qemu_coroutine_self() again.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/qemu-coroutine-lock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


