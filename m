Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45522F5201
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:29:19 +0100 (CET)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzktS-0007r6-EQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzkrz-0007MV-83
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzkrv-0002uj-Qa
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610562461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMKKe6Y8ibf7/cwVFF7j0hjWm4biY1ZOge9XnwjBr7c=;
 b=YXPDmKEoaRtmHTJXiAkhK74D0IB4z5fTORcV+rqFpFDszIocWwfXZWR6oN0Dii2icZ29lm
 FnKYy+UE6KDnm6HDYeTzG8bE03QBvzCTanKFsux0Q3MHUo7sPnOFoEV3GT5rD0gxb3HWR0
 y/J4Lgeoyn/pcj3fUvGnEHtmT4Aj+rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-hNPZJ08uNgKGk58kGirrnw-1; Wed, 13 Jan 2021 13:27:38 -0500
X-MC-Unique: hNPZJ08uNgKGk58kGirrnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65960180A097;
 Wed, 13 Jan 2021 18:27:37 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF20F5D9EF;
 Wed, 13 Jan 2021 18:27:36 +0000 (UTC)
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <7e46ebaf-e54f-0154-4b93-4488ffecb600@redhat.com>
Date: Wed, 13 Jan 2021 13:27:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a56f2df6-867e-2542-734c-95c1ae3acf88@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 1:48 AM, Thomas Huth wrote:
> On 12/01/2021 23.37, John Snow wrote:
>> I wanted to know what the minimal setup required was to replicate the 
>> compilation instructions featured on 
>> https://www.qemu.org/download/#source
> [...]
>  >      pixman-devel \
> 
> pixman is only required for the softmmu and tools targets. If you just 
> build the linux-user targets, you can even get rid of this.
> 

Sure; the intent was to figure out what happens if you run the 
instructions from the website without explicitly disabling anything.

What will you get by default?

softmmu by default is probably a pretty reasonable thing to want to 
build, so I'd say pixman will have to stick around in our minimal 
dependency list for now; though if we were to translate this experiment 
to the website, it'd be worth noting that pixman is only required for 
some, but not all, binaries like you say.

(If there was some way to build softmmu without pixman by default, that 
would be pretty interesting, though. I suppose it would involve 
disabling all spice/vnc/graphics devices entirely? It doesn't seem 
tremendously important, but pixman does stick out as the lone very 
particular dependency for a minimal build.)

> [...]
>> Notes:
>>
>> - our configure file suggests bzip2 is an optional dependency (It's 
>> set to 'auto') but meson will error out if it is not present at 
>> configuration time:
>>
>>      ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found
> 
> IIRC it's required for compressing the edk2 firmware images, so if you 
> compile without x86 and arm, you don't need it. Maybe it would be good 
> to add a check for this to the configure script, too?
> 

It already is erroring out when meson runs, so I think it's probably 
fine. Just something to document.

>> - diffutils is required for the qapi-schema test, which runs at build 
>> time.
> 
> We should maybe add a check for "diff" to the configure script?
> 

It's in tests/qapi-schema/meson.build already, so I think it's sufficient.

>> - early on in the build process, an error "bash: find: command not 
>> found" can be seen, but it doesn't seem to cause a failure otherwise.
>>
>> - perl is not declared as a hard pre-requisite during configure time, 
>> but the build will error out if it is not present:
>>
>> [254/8314] Generating texture-blit-frag.h with a meson_exe.py custom 
>> command
>> FAILED: ui/shader/texture-blit-frag.h
>> /usr/bin/python3 /qemu-5.2.0/meson/meson.py --internal exe --capture 
>> ui/shader/texture-blit-frag.h -- /usr/bin/env perl 
>> /qemu-5.2.0/scripts/shaderinclude.pl ../ui/shader/texture-blit.frag
>> /usr/bin/env: ‘perl’: No such file or directory
> 
> shaderinclude.pl seems to be pretty small, maybe it could be rewritten 
> in python?
> 

Maybe; Paolo has replied to you as well, but this is just the first perl 
script that so happens to run. There might be others.

Drawing down on perl long-term is probably nice to do, but it's probably 
not a priority. For now, we have both perl and python as build 
dependencies. Let's document and move on.

>> - bash has to be installed explicitly. configure/meson do not check 
>> for it, but the build will fail if they aren't present.
> 
> IIRC we were able to compile without bash before the meson conversion, 
> just some parts like the iotests needed the bash (at least that's why we 
> have a check for bash in tests/check-block.sh for example). Where is it 
> failing now?
> 
>> - musl seems to work alright, but does throw a ton of warnings. I 
>> didn't actually run any tests, since they require more dependencies.
>>
>> - linux-user binaries can't be compiled because alpine's usage of 
>> musl; I didn't look much more closely.
> 
> There were some related patches on the list recently, look for the 
> "Alpine Linux build fix and CI pipeline" patch series.
> 

Glad to see someone else thought it would be worthwhile to support 
Alpine. There may be interesting use cases for building alpine QEMU 
containers that are configured for extremely particular use cases, to be 
deployed as a utility.

--js


