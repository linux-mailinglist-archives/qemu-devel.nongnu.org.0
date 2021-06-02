Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767283991FA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:54:16 +0200 (CEST)
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loV4J-0000jD-Ir
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loV2r-0006L3-22; Wed, 02 Jun 2021 13:52:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loV2p-0001m0-6K; Wed, 02 Jun 2021 13:52:44 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dg27so3904784edb.12;
 Wed, 02 Jun 2021 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z91/lUstfHfJB/OXs2S66wKXDOW5G7UA9KsSrmTjORY=;
 b=bp9KwO+aII7+FRDY0hE115XUhDVFy7OaYmt7YHWpcvpHH+Ii0+hR2HGY4u7NZC8XdN
 vrYChVx7lqrMBAkycpt8W7tlJtwJzIJeu5w2LUlR0F4Qo+NjQEFOuVfakWtCAMg6bA2I
 qF3z0rCIXW0Kj/ycnScFwTxhdHumdi/OaRiqRG9jyN5mx6nSVPiPM1XRYuScexu/AWcq
 2oaUf47K21gxnWC13QNyRbL2ONZj4b7HMdwj/keKY7P9yf60UWyum04Hhf5j73lHUj4D
 bsvgGR3ZO4yK9s5exLNeXI+YLQpTnhOipMQ0vCKcc3XnEOD+qikq8twscZaMBWMYC8tE
 b8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z91/lUstfHfJB/OXs2S66wKXDOW5G7UA9KsSrmTjORY=;
 b=jPPAQJvu5KyHbA/agrOriyVU1D3lGs62JCqFIWxWHEZ4slxLVWeIf+Fb4bhTZXtY4R
 N3oz104c6cWWicwRqyA8BaeD3G6Q+zI9/Wg/bvPts/QLsvr86M1hWNcCEALMt9ZQWGr1
 qx6cZjRiciUkywbpzoWSpxHhHuufY6LF7c3L36uy6Op+JCAmdwI16X/Ribb+1SILFUnk
 Jk2WjuG/6H8A+Ys6o2pkVm1wTs7MWqlZ1FLa82K8DH/E0PNnvF/9GHb+2FRfyjuXAoDt
 /FBhBA32OPHJ79e2SXWsFvFYmdMEHSTrfx8z3Yl+yLL1AgeBY7hsLzhRjvScLsi29q25
 sG/Q==
X-Gm-Message-State: AOAM530knvZZt6d+y5Nlp6T+MtcVVhzdUIRM4s1XPvICRsER4uN5y2BT
 zYm/GG2XO+WMHYSWe3wMReQ=
X-Google-Smtp-Source: ABdhPJwiV7QGmFOQZq4WrlxTtHsPpFtNZKQ+ucqhLH+U3NFlI21vgAs5Jg3/3mSYfZB+rKf6DG4UJQ==
X-Received: by 2002:a50:9fe5:: with SMTP id c92mr32414637edf.93.1622656360692; 
 Wed, 02 Jun 2021 10:52:40 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y5sm233184ejd.68.2021.06.02.10.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 10:52:39 -0700 (PDT)
Subject: Re: [PATCH 1/3] misc: Fix "havn't" typo
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210602170759.2500248-1-f4bug@amsat.org>
 <20210602170759.2500248-2-f4bug@amsat.org>
 <CP2PR80MB3668A422060CEA5B25ABE451DA3D9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6ff21611-5e47-7bc2-5477-fe5201386355@amsat.org>
Date: Wed, 2 Jun 2021 19:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668A422060CEA5B25ABE451DA3D9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG target" <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 7:25 PM, Luis Fernando Fujita Pires wrote:
> From: Philippe Mathieu-Daudé
>> Fix havn't -> haven't typo.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/usb/desc-msos.c         | 2 +-
>>  target/s390x/translate.c   | 6 ++++--
>>  tcg/tcg-op.c               | 2 +-
>>  tcg/arm/tcg-target.c.inc   | 6 ++++--
>>  tcg/sparc/tcg-target.c.inc | 6 ++++--
>>  5 files changed, 14 insertions(+), 8 deletions(-)
>> -    /* Validate that the "compressed" encoding we selected above is valid.
>> -       I.e. we havn't make two different original fields overlap.  */
>> +    /*
>> +     * Validate that the "compressed" encoding we selected above is valid.
>> +     * I.e. we haven't make two different original fields overlap.
>> +     */
> 
> haven't make -> haven't made?

Oops yes... Thanks!

> 
> Other than that,
> 
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

