Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA5218FC0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 20:35:17 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtEua-0002Zp-BU
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 14:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jtEtY-000279-Bh
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 14:34:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:51244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jtEtW-0004j0-5j
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 14:34:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77A27AC7A;
 Wed,  8 Jul 2020 18:34:08 +0000 (UTC)
Subject: Re: [PULL 00/53] Misc patches for QEMU 5.1 soft freeze
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200706164155.24696-1-pbonzini@redhat.com>
 <CAFEAcA-F1FGde+=c3iS3wcRWG+i0RgYj5-jwafn0sX6EEYEsWA@mail.gmail.com>
 <1a9ad36f-f4ae-2ea5-3d69-03aa5580b60e@suse.de>
 <de27589f-6afb-b8cf-05a0-f5d34f9d2a58@redhat.com>
 <f17ca47d-f5e9-e710-5edb-9d92839ee7c1@suse.de>
 <56c7e153-e47b-aa5c-80c0-ab4f5c3d85e8@redhat.com>
 <57c79f36-4cf9-6188-ef40-b4f775add83d@suse.de>
 <0a3ab45d-468a-65f2-5b9d-440a0a950ded@suse.de>
Message-ID: <02473efb-4408-5124-8b83-5a258298bd33@suse.de>
Date: Wed, 8 Jul 2020 20:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0a3ab45d-468a-65f2-5b9d-440a0a950ded@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:20:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/20 8:25 PM, Claudio Fontana wrote:
> On 7/8/20 7:03 PM, Claudio Fontana wrote:
>> On 7/8/20 6:55 PM, Paolo Bonzini wrote:
>>> On 08/07/20 18:45, Claudio Fontana wrote:
>>>> C++ is used to link the final qemu-system binary and on my system c++ has LTO:
>>>>
>>>> c++ -v
>>>> Using built-in specs.
>>>> COLLECT_GCC=c++
>>>> COLLECT_LTO_WRAPPER=/usr/lib64/gcc/x86_64-suse-linux/7/lto-wrapper
>>>> OFFLOAD_TARGET_NAMES=hsa:nvptx-none
>>>> Target: x86_64-suse-linux
>>>> Configured with: ../configure --prefix=/usr --infodir=/usr/share/info
>>>> --mandir=/usr/share/man --libdir=/usr/lib64 --libexecdir=/usr/lib64
>>>> --enable-languages=c,c++,objc,fortran,obj-c++,ada,go
>>>> --enable-offload-targets=hsa,nvptx-none=/usr/nvptx-none,
>>>> --without-cuda-driver --enable-checking=release --disable-werror
>>>> --with-gxx-include-dir=/usr/include/c++/7 --enable-ssp --disable-libssp
>>>> --disable-libvtv --disable-libcc1 --disable-plugin
>>>> --with-bugurl=https://bugs.opensuse.org/ --with-pkgversion='SUSE Linux' --with-slibdir=/lib64 --with-system-zlib --enable-libstdcxx-allocator=new --disable-libstdcxx-pch --enable-version-specific-runtime-libs --with-gcc-major-version-only --enable-linker-build-id --enable-linux-futex --enable-gnu-indirect-function --program-suffix=-7 --without-system-libunwind --enable-multilib --with-arch-32=x86-64 --with-tune=generic --build=x86_64-suse-linux --host=x86_64-suse-linux
>>>> Thread model: posix
>>>> gcc version 7.5.0 (SUSE Linux) 
>>>>
>>>>
>>>> I checked cc but did not think to check c++ . I will find a way to disable this thing and will correct the patch accordingly.
>>>
>>> Having LTO support is not the same thing as having it enabled.  Are you
>>> compiling and linking with "-flto"?
>>>
>>> Paolo
>>>
>>
>> no, the compilation and link stage do not show this explicit parameter. I am puzzled.
>>
>> C
>>
> 
> This is really weird, as I cannot reproduce it.
> 
> What I did notice is that all the code that directly or indirectly uses the functions is under an
> 
> if (0) (
> )
> 
> since tcg_enabled is the constant 0.
> 
> By "indirectly" I mean that the static void qemu_tcg_cpu_thread_fn() function that calls those is referenced only by static void qemu_tcg_init_vcpu(), which is called only under an if (0),
> ie if (tcg_enabled()).
> 
> For me this builds with --disable-tcg and with --enable-tcg .
> 
> Maybe the issue is actually the name clash of the stub and the module?
> 
> I admit I am not familiar with the rationale of why the stubs are all built regardless, could we have that icount.o from stubs/ is replacing softmmu/icount.o to cause this?
> 
> Thanks,
> 
> Claudio
> 
> 

So I guess if you could Peter, are you building there with --disable-tcg or with --enable-tcg  when you got that error?

Ciao,

Claudio


