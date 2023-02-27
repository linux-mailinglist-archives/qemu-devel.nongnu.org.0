Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A16A4136
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc3g-0002Ly-K2; Mon, 27 Feb 2023 06:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc3E-00020f-6d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:52:17 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc3C-000073-Jy
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:52:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso2006124wmo.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RafL2lV080cXKgzF6u9+TfA9oimcfRSOeXL0HMqqhRA=;
 b=bcCD7ZxF5WrzQrs+Uip/Mdfpvr5qB/d/avi5i4La3j1jCgXRI+STsjTKVRYFNiukJd
 tgW2l+8tUd9/wOjITNhDHlU/GL5sZFTXUZb1q4bQNgO9jps1+WSwnveNrJ8wv20duHLb
 scl2vIRozMbii6h2iym5aGCO1iP4cSSBFbidEl7F8byB4AphEd/E66cOwRMvdAgHec0f
 qBnUP4BNPTIaABo91H+7qJDFZggYsaoYazQ51sRpUkm5IzcreRDY5Gdrp4lpRZVXneUr
 zeyrr3+zLOwNyfMv2BIz/q9mVteNLc9Gn/nhjqvk0oMkciXVl5ZN73dn9StRFFz0H45x
 V6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RafL2lV080cXKgzF6u9+TfA9oimcfRSOeXL0HMqqhRA=;
 b=b04NR3/qTh0uahtmLYIvPKNJAoawAuBQ0m5CGp4Tn4dyyZBPljsoF9+rqm5ZhuLBPT
 3/tyDlV/DKXQat5hv8y12CAIss8Rm/GUHjwXV0IFKt/7T8Kto8A/2ipeULTPc2iPhs7J
 Tu3hTNtnw/6jJ38wofrvTciq+DPGvzHiNuYRaBjyyrA8VMsN0DLoe9uxRSjvMSwH6yqH
 aezyhy6JFdj+IZVwPgoYOdgr63YzlkA+VRG61XiAWed5C02A8+LPOptivawHL0RMSHLC
 CFiqsYlM/hYsfjOAG1AqlIJ80C6ikKHy8yl9h1MHSEhERs9nIoU6mWJoH2iA29+doz+A
 ydww==
X-Gm-Message-State: AO0yUKUZUmCwQkLk2P3mT3MQRZ6H31jPCJctRufckhOICajix8pcksoY
 Z/N1k+hO6cFllTE9VcKSXEhTeQ==
X-Google-Smtp-Source: AK7set+i4C8lU5/7WwDpcykcsTpcuhG5498XRKwAFqBNvLweEY0NUSmsaMp8u/SKz8Q1ia3EC93pjw==
X-Received: by 2002:a05:600c:44d3:b0:3da:fc30:bfc5 with SMTP id
 f19-20020a05600c44d300b003dafc30bfc5mr17864181wmo.13.1677498733073; 
 Mon, 27 Feb 2023 03:52:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003e204fdb160sm12434767wmb.3.2023.02.27.03.52.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:52:12 -0800 (PST)
Message-ID: <e1eacffc-5c12-e999-666d-8bae8a39f728@linaro.org>
Date: Mon, 27 Feb 2023 12:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 04/12] hw/i2c/smbus_ich9: Move ich9_smb_set_irq() in front
 of ich9_smbus_realize()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> This is a preparation for the next commit to make it cleaner.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i2c/smbus_ich9.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


