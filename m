Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEF460E49B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 17:34:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oniK3-00050q-93; Wed, 26 Oct 2022 11:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oniK0-00050O-6H
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 11:28:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oniJy-00054v-96
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 11:27:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h9so15870291wrt.0
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=llJSft3OmNHzZnv4t1YE9SRm/1h70y6NT8GRvYoGJow=;
 b=DXXw3Tp0gdtcsGD7j5KEqYQjrQMl9XU/szxqcDxj/mJCsRJlR63Dp6XvAF58xG0b25
 LEegnWV/QYmk0enwb7B3tJXm3fvRHg7xZLf2sRSzp2Y6D2Flwedp1wkzsT1uRK82AmAg
 0MLYV7/8WR19sYpAHA4+dqHKxWSucWz0MWgSk7b9+Y0XrXKNYqOAyIPz5TPiq8s/QZgf
 j3yIBd/Zuv8bbCCJ9+SmXwJnuVXBJxKi6RhAQ7ZuL9z3LPDn31dx+wihGaOl+h0z6uam
 YzvwLWo/SL8Kw3r4i9dWcO9+XYLwi+wuZRfThv0kznbkKWpq7PtyTeTuwnm/Es8jNXaF
 4nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=llJSft3OmNHzZnv4t1YE9SRm/1h70y6NT8GRvYoGJow=;
 b=S7PmLpEb/A1m9yylEiCDrxeY0s887ZS7ITc2rH1EZREUb9FWR7UlgJ0FSXdtBCVJ+C
 EW9Qdo31dZbruECUSvFCoz1A459DaedsgWqiLYCI3c6b/snJcg2x5eUxhDfU5hAUjNsO
 H/u5JsqJhnn+L2kpDUxXOtZw/Inm4l2upQPTgBLKBsW+eS+djW/pPsBiTEzqsZtnmEs/
 iCDpVlD1CqLXBYzqmbb9anBNQmAy9INR1T4why0YbdUIv6n4s7YGcZXYF9IJPkyJoOwK
 Q1XAuhrbAMwKGhvfrp9T+nk6Pd9ZvO+4CL66aCBIgSwy3pa/hQQW5QZypy4ZBiDNVOCC
 IN8w==
X-Gm-Message-State: ACrzQf03Elxz83VRIcHZXrJ7KzyYQRaZ5Ul0QYg7lyUdmAAVH07qZqKb
 rVRmQKTdJPXhbJVCKvua2EqzKQ==
X-Google-Smtp-Source: AMsMyM7Qnne7//uGT5L0X0uFGlQIdroIa0Ppb4INT7skrgxwWlSxGvnfXqLqL4cToYCKdYZ+rKalcg==
X-Received: by 2002:adf:fd87:0:b0:236:7ad7:d3c4 with SMTP id
 d7-20020adffd87000000b002367ad7d3c4mr8145028wrr.687.1666798076082; 
 Wed, 26 Oct 2022 08:27:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b00236576c8eddsm5413010wru.12.2022.10.26.08.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 08:27:55 -0700 (PDT)
Message-ID: <4dcf7da8-e1f2-6e44-db80-ab2f17341469@linaro.org>
Date: Wed, 26 Oct 2022 17:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 1/4] hw/i386/acpi-build: Remove unused struct
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221026133110.91828-1-shentey@gmail.com>
 <20221026133110.91828-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026133110.91828-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/22 15:31, Bernhard Beschow wrote:
> Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
> simplify PCI bus tree generation'.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 7 -------
>   1 file changed, 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


