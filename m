Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54F590AF8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 06:18:28 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMM7v-0001DQ-6V
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 00:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oMM6C-0007lj-6j
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 00:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oMM67-0001aF-KK
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 00:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660277793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZePtITI0RX4qss63XRIgN5ENaY7IBADXY73bqg8SdU=;
 b=bAT3VgA5Cg1uzHlLr9H1AinZI8b+XpfsDR/mAcxp+Jw6VMFQUF/tTbd72txAuco2uOAvN4
 DRuKs4lp4qhgA9TrM3+JqgsXibIfbH9SEWfUgbcN5HQWjTGSrp75dplj0g5WZYut+rpQ+o
 B5Tp1XnCmWAbfnIU16jGaK2s1IN1Bm0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-KIj7FLm0MFOn4vdlpjtphw-1; Fri, 12 Aug 2022 00:16:30 -0400
X-MC-Unique: KIj7FLm0MFOn4vdlpjtphw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m22-20020a056402431600b0043d6a88130aso12065412edc.18
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 21:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lZePtITI0RX4qss63XRIgN5ENaY7IBADXY73bqg8SdU=;
 b=usw0hxRaaltwY9XDPCZgVHHc8HFe6YADAZqUPbEWRO+42bI6k8R9yZnpKb9/SdHWxj
 4YXHzJwtt7im9uVgmmYQ8zfxU/PiTgGa+jt07zRtT82naxT95N5qqZGeAuyORJtKJb1L
 Wntty8OXrDKuIX+8+a9ekBz1Thjy0hopNd6tnz/Bgl/9S4dOSxtluA3VTWSR7aiUu55J
 ci/cYPNhtHBn5bK7+VbujP1p+nvpmwGdfjiNARW98yL6FDiWBdXuixLZva8HKQ3psslK
 CZVN8uGGSyf1IFR76EmyLk7LEQ7quhFE2LcmytvQKPwqVoFgSv5bkVgCpVok3KFg0i4B
 qCOw==
X-Gm-Message-State: ACgBeo1D+AKL6O0WydaSEXnSup5wmnG2fIUO4bxQQyZlZ6edWU3bOcZK
 iiO+VXtSCSgdVMF3nMEbY3LwrNIHDRDCI+fbMT2Xjff1ThDhwGdZxhNJzmY05cAb+cn7wR9xqUr
 r/+IyIQ8AkUJPh70=
X-Received: by 2002:a17:907:7e8f:b0:733:16da:24bf with SMTP id
 qb15-20020a1709077e8f00b0073316da24bfmr1392905ejc.349.1660277789928; 
 Thu, 11 Aug 2022 21:16:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4lkCiRv3XEct8CNUdJ5fTfTpjXmqN6JnYX+rr4LTCLy0Fg9p5cTLWYZriXczUMyk98TaReHQ==
X-Received: by 2002:a17:907:7e8f:b0:733:16da:24bf with SMTP id
 qb15-20020a1709077e8f00b0073316da24bfmr1392897ejc.349.1660277789705; 
 Thu, 11 Aug 2022 21:16:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-115-19.web.vodafone.de.
 [109.42.115.19]) by smtp.gmail.com with ESMTPSA id
 bv18-20020a170906b1d200b007315e57ba0asm340114ejb.114.2022.08.11.21.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 21:16:29 -0700 (PDT)
Message-ID: <9d24dd87-782f-ab15-9d48-51653801cee0@redhat.com>
Date: Fri, 12 Aug 2022 06:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC] Unable to use qemu-ppc to run 32-bit powerpc executables
 generated on gcc110 machine
Content-Language: en-US
To: Pierre Muller <pierre@freepascal.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <66112e17-e4ac-59fd-ceaf-56047015918a@freepascal.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <66112e17-e4ac-59fd-ceaf-56047015918a@freepascal.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/08/2022 23.38, Pierre Muller wrote:
> 
>    I am using qemu to check code generated by Free Pascal compiler
> for various CPUs.
> 
>    Recently, this allowed me to find out that Free Pascal was generating
> wrong instructions, leading to SIGBUS errors using qemu-mips.
>    The same binaries worked without troubles on mips test machines,
> probably because SIGBUS is handled directly inside the kernel.
> 
>    Here I would like to report the problem I get when trying to run
> powerpc executables using shared libs generated on gcc110 machine.
> 
>    I copied over the needed libraries into a sys-root directory.
> 
>    The problem is that the code crashes with a Illegal Instruction
> after only a very few instructions:
> 
> muller@gcc186:~/pas/check$ ~/sys-root/bin/qemu-ppc -cpu g2 -d in_asm -L 
> ~/sys-root/powerpc-linux ./twide1
[...]
> 0x3ffc1d60:  f00004d7  xxlxor   v0, v0, v0
> 
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> 
> The problem is the the 'xxlxor' instruction is a VSX extension instruction.
> 
>   There is apparently no cpu in the powerpc cpu list that enabled this 
> extension.
> The output of cat /proc/cpuinfo on gcc110 gives that:
> .....
> processor       : 63
> cpu             : POWER7 (architected), altivec supported
> clock           : 3550.000000MHz
> revision        : 2.1 (pvr 003f 0201)
> 
> timebase        : 512000000
> platform        : pSeries
> model           : IBM,8231-E2B
> machine         : CHRP IBM,8231-E2B
> 
>    Is there a way to enable cpu features separately for ppc like is done for 
> x86_64?
> Or would it be possible to define a new cpu inside qemu source that would match
> the description above?

So you are building on a POWER7 host and try to run the binaries on an 
emulated G2? That sounds weird. Why don't you use

  qemu-ppc64 -cpu power7 ...

?

  Thomas



