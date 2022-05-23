Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC24531D91
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:17:16 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFQR-00057g-8c
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntF52-0003JA-IX
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:55:11 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntF50-0006J4-RH
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:55:08 -0400
Received: by mail-pg1-x532.google.com with SMTP id a38so11802171pgl.9
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=LdsG1bXx3b+b+O8V5MkFuNZUtfdtFT54mP0ZfHqrwq0=;
 b=Z35ePqkVP4QZiWbC3MiXVZfj0galFPVst0bgcXVNVbvjjOdZ3zpsYuRlaH8qIm/laO
 kJwwqzBzs4Ltk3lHOWDTtUb0GkNYfGzo4wCEjy6R0SwEeYJPsz5TaHE2CHCLYvYFgxyR
 7j4o84zgCc/OWZUUknemb8Bpw37WTNJFb8YLgt8EP6+1rs1wsS3C9RFgTkPCtqa4pW2K
 S/3DorYneDBBKkE0nlMd3G43h31kD3sW+mS4R+VDBEb+FRbeDwpUKmoqUfLS+XTXHVu1
 lFiFxSXLhthw1nsa+LAKYPn7LeQrY9SVKc5hVXb0Ls0fvf1Fahka/iEbCptzFVElrQyO
 Tm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LdsG1bXx3b+b+O8V5MkFuNZUtfdtFT54mP0ZfHqrwq0=;
 b=w2U4/YI2FG+WIle8TbiS65vlEX1ZHzG9paC3e9FU4JpJeZRdv2o6mAZc4AEWmsdRjS
 bUnSLoaMmFqiTT30CT1tEdAX+s2Iavn6mAH6aI24KE+bPDPf/KXI7FfcKuUfXtWuGWCJ
 AKk7oNvSS8NLY4iWwJaehI7l/AmuAsrL5VR7o3Oza3BHjRGmSTZAjHMGw0Mona9EvHop
 BkZJS/xmPJyEzzrr+LzGwd2whYYrRWZpviK4DN+E3BDsQ6EH/B94ZkazBaWyIFhgn6s7
 xBv/98aojt5rDRse2m524YyqsgpTq2jIMseOXXQUN00K5gqlzkGRlLr9YvIrpge+W6t9
 K7Qg==
X-Gm-Message-State: AOAM531uJCVFNTomCX7bIn+vMZHL2enXyJdybKBGUUjM6QcTOUQ7H1bg
 62vbpph74IGptZklanVJ0i9TJw==
X-Google-Smtp-Source: ABdhPJwfpBvv4IBIu31ULSPL1y0tEOEBax6O63pXuJ2kbiSCHQbpjN8U1jw9RkhLsbVr/5wJvByorg==
X-Received: by 2002:a63:9dc7:0:b0:3f6:17f0:f310 with SMTP id
 i190-20020a639dc7000000b003f617f0f310mr21160379pgd.285.1653339304969; 
 Mon, 23 May 2022 13:55:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a17090a841300b001df4a0e9357sm139965pjn.12.2022.05.23.13.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 13:55:04 -0700 (PDT)
Message-ID: <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
Date: Mon, 23 May 2022 13:55:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220523194111.827805-3-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/22 12:41, Konstantin Kostiuk wrote:
> Bus type spaces (Indicates a storage spaces bus) is not
> supported, so return it as unknown.
> 
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> Message-Id: <20220520201401.706630-1-kkostiuk@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> ---
>   qga/commands-win32.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index dcdeb76a68..36f94c0f9c 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] = {
>   #if (_WIN32_WINNT >= 0x0601)
>       [BusTypeVirtual] = GUEST_DISK_BUS_TYPE_VIRTUAL,
>       [BusTypeFileBackedVirtual] = GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTUAL,
> +    /*
> +     * BusTypeSpaces currently is not suported
> +     */
> +    [BusTypeSpaces] = GUEST_DISK_BUS_TYPE_UNKNOWN,
> +    [BusTypeNvme] = GUEST_DISK_BUS_TYPE_NVME,
>   #endif
>   };
>   

Build fails:

../qga/commands-win32.c:496:6: error: 'BusTypeSpaces' undeclared here (not in a function); 
did you mean 'BusTypeSas'?
   496 |     [BusTypeSpaces] = GUEST_DISK_BUS_TYPE_UNKNOWN,
       |      ^~~~~~~~~~~~~
       |      BusTypeSas
../qga/commands-win32.c:496:6: error: array index in initializer not of integer type
../qga/commands-win32.c:496:6: note: (near initialization for 'win2qemu')
../qga/commands-win32.c:497:6: error: 'BusTypeNvme' undeclared here (not in a function); 
did you mean 'BusTypeMmc'?
   497 |     [BusTypeNvme] = GUEST_DISK_BUS_TYPE_NVME,
       |      ^~~~~~~~~~~
       |      BusTypeMmc
../qga/commands-win32.c:497:6: error: array index in initializer not of integer type
../qga/commands-win32.c:497:6: note: (near initialization for 'win2qemu')


r~

