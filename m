Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619AD4CD787
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:18:51 +0100 (CET)
Received: from localhost ([::1]:53844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9hi-0008Fx-Fb
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GN-0006O1-EY; Fri, 04 Mar 2022 09:50:35 -0500
Received: from [2a00:1450:4864:20::430] (port=47083
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQ9GL-0003oE-T1; Fri, 04 Mar 2022 09:50:35 -0500
Received: by mail-wr1-x430.google.com with SMTP id x15so13023993wru.13;
 Fri, 04 Mar 2022 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q5kGzbpYM0SoZse+km/zvjvymHQ7Ii9XWIsLly79tDs=;
 b=mWHjN9FA+hpPNsworOfND4L5yC9zV8vmfgWE4wSE2Tc9dU3UssRiWL2Ui71yTZZXwC
 VtY0Sx6BNk1nF5ImD3BKXYpMZTZv3iit72h6bdBQEOhJtw0ZWnXrCxpggrEUw2oxHhL1
 6h4CnPZmAaKwh8ZgcaXQLt6Y/HnUdNsOvASWgqtUmrPIvC1DONeGK6h2zxFjFXfF101J
 1BWIBoMzqUywzInecWjb2ykXRGMGykjios8T+mdKak0VMT36UVswfcOHapfZmj4vTsm4
 iKMVGbySZUsPI6E5JJWqyx4yR2q7NHQ07JtK6Xe+7Tvko+q3/yNjCIIeMvzUn3vk2q60
 WGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q5kGzbpYM0SoZse+km/zvjvymHQ7Ii9XWIsLly79tDs=;
 b=nyfMSbcGCjSJZxYHGOAGhBRIMK2e4GQM0mlcut5l3IdgTBHcT77DG4Swwr83sTwalI
 H3JJnj8soK5GAvjNDTGtxVwV//b5Hnb8enBdOMw4cxtaa+Ra7xWRckOc76gn7ZDfZpZW
 GixMJYbckVt/kXLClHEvG+4KCYz7aqGuRAEwL5zGJ4FeW7n0ZpLUsQdfOpSgOvUpNgbX
 bKEJ5KqC4L06ySw8AgF4kwOAXEppH3KNz7aeEAGKPZ93KBb9ky8F8l0WPZxoAm+FrUIp
 8lcFag6Py1LfeU/6UpT5GxRCV5pUAv2+I5WDejUzWzDuRy5Dng2PruExYxIiRkbNH8H3
 3teA==
X-Gm-Message-State: AOAM53353Nlh6Uq5x+6rA5wYz0XN1kTWJpeusbxxzFNlRxjWPMx2qbAF
 xTaHuyIhgmivyyvhJiGU9GA=
X-Google-Smtp-Source: ABdhPJwJ9b2rxvDShrpD2hQPMCIwT3Y6AkH0D55vfX4A8ZH2NgP/C8cwUvxw48h5FaCSo0yts79sjQ==
X-Received: by 2002:a05:6000:1866:b0:1ef:8a14:ab6a with SMTP id
 d6-20020a056000186600b001ef8a14ab6amr22347385wri.12.1646405432251; 
 Fri, 04 Mar 2022 06:50:32 -0800 (PST)
Received: from [192.168.88.252] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n8-20020adf8b08000000b001f046cc8891sm4752021wra.24.2022.03.04.06.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 06:50:31 -0800 (PST)
Message-ID: <ff763044-1e6a-18ea-02b9-9f7a7107bf43@gmail.com>
Date: Fri, 4 Mar 2022 15:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 6/9] util: Share qemu_try_memalign() implementation
 between POSIX and Windows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304112126.2261039-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:21, Peter Maydell wrote:
> The qemu_try_memalign() functions for POSIX and Windows used to be
> significantly different, but these days they are identical except for
> the actual allocation function called, and the POSIX version already
> has to have ifdeffery for different allocation functions.
> 
> Move to a single implementation in memalign.c, which uses the Windows
> _aligned_malloc if we detect that function in meson.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20220226180723.1706285-7-peter.maydell@linaro.org
> ---
>   meson.build        |  1 +
>   util/memalign.c    | 39 +++++++++++++++++++++++++++++++++++++++
>   util/oslib-posix.c | 29 -----------------------------
>   util/oslib-win32.c | 17 -----------------
>   4 files changed, 40 insertions(+), 46 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

