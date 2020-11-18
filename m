Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA92B7FD3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:52:56 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOpL-0000dK-Ag
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfOoL-0000AG-Eg
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfOoI-0005Rw-BO
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605711109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Av3K8S9Vp7lc5Y177lYuymzuRNwqGzVGRl1qACaf+tw=;
 b=AxlkN+86XRrMm9Xb8/EX2u4PD1Q4VFo5MEP44nj8+qWLgqb/Qm1iYc5jWGikmITLpxwSSg
 XCMGfqc5UgsYlBbbvx3wg3sY+az9zHIo+n39VCxuE/JSJ+2ORZtLtyQC3biNow8BPZW60j
 ch47NZwwiGfjlLFK93ri0jlBGLFZoMM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-N3t-kUt9O2K3DRDRMTGuZA-1; Wed, 18 Nov 2020 09:51:48 -0500
X-MC-Unique: N3t-kUt9O2K3DRDRMTGuZA-1
Received: by mail-ej1-f69.google.com with SMTP id m3so939573eja.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 06:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Av3K8S9Vp7lc5Y177lYuymzuRNwqGzVGRl1qACaf+tw=;
 b=jEdPEnkKlfeSlc/4VzvoRoBga1pk/WByMKyHWUcNCPSQpuAFEkgWLpWNz985n/SZM7
 Q97D8n0EuoEZEJYGzlR7ZHVUmDuN95UiobaIbFf15/wsgrmTVZUBYiGZSMeFjLGBFU4t
 TYOUEYNYEFC1J2I0HpLOfcNX9tKj1Vg4CvU2YlV3MQnTakuY3oeaLZ14QJulzUJ1iFzJ
 mUicWATW/FBCf0IXT5r3Qri7TC/r9CApswDkLENmylCBOxOePpsQya/YsD2ATSFFHVay
 AN7QOwb3oWJcFRitK0qSlACq7UftH9DufXLkGE107KIqkSEX1Hvdq4TUx7RpSbzCjBBE
 +nRg==
X-Gm-Message-State: AOAM532D77WLrMVnUexJi8yPgZz1ayva6GdHemGRI76lR9mS6MAcjTsH
 rhEyjVb0y+Z86b3kXXSsUKYwR1e1C1IAFceNwsj0ewP4YPBBklzWsIFE8XHYJ4iDViBvC2JSFJf
 UiPA8IEldWFaEjzk=
X-Received: by 2002:a17:906:e53:: with SMTP id
 q19mr24990670eji.254.1605711106856; 
 Wed, 18 Nov 2020 06:51:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/j47iivccdl31v2Rf9pQ81i7S628Oq1ujDTIGYOXJXwJrUouX4CZdWbnlIG1B/3Q0fHaN0A==
X-Received: by 2002:a17:906:e53:: with SMTP id
 q19mr24990635eji.254.1605711106614; 
 Wed, 18 Nov 2020 06:51:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q15sm13289063edt.95.2020.11.18.06.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 06:51:45 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
Message-ID: <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
Date: Wed, 18 Nov 2020 15:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118143643.GF1509407@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Olaf Hering <ohering@suse.de>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 15:36, Eduardo Habkost wrote:
> On Wed, Nov 18, 2020 at 03:05:42PM +0100, Paolo Bonzini wrote:
>> On 18/11/20 14:48, Claudio Fontana wrote:
>>> On 11/18/20 1:48 PM, Eduardo Habkost wrote:
>>>> I don't get why we would use a new module initialization level
>>>
>>> To have a clear point in time after which all accelerator interface initialization is done.
>>> It avoids to have to hunt down the registration points spread around the code base.
>>> I'd turn it around, why not?
>>
>> I see two disadvantages:
>>
>> 1) you have to hunt down accel_cpu_inits instead of looking at accelerator
>> classes. :)
>>
>> 2) all callbacks have an "if (*_enabled())" around the actual meat. Another
>> related issue is that usually the module_call_init are unconditional.
>>
>> I think the idea of using module_call_init is good however.  What about:
>>
>> static void kvm_cpu_accel_init(void)
>> {
>>      x86_cpu_accel_init(&kvm_cpu_accel);
> 
> What do you expect x86_cpu_accel_init() to do?

I don't know, the same that it was doing in Claudio's patches. :)

He had

	if (kvm_enabled()) {
	    x86_cpu_accel_init(&kvm_cpu_accel);
	}

and I'm calling only the function that is registered on the enabled 
accelerator.

> I don't understand why a separate module init level is necessary
> here.

Because you must call accel_register_call after the TYPE_KVM type has 
been registered, or object_class_by_name fails:

void
accel_register_call(const char *qom_type, void (*fn)(void))
{
     AccelClass *acc = ACCEL_CLASS(object_class_by_name(qom_type));

     acc->setup_calls = g_slist_append(acc->setup_calls, (void *)fn);
}

The alternative is to store the (type, function) tuple directly, with 
the type as a string.  Then you can just use type_init.

> Making sure module_call_init() is called at the correct moment is
> not easier or safer than just making sure accel_init_machine()
> (or another init function you create) is called at the correct
> moment.

Since there is a way to do it without a new level, that would of course 
be fine for me too.  Let me explain however why I think Claudio's design 
had module_call_init() misplaced and what the fundamental difference is. 
  The basic phases in qemu_init() are:

- initialize stuff
- parse command line
- create machine
- create accelerator
- initialize machine
- create devices
- start

with a mess of other object creation sprinkled between the various 
phases (but we don't care about those).

What I object to, is calling module_call_init() after the "initialize 
stuff" phase.  Claudio was using it to call the function directly, so it 
had to be exactly at "create accelerator".  This is different from all 
other module_call_init() calls, which are done very early.

With the implementation I sketched, accel_register_call must still be 
done after type_init, so there's still an ordering constraint, but all 
it's doing is registering a callback in the "initialize stuff" phase.

Thanks,

Paolo


