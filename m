Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3252AA6C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:18:10 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1lj-0001yq-W1
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1je-0000Wc-CN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:15:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1jc-00039f-SY
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:15:54 -0400
Received: by mail-pf1-x436.google.com with SMTP id a11so17634375pff.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/1c2PqJVZ3vL+HEM/irAytc0TXVIocscAye5GiYGif0=;
 b=qD9yHG3I13EvShKc2IVZ6O9t/dloWh2I+jKT8rRVQfPBmQJ0oT/SMs51DURTw0XSXN
 du8siF//OnVr3tYyASAVSe10cknNJt1M2OS5rkB4p62VxZ5JXSTSdwVC+2oHlO+qJRC1
 4H+HtOyGSI42Ih07ywgGiL6h7Dz8WDKJHpAf0aT94FZWQDzvcrDJO9WlYlkGH7wO/Kz7
 UXGnLz/nw1wao4X+XDoZ4NjINg6zo3uawlAaPuryvjuUqjgYS/ZsYTX6QOtKagR9jFij
 BkUv8xfxU28UEHRpIw04/TmudIOsDOWlLa+MbJV3Kb8u+j2HRrZOcrNRh0hqTncRl4WI
 mL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/1c2PqJVZ3vL+HEM/irAytc0TXVIocscAye5GiYGif0=;
 b=xvIQMXGIcPO1Xbdvnnn+WkfX8brJQkMEnerJDENPqlX/huK3hb/YvnHkb52dOrfv2Z
 nb1lLuMtRBdF0cEYyyqCtO8TfwqO6Eo/ZVh8Uz4ioeEWo+V2L2AIcus2yeYG+1dH/cXo
 /4XmDy1ZifcJyFKdr3lDszGPW5ZK8JWPFcZvQLNKrw6QH95rwIuZM0bJpe3SNxVMfBE3
 uNau6xPIJY4ouhfUO7KoyJe4wWMF45yjrL924L6xJEBF/nIXopjEM4EVEa4jcTwe2HgJ
 DeRLNCWnZuHjMvQ6NLpRTiBjk7CUlFL5AGnQCelT8sQOy0fQcgUtBW0p3g6QRWvD0mH3
 avsA==
X-Gm-Message-State: AOAM5331pAsIvOe40bqZs5fIUTz1xdXOLtO59O7w4dWS9ruDfBcRsaA6
 djkCZCXSnJyrObq5w8kqemh3UmMet4Zycg==
X-Google-Smtp-Source: ABdhPJyk0rhDdDjy3s3r83vXD88a+sL/Dm28Oqy5q6gTnIpmkJIWmHxLvBVQ8Bpje+xcMrxx3y0MuQ==
X-Received: by 2002:a65:4684:0:b0:3db:5e25:38eb with SMTP id
 h4-20020a654684000000b003db5e2538ebmr20756098pgr.363.1652811351620; 
 Tue, 17 May 2022 11:15:51 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a1709026f1700b0015e8d4eb287sm9365516plk.209.2022.05.17.11.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:15:51 -0700 (PDT)
Message-ID: <63299ab4-680a-e964-366f-b1067aa18084@linaro.org>
Date: Tue, 17 May 2022 11:15:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 08/16] configure: add missing cross compiler fallbacks
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 5/17/22 02:26, Paolo Bonzini wrote:
> The arm compiler can be used for armeb, and the sparc64 compiler
> can be used for sparc.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

