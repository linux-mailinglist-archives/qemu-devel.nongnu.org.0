Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6904B8B17
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:10:36 +0100 (CET)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKL0s-0006A2-Tg
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:10:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKKu0-00074O-0h
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:03:28 -0500
Received: from [2a00:1450:4864:20::62c] (port=37695
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKKtv-00008E-LU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:03:25 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bg10so2530817ejb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 06:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jXehENJcwOcYRAfFwkhRdG0ljqJZ4WE4DLuNgsk9btg=;
 b=IaNEpOJZ6U/wu7PiLUqb1lTE7d7QeRclKG7LEb3PIYEYY+SDt30TysmOVw6He2NNwc
 g30Hu0cjDcLzio5k03dZe5BoJ4BQmJtt4cKL5V3w8IXQ1c9uSTsAluBQRCQr9qOX7DHa
 DqEj7HIz82Sdos9sTzPLbDmv5oRFVKoIJ0GmxLNC6/yrNAC8Py7APp4aQccB4yMMCCUX
 bvte67z2yJEhKC4CDQPLNxiSUNPEPZnJH+TYnMWLXuZ0hduPPd/ypU6UfKN7CD1k4V2u
 /l65czWw6srTDWh6UO82V6YiqX4bfCr2xETf8Ugdm/3SW5F1qFQCHj1T0YeQx6l/2mHQ
 KUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jXehENJcwOcYRAfFwkhRdG0ljqJZ4WE4DLuNgsk9btg=;
 b=Acxi6QyK50iUxsyrDolqN1Nf3tUeEkTi1iVQiF1Paf4R6eGCDRK4dgVdRoaW3PtY7V
 1Z5KOpEH7HkWEPGYQ70oDVQXjjyByGONx9Nc50r4LdOMZh9tvJ2ZdOUyRBxaBDud3msZ
 Q/agtg20lgM1bHcJGhKd5/Wv5DmhzwOLZlW4DddcU6q0qhMxfKN6zwmKXxIbtGMBt0QP
 fX74eIiULcabUcczVhyfjcNHjgBz/uuQurl4zemzOOFm7dl/kKE32rwggaQulhYcwkce
 NOygrDAnR2MJghUDLoBZYmrfy9WI/YXbr0bG0O5xsTspOPDBoltiPdZ6Ugj1E08vZtRf
 TJyA==
X-Gm-Message-State: AOAM533YJjC7uaZZlAzfivnGpRxv7EOiQPyfNQ2HReEnKsoh1BrRQLah
 FfzyMoZf5zWLLGQKjGGgswg=
X-Google-Smtp-Source: ABdhPJwFWRNW5BVVnmU9z2NXU0ZoQ8rNQddNtEtNs8jYS8nJcSWJMzz5R6ASvdc1KJIVB0jVAh4zCw==
X-Received: by 2002:a17:906:9c12:b0:6cf:b429:b645 with SMTP id
 ff18-20020a1709069c1200b006cfb429b645mr2558296ejc.386.1645020201103; 
 Wed, 16 Feb 2022 06:03:21 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id j21sm3014927ejj.193.2022.02.16.06.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:03:20 -0800 (PST)
Message-ID: <d4976978-b8bc-83ec-1a8a-9618d6ea6e98@redhat.com>
Date: Wed, 16 Feb 2022 15:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/30] Misc mostly build system patches for 2022-02-15
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220215093223.110827-1-pbonzini@redhat.com>
 <CAFEAcA_xPeknSFpf0M9vETUXk8fW0gfiKg7eiJszJfagsJubqw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_xPeknSFpf0M9vETUXk8fW0gfiKg7eiJszJfagsJubqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 10:56, Peter Maydell wrote:
> Hi; this fails to build on OpenBSD (on the tests/vm/ setup).
> 
> Meson thinks it's found OpenGL:
>      OpenGL support (epoxy)       : YES 1.5.4
> 
> but either it's wrong or else it's not putting the right
> include directory onto the path, because the compiler
> fails to find the headers:
> 
> In file included from ../src/hw/arm/virt.c:42:
> In file included from
> /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-calxeda-xgmac.h:17:
> In file included from
> /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-platform.h:20:
> In file included from
> /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-common.h:27:
> /home/qemu/qemu-test.sr5128/src/include/ui/console.h:11:11: fatal
> error: 'epoxy/gl.h' file not found
> # include <epoxy/gl.h>
>            ^~~~~~~~~~~~
> 1 error generated.

Yeah, there's a lot of uses of ui/console.h and they all need 
epoxy/gl.h.  That's in need of some cleanup.

Paolo

