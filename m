Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60FF487D9C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:22:17 +0100 (CET)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tz0-0006o5-7a
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5ttq-0003cL-I0; Fri, 07 Jan 2022 13:23:38 -0500
Received: from [2a00:1450:4864:20::42d] (port=35348
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5tto-00015S-QW; Fri, 07 Jan 2022 13:23:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e9so11139012wra.2;
 Fri, 07 Jan 2022 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r/61UO2M8uKpBF9iK8crNZAzwXGD+NkoTW1VO8VeSwA=;
 b=lgwda55neFwHIIDXPsgBMDaBj1NSRJmM+HX28O74XTVoJ7A3cZFerrHIhwmAVf0aw9
 OukEGgaMzd6nnSDJz70JmFf23fjGDvoeg7RMzedRbWj1IWR/qZmo89d46d8yd2WlSGpf
 ZpprWqIsEPeK6Y/G3GYoUzqwSnYvZ1Z1e5FRqT6RFFVXMqVH13/TS7uYGmHBET7ghlQw
 PiV2NsE2NpZVzaB4AaPXhws4LaXd7uxNH9pl4ItP6zd+ZVONYVaNpkVogofNAswhwaho
 +5et4XMH6JejCgL1YX3Up9ODXZLuNIz9kPHWpoIZLK1ZAZ4/Xmq8HgzXqkRvdzBO6Cc3
 oYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r/61UO2M8uKpBF9iK8crNZAzwXGD+NkoTW1VO8VeSwA=;
 b=4jKVGGJ+uMW2IY0TBRi7G7hdlLA3MTakzxHC3F5mVYrWrfsYcLEnXA0hbnhfv6hjmM
 OrejZAnppy+DkRIr7gFvde5Y5sQ7jW/y/F4Yvw+UnNvaiQNu0tbdCBDGNNvWdwtm6J5H
 BTK7KvbHpCaHujQd7clkaKfoqxYHd+7dBMERa9WO7WqHxdnjHMQiVagbxb5+T7P5rI/G
 HVjWAebP43gab8RIrPxNbZvdJ1SKPPDSgVeDXgKUX5aAMAvi6JFTP0NhyVZBU1SM6qaL
 mqzUAO7DzGcq6uwk5iimHL5N2PFGCkFc6Krw2+16YQLGru83+MK8gTxDRJ/WIqZgJfd0
 7Y/Q==
X-Gm-Message-State: AOAM530N9T/Jfo2Hc0X7TQMhHPbwLg8gb+fw6uHvtflzBhCAGDVVnoo3
 EbreLNYjw1jiiVcPeune/+s=
X-Google-Smtp-Source: ABdhPJxMWpvvsmcrboZgzBX/OsC7h3vcPgI1GosrMTWp9GjSJWIFspHPO1L600Sa2XGeSbBHACTPkA==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr48785584wry.7.1641579814095; 
 Fri, 07 Jan 2022 10:23:34 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id h2sm5618187wmq.20.2022.01.07.10.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 10:23:33 -0800 (PST)
Message-ID: <63f40c85-4770-31c7-2903-687acb7bbd27@amsat.org>
Date: Fri, 7 Jan 2022 19:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20220107153019.504124-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220107153019.504124-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 16:30, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/simplebench/bench-example.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
> index 4864435f39..fc370691e0 100644
> --- a/scripts/simplebench/bench-example.py
> +++ b/scripts/simplebench/bench-example.py
> @@ -25,7 +25,7 @@
>  
>  def bench_func(env, case):
>      """ Handle one "cell" of benchmarking table. """
> -    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
> +    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
>                              case['source'], case['target'])
>  
>  

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


