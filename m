Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B34C7F23
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 01:23:51 +0100 (CET)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOqIw-0006RG-Nv
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 19:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAX-0006V2-Iv; Mon, 28 Feb 2022 19:15:11 -0500
Received: from [2a00:1450:4864:20::331] (port=53861
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOqAT-0005N4-Pn; Mon, 28 Feb 2022 19:15:08 -0500
Received: by mail-wm1-x331.google.com with SMTP id i20so6630560wmc.3;
 Mon, 28 Feb 2022 16:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FcqKiwl0BhG1xwClYDadQ6lNlX0G0NpVupZwY+O6jP4=;
 b=hNvMyjnlh29s24TIIhSPDArH+IQqjuSu15GzO4Oz56P2dmBHZy/TCcN3hvGyQ/+ipB
 p/J3TJ6nP0QrBb33S0VIdprb/kC+idEk3/Dcpx+fhVRVNEDtBu2ku+EsV+U0U6fHGuOy
 zdSueZhOLZGA2rwAi/ggYd5EbaAmjLaijtAPyBG73Nz2Czs7txsQYvgszwE+VAWJGbBJ
 FARzBy96y+gtrO2nCZmpQ2QnSoaM1v6NA6dGKdcAQQGNwQFvapezZ3jMtFLndItGs0SL
 J6cpmi26CtnDuG4dFITfG1XbP6xPCCYrtSNfYwKrojdtWHY2PXCwhGNuL+HbZkL7Emyq
 z12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FcqKiwl0BhG1xwClYDadQ6lNlX0G0NpVupZwY+O6jP4=;
 b=NcFDUdnjo4gZPVCEj1HzMVk9Wo0E+ABAa/KEHzo9vguNuxgjcGFMFoizbotKC6djMI
 RwI5Ka/e5uWHCZJTWswDt/cQC0lGL3bcqTVNVtsER/M6K/rUqBqEMQRTxb95CjWjNMCT
 QrvG8hykRjNo2SvU+TDZ/qn0uoJ4iJiRwpb0BTPofeDWvMPtnMKTxA1FswfUX1mCkfRe
 vLIOn1FvMZbAX6kDgo4lzrdBwglUxSmxSu7nnTciPUQ3OFxXXg9xirhLQNiShzxd1HRj
 PZCNSaCUPbl/Sgu/Dde0s/I87BQFUccMWlUXdL4mBScUn6EbsXxckUEXGG+vLGDtVWfH
 O8Rg==
X-Gm-Message-State: AOAM530HQ1dm6+P8+oE9BukOlhk40OHkECXKGGAIKkEU2T9qh0nd7KS4
 GGX7E4UtD1XgbjEuxaYlxTHLcX/mFlI=
X-Google-Smtp-Source: ABdhPJyN7HooOx5uqadliHWr3HxBG/6CFjUECVnn48EvopdC+xpg9/JL1lqjUDH7WeiaQy95qvQzmA==
X-Received: by 2002:a05:600c:21a:b0:381:6277:a64c with SMTP id
 26-20020a05600c021a00b003816277a64cmr6663799wmi.14.1646093703925; 
 Mon, 28 Feb 2022 16:15:03 -0800 (PST)
Received: from [192.168.131.175] (62.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.62]) by smtp.gmail.com with ESMTPSA id
 q17-20020adfc511000000b001edc0a8a8b6sm17655121wrf.0.2022.02.28.16.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:15:03 -0800 (PST)
Message-ID: <7aa57b39-bb8b-f65a-7432-4bf705b8d977@gmail.com>
Date: Tue, 1 Mar 2022 01:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220226180723.1706285-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/2/22 19:07, Peter Maydell wrote:
> qemu_oom_check() is a function which essentially says "if you pass me
> a NULL pointer then print a message then abort()".  On POSIX systems
> the message includes strerror(errno); on Windows it includes the
> GetLastError() error value printed as an integer.
> 
> Other than in the implementation of qemu_memalign(), we use this
> function only in hw/usb/redirect.c, for three checks:
> 
>   * on a call to usbredirparser_create()
>   * on a call to usberedirparser_serialize()
>   * on a call to malloc()
> 
> The usbredir library API functions make no guarantees that they will
> set errno on errors, let alone that they might set the
> Windows-specific GetLastError string.  malloc() is documented as
> setting errno, not GetLastError -- and in any case the only thing it
> might set errno to is ENOMEM.  So qemu_oom_check() isn't the right
> thing for any of these.  Replace them with straightforward
> error-checking code.  This will allow us to get rid of
> qemu_oom_check().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have left all of these errors as fatal, since that's what they
> were previously. Possibly somebody with a better understanding
> of the usbredir code might be able to make them theoretically
> non-fatal, but we make malloc failures generally fatal anyway.
> ---
>   hw/usb/redirect.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

