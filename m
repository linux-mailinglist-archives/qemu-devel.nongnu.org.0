Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1A62599E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSON-0003J3-2A; Fri, 11 Nov 2022 06:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otSOL-0003Im-Gt
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:40:13 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otSOK-00022J-0Y
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:40:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so2984592wmg.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UhldJeimvIz6e22Vm9FCacxwOtyiJXQvXaALA553MBs=;
 b=CdLwRTSOGStUjmbuG4pOrvYkjvkTRdGWSBSUEOgSWeG89TWFMKGk4+T9hAutXf0KRl
 dIWgD2r9ALBsQs19ifyPWj4npKAfmAEU2An4Svm7wfqL5dN2A/mINOwKHY73ru6PqhYa
 rbwCR6dK5BfhTqel8JrYNAhj2C9ZvYHwEzMNO141KSn+qAmWL6f3DV4iC/zM/NexKJWU
 zX07wFWP1ytaPdI2G9/KjiAGzLa+px9gkCx2bPpHQUVEy7YrO0ZaCVSnytJCpIrM9g35
 Pmvhn7uBeN4TURyCBk8yTUdmRAEXLtL34EfGF3ea2I0UcUvSwuVuDhgfW1wTiVcL4PEv
 yVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UhldJeimvIz6e22Vm9FCacxwOtyiJXQvXaALA553MBs=;
 b=RY+Sd0n8wE9z5X1c1HB9B5pVKo+8x9XPLoT0pz2HP+EEoT+f/SkuudRubuuDj2fqnY
 c8tmf2YPxGlsmLPySzpaPG8nHJFPWT2+T5f2NGl+hwL6E4X2qiuT05IHpMdnk+/rciSB
 oKIMsdAtvo6BRS2Fv+ORKUHgQLBnuv/YUQSH10VR5j+Fk2bwkdS0ncU+utJEz651aJZP
 4yHJAKhxLYi+CsF9ztiR9MtkWE8x+zknoxgWFOYhrUoyxXbS5jaDP/tO4UNWTrbIPtSN
 LcKfybFZEKv4JliItOirJOj51HdFoYpaixbDIfJ673WPVtaTvZO+wBB2X2oDT9FL0Zjy
 zacQ==
X-Gm-Message-State: ANoB5pliYbl1PY68B4hpK4lYFNr80wWnz65zAwtYnKJSzzKZA1wSmW3a
 bj+g5k8PLnkX5KcHhQxAi02TEg==
X-Google-Smtp-Source: AA0mqf7lFxZa40RyM7lcToVNBcPnlfWCzvKW0ciytfSGYA2oLmq8DEBWOsa6jDi4bJtvxoe1EmH+yw==
X-Received: by 2002:a1c:f611:0:b0:3c6:b7cc:79d2 with SMTP id
 w17-20020a1cf611000000b003c6b7cc79d2mr1008697wmc.42.1668166809931; 
 Fri, 11 Nov 2022 03:40:09 -0800 (PST)
Received: from [192.168.7.115] ([109.111.120.167])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a05600c3c8100b003cfaae07f68sm8775299wmb.17.2022.11.11.03.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:40:08 -0800 (PST)
Message-ID: <bfc67412-09ce-793e-49ac-b0af0cf05fbd@linaro.org>
Date: Fri, 11 Nov 2022 12:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221110220805.26816-3-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/22 23:08, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Replace the local Error variable with errp and ERRP_GUARD() and change
> the return value to bool.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)


> @@ -7388,14 +7387,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>       }
>       ret = msix_init(pci_dev, n->params.msix_qsize,
>                       &n->bar0, 0, msix_table_offset,
> -                    &n->bar0, 0, msix_pba_offset, 0, &err);
> -    if (ret < 0) {
> -        if (ret == -ENOTSUP) {
> -            warn_report_err(err);
> -        } else {
> -            error_propagate(errp, err);
> -            return ret;
> -        }
> +                    &n->bar0, 0, msix_pba_offset, 0, errp);
> +    if (ret == -ENOTSUP) {
> +        warn_report_err(*errp);

Why only report ENOTSUP in particular?

> +        *errp = NULL;
> +    } else if (ret < 0) {
 > +        return false;

Is that normal to ignore:

-   error_setg(errp, "The number of MSI-X vectors is invalid");
     return -EINVAL;

-   error_setg(errp, "table & pba overlap, or they don't fit in BARs,"
                      " or don't align");
     return -EINVAL;

Or possible future error added in msix_init()?

