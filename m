Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4D6FD85A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:36:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweMt-0003aI-Om; Wed, 10 May 2023 03:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweMr-0003Zl-8l
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:36:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweMp-0006yU-LQ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:36:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so45013985e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683704166; x=1686296166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0qM0llPArad651YICM5ASeoJ0/r6faNBI3Dmsyh9dDM=;
 b=RNgkzOU9GQXKPkEjRkzznRdjJopi+colU4Rjqaxao9XMFkC1yuMjBJaieuQPCDeoD+
 dhnkOtve7BsAto/U/DpegXV6+GUgDkFIJQr28ZAj3SRLT9L3G3yG0ojBu3NLBHJa4u+a
 MdYwZxrsDHqyGVClvYI0GQ/K7/vbOOao7wZGcb6jMy0zuvGv3iQWWebIBWS2xtWvCvW7
 coK7gqJqIp5i1HRVylh7njiD5myzUMe0YIiyHoccoAbtB0ZLxseyOfxNeTu3mtyBi+6E
 A5DIWCipwWEdoAyqWnQzkI6RzAsS4WtiuKsajwbhrIiGS4CcQ1+6zMgWE/HJJ/2YEr7F
 jflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704166; x=1686296166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qM0llPArad651YICM5ASeoJ0/r6faNBI3Dmsyh9dDM=;
 b=dj14Z3IEWkRdmr5h3k6Kz+52GQwQ9gjasXb43rS0PwSLAXbNx2n2ftwIaBZQLljExH
 Tgo4xQVWkf5nla8JN60qVyO0dlBVbOH/LYFTMRAMJj1wCFw64ojY+gMyPn3mT05qVmRG
 /lkrZLmaQ7/WLFF6HzFhTCzmOTO4dwGj0S4igb7RHJfBjcjMTnPr+ifqY6QtmVbKPk/S
 sNDD2rBGeKpZ2DHzGOtOmtsFpdiR5r3+od3qK4eAfBTKMFxiKRMSLarEp+2pL485yNKb
 Jp1TS41GY1r4tK0x9ZwTpaDEqWZ8zFsZghgpe+1zEae9SRxex2iUBs2BbpWhyQrLQtBd
 EjFA==
X-Gm-Message-State: AC+VfDw8RgW9HuHXuSUprfqRa98mbhuclfSjWZaXLdOXyRRYTySaECKO
 XnfJ3PNrzGcPRmyR3vsxJdXzNw==
X-Google-Smtp-Source: ACHHUZ4fm6R1aviQI5L57UeW8eIXk43j+Ih4jDZqyTf/NHgKAk9O88O6HVUZKzU5BdxqFQsTxyaDcw==
X-Received: by 2002:a1c:f616:0:b0:3f4:20ea:d778 with SMTP id
 w22-20020a1cf616000000b003f420ead778mr8811525wmc.37.1683704166348; 
 Wed, 10 May 2023 00:36:06 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a7bc058000000b003f173987ec2sm21991700wmc.22.2023.05.10.00.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:36:06 -0700 (PDT)
Message-ID: <ef3fb5d2-4d6e-9202-126f-4c8f7e2ad4c8@linaro.org>
Date: Wed, 10 May 2023 09:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 03/12] audio/pw: Pipewire->PipeWire case fix for
 user-visible text
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, dbassey@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230506163735.3481387-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/5/23 18:37, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> "PipeWire" is the correct case.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build                   |  2 +-
>   qapi/audio.json               | 12 ++++++------
>   audio/pwaudio.c               | 10 +++++-----
>   audio/trace-events            |  2 +-
>   meson_options.txt             |  2 +-
>   qemu-options.hx               |  4 ++--
>   scripts/meson-buildoptions.sh |  2 +-
>   7 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


