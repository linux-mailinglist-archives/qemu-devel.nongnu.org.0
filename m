Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8A6AF6CD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 21:38:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZe4K-0001di-VW; Tue, 07 Mar 2023 15:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe4I-0001ao-Hu
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:37:54 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZe4G-0004RD-OS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 15:37:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id j2so13395639wrh.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 12:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678221471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQCYV4Ql1Re39uGZ/jkhiRQWtiscq6iKZGb+ImDYu7Q=;
 b=KWkeUzhvfYMA0IXBKdhz57Nss4CzPLEwNf4tuFVZ95T5hfq1NdWkw4nq6MKzQ9jvQC
 +y3/O5DtuYWxTHewaDP5/1Zr3RSqo7U/xQskvHFEF1hbXVz5tdFqCy0pTtLvowEE5LO5
 fik9xWpLhHTPZdNsQam0SJa4K/4Dijr7PtizKFcM4QuJQV3z1Ck3Y8IFWh+f0p3sGSRb
 1GTokFVWieCehTFaKkpn2ngB5s+32wg2VKjv7WqtZ8hy86mJvjnRYdgRhn5zNLGPZuWY
 7Nd9oGXtuEyok/sJR7q669imzPJFWJS6Dexu/yOS5cf2dlDNdWa0yln0iZb4s1xrC6AV
 P+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678221471;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQCYV4Ql1Re39uGZ/jkhiRQWtiscq6iKZGb+ImDYu7Q=;
 b=tUq3vqeC5jVJFLyQyU+A6Uf5SbZmQPVimbmswAX4qqCW9B4btcEIlEd+xb8wStAPMe
 6XPdN4FjcyKMM5EzDl92uuOPwffWHAw4tyMuz1bbg9rox6klZOcnGX9n7Eg2aK21FhC9
 LqxR2l4ddkC5SAYOUIbCdi2kke3YOatZjYKiNYBB7ucN75q4sAqbQtxhtFMsUcbaTgYg
 R9p+9FNR5SewEHgH1NFc4YZ62PqWSw4tlGgAZJl69djDso+8+I+07ayY8DYUTJF9gKU3
 4JiBbSQXfNakGiP2K3LHb9SP9diqQUs7vGW9SuTgK94w1H4hZnkh1bT4qilWXHs+MsHa
 /iBQ==
X-Gm-Message-State: AO0yUKW8uZTEI+9Y1yQPJ5UafsUQeDZdGiQIG9LvmVg1NzIcVy1i8FfZ
 qSqjLHHtkTl0d0VciRarbGFBFg==
X-Google-Smtp-Source: AK7set9res6n7CfRECrhw/8riALDYGZa98bYlelzDf5UTBODH+1feJY9FGPHkYofNWceS+XsS5MySw==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id
 v9-20020a5d6789000000b002c8dc70ab13mr10482075wru.18.1678221471324; 
 Tue, 07 Mar 2023 12:37:51 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 p10-20020a5d68ca000000b002c59e001631sm13707173wrw.77.2023.03.07.12.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 12:37:50 -0800 (PST)
Message-ID: <4181d07d-8b70-ae9c-3926-300e0ae31897@linaro.org>
Date: Tue, 7 Mar 2023 21:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] block: convert bdrv_drain_all_begin() to
 AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-5-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301205801.2453491-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/3/23 21:57, Stefan Hajnoczi wrote:
> Since the AioContext argument was already NULL, AIO_WAIT_WHILE() was
> never going to unlock the AioContext. Therefore it is possible to
> replace AIO_WAIT_WHILE() with AIO_WAIT_WHILE_UNLOCKED().
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/io.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/io.c b/block/io.c
> index 8974d46941..db438c7657 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -520,7 +520,7 @@ void bdrv_drain_all_begin(void)
>       bdrv_drain_all_begin_nopoll();
>   
>       /* Now poll the in-flight requests */
> -    AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
> +    AIO_WAIT_WHILE_UNLOCKED(NULL, bdrv_drain_all_poll());
>   
>       while ((bs = bdrv_next_all_states(bs))) {
>           bdrv_drain_assert_idle(bs);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

