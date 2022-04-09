Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18C84FA0A2
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:25:30 +0200 (CEST)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyuv-0001yi-T7
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyr6-0007ZR-Tl
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:21:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyr3-0005mC-M3
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:21:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so13332745pjb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ppoA3mvS9q/qtJs2kfHueg9IKiQGxu71Diq9gdMQUcw=;
 b=WdSsfyjyPtdJOdqULA4BTbf+QWNMudDjDaBd4mUyuDWy2YP20zliV+MfBcHxqxkn3K
 tX4IYSMRFtUwNP3aeEQGbkmr+NZ2zEVXUVoZcD0SNYAPji1x2HVJoZK+VA1WoC2Ks/x6
 rH3xNEoXT4BV6uLD4hAB51vYzZ6K84VNmtZ8+u40tsA0zVx7JzzuO+l93LDOBAi42njy
 mCEo07/wt1QaEF0gOtjxfRqS+La8KjE3NTVQFKO4QqhVt4KZIhfkXtnciRVP0xwXhfPT
 4AyilOfASEAraxXx5PBD/eCb+/UpJNbUBHVzIoXZ2FJlQgUOv1ASgzn4MgETecw0a94Q
 d7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ppoA3mvS9q/qtJs2kfHueg9IKiQGxu71Diq9gdMQUcw=;
 b=fVFxqLF3+yN6Xld5IDmLTRGnFNGLVzw1BKHsqaYdl2gs46CW73Qt/95qBU5oDilHF1
 0RdLaMW83/dj6EBYl9Xl3EhINIJuGKHgECwx5YabzqQewsAH1T3eilt4luLmR7xUL3lw
 GuTSwj/e0Raf/gjBpYtnZz/pjU51waHEQ+njAa7YdXbVC4EX9ReEQ8jomUQ3p8Tt+mKi
 F07MaLqkFIKFX0tEHX/ENZFrco6TdPdiRPy0pyeUse+LUZc7sOEz7y/cwM4P/h5ZYjN4
 d1pom/9cpmXLycCgpCLhuFpCnSxdmBOkNENi6rEgbSxqO2nyVzh0Q737BSjahqej7zI+
 E3mA==
X-Gm-Message-State: AOAM531MINQFvHYgdwx0JyugqubLaH/KmmIBrCIlL35Jg6UJcI+p7EYM
 OxI2ceT2b9AIF+6U/p93hmhOXg==
X-Google-Smtp-Source: ABdhPJwXVs/5zIxGdnMJmcBKglnNNAjUwKyz62W959EuhewsmsG5kijTFY41Z2DirzN6wZirtp9N9g==
X-Received: by 2002:a17:902:d2c3:b0:157:ebe:25c5 with SMTP id
 n3-20020a170902d2c300b001570ebe25c5mr9993107plc.59.1649463688289; 
 Fri, 08 Apr 2022 17:21:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm28673734pfh.177.2022.04.08.17.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:21:27 -0700 (PDT)
Message-ID: <4dd747c0-3ab7-ef2a-168f-ccec69ed2d35@linaro.org>
Date: Fri, 8 Apr 2022 17:21:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/41] hw/intc/arm_gicv3_its: Implement VMAPP
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the GICv4 VMAPP command, which writes an entry to the vPE
> table.
> 
> For GICv4.1 this command has extra fields in the command packet
> and additional behaviour. We define the 4.1-only fields with the
> FIELD macro, but only implement the GICv4.0 version of the command.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> GICv4.1 emulation is on my todo list, but I'm starting with
> just the 4.0 parts first.
> ---
>   hw/intc/gicv3_internal.h | 12 ++++++
>   hw/intc/arm_gicv3_its.c  | 88 ++++++++++++++++++++++++++++++++++++++++
>   hw/intc/trace-events     |  2 +
>   3 files changed, 102 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

