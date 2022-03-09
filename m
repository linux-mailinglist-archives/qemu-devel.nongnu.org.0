Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA84D3024
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:42:49 +0100 (CET)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwaV-0006OA-KP
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRwY4-0005RR-VR; Wed, 09 Mar 2022 08:40:17 -0500
Received: from [2607:f8b0:4864:20::1034] (port=41786
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRwY1-0006us-SU; Wed, 09 Mar 2022 08:40:16 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso2375256pjb.0; 
 Wed, 09 Mar 2022 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=poONqa5TL3pNQ6a3n7fkvkkrkCPCSazH+pkr4glX5UI=;
 b=MFXCucypRp1G16XpzHWyewFeuQal5+TslsE6ZwDAb7iLwtI+D3xX6bl7xChIe6onYy
 LN+bMnpOz9eGkA1E5I0sFy4aX/K992RSc8DU9qfcyru3IexAbHLrnaRYO607PJkQKqLp
 i+meccG9F0gXGGf09PJKk6gr/08eeiK0YsJwiLbN/hi1UXeCkpK5/2PLGuRIF9d8cW8V
 +MZvPhHtOl+jSQeY+UgAqQw5ZVPEjBi+tyuXyzY+XHjKBS+RpoRWxw9OuwfsJLNkEfc7
 nOEmne6oDoBvwdos/a2o8nee4SkmWr8zNz1VNABXJX+aVkOwJN024tcMyox7qZAhK/DI
 22Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=poONqa5TL3pNQ6a3n7fkvkkrkCPCSazH+pkr4glX5UI=;
 b=cQ+MNhQKLWxtm4TZymIPse2rZ7ulL9PLnVJR7xWCU1HJeDML2z0cb4IXXAEz4vn9ac
 9qsvYGHAwsThj2WHQfz6r1AETHBICap3A0jVVKqKMSXly5sXKTCkui2/Cx/7M+RdT8BP
 DMNBe8RPOePd60eGss1G8ZIc8VVaZijAQZQAHTCgOENugsXUekzQOifPWgPKXkHzXHR7
 SdyyjQ4EqSknR6YlcBOW9/AnDcgMcXSoCYOrKhstf21nIzZ4b0LygMgfzeB7ezvtH/JF
 ABbCacDau2hn5UShzXK0CzxsF88A7tLsix3rpl3iSmYb3QP5D4gMNzuCX1xoZw83GfOc
 6+5Q==
X-Gm-Message-State: AOAM530e6CJqEcbUOIpQ6FSf3iuxtqGBltEWjn3zgg4W6wODkUayAizS
 H4a/Xfjw2czU2qpLNfH7N5M=
X-Google-Smtp-Source: ABdhPJxfjc6jISo2XqivAUWZkE0innIHNjWHpvSNeO5MCGNo5yAGaatU8gLMI+Qhj9o4Pb74Niq/ag==
X-Received: by 2002:a17:90a:67c3:b0:1bc:9cdf:1ee9 with SMTP id
 g3-20020a17090a67c300b001bc9cdf1ee9mr10376956pjm.203.1646833212021; 
 Wed, 09 Mar 2022 05:40:12 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 c34-20020a630d22000000b0034cb89e4695sm2473136pgl.28.2022.03.09.05.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:40:11 -0800 (PST)
Message-ID: <180a965e-69c6-c21c-ec42-f9784b654b01@gmail.com>
Date: Wed, 9 Mar 2022 14:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
 <f2898408-5082-7121-2496-fb296c48244d@gmail.com>
 <b05317e1-3659-2dce-4582-58bc6ca4a79b@redhat.com>
 <YiiehhaRPGWnM2Vn@redhat.com>
 <ae5f9f7d-e0b3-3d79-1fe1-d8dfdb1ba2b7@gmail.com>
 <YiilTXYgeORlVl96@redhat.com>
 <CAFEAcA85uL4gvUR9gJ7V7+KHYhE+40WjYHngxVyqusR8Xn6LBw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA85uL4gvUR9gJ7V7+KHYhE+40WjYHngxVyqusR8Xn6LBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/22 14:09, Peter Maydell wrote:
> On Wed, 9 Mar 2022 at 13:02, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Wed, Mar 09, 2022 at 01:50:34PM +0100, Philippe Mathieu-Daudé wrote:
>>> Not sure which job to choose yet. Per the first google hits we
>>> still want to cover Catalina first:
>>> https://www.statista.com/statistics/944559/worldwide-macos-version-market-share/
> 
> ...that page says that the figures for Catalina are "incorrectly
> high", so not a very useful set of data for these purposes I think.
> 
>> My general gut feeling is usually to prioritize testing older versions
>> as they tend to be more widely used, and we want to avoid regresions
>> on stuff that has been around the longest. Compatibility problems with
>> new releases tend to get reported by users/maintainers and would not
>> be regressions, but rather enhancements to support the new platform.
> 
> Note that technically speaking Catalina (10.15) has already fallen off
> the end of our support policy (which currently requires Big Sur (11)
> and Monterey (12) support, as the two most recent versions). My
> personal macos x86 laptop is still running Catalina, though,
> because Big Sur dropped support for that hardware :-/
> That suggests that maybe Big Sur would be what we should go for
> now if we have to pick just one for the CI.

OK. Since I'm running Monterey (12) on my workstation, I'll make this
job manual / nightly, and keep the Big Sur (11) on CI.

I'll let Daniel / Thomas / Alex decide which FreeBSD job to demote to
manual.

Regards,

Phil.

