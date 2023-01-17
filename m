Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D611066D6CF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 08:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHgII-0005Z9-SB; Tue, 17 Jan 2023 02:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHgI3-0005Yg-RD
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:21:51 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHgI1-00021I-SY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 02:21:51 -0500
Received: by mail-wr1-x430.google.com with SMTP id e3so20370187wru.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IYK/nQC07kIXJuVOxh4RJkITmazo+pChDR0p2flp/O4=;
 b=ecuKJ/XmVYYqvlJwSjcrMFqGGGT0Sv43bs2oPlN/IRlABuZn7yGA5rpllK+ctCj4GF
 GzMKSYZcFxC7bgOI1UoFecqosdJLkUUhmqdRMllqBR8Mc+vEuNgd0qAIqkq6gNihodjp
 C9amJbE6XPO/uo7KVLxjKBPHwpMYaihQGh5VKT0Unu4o9992meTjFaQvaAj0ymTZakg5
 CcdEia3M3n7k6C20Q4E//NpeiU3bu67Lz1Lzs0YbfyBd1YvnILWUP5A69jCsSP33GR+2
 drTFF3ot/MXUraeo/Pysnos1wvx8dpFKfQFrrh35b64eYICKfPfsrMfL6h7IccEosAuP
 +JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IYK/nQC07kIXJuVOxh4RJkITmazo+pChDR0p2flp/O4=;
 b=TmpzOOQjKJFDF0YIICsq5eeGND9cT/wEn/Y+wEZP+PCYwsvUcZQKHGluh9alhCaFtF
 1OENtwzLPs1EUHnsVq+R3cF2haiECaQVrCK5B/fTzh93ZzuJzXGumjc/kaURmpUgMirj
 3Nk7HQB+NvWclq9wAke+b173TVh3Q+s8j3UxRpWgPnJNmAnDXYJDhAvkKPmexW8jIoNp
 JM1KaSiMtjky92iZC6p6YzcVmqdzd6yR68TvDmWmZLzcWoEDAU/XDmQSvYuLYjOY8A1J
 boE0xAqMzh/ojEtroysZPDLnqCuOogBiw1YJM+MT3xXK4ezNJfvR7n0catkKlpH3NJV3
 k0Sw==
X-Gm-Message-State: AFqh2krJ5NHi7R+vCUTnWF/C61FSIsuAIByVyVBHfeDzs4hVzGAmFqDX
 f4odQs++xYIdXEmQjYqKFEeR5A==
X-Google-Smtp-Source: AMrXdXtya5E9OrsUD5TxtqQZQeWV+eHnIRbE2b/5udjNPjGFPTs3/yLwBE1Ac9wM2OY7GNL5I7FH1w==
X-Received: by 2002:adf:fc0f:0:b0:2bc:7ec3:8a8 with SMTP id
 i15-20020adffc0f000000b002bc7ec308a8mr1917902wrr.44.1673940107978; 
 Mon, 16 Jan 2023 23:21:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az35-20020a05600c602300b003dafb0c8dfbsm6889603wmb.14.2023.01.16.23.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 23:21:47 -0800 (PST)
Message-ID: <2dc89f14-d38b-2220-64ff-d3480d85057e@linaro.org>
Date: Tue, 17 Jan 2023 08:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/2] qtests/arm: add some mte tests
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Gavin Shan <gshan@redhat.com>
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-3-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111161317.52250-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 11/1/23 17:13, Cornelia Huck wrote:
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


