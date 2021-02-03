Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567030DCAD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:27:02 +0100 (CET)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J7V-00067I-4D
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7J4R-0004En-ER
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:23:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7J4O-00084I-UM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzlVfnRGikRF2DzTki51BOnkub+oK0lmd2xPCKtrEP0=;
 b=ingmgy0ilrskYeDqC952nD+3+emOzutFmqbg6vyJdEBXZCSU259Pzk90u9YbLBJ+GRI0P6
 3l43knrXAkMQ2LdD6It30dA0qGG2YSUL5DNwkMMeJUmJ0Shbh/8kuqiYuevhYvuEH7DKtU
 B8PBvrs2txbDiW7JYqyO4sAHG37U4G8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-toB2rfbJPGeGjFZK9RHtYQ-1; Wed, 03 Feb 2021 09:23:45 -0500
X-MC-Unique: toB2rfbJPGeGjFZK9RHtYQ-1
Received: by mail-ej1-f72.google.com with SMTP id eb5so2407938ejc.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rzlVfnRGikRF2DzTki51BOnkub+oK0lmd2xPCKtrEP0=;
 b=mjei0T9UuGESFgOHO9ow2EuaqVpI60VU1OBWWwb8j5SKiwIKWtXfaIHQmkKdaGii9H
 s2wZ2sFGU8Gi+WyrXmnlpGIm+mfukcWUQpk62c7F4EYFvMglAYzFqB2kireAAKcsQK4o
 UGqcO7o3nY1NYytN6FIVkJTpOCYgZoCm8x9yGt9cLNJq4jgkNoqrLdMPUyvLbdnZiYrx
 2INw3ckm15Y9ppSb9J2rbG736tSVsdGJpRB608a4qu6ofaI9XtOGOXtfUkxDjp4uoG1q
 hOxj1u4BnmmT2eqt9fANMY1Ux3YQCLwMGqcF0dOITZ9H+syAvTTVJethCHQD5D7V0TNc
 0V6A==
X-Gm-Message-State: AOAM532Vu1ItzPDVHN3WDsUAF7CAtBOldPtiknn8pfD0K4TDKHaxZUuj
 THBA7Dd5OHwl5LV21xacWGXgxlR08P+Y5iYSJp0I3p1+xmfXkd30hdy7SmMP8fF1xYYRR75j7do
 aDdmK5G3UeGsLrz2J+qppsUmEkojc6rqrbCNG2CGlaMuHguh3joEjvasMk5vhDgnf
X-Received: by 2002:a17:906:5857:: with SMTP id
 h23mr3281541ejs.465.1612362223581; 
 Wed, 03 Feb 2021 06:23:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVwHX/24B33SLPRbrdeRnFsXZnJIyFyErIOW3UmSzQhnr0ScaIOUvZEw9As40noswB6F+HqA==
X-Received: by 2002:a17:906:5857:: with SMTP id
 h23mr3281515ejs.465.1612362223349; 
 Wed, 03 Feb 2021 06:23:43 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id h16sm947362eds.21.2021.02.03.06.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:23:42 -0800 (PST)
Subject: Re: [PATCH v15 22/23] accel: introduce new accessor functions
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-23-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7dd6b937-be9c-5e66-17ce-81414bc26f82@redhat.com>
Date: Wed, 3 Feb 2021 15:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201100903.17309-23-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 11:09 AM, Claudio Fontana wrote:
> avoid open coding the accesses to cpu->accel_cpu interfaces,
> and instead introduce:
> 
> accel_cpu_instance_init,
> accel_cpu_realizefn
> 
> to be used by the targets/ initfn code,
> and by cpu_exec_realizefn respectively.
> 
> Add warnings about the use of target-specific headers.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/accel-cpu.h | 11 +++++++----
>  include/qemu/accel.h        | 13 +++++++++++++
>  accel/accel-common.c        | 19 +++++++++++++++++++
>  cpu.c                       |  6 +-----
>  target/i386/cpu.c           |  9 ++-------
>  5 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
> index c7c137dc9a..24a6697412 100644
> --- a/include/hw/core/accel-cpu.h
> +++ b/include/hw/core/accel-cpu.h
> @@ -1,5 +1,6 @@
>  /*
>   * Accelerator interface, specializes CPUClass
> + * This header is used only by target-specific code.
>   *
>   * Copyright 2021 SUSE LLC
>   *
> @@ -11,10 +12,12 @@
>  #define ACCEL_CPU_H
>  
>  /*
> - * these defines cannot be in cpu.h, because we are using
> - * CPU_RESOLVING_TYPE here.
> - * Use this header to define your accelerator-specific
> - * cpu-specific accelerator interfaces.
> + * This header is used to define new accelerator-specific target-specific
> + * accelerator cpu subclasses.
> + * It uses CPU_RESOLVING_TYPE, so this is clearly target-specific.
> + *
> + * Do not try to use for any other purpose than the implementation of new
> + * subclasses in target/, or the accel implementation itself in accel/
>   */

Squash to patch #18 "accel: introduce AccelCPUClass extending CPUClass"?


