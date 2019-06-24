Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710650BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 15:24:00 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfOwx-0007k8-Mo
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 09:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36083)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hfOw0-0006lq-NC
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hfOvy-0005Io-OR
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:23:00 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38804)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hfOvw-0005Fz-Qi
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:22:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so13915055wrs.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 06:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IxC5K3hKa9tC3R9rtfu9sMpXSzuWl/8E7PGxgNeSKhk=;
 b=YdqK9ra7qxqeW4ejZmJSs0mZ3XiI96oB151Z8PHcRvtF62Coq+X8knaI3zMiviS0Rh
 P8oCSFh7UUdlKewdLe6n2ngLEw+ERa/aYSkgQd9R6i5b+0O//XlNeW2UzylIxaMnp8S1
 29wBCsOgPuRnMUuD3H4Q93BZ/oCquN9guZrzX+gXV6bDfhBwWQKpWFY2DwMRQHWBFeFw
 7v89QCAbaNGd3n25qbz0NxAcCJv6QT1+bHCypPi2fribaCADKiMGxT7pe31cqx6aT77G
 6VTQ1EKn8tNVVyIaVRb9iUdG+VZ1ME3wEhZtSAHkga2HlfI+XDdc1PiA8HlQqpv5fhDy
 W+3Q==
X-Gm-Message-State: APjAAAWTPVERuVo7XDuNcQ1uA4/cxQqVnbw/d+852mhFFbHTqEqfXbRu
 aYxod7Vw903RpG8QxeEvXTmYMg==
X-Google-Smtp-Source: APXvYqwOW2FsjQkoFWKzWCGodDlMXmiJ2+sJ1oLOHfVQD84hwmB7kknvHHtRpf5wk3ICMz3j7Z6TCg==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr44585489wrx.300.1561382574920; 
 Mon, 24 Jun 2019 06:22:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7822:aa18:a9d8:39ab?
 ([2001:b07:6468:f312:7822:aa18:a9d8:39ab])
 by smtp.gmail.com with ESMTPSA id r5sm23973230wrg.10.2019.06.24.06.22.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 06:22:54 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20190624123835.28869-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c191c41f-a9a5-48de-2700-ed2065a9ee24@redhat.com>
Date: Mon, 24 Jun 2019 15:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190624123835.28869-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH] target/i386: fix feature check in
 hyperv-stub.c
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/19 14:38, Alex Bennée wrote:
> Commit 2d384d7c8 broken the build when built with:
> 
>   configure --without-default-devices --disable-user
> 
> The reason was the conversion of cpu->hyperv_synic to
> cpu->hyperv_synic_kvm_only although the rest of the patch introduces a
> feature checking mechanism. So I've fixed the KVM_EXIT_HYPERV_SYNIC in
> hyperv-stub to do the same feature check as in the real hyperv.c
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Roman Kagan <rkagan@virtuozzo.com>
> ---
>  target/i386/hyperv-stub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/hyperv-stub.c b/target/i386/hyperv-stub.c
> index fe548cbae2..0028527e79 100644
> --- a/target/i386/hyperv-stub.c
> +++ b/target/i386/hyperv-stub.c
> @@ -15,7 +15,7 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
>  {
>      switch (exit->type) {
>      case KVM_EXIT_HYPERV_SYNIC:
> -        if (!cpu->hyperv_synic) {
> +        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
>              return -1;
>          }
>  
> 

Queued, thanks.

Paolo

