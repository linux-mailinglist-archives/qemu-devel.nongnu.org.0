Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E24A6AFB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:41:35 +0100 (CET)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF7SY-0004Yg-1N
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:41:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nF4L7-0004g5-Q5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:21:41 -0500
Received: from [2607:f8b0:4864:20::734] (port=43859
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nF4Kc-0007rt-40
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 20:21:14 -0500
Received: by mail-qk1-x734.google.com with SMTP id j24so14546826qkk.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 17:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjp+9gvCRInyqcWZwZdgHXM2p7hjeYZinfqSNto+nIE=;
 b=MX5VDaYGNOSfDSVfuKmJNVJrofJP6kWKqNLvfu5frMWOSVbW70KJo8ipsYJuoX56LN
 bnR1AqyQtJhihZHE0HQgQ5PDRssQONqHigwbVOceUyxXx34nNJjYKSLyeN6Bbqd7sTkk
 cquNAY0jnrFgX+dJ4Fm2Eqww6c50NCacxP3Z7XRlFxWUTK/jnhJuTmvwQpNEVPPs9OhO
 QdVr/Mur/iiDZCmMjPMZ9cudod+n+5O87589g2GRf0w/rY+ZP9qxOEhq0tuPyvymZ5c5
 q8n038pBAe8H3raZK6lsdbs1A52R/Z+99zArUTWlhk45AHOIsmmbJyHXYRXy8OnR3mpD
 o8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjp+9gvCRInyqcWZwZdgHXM2p7hjeYZinfqSNto+nIE=;
 b=iauFHmLuzNXBV6WsaZmdd7Rgk1ZDYAoV5jbGhD22aEB050lEjWC7OyOgLiaTGESyDZ
 6kz+vVrTSdYFHUT13AkLskE/DJxrl9LHJdkGim38lJ6SEm+1SVAG9mRWGjtS4trLPVW1
 q6i5jjyRHwNKjBJNFAgHPDU5TZza06aVskDvwouJU612UlXaNkO9RaDSMFtkq2m48Maj
 jpPVCBef798s0ki1px+fUJj0t/sZ2WuSUupxgBhJvgI2v0TZd+7rb85TTkqbsBU1zAbO
 usGjMF/kI8W7meG4B7y+xESazz5aEEm3XcvT2Dl8e1SX5WVJPm7zanBOytUwy7WaSJ5Q
 GGzA==
X-Gm-Message-State: AOAM532HnI/8WYpwbnZU8sstnQeaIe8G/LMKRPN7zOWYC04M1NZj4jE9
 t19ZjZI0NI9TSfBU7o9F7OE=
X-Google-Smtp-Source: ABdhPJxfdO1DuKnATH8wEmkiOvjCp2q9dzA9iRxaMn2IFWbdeOYWTh2zv4uuJQb7yKdCLEbfq1q/5Q==
X-Received: by 2002:a37:785:: with SMTP id 127mr19214875qkh.64.1643764869206; 
 Tue, 01 Feb 2022 17:21:09 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id bs8sm7960039qkb.103.2022.02.01.17.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 17:21:08 -0800 (PST)
Message-ID: <0da8a547-9347-2368-6777-ea7bfe02949d@amsat.org>
Date: Wed, 2 Feb 2022 02:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 17/25] tracing: remove TCG memory access tracing
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, fam@euphon.net,
 berrange@redhat.com, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Vilanova <vilanova@imperial.ac.uk>, Riku Voipio <riku.voipio@iki.fi>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
 <20220201182050.15087-18-alex.bennee@linaro.org>
In-Reply-To: <20220201182050.15087-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qk1-x734.google.com
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

On 1/2/22 19:20, Alex Bennée wrote:
> If you really want to trace all memory operations TCG plugins gives
> you a more flexible interface for doing so.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Cc: Luis Vilanova <vilanova@imperial.ac.uk>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> 

<crop>

> --
> v2
>    - dropped extra line
> 

</crop>

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220124201608.604599-15-alex.bennee@linaro.org>
> ---
>   accel/tcg/atomic_template.h   | 12 ------------
>   accel/tcg/cputlb.c            |  2 --
>   accel/tcg/user-exec.c         | 14 --------------
>   tcg/tcg-op.c                  |  5 -----
>   accel/tcg/atomic_common.c.inc | 20 --------------------
>   trace-events                  | 14 --------------
>   6 files changed, 67 deletions(-)

