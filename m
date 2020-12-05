Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2562CFC21
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 17:42:46 +0100 (CET)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kladx-0002dX-Ns
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 11:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaZC-00069E-2T
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klaZ9-0007Gb-EL
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 11:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607186264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VAtj6WwaTiG/TcASV4UKsHj9JUGTQf6t0vGLjt6ZDLw=;
 b=QmgPXi5eEcCrDJBJdHQltdndxROipo3bWN3CK7ki7RJdtcrFHey9lUhvHcMfWMO0+m6UX3
 Pw+jKwP6IiFF0fu5ZZ+Q+pJ/PKHjr9w1kw3lHCvhmmjInNEp5UJR/4VRtgKGKIQml4T6OG
 uFdEblDhDYiPpshWZPmtgezEt+Alf+E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-gDmFxMYxNMC2xqmJm6uvog-1; Sat, 05 Dec 2020 11:37:42 -0500
X-MC-Unique: gDmFxMYxNMC2xqmJm6uvog-1
Received: by mail-ed1-f70.google.com with SMTP id p17so3713647edx.22
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 08:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VAtj6WwaTiG/TcASV4UKsHj9JUGTQf6t0vGLjt6ZDLw=;
 b=pDGTr1dH1F9wVSqLf5IaizUPVgOQuLGpCt9xFlpqIdcQvTM4EfoOy0V5TrDaoN7t/p
 dO3F0brziX3/KMAS7sAHCEY4hdAddW9u95cMSpFy0VHxRVb3MLU1r6My+68ybv4qEl9i
 pXE4mcRdsbbotwVKnvMf8vweOeJyzPsq8ytyzUl8Za2TZqerMkU30RbFOZzbR13xfWjx
 aNGUmHtMoN+DOsqsflAsRyQNB0gi97mdLX+5dhlsb76gv4PaWrNYkpUfJ4RtI5Fg9c5d
 iiXI/Hro9f/f0sD06zGI8Oo/FUZc94z3uxPqOqhrqtnf2nWBdd1v+vQ3hhIK13AmXTAs
 Ruvg==
X-Gm-Message-State: AOAM531QHt7iGo2q3bgENCunzs3Dn1hhMLHfwIBf4TFDSnJ89yDJ6h2U
 I44FD2v9bbeNtfT+n4jzdZtNLxeo4oejnYBDUFJbPK0BhOO6146I6LGGhDXZ8Xep4DH2WZ7rr6x
 sE5MVnx2u5yMmjdM=
X-Received: by 2002:a17:906:7f01:: with SMTP id
 d1mr11972427ejr.429.1607186261653; 
 Sat, 05 Dec 2020 08:37:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj8TLxuZhvAAf2ymzxGQ2nXPsKqXHdXdBvkGXQ2DXqF+Q8WTWLdEH/u8eC8FBxuYY87eok7Q==
X-Received: by 2002:a17:906:7f01:: with SMTP id
 d1mr11972418ejr.429.1607186261483; 
 Sat, 05 Dec 2020 08:37:41 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k21sm6007603edq.26.2020.12.05.08.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Dec 2020 08:37:40 -0800 (PST)
Subject: Re: [RFC v8 14/27] cpu: Remove unnecessary noop methods
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20201205161518.14365-1-cfontana@suse.de>
 <20201205161518.14365-15-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0df31c17-0260-31e3-6081-3c2e3500eca1@redhat.com>
Date: Sat, 5 Dec 2020 17:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201205161518.14365-15-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 5:15 PM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  hw/core/cpu.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 576fa1d7ba..994a12cb35 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -199,15 +199,6 @@ static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
>      return target_words_bigendian();
>  }
>  
> -static void cpu_common_noop(CPUState *cpu)
> -{
> -}
> -
> -static bool cpu_common_exec_interrupt(CPUState *cpu, int int_req)
> -{
> -    return false;
> -}

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


