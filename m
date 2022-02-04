Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBD4A9358
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 06:23:28 +0100 (CET)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFr4B-0004NT-6t
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 00:23:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFr0f-0002YD-EA
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:19:51 -0500
Received: from [2607:f8b0:4864:20::42c] (port=35439
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFr0d-00044n-A9
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:19:48 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u130so4163517pfc.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 21:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=okcOhKRCnVGnnG6qRWZ0X10Df9KnuNKH3RGOscpigkA=;
 b=JrbiMUPHEvq+7P9iSQzgcu6dnZ48g1fwPU3+Z5JWCko/BMsfdMgCyZtKIJ5tEQM2XG
 KZP9QKDuZdPSf3D20PEHF68RGiMi9fAdhOLxZ0ZuxMvIDl9lfrtFBvFTgjaPzjKvlImO
 off6UN6FaeUIHr+UZdU7v2dncqsaOsrMxLujCxtFUEOmXBk+CHqrFm60/GDf1qLSVEnH
 Fb6COxhx4t4WZ6r5BydV31aRXzda7dXhjtljnxj1Mjz3qZdCFGKrA9xQy7ARy+TDXPT/
 /QkVvNY9nj4gymr88XtVddyuwaBnAoxHtJ5R4v82wvja8wdV6Nx5CrcVibbJ1yzG0iQR
 Gfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=okcOhKRCnVGnnG6qRWZ0X10Df9KnuNKH3RGOscpigkA=;
 b=rmaNqIRW22RjdJpnmfMOEzRq/B2km/prfuxaHRCUzamdnq5xSPURojyFHZsPZWSoZC
 EHGsV8hXqtX5C00phsGIgZtFWfulDRdnbBtqMMTcd2eweUW3aza32GWsZzYGRjBJ0wDO
 dEURloAOGlk4lLrFUbL/4BTcPEPJxazdTkM1p48izNvYIhgVuuVUBnOe3Mz/HFfoHrcW
 60Zq1rVdZ6KEUeBEgaNwjIbnYLLu8plSsEd6q+vvcrmrg08HDy8tv+iCdxt8wJm/PXsG
 BqaQlx/YO9m2v80qQ7h+9Ynp7OwKG3j2my10k5dGYCzxGvKNRSSF8ZF/d1Q+ovuNXX8h
 JDZA==
X-Gm-Message-State: AOAM530R9JJ8K1eMQ3oMqRzEbX6dSiwKkCD9GAJsr+HpTATIqc5Z7txV
 qRg1CmS6ybup17UsZoYp8yP/eMMYkFk=
X-Google-Smtp-Source: ABdhPJzLI/dn3yI9LF6DFiVQ+s0HrZFUwi1EYL0/ZZxGRvVrtcZCotgKDdE6aez93/e9KtAnp0QBaw==
X-Received: by 2002:a62:b40e:: with SMTP id h14mr1476881pfn.79.1643951985689; 
 Thu, 03 Feb 2022 21:19:45 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ot9sm753426pjb.47.2022.02.03.21.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 21:19:45 -0800 (PST)
Message-ID: <6358e5ce-9f4a-740b-2051-c4f8078d13fe@amsat.org>
Date: Fri, 4 Feb 2022 06:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 25/27] meson: require dynamic linking for VSS support
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-26-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-26-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 3/2/22 18:33, Paolo Bonzini wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The glib_dynamic detection does not work because the dependency is
> overridden in the main meson.build.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> [Rewritten commit message, added requirement in qga/meson.build - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   qga/meson.build           | 2 ++
>   qga/vss-win32/meson.build | 4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

