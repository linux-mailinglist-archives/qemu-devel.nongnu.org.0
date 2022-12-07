Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD63645609
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 10:07:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2qOW-0001WG-PM; Wed, 07 Dec 2022 04:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2qOI-0001Sr-QB
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:07:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2qOE-0000xp-Kq
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 04:06:56 -0500
Received: by mail-wr1-x42e.google.com with SMTP id f18so27106296wrj.5
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h+3fSCiAP2V5BazDY7KX3tYn5iCzCVbykPTkAaEgqKI=;
 b=jJh3c2JFbAtLtKn+rStdsypOwMEPMt6f111wKlXc2434xKiVDyCCYovjaawUNQR+Is
 Onux4tjKTPdy0oeNlhdW1PIgpJXObkrLzfD2OSWMBNvY4/xXkNs3Z1zsIxviTFR7td/m
 SwFAm2Zen6NR0gdC252RSsc/Vb0VJjD/Cl4LBoWAlNSmsJR+DxRgdSjGwRIi6GKhvtkO
 YCz2AZsOfPMKRy44RKW8zHqlbW0KYGmJGG48drMV0VIPD8hBYl+9GUZ/Aof3LNZVGnb1
 sCIN/g4tWIbUMKBKCO3SN684hDYSxfXsKMqEaNkCKBQ69MGUrqXU+XRG2NeInZHkn8Oz
 3T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h+3fSCiAP2V5BazDY7KX3tYn5iCzCVbykPTkAaEgqKI=;
 b=dOd27X5ee1879eVEj4u1GW+tLMB3b/kTHIg4MFFFCD9W/KhJcgNuM6JLAeCDl+sOf4
 OdqmXDQ8cil02Z13df10zMeFxSPFos9OZUr5vx+YxPLkjHLNu7RcDen9Kju812Lw9aH5
 iv0alPGRFwoepOk7v0CugADqEorJaAn3dPz5VKUuQgJoihQoB4ubY1w5oIw1MaCFcZXm
 fudOYuRvTH+oc0MaZlRqRZgRXbCticB6GjZzpWghQlKugQEk2KYqeL5XK+2PveNS8FZN
 txAtR4jTfSLWyJEWimn6zT2zD+XcDcPTzLn5Vy39MA2aTW2yVV10SMwTc4TChr8LSaU8
 ljGw==
X-Gm-Message-State: ANoB5pne9yDRBR/7MG/KbLmaqtpiS1CjjmmKb7FwwqgeQrW/mimqjWK6
 6r+QJo8Nn7GnWfgTH9xPFx2hPw==
X-Google-Smtp-Source: AA0mqf4xbNm75QTt6yrYr+d/JsJbZtFP4rGaHenaDh/kEiL+zuetgNWtKiJHI/qEZe6XlyI1I0cxjA==
X-Received: by 2002:adf:fe0a:0:b0:242:30f5:a947 with SMTP id
 n10-20020adffe0a000000b0024230f5a947mr18711259wrr.597.1670404011643; 
 Wed, 07 Dec 2022 01:06:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u11-20020a5d6acb000000b00241c4bd6c09sm18673375wrw.33.2022.12.07.01.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 01:06:51 -0800 (PST)
Message-ID: <3abe6ca7-a0eb-f2cf-aef0-3f4b16478285@linaro.org>
Date: Wed, 7 Dec 2022 10:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] configure: Fix check-tcg not executing any tests
Content-Language: en-US
To: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>, qemu-devel@nongnu.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

Hi Mukilan,

On 7/12/22 09:23, Mukilan Thiyagarajan wrote:
> After configuring with --target-list=hexagon-linux-user
> running `make check-tcg` just prints the following:
> 
> ```
> make: Nothing to be done for 'check-tcg'
> ```
> 
> In the probe_target_compiler function, the 'break'
> command is used incorrectly. There are no lexically
> enclosing loops associated with that break command which
> is an unspecfied behaviour in the POSIX standard.
> 
> The dash shell implementation aborts the currently executing
> loop, in this case, causing the rest of the logic for the loop
> in line 2490 to be skipped, which means no Makefiles are
> generated for the tcg target tests.
> 
> Fixes: c3b570b5a9a24d25 (configure: don't enable
> cross compilers unless in target_list)

When posting a patch fixing an issue introduced by another one,
you'll get more feedback if Cc'ing the author/reviewers of such
patch.

Also Cc'ing the maintainers also help in having your patch picked
up :) See:

https://www.qemu.org/docs/master/devel/submitting-a-patch.html#cc-the-relevant-maintainer

I've Cc'ed the corresponding developers for you.

Regards,

Phil.

> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> ---
>   configure | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 26c7bc5154..7a804fb657 100755
> --- a/configure
> +++ b/configure
> @@ -1881,9 +1881,7 @@ probe_target_compiler() {
>     # We shall skip configuring the target compiler if the user didn't
>     # bother enabling an appropriate guest. This avoids building
>     # extraneous firmware images and tests.
> -  if test "${target_list#*$1}" != "$1"; then
> -      break;
> -  else
> +  if test "${target_list#*$1}" = "$1"; then
>         return 1
>     fi
>   


