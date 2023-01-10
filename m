Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC46639D8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:23:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF8yd-0003pj-8Q; Tue, 10 Jan 2023 02:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF8ya-0003ln-BH
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:23:16 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF8yY-0004S9-EJ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:23:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so10716670wrz.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Du4mhjasHako5qwl7hv4ogJH4gnyXnB5dYi3UmU7zc0=;
 b=IJvahpBiPwCMLHvlpBUr26Y/EPp9q+WOdMVhVNnfqMWPmCkHUA0BUL13RIxoizavLk
 5SCro0CZcyp7AgXm5+OvVx73PPUSfAREL4lBwq4uT7UDeotza2uRs2mC5UXnQnRSvXgU
 uXcKjC67EUkzQKJhN+3H4pNyl2InAuIRFo+NH2y1VTnuWdIhoNaz7l3QbpoAl/gAZmsJ
 jS8L9E0eiWFpqQhgP3ibyfUtGRR3VKkhkXUoEWQDneHnKFBxp8lA44oJDcWhmTGV7ihn
 djoUd57UeC1wPW0q21eN6+bm1CzSxkP2UNMWSBmuRZFKAL79v8Fx6XjxlkksfYqmIdvq
 brbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Du4mhjasHako5qwl7hv4ogJH4gnyXnB5dYi3UmU7zc0=;
 b=R7ZLi9LoPQOuqTXOkpNwbMTNWdOi7Qhhk+4RjsZXzlArDUeOyRNHCRgDPEOq6IuIRV
 l0OnieKwTYXfePMp+fTfj4/RnAM1fv3rwCIsfyRCsIrSFKbXX6An9ugqKd3+rNQ2lVog
 xb1FGpJmAoMTtpCG/I5ilrLWEiJ0R8OsSmdBdMOjCHkRVIpGvqkgON0h/dufCtopwYhS
 nr1j0zvHlDFJlIS4KPhc3jgCQ362dPmpXE4pYOWB5ZASmjxOnooUUj+TEkbma879DcVQ
 0ZLH2HcUbCJx0iNe/SER70mmWQmJ3debgFfiwLkcstHemZYLpyyGXQDqdyRTuTWZsEGC
 uSmw==
X-Gm-Message-State: AFqh2ko19ReiuvpPgz25O96udOsaYyUeGwsvoa3pKu3C4VzVgmRP78LQ
 Iu3KIhxJVbiWdKfzVsASKJ07Qg==
X-Google-Smtp-Source: AMrXdXvw0NZq4JY4aAlnyi+6/V86iNhtiGxah7j93BMQLjzFB68BVmJoYP67DzoITuUEXX6UquYD4g==
X-Received: by 2002:a5d:6e08:0:b0:236:84b5:6658 with SMTP id
 h8-20020a5d6e08000000b0023684b56658mr42359382wrz.64.1673335392140; 
 Mon, 09 Jan 2023 23:23:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm10502707wrv.76.2023.01.09.23.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 23:23:11 -0800 (PST)
Message-ID: <b3efe230-8bda-cad4-112c-aab3ce9bf320@linaro.org>
Date: Tue, 10 Jan 2023 08:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 15/17] ui: Don't check for mode change after mouse_set
 error
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20230109190321.1056914-1-armbru@redhat.com>
 <20230109190321.1056914-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109190321.1056914-16-armbru@redhat.com>
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

On 9/1/23 20:03, Markus Armbruster wrote:
> hmp_mouse_set() doesn't bail out when it can't find a mouse.
> Harmless, since qemu_input_check_mode_change() should be a no-op then.
> Clean it up anyway.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   ui/input.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/ui/input.c b/ui/input.c
> index 8f4a87d1d7..d1c7605238 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -616,6 +616,7 @@ void hmp_mouse_set(Monitor *mon, const QDict *qdict)
>   
>       if (!found) {
>           error_report("Mouse at index '%d' not found", index);
> +        return;

Oops :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       }
>   
>       qemu_input_check_mode_change();


