Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B92ADB84
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:21:08 +0100 (CET)
Received: from localhost ([::1]:33030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWOJ-0001WE-1s
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcW9K-0002jV-L9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:05:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcW9G-0004Vk-Tp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VCOkZwLsMU4ydbdx447S4qh3s3Gm6I+KGBAsbynidb8=;
 b=DuwOE72QPQD1nls9xE2SJEywQv/NeOtVnMGebaXMzlEobE5Nh2Y1qwHOAsCFp20rhxL56i
 pb9Adz4+tIRiuvEC0oX0K1x3oyDPq3X19IyHqyVEZTf/0sKtcfTixDlqo2HnlNcaScjgjx
 h1KM+TjqlybOamH0vJcT+9WHNwg9U0s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-OKUeCKv0POidWM2p0PZr4A-1; Tue, 10 Nov 2020 11:05:31 -0500
X-MC-Unique: OKUeCKv0POidWM2p0PZr4A-1
Received: by mail-ej1-f72.google.com with SMTP id yc22so1200457ejb.20
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VCOkZwLsMU4ydbdx447S4qh3s3Gm6I+KGBAsbynidb8=;
 b=j5akHE0nxDuUqIA63/nZQLiONapYtSrtE28VAZXVGFIhaNqfGbL802h8lU7r0Ho4am
 teZCSoTYZ8s3s9zqSuoGa/eocl2iHaIwEzWnMMUibSL4tmJdP0nVxd9jmSHL1gSs3RQ0
 zYxiwuG+09FnveetnDcMNODAasQ8V8IapI9c6cmewyVDeLrb8QOwfX12CgI/VyRagPI7
 9CLW54JWychkDaiuRTv6PMEixUNWRY3S2HmYJ8xuR5nJoJh6ER4CYgrNGCTw6DhTRoOK
 KYSmM3mFsH8N3y99V4srRyLK/5fobRq2GotK1KrXnge9GtVGKAfqQK9w66TOt7e/kzg7
 TKNQ==
X-Gm-Message-State: AOAM531SYnN5k237MDoowPFGSo6MBTtiAEMrKi4d0+iMgZX1VAm9+nFj
 6YthsEj/1cYd0CYw7kAu7qxKd6cvljc0dfb/KEEvJ+OreTuKmDXO09ASiFNwpvlIhL9rTlXZN/S
 xKApZ5lkkxaH5OP4=
X-Received: by 2002:a05:6402:181a:: with SMTP id
 g26mr22590297edy.8.1605024329985; 
 Tue, 10 Nov 2020 08:05:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxQeigU2A2S21hX6DgNB6hOFgVZMYhJVSA5d7rujMERBVlb0mQ1IbwwMWqnK/feE08ex3R8Q==
X-Received: by 2002:a05:6402:181a:: with SMTP id
 g26mr22590264edy.8.1605024329792; 
 Tue, 10 Nov 2020 08:05:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d11sm10848300edu.2.2020.11.10.08.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 08:05:28 -0800 (PST)
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
 <20201109180302.GB814975@redhat.com>
 <971cfde9-d24e-a3dc-6389-8a7c9e477f63@suse.de>
 <20201110100438.GF866671@redhat.com>
 <c4c56c06-7530-5705-9ce8-5eff8cf1a0d3@redhat.com>
 <20201110152314.GF5733@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8bc35f55-159f-5037-3355-12bf4fd48e74@redhat.com>
Date: Tue, 10 Nov 2020 17:05:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110152314.GF5733@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 16:23, Eduardo Habkost wrote:
> On Tue, Nov 10, 2020 at 11:41:46AM +0100, Paolo Bonzini wrote:
>> On 10/11/20 11:04, Daniel P. Berrangé wrote:
>>>
>>> ie, we should have one class hierarchy for CPU model definitions, and
>>> one class hierarchy  for accelerator CPU implementations.
>>>
>>> So at runtime we then get two object instances - a CPU implementation
>>> and a CPU definition. The CPU implementation object should have a
>>> property which is a link to the desired CPU definition.
>>
>> It doesn't even have to be two object instances.  The implementation can be
>> nothing more than a set of function pointers.
> 
> A set of function pointers is exactly what a QOM interface is.
> Could the methods be provided by a TYPE_X86_ACCEL interface type,
> implemented by the accel object?

I think we should not try yo implement interfaces conditionally (i.e. 
have TYPE_X86_ACCEL implemented only on qemu-system-{i386,x86_64} and 
not qemu-system-arm), even if technically the accel/ objects are 
per-target (specific_ss) rather than common.

Paolo


