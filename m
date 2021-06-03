Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494239A332
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:30:12 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looMD-0003nq-Dz
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1looGq-0001Ib-FL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:24:28 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1looGo-0006qb-BR
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:24:28 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F175219E0;
 Thu,  3 Jun 2021 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622730265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbjClczC5gLA40sfe00ZY+sFYsbC5ZyzMkvNM/TuESQ=;
 b=QtkRLvg20PZ7YGn5NdiCEJqPNf/Zv4bL7TFdEkY/JxW421v/6SjTYeMzpQJWDR8yeQ/n0B
 IXN/AKOLFp0q0dE3YTa/BNyMttqWLdwzjxcHUQqrh0isc6WUrEbF+Oa2zrr8ij5s4/qjBR
 tdd0CqmYVRj/rMGSry9xqlxnZn7wdFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622730265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbjClczC5gLA40sfe00ZY+sFYsbC5ZyzMkvNM/TuESQ=;
 b=Sh/r/huz0fYA2VtYIU9Uh3QGx7jUNzl5QyUDMS/jCGiulDIPzy6ilhGFDHeW63qb9Dhi5D
 7yxfes146ZMYyVAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8E6E0118DD;
 Thu,  3 Jun 2021 14:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622730265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbjClczC5gLA40sfe00ZY+sFYsbC5ZyzMkvNM/TuESQ=;
 b=QtkRLvg20PZ7YGn5NdiCEJqPNf/Zv4bL7TFdEkY/JxW421v/6SjTYeMzpQJWDR8yeQ/n0B
 IXN/AKOLFp0q0dE3YTa/BNyMttqWLdwzjxcHUQqrh0isc6WUrEbF+Oa2zrr8ij5s4/qjBR
 tdd0CqmYVRj/rMGSry9xqlxnZn7wdFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622730265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbjClczC5gLA40sfe00ZY+sFYsbC5ZyzMkvNM/TuESQ=;
 b=Sh/r/huz0fYA2VtYIU9Uh3QGx7jUNzl5QyUDMS/jCGiulDIPzy6ilhGFDHeW63qb9Dhi5D
 7yxfes146ZMYyVAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id R/s+IBjmuGDDSQAALh3uQQ
 (envelope-from <cfontana@suse.de>); Thu, 03 Jun 2021 14:24:24 +0000
Subject: Re: [PATCH v2 0/2] Fixes for "Windows fails to boot"
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Siddharth Chandrasekaran <sidcha@amazon.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20210603123001.17843-1-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1da75e95-1255-652e-1ca3-d23a8f6bf392@suse.de>
Date: Thu, 3 Jun 2021 16:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210603123001.17843-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:29 PM, Claudio Fontana wrote:
> v1 -> v2:
>  * moved hyperv realizefn call before cpu expansion (Vitaly)
>  * added more comments (Eduardo)
>  * fixed references to commit ids (Eduardo)
> 
> The combination of Commits:
> f5cc5a5c ("i386: split cpu accelerators from cpu.c"...)                                                                              
> 30565f10 ("cpu: call AccelCPUClass::cpu_realizefn in"...) 
> 
> introduced two bugs that break cpu max and host in the refactoring,
> by running initializations in the wrong order.
> 
> This small series of two patches is an attempt to correct the situation.
> 
> Please provide your test results and feedback, thanks!
> 
> Claudio
> 
> Claudio Fontana (2):
>   i386: reorder call to cpu_exec_realizefn in x86_cpu_realizefn
>   i386: run accel_cpu_instance_init as instance_post_init
> 
>  target/i386/cpu.c         | 89 +++++++++++++++++++++++++--------------
>  target/i386/kvm/kvm-cpu.c | 12 +++++-
>  2 files changed, 68 insertions(+), 33 deletions(-)
> 

Btw, CI/CD is all green, but as mentioned, it does not seem to catch these kind of issues.

https://gitlab.com/hw-claudio/qemu/-/pipelines/314286751

C.


