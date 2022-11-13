Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D6F627269
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 21:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouJDL-0006HM-2D; Sun, 13 Nov 2022 15:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouJDI-0006HA-DX
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 15:04:20 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouJDG-0004n2-HV
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 15:04:20 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so6436842wmg.2
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dE0Kpy9Duj9F3lHAKPRsslvDUEh6AzEqsrx+UU6gP9s=;
 b=p4XxfiwZpJxR4OEp1Qi853Zlcs6SXoR7wHXOkynY2f8B00tS6DN2Nhp9GeuhHlBqfr
 eyrp7M/ruHybaHX0WsKAtwTQ5OhSKMcgBt0FUBaWsCQgdthi8cd54dFvfJ7I0ryhpAMP
 IMwfR6JFSnkS16VzlhvbRhaLj2iXYIr+lz2YpiJIeprebcy9Q4eES59NCU0Qhxby+f7u
 nqhiBXaWqF2DQiVr5IZLttzbx8/6DrgYBdMFLYWj1C0arbtA5e0fXN0Dayyrm60ijydC
 A8+DE8jL0a/pDa6DeP4zRSe+Jd8vMAt8NNtV4LSjUzdlCl+UzB6Zr2tHavK9vn8AulxL
 g9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dE0Kpy9Duj9F3lHAKPRsslvDUEh6AzEqsrx+UU6gP9s=;
 b=snTSbL2gfdbw56qhgb/14r+A2B/IvvyO701UIW/gvEq/dr94RSPgE256+q0FcRhw1v
 qBB7DKeHU7CwUUtHGYVNK8FSZQDWip4QewGYkExdx8737e6KbirdRWdHnlrm9VOkZKdx
 17tEGP9pMikP8Py8UWStoIzy4r4Uh8ivps5QRgObpxr9pn1WXzNlL8xxHmXnTTteeBcU
 0sI4GtXRud8sbeFIuqRfTK7Da0OQcaM/7cOPYf3txv7ljadUuEN63GfLtu7NrxXy9u6t
 qJp5q6B4DNyQvAGHdR+QiVsd3muvs5rPyE0TRUTPYqP/Khr1Bv3WQysKEKIpM+meexGF
 I6LQ==
X-Gm-Message-State: ANoB5pkfGA6I80r46zeoYmK8Tyqv38jrgFVwbvkThv92WgN8ssbonUDv
 CJCwc2UAtqReQ7cna18qi4taAA==
X-Google-Smtp-Source: AA0mqf5TOtbES9E+qeljSP7EG/Ol3UFZ6nWt8Xrmeax6mgKkjp+8ARRS5zccWl+i991vWNOyxvhEAg==
X-Received: by 2002:a05:600c:35d4:b0:3cf:d70e:223c with SMTP id
 r20-20020a05600c35d400b003cfd70e223cmr3481946wmq.74.1668369856492; 
 Sun, 13 Nov 2022 12:04:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c502900b003c65c9a36dfsm10268247wmr.48.2022.11.13.12.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 12:04:15 -0800 (PST)
Message-ID: <e74f7cc2-fdbb-3750-e8a2-a7e3a9d447c2@linaro.org>
Date: Sun, 13 Nov 2022 21:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 19/20] hw/isa: derive CPUState from MemTxAttrs in
 apm_ioport_writeb
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111182535.64844-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/11/22 19:25, Alex Bennée wrote:
> Some of the callbacks need a CPUState so extend the interface so we
> can pass that down rather than relying on current_cpu hacks.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/isa/apm.h |  2 +-
>   hw/acpi/ich9.c       |  1 -
>   hw/acpi/piix4.c      |  2 +-
>   hw/isa/apm.c         | 21 +++++++++++++++++----
>   hw/isa/lpc_ich9.c    |  5 ++---
>   5 files changed, 21 insertions(+), 10 deletions(-)


> -static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
> -                              unsigned size)
> +static MemTxResult apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
> +                                     unsigned size, MemTxAttrs attrs)
>   {
>       APMState *apm = opaque;
> +    CPUState *cs;
> +
> +    if (attrs.requester_type != MTRT_CPU) {
> +        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
> +                      "%s: saw non-CPU transaction", __func__);
> +        return MEMTX_ACCESS_ERROR;

Are you sure it is illegal?

> +    }
> +    cs = qemu_get_cpu(attrs.requester_id);
> +
>       addr &= 1;
>   
>       trace_apm_io_write(addr, val);
> @@ -41,11 +52,13 @@ static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
>           apm->apmc = val;
>   
>           if (apm->callback) {
> -            (apm->callback)(val, apm->arg);
> +            (apm->callback)(cs, val, apm->arg);
>           }
>       } else {
>           apm->apms = val;
>       }
> +
> +    return MEMTX_OK;
>   }


