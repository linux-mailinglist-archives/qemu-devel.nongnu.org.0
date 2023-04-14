Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D796E2666
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKyb-0000v2-CR; Fri, 14 Apr 2023 11:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKyZ-0000ur-L6
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:04:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKyY-0002nH-3R
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:04:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id r20so2028695wra.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681484671; x=1684076671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VTyp+9ZRx7dtp1gzXb64O9oV6/A1n5kXODb1JKcrHuY=;
 b=zacV33yMFEIi1ADJ7lsRGp624JS3Hr5YBJg7IN07gaz5kvTTWoxLTqryhp0//MB1tP
 neFsWTyP1RRgODq5poarT258lZdoVXElGxFPpH5yzVYu8wovUqzMdmF8WWlLQ5tALhog
 CuD0MhXXKMhVAQ5E97fY/Nlmv932kvzwsn9YBXShCQ6SMCI3o0ShnSZVMmIwBF9zEHW6
 Rb6bb5Ka+ieCUWlZO+t5fWs6BdATK3WcEczYjy5E8IpRJi63dE4ML6iYTBPn/GvBAQkT
 Pma6JNftO5eI0GKLU4s6g7W3jgLwlv8n4HwLxihuSJrTrdBoUqbwNxwGhpxVgcSv3GO1
 yPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681484671; x=1684076671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VTyp+9ZRx7dtp1gzXb64O9oV6/A1n5kXODb1JKcrHuY=;
 b=GtP2Ox/3an0ibBxOGpA3mjCyjZZfLEYQW0SVwkG3skTVKqvTrenveKo5yA5YbdUv8l
 AJ9llKFBPE72K9SkBXBIT65DJfxhoCAalRpThfg62pufgDfWbcYtfw2A8tz3ooFDmO8o
 yqpVbkvnVtFjZ7AI788aOhCNKT8V15ukQn1wFzkTH0afrnuSl+f0+YpEoYIyIHSlmQQQ
 +eRoauvNplcUcElxOJlrLehjAIgPqoSCTraAOl18Hk04p0YvxQBsQ8W2chEI1FpyVOcc
 VZw12CSPS9MqmV6Q4pwEnzwBFH1ASFfdV0KG7t6PA3C2IAocuakeR5+Wsf/+51rHK3wX
 2g5Q==
X-Gm-Message-State: AAQBX9dBWBRm+Od04hG332igrfbjfBRQSRIeTked6OlTQUMHxRD5H6go
 eCgICJ3Gdvsf8QbZCU36a1zI7w==
X-Google-Smtp-Source: AKy350Yi+3mcQl1hvuVQE0GkJoO/l3OUfYoz3WyJRgDf4HoyixdRluEnS0aNpfKYB1kOaEij1WS48w==
X-Received: by 2002:a05:6000:107:b0:2ef:ae9e:b191 with SMTP id
 o7-20020a056000010700b002efae9eb191mr4783021wrx.45.1681484670585; 
 Fri, 14 Apr 2023 08:04:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 m16-20020adffa10000000b002efb4f2d240sm3742266wrr.87.2023.04.14.08.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:04:30 -0700 (PDT)
Message-ID: <76efa3ab-048d-71ec-6982-5fca831ac08b@linaro.org>
Date: Fri, 14 Apr 2023 17:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 16/40] e1000e: Always log status after building rx metadata
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-17-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-17-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> Without this change, the status flags may not be traced e.g. if checksum
> offloading is disabled.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


