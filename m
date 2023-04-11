Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DD6DD746
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:56:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmAjC-0001N2-QN; Tue, 11 Apr 2023 05:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmAjA-0001Ms-OL
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:55:52 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmAj9-0007Zt-3K
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:55:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id d9so7003045wrb.11
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681206947;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WVlqTSEVYhv9R3aJqiHDuaOnVED8dbeaMKAm672KFy4=;
 b=WM0hrDyRhu2A6PNemcRfHfnXPwbQ1AWRp2rAEG+ot56aNQtL7Qda4xdm/dxA4kXWEx
 wfDx5VeQD77G3TBiLFWPYfDoNm5TPbJW1Tbs2M9aeWiZZ9rjvKQqvPQVt3K4syhG7azN
 mvIl1oqeyjhxJs3zZejt92xm/82+MRDe/KRbnY1p/BfcOrzXV+DTJj9uoNE/Bq0jJp4b
 bz/Mt7wfOnW2OWCgJH5MBezEELry/UDMH5gKZhrhYQAqzLb7cLNXFOk90Ad5yW6Aqy1B
 25jtxw86eikkWSJ42gCmiD3jQLdlFuALUyheD258ssNxFoVS10kjnR6aE95osN2T2qiI
 RN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681206947;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WVlqTSEVYhv9R3aJqiHDuaOnVED8dbeaMKAm672KFy4=;
 b=t/+wChkSMGCL10sYKixvfili0hwg7IAm/4pJnFQoKi0XaPdp0txmQMqog6fpgQeErH
 ObfIJApv5bV0P1lKmPBxkJdCZ79VGRwTY2Qfc0l+XgFsIxwFN/jdiJOBF9/Qe+DZ26Gu
 bFP2pREnasmXIGftWT5uaZmhZcgyYMOnHPcjObKJOg1MMy4MkXgGBYDexlSl1zw6ZeoH
 99O0FZ2ptSOWCVnLtsGiigT1znxKgpsPZ2GAcozGzAu71cKfSJGRuCIR5M8zi+5+1hea
 tKKblENK+kjl24G2rgagopDTjO/nYqIu0gkOGfDKWNG5EoZUX1j9K3vlpYIpNnWPp07R
 ho8Q==
X-Gm-Message-State: AAQBX9cnpbqn+ux4qokOdNdFw6qDWyDqRcUD7FsSKcyvx8n8jP8h+C46
 ojPX/y7/1X/cqzNzM0Z6tnB+ag==
X-Google-Smtp-Source: AKy350auxwzt+PNsYzg4MMKnQzlD8I6Vmn+HHt7wzET6sRX5vTmY4pezzKi/4ZwBkJ7Iev0YPomgWg==
X-Received: by 2002:adf:d0d2:0:b0:2f0:2dee:3ed3 with SMTP id
 z18-20020adfd0d2000000b002f02dee3ed3mr1519052wrh.8.1681206947337; 
 Tue, 11 Apr 2023 02:55:47 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056000101100b002f21a96c161sm4476397wrx.70.2023.04.11.02.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 02:55:46 -0700 (PDT)
Message-ID: <37fc6159-013a-a3fb-0184-c53f2f39e677@linaro.org>
Date: Tue, 11 Apr 2023 11:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0] tcg/i386: Adjust assert in tcg_out_addi_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230407190200.3259312-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230407190200.3259312-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 7/4/23 21:02, Richard Henderson wrote:
> We can arrive here on _WIN64 because Int128 is passed by reference.
> Change the assert to check that the immediate is in range,
> instead of attempting to check the host ABI.
> 
> Fixes: 6a6d772e30d ("tcg: Introduce tcg_out_addi_ptr")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1581
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



