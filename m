Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D004D860A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:36:38 +0100 (CET)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTksH-0003Sl-Gm
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:36:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTkpR-0000up-DJ; Mon, 14 Mar 2022 09:33:41 -0400
Received: from [2607:f8b0:4864:20::531] (port=43787
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTkpN-0000s3-NU; Mon, 14 Mar 2022 09:33:41 -0400
Received: by mail-pg1-x531.google.com with SMTP id 27so13824890pgk.10;
 Mon, 14 Mar 2022 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X/46/WxBXd5r1PoLNkiqt2NeejRhSp6bCOG53ApccJU=;
 b=JtJjwPxTetZhe5+2eil35GvkIrdTuZPw2ZOPyl2fAi90MkPfCu87Z0/XYnQQQHNvlw
 gJcGpeEh8VyC8rPrBaU0dctHOzaoiHOUeYr221v4+lo7RDsHfgYOPMkRFwcncsraRZxl
 9Yy/MEaYCz6C79NBa9I24MUX5JEK0x2CawhPcp3JntwPyjqWag6hNyldzL/ysoeioKcS
 iinRo5j2ev9L/MhFodsDN+up90DAKdpZ3R12YgjcxKdJIPeYvBXwIyo+UiIa0ICNS4iV
 1hjqLlBO+KKKhTdP6Kv53zAwjSCFn9xh8SSmbV//LnCiI8jj5IWB+5A3mGUbibjRQCDl
 8+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X/46/WxBXd5r1PoLNkiqt2NeejRhSp6bCOG53ApccJU=;
 b=CagaGHSPcDOTb/cjfPde8pUz2h3h0+t+2PRizi7wt76QC/GMV67MfieYZ49n2ya3Zi
 3Rl2hFO7ToNsIKvXhaR7zxczY+zLyZ6XkAHpTPRnZEtvJhGr6Q7V1yCRUoX3hfb/nV0L
 DZWe0zFb1/cqASNUg9dStywSP8emg7YzmLsIpTqWraxYkt/3NN3CjVNRr0266tsyGDdD
 cAOGuG27lZrfoN+61g7JARd7/8bSBjiQsyXp9hfzxRsX6EIPm009yNgQoHRmuCcLLLXf
 SCUWzHAn0547v2JJZkXS/9waagzZso1tUfbqJrQcUJjbUlCOSPDsA5NtayJ6fJIIgEto
 zBKg==
X-Gm-Message-State: AOAM532kMuU7W/9Q74u4PnVaM+dFjI7M1IhUJy5dwGIaSojL836rkym+
 saD4VJ0J4cr5DUPUxyZGNodUMYL9Sjg=
X-Google-Smtp-Source: ABdhPJzhh1yDEN3lGE+Syxn555JRhz6Jnf8b/LBUCwbsxQWtSsP7+UDj+XCvJvnObnWyJnf3xXOwaA==
X-Received: by 2002:a63:28d:0:b0:365:8e16:5c19 with SMTP id
 135-20020a63028d000000b003658e165c19mr20352911pgc.579.1647264816086; 
 Mon, 14 Mar 2022 06:33:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm22250431pfc.111.2022.03.14.06.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:33:35 -0700 (PDT)
Message-ID: <4db1e2b9-819b-4a08-0f18-4d2f78ac1015@gmail.com>
Date: Mon, 14 Mar 2022 14:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH experiment 08/16] tracetool: add extern "C" around
 generated headers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-9-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314093203.1420404-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
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
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   scripts/tracetool/format/h.py | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
> index e94f0be7da..2d92fa8bd2 100644
> --- a/scripts/tracetool/format/h.py
> +++ b/scripts/tracetool/format/h.py
> @@ -27,6 +27,9 @@ def generate(events, backend, group):
>           '#define TRACE_%s_GENERATED_TRACERS_H' % group.upper(),
>           '',
>           '#include "%s"' % header,
> +        '#ifdef __cplusplus',
> +        'extern "C" {',
> +        '#endif'

Why not use G_BEGIN_DECLS?

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

