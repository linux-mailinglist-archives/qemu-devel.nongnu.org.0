Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344082C31C5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 21:14:34 +0100 (CET)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khehs-0004IA-NU
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 15:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khego-0003rD-LH
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:13:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khegm-0002Xw-IY
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 15:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8W23uE0DOiPKkKhPCIebKvWTh4Tsa8T1QoJh/pOWp0=;
 b=fjNJVDTxdnd5U+/dXQXRePS7JLp46JbnZEQHXYW6ZmHVMe0yYLHlLFu19XK+unnPUa4YqJ
 xOO681WVhYc7yYNo8IceXUYJ0W6IEuQmq7tv7omvWG4eIf3SE7ghpuSFtL3g68ax6NNebB
 Le8GgihfDLRY0OsnMM3gfb7IG/2xxk8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-Wo5wfqbnMxyoMxbQS8UZ-g-1; Tue, 24 Nov 2020 15:13:16 -0500
X-MC-Unique: Wo5wfqbnMxyoMxbQS8UZ-g-1
Received: by mail-ej1-f70.google.com with SMTP id a9so36120ejy.22
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 12:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A8W23uE0DOiPKkKhPCIebKvWTh4Tsa8T1QoJh/pOWp0=;
 b=XRvFI0M5MMN1DiRAz2yRjhCo+8pArluJyHytpFZeLYo1zbIg/kAUi2C4xPwwE4uY3w
 HfGQo3lXKB5jfVuK4SSSxgOkv7193z35GReMg1jauF3nHbl+z6HdZ9k2ALtGN/ei+v/I
 wPYcT8+VkFK1OjU56xJ6v/4RuQr3uSnSyaZE8ywEkTS4e74BXZ06/1Yu4nXHdRQiJ5Pv
 Q0c0pbn4OGYcjZuYHaweeppsiX5YXZJ663Et4n9nE0C6MtLNVnVHGcdfUNwXu4b4TAb5
 6hhIWReX5hDgmsmhii1Y5deL+KeYXwkHnCvAtGvbh8FoL+/9VVuqeAFo4pxSpWCdICAA
 +p4A==
X-Gm-Message-State: AOAM532mGJw7iuzp5U2MGjP3jsWgF1AxAE/rsdkALKgumavjYvmkvUKj
 PS5F3yV35vaF2rRy7/xuybPUWwH29S77MXfMtCrW/ly90KYKymCZK3d7EQpJxbrH2v2ZpwXbaTS
 FCecoHdb+hUM9gu8=
X-Received: by 2002:a17:906:82c4:: with SMTP id a4mr95277ejy.131.1606248795449; 
 Tue, 24 Nov 2020 12:13:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/NxX+OcvRwqWcGVE5iHASC/gcfFafsLrIyIw8v7qBWte336GK/hKMisAzIPuD4S8LRN8dSA==
X-Received: by 2002:a17:906:82c4:: with SMTP id a4mr95249ejy.131.1606248795285; 
 Tue, 24 Nov 2020 12:13:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u18sm7640749edd.60.2020.11.24.12.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 12:13:14 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Emilio G . Cota" <cota@braap.org>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-12-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v5 11/12] i386: centralize initialization of cpu accel
 interfaces
Message-ID: <7dc27df6-1c81-f8fb-3e56-aa6ffe9e8475@redhat.com>
Date: Tue, 24 Nov 2020 21:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124162210.8796-12-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/20 17:22, Claudio Fontana wrote:
> +static void x86_cpu_accel_init(void)
>  {
> -    X86CPUAccelClass *acc;
> +    const char *ac_name;
> +    ObjectClass *ac;
> +    char *xac_name;
> +    ObjectClass *xac;
>  
> -    acc = X86_CPU_ACCEL_CLASS(object_class_by_name(accel_name));
> -    g_assert(acc != NULL);
> +    ac = object_get_class(OBJECT(current_accel()));
> +    g_assert(ac != NULL);
> +    ac_name = object_class_get_name(ac);
> +    g_assert(ac_name != NULL);
>  
> -    object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, &acc);
> +    xac_name = g_strdup_printf("%s-%s", ac_name, TYPE_X86_CPU);
> +    xac = object_class_by_name(xac_name);
> +    g_free(xac_name);
> +
> +    if (xac) {
> +        object_class_foreach(x86_cpu_accel_init_aux, TYPE_X86_CPU, false, xac);
> +    }
>  }
> +
> +accel_cpu_init(x86_cpu_accel_init);

If this and cpus_accel_ops_init are the only call to accel_cpu_init, I'd 
rather make them functions in CPUClass (which you find and call via 
CPU_RESOLVING_TYPE) and AccelClass respectively.

Paolo


