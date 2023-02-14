Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CC2696093
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsOB-00031d-7i; Tue, 14 Feb 2023 05:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRsO3-00031I-HQ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:18:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRsO1-0003B0-DE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:18:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 hg24-20020a05600c539800b003e1f5f2a29cso825917wmb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eoDBwkEXI5izGPqDRRnDV1SRzOuqgYyRvmtYlUo4G2s=;
 b=uNhjyL6TlhQVyWciq2J5Y4rvZSg3BMpP0NgkwN/8EFyqQV0Ctk/CdkrLCxL7Ja5yDD
 Lmk3EiYCOWfhdB+gE+RI+Gb1FZLFLnj2g9OExyWfqx5dGMTHrmmCZzWdMWJN2lUw3hVq
 Hv5CjcWcBlz+d2ej6vgNtZbqb9+jmCznmHth4pejJpWcVGCnnPOUIWa7an3BobBEaMrQ
 Z/YY6AutCRL2s7GBaKMv0O3lWTJuF0k5LcEqBFvedUfVCl9W3Yc/Us8lwmTC3ccDAhgE
 Uckqf9Ay3dBi9TdvESmzN4BB71s5qfXfu/4h7tKr8xxH0dzqQfJ+52EhgnUR1C2KlXe+
 TTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eoDBwkEXI5izGPqDRRnDV1SRzOuqgYyRvmtYlUo4G2s=;
 b=QpUQqJsQYP52CtJwgeAZ8j1kMQuUAZO9rqqLqHx8RZtjrmP5UbK/fCT+5Z0N9z1mEA
 FfiFgNtkwINK/rydHxjmKTMNBCSy4EM0Nl0j2vGm69SEXWpWLcf+MHhoA9AUa+H2yf1j
 hnA47sg2JK2ekOoGD81BLS08zJfRlVKAG62K69BkmPk6bqhX4OSO3/hV0kGaxMuZ/1pM
 rDlrh2fDLDJ3+tFyL7HLqCZB32gkm6ne2EQ9at7fKtGHJAtZIwOF8/+n99WgrXfXQ3Wd
 ypi8pRs/1R3LtDtlZtdyb44h4ohY8qvgdaRlXmkaPaLQKCs1/IlheHD0ioGRUcB7Y8RN
 BDZA==
X-Gm-Message-State: AO0yUKXAoDufu+T1UqGO7QcmelJVkjlDmWjosjyvUMIgEPjJVGsoAjRt
 UebjvP0aJyYarUhS/kT5LU4KhA==
X-Google-Smtp-Source: AK7set+qQNgjMtGg8rC+71MkxkTLHVQJ9o9UBM5Oem6aiXA1Yoz/0v0A5hCuglaHT4SYNfSkA5u6FQ==
X-Received: by 2002:a7b:cb05:0:b0:3dc:5e0d:4ce7 with SMTP id
 u5-20020a7bcb05000000b003dc5e0d4ce7mr1489423wmj.11.1676369887793; 
 Tue, 14 Feb 2023 02:18:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm21238909wms.20.2023.02.14.02.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 02:18:07 -0800 (PST)
Message-ID: <f088930b-ad9d-354d-5053-f319272140a1@linaro.org>
Date: Tue, 14 Feb 2023 11:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 6/7] hw/isa: Assert isa_register_portio_list() gets
 non-NULL ISA device
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-7-philmd@linaro.org>
 <8bcc1035-c9fc-762a-7a32-6b0344539345@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8bcc1035-c9fc-762a-7a32-6b0344539345@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 8/2/23 20:47, Richard Henderson wrote:
> On 2/7/23 14:07, Philippe Mathieu-Daudé wrote:
>> The previous commit removed the single call to
>> isa_register_portio_list() with dev=NULL. To be
>> sure we won't reintroduce such weird (ab)use,
>> add an assertion.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I wonder how much use of __attribute__((nonnull)) we should be making.

__attribute__((nonnull)) is compile-time, but seems weaker than the
good old runtime assert():

  void a0(void *ptr)
  {
    assert(ptr);
  }

  __attribute__((nonnull)) void a1(void *ptr)
  {
    // can no use assert(ptr) because compiler warning
  }

  void b0(void *x)
  {
    a(NULL); // runtime assertion
  }

  void b(void *x)
  {
    a1(NULL); // compile error
  }

  void c0(void *x)
  {
    a0(x);
  }

  void c1(void *x)
  {
    a1(x);
  }

  void d0(void *x)
  {
    c0(NULL); // runtime assertion
  }

  void d1(void *x)
  {
    c1(NULL); // no compile error, no assertion!
  }

> I realize we'd probably want to add -fno-delete-null-pointer-checks if 
> we make too much use of that.


