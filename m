Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CC4A5324
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:23:19 +0100 (CET)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEg10-0002Ii-Ra
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:23:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEfz7-0000Ok-3m; Mon, 31 Jan 2022 18:21:21 -0500
Received: from [2607:f8b0:4864:20::52a] (port=35453
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEfz5-00071X-GS; Mon, 31 Jan 2022 18:21:20 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p125so13672901pga.2;
 Mon, 31 Jan 2022 15:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLkjlkZDQKxUgZ4qhm6Im4nNBukeTMwsITVuFiLt+zk=;
 b=Lp83HdD0reqhrOyCQB/M3B5CJ4qn2o0Q+yyrKskrfSPgkQUZMHbFoxUBTW6GX90JSo
 3NDak5QvsurwcoT0T61TzkaEgoaqV3xf+X2FiOl5MzIAIbkg70Bf95BXiBiBDlb74o52
 LTiqIPZXTyL4Wu8vsnJhQU7r9JyWqe5vtIqYOeeRg0id+y9y5VSK1LUTLOt2tMonBDE2
 ikImZojsqYyuXzMAg3urGvubhIsg2qK9g6DGl1uZPqE6kXvcjHsUvbyeURUuO+EsCpLP
 RR1cHgYGp6c+ZU0Dcc+Q/LRh72J/SqutHfrlmJf1wrQBaXuscmYm21coKOMi1ymtKILh
 IG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cLkjlkZDQKxUgZ4qhm6Im4nNBukeTMwsITVuFiLt+zk=;
 b=ORzlNF/yW7VIyfqNOLj922FmUz73SPse3g7y/NZx7UxlSFBi/7UpDvRBk9qllfDH47
 fp9IlUyKxigBK6RVe57hQUNxCHQEU2hJHX7mF6ZtYezs4UsEhFk7upjdYZYCVXUjh0Er
 EEEj7WRN6I/Y3PFQsM1jb/bFx/08JMrDsqIixF08/FggbUHvFjMLB+FymERf3EB0PI0f
 H3HPn5YgKh1ybGDeM4pkIo5ublDcly7GqYtr1Cjemd+mqLVH4YuB5273pMrBoBV63nSd
 /Otwg/bMJqa8nOouaeDFkY7j3TmZprhhMpgikImRQ0sK1qr2PCRdaBHZdoKhxlEuChos
 HPig==
X-Gm-Message-State: AOAM532+LwkjDvJUShiu6m0Q0Jrl+Y+UsWjEm8Wghc037XO2Iv2hD6sn
 hDYBI17S44Owe5X441L+dCE=
X-Google-Smtp-Source: ABdhPJz3XGr9l70q6AQPX8sHucJKUH1vi/1SazXaxx7MgKGM+qdq+ZjtQ4RAek82LIqRhEmgv2JOuw==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr18848537pgj.487.1643671273059; 
 Mon, 31 Jan 2022 15:21:13 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mz23sm378396pjb.2.2022.01.31.15.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:21:12 -0800 (PST)
Message-ID: <18c91f53-56b9-76d0-dd83-73c48d35bad1@amsat.org>
Date: Tue, 1 Feb 2022 00:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU
 Control
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com,
 peter.maydell@linaro.org, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-6-edgar.iglesias@gmail.com>
 <24f93c21-33a6-091f-206f-b80f505b6ddb@amsat.org>
 <20220131121720.GS3586016@toto>
In-Reply-To: <20220131121720.GS3586016@toto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 31/1/22 13:17, Edgar E. Iglesias wrote:
> On Mon, Jan 31, 2022 at 12:35:54AM +0100, Philippe Mathieu-Daudé wrote:
>> On 31/1/22 00:12, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>>
>>> Add a model of the Xilinx ZynqMP APU Control.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>> ---
>>>    include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
>>>    hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++++
>>>    hw/misc/meson.build                    |   1 +
>>>    3 files changed, 349 insertions(+)
>>>    create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
>>>    create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c

>>> +
>>> +#define NUM_CPUS 4
>>
>> Hmm isn't it APU_MAX_CPU?
>>
> 
> 
> Thanks Philippe. Yes, this was a little confusing. The values happen to be the
> same but they belong to different models. For example, the apu-ctrl model will be
> reused in Versal.
> 
> Anyways, for v2 I've renamed the macros to CRF_MAX_CPU and APU_MAX_CPU respectevly.
> I hope that makes things clearer.

Thanks!

