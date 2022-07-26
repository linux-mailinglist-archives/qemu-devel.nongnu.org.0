Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD695581BAE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 23:33:14 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGSAz-000428-3t
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 17:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGS7m-0001dE-TE
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:29:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGS7i-00064e-D2
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:29:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o20-20020a17090aac1400b001f2da729979so228005pjq.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdtVyiry550dc1SE8B5NPw4yX89iIoWX9f+Ujw+S0Yo=;
 b=HZ/B0px9FLQbguQVze5GlBO2YjDAavJn+TKYOX7BznmZv7ViI+g/A+BkFXTegLlXh4
 a9fnSXJw8E44PCcMCx/ezhDt9BveBhwbLbl0AkgpucSUAV5ePd4zFkSZiIE0xUabP6wm
 2uMG2GHhcSRXpuqG1Zwzg2x0W+WnDcvRsqnycYBjIAY1jjL2/K+ztbdPD5nsWXooGuO+
 2AJ+/lZZB62z6YHncC4Ppbg3rNhuLPV5ceqZDr/h1OME5/6TAyAmd72gb9yW+tWpNJ8w
 plerpecZJKOYHqtge7BeFYuJTn7QPJ84CIZwRAYeLLpC+O0wK69qd5H1R3Ik5o/wqXti
 wXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdtVyiry550dc1SE8B5NPw4yX89iIoWX9f+Ujw+S0Yo=;
 b=mjYBhEcMsGvsO2d2HBLo+PFAZn4W5nN0vTVB7aHU/elWPI9N2ewaBOtFb8t8JYAWaE
 ZkhUAgN9UFHrIesETBvynbJYWKF7iB5HCkkngDkA2VGDGDNRNr4GMCAo7asEZXG5d2PC
 LxehZ+E8inv0WXdqBR+o4V1dA+pz+mot7f8r5pk8ZeRSZ5SKUUoIGX4/QO5+q4hE9b4w
 opxQBjcNwTjYItnYFa/J8+UgxCZYbzntCMuzk30xYtYbvlYYtjDHQR9vAVNPXRU8T7t8
 r7J/DxMhMw0Y2n4c/UGtLocGOu1K1dE5qXUy3XWE6iS3zIUNBNb2wDYoEn8gp+q9Ko6Q
 KArA==
X-Gm-Message-State: AJIora/kRTwH2vO+1Ize9BQtuqbzmZJDXtM/lWWtAHJvm3Kiwq1LkvPX
 gaHgUxjTHwyH6UEHDKgZ6m0=
X-Google-Smtp-Source: AGRyM1sN9Wr1BIDctP6h5rU6Rk541WxF6MOcAaU0yFt+dzyDRbFECCouT2OxbBVJlSP/IHrN6GoCXw==
X-Received: by 2002:a17:902:8b88:b0:16d:2a70:26d9 with SMTP id
 ay8-20020a1709028b8800b0016d2a7026d9mr18720456plb.84.1658870988456; 
 Tue, 26 Jul 2022 14:29:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 65-20020a621544000000b00528d880a32fsm12284319pfv.78.2022.07.26.14.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 14:29:47 -0700 (PDT)
Message-ID: <7ce4e714-57e1-30a1-9a16-4690c93f4031@amsat.org>
Date: Tue, 26 Jul 2022 23:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] pci: Sanity check mask argument to pci_set_*_by_mask()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
 <20220726163206.1780707-3-peter.maydell@linaro.org>
In-Reply-To: <20220726163206.1780707-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/7/22 18:32, Peter Maydell wrote:
> Coverity complains that in functions like pci_set_word_by_mask()
> we might end up shifting by more than 31 bits. This is true,
> but only if the caller passes in a zero mask. Help Coverity out
> by asserting that the mask argument is valid.
> 
> Fixes: CID 1487168
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Note that only 1 of these 4 functions is used, and that only
> in 2 places in the codebase. In both cases the mask argument
> is a compile-time constant.
> ---
>   include/hw/pci/pci.h | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


