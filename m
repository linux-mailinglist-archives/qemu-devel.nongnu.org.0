Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6E4D495A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:18:30 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJcb-0002WW-Q1
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSJUv-00069j-AT; Thu, 10 Mar 2022 09:10:34 -0500
Received: from [2a00:1450:4864:20::436] (port=34628
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSJUt-0004ym-MM; Thu, 10 Mar 2022 09:10:32 -0500
Received: by mail-wr1-x436.google.com with SMTP id j26so8205090wrb.1;
 Thu, 10 Mar 2022 06:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pfxuBajQvGAZNjDx4StbXc9CBKvX8ZNb+fAFea8i93U=;
 b=nu4kDkpfAJNrzPKe6uIyWiPO/izwWII6RlQxCCYlpw7JbRbg/Td4WuIh9dZyd0IGoo
 wsOj5p/fxlAvawLx/ScWUqHRmxHq0WrMUKyh9i//woCIKl+K8aoQsNJZbYs8Lm7xJe9r
 2URHAHiHvtW8g4X0CfDbEtmZ9Vfp4cDOoPChkwmP28j3KDkC98fnHj9W605wJ1Q8wMdQ
 tnSQ9GfcE7IeGAeTPhMBHuPfi5uo7ZpUPwhgxlvbQ8r52C3UZG8GE+c+qAsc8APmT8Ud
 Mm25SctO28eT45XvONpyTHZQrH8l8tID6JgE6rPBDN4nVhONw9ifcMB2nb1buke2od2m
 FvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pfxuBajQvGAZNjDx4StbXc9CBKvX8ZNb+fAFea8i93U=;
 b=ja/RH6vS+zlGU2nOqZQwjoqOSTcce2Na/w80iyQnIrNGY0GazeqKSVAfe6kEU0pt7H
 6pGfM3cri0o+R2k8W1kqlmtwP01VEKpYfyUV9WPUQDgC4I4CbsFZz1jU2OGy1AUQ5lTo
 B1JhZtpYt2HsEnsciS+9ry6G1kiuN7BhBxT/6OT+qFDu2Qp9lMqCx3F5Gwta878icXmp
 U1CBEEDtK3SOup0OX28ySVkKeVX26ZKiocUYrj46UgFgrEQQ4CtxLWuu+K6DZcgHPaFY
 AGNpV8xBqQ4Uvc4XGdJDZjNBhpKtCrvzB1Bm6fsmPxNHiIBxg029mbRDGJIRePJY9Sqj
 QH/g==
X-Gm-Message-State: AOAM532gOGIYnc87QaDNrVKE6JgnTNhBXvCU/8ftrA+01RtSsrKLZfo9
 OZI+fStXhFaEHF74D3YLmmU=
X-Google-Smtp-Source: ABdhPJzcjq0wxMKpq94miTXbTdtrHHyJn7rYSqHYslZesIU8N05bHV8dAFxBrvZ6IGLLg951+LVzeQ==
X-Received: by 2002:a05:6000:18aa:b0:203:6c12:1981 with SMTP id
 b10-20020a05600018aa00b002036c121981mr3780501wri.121.1646921429530; 
 Thu, 10 Mar 2022 06:10:29 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 y12-20020adff14c000000b001f04d1959easm4218997wro.13.2022.03.10.06.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 06:10:29 -0800 (PST)
Message-ID: <c25b1d81-77a5-d8b4-b092-21e09b81603a@gmail.com>
Date: Thu, 10 Mar 2022 15:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 05/35] coroutine: small code cleanup in
 qemu_co_rwlock_wrlock
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220310124413.1102441-1-pbonzini@redhat.com>
 <20220310124413.1102441-6-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220310124413.1102441-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: hreitz@redhat.com, qemu-block@nongnu.org, stefanha@redhat.com,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 13:43, Paolo Bonzini wrote:
> qemu_co_rwlock_wrlock stores the current coroutine in a local variable,
> use it instead of calling qemu_coroutine_self() again.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/qemu-coroutine-lock.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

