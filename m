Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B166D054B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:51:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrje-00014f-NJ; Thu, 30 Mar 2023 08:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phrjc-000147-BF
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:50:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phrjZ-0004kS-Pz
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:50:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id h17so18941365wrt.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680180628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1p3iFLY6gCvaWCh9eCMcHAH/L+nIbjjvFrbxepMTOGM=;
 b=rt2MwtJ2vnUmf020Y+0Kn+D0JMtRC6pd/I3SCUCLj/7gNJ5wuhslqMbqWlbCxv3Pt9
 o4gfaUK2gaPm1N+Oq2ES1PRLIGdHk9ApIwOFa6DevlRCzVmkmDCX2D+MYPN/FoKbnnuj
 lEhkIkLhF/Mo4Ihe/NDk/4+rJLlKp0xQJ1Zmt9sFDc28TGP9pfWfO8OVhQSvWnIzpacd
 oJSVsAyz4zlVQCPHRlV8Hvu5tL4yykXQqzZG/ny9wZxAXoL5vIp8JjmV4Y3IQ2W6hIs7
 5jKWDKcOUra3Rn8sogsBKiyKybMw4cwSTjmBf7/5v1Sqox+io7IgHP6aBsfF98OhmVyi
 MWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1p3iFLY6gCvaWCh9eCMcHAH/L+nIbjjvFrbxepMTOGM=;
 b=WSemDqDAHtw6PFJmi3IdS0ckHu8gUlAD0eNog0L/mQ+Gk/6kZpXmdpanTqVPMs5kA4
 aLvXm4mMWVria6uscKvkHyZHgPFxxBnClgblXie/yUOg53HUW+mQWvdMZXy5qRRWAINt
 b3s1Fm9GM8cE7YoS5cyaJe/znXYyKews3UoyE4cS6U1TJ7IMDdtXjFUn4iGPFRlGRM8Y
 leoDpvRD3iCghzId/rFwIWaRpsnUikaRW1ZayCc9Y203MTsOKzDWh/z58lrE0in2RRCX
 xtFstMX8GFEYtToQUJdeIafARIQLO3LvCfAhm1Qf4l4nwv5lEDJgE/psThiHuxbRp3bt
 Uwkg==
X-Gm-Message-State: AAQBX9cIgjlvwa2RIS+X7d73mIpwgaVp9d9hfV7P7/I3AoyID1tpEsrc
 hAOnJCK+ydyErXJj4Foo8UzJLA==
X-Google-Smtp-Source: AKy350ZlHfvVjxaGKKm9AeMDApZwKmxranNfw2npntzzLxTC/1gmjSEpUOnw69kcHvMmHENqbsBSpA==
X-Received: by 2002:adf:fb0d:0:b0:2e5:17a4:7d65 with SMTP id
 c13-20020adffb0d000000b002e517a47d65mr812798wrr.39.1680180627889; 
 Thu, 30 Mar 2023 05:50:27 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s2-20020a5d5102000000b002c71b4d476asm32699987wrt.106.2023.03.30.05.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:50:27 -0700 (PDT)
Message-ID: <6bdaf1ec-3dcc-6e94-cdf2-8755c88bc4bd@linaro.org>
Date: Thu, 30 Mar 2023 14:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] vnc: avoid underflow when accessing user-provided address
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20230330124424.40610-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230330124424.40610-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 30/3/23 14:44, Paolo Bonzini wrote:
> If hostlen is zero, there is a possibility that addrstr[hostlen - 1]
> underflows and, if a closing bracked is there, hostlen - 2 is passed
> to g_strndup() on the next line.  If websocket==false then
> addrstr[0] would be a colon, but if websocket==true this could in
> principle happen.
> 
> Fix it by checking hostlen.
> 
> Reported by Coverity.

Also by Vladimir Sementsov-Ogievskiy few months ago:
https://lore.kernel.org/qemu-devel/20221206192334.65012-1-vsementsov@yandex-team.ru/

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   ui/vnc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index bbd8b6baaeca..9d8a24dd8a69 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3751,7 +3751,7 @@ static int vnc_display_get_address(const char *addrstr,
>   
>           addr->type = SOCKET_ADDRESS_TYPE_INET;
>           inet = &addr->u.inet;
> -        if (addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
> +        if (hostlen && addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
>               inet->host = g_strndup(addrstr + 1, hostlen - 2);
>           } else {
>               inet->host = g_strndup(addrstr, hostlen);


