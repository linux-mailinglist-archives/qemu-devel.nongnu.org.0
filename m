Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D45939925E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:18:56 +0200 (CEST)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVSB-00007i-2i
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loVR0-0007bl-1o
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loVQv-0000es-G5
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622657856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahzsiWMZxojr9G4HDfeT3zH2J1bsBxHW/tNRfW/BP5w=;
 b=LQsjLbjZwQaYPvJUAMINrD1m2oToE5WFuA8HnSMgJGx1QcIb1eJyG+DdukUv+sz3H9nZGN
 CURFyw5wJMltg7L/Rd5FRJ5nDopDtMamoWIT4L5+570BCQsF0LNG/oD268cVbYJqf5nF38
 s2hzfxO1ukV33+0ymNnrqJ+VqOGbHpg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-sD8JBzulPx-0HSRgUK7_sA-1; Wed, 02 Jun 2021 14:17:34 -0400
X-MC-Unique: sD8JBzulPx-0HSRgUK7_sA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h23-20020aa7c5d70000b029038fed7b27d5so1847995eds.21
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ahzsiWMZxojr9G4HDfeT3zH2J1bsBxHW/tNRfW/BP5w=;
 b=jc0IGNRRPY38MWTl+/Wm4yLKiV/vhWJj8Tt97bA8LauwcU1fLoGYXeIzIgpWDyv/1M
 Tj/KfKUyJoDC75JT/wp9S8wGYTVhImPEI2EDzst3oWAm5Sb8GPPh+mQJNeLAifUIsQIe
 uPG1EZMLQ6KvcJe7l5rkrWpMlbTGJnesKvdiaTKblVZCV7/MGpk8tO0y0b1CM5s8d8PC
 l7z/j7CUbJjODcFRX8BIWY509HjUzcWtx0Pm2+JUkM4KNxZUowqtk7HA97V+Q864NV3e
 pzCR5iw15C6ixAtkITpfl6nCqrzp9NZYvUy3iJ6xJCvTHgVEzbuiClAH3u1M+jG6Bxhp
 p+fw==
X-Gm-Message-State: AOAM533Nw3AdIbMlL0jqhZsqIjDPyukR2wj67E4RWojEYyCawZnyEZb7
 DLutespza/An5KagCD61WR3k38iyYnDjA0P16Ozenw2VAkF2z1Zgs8UIJJNfq9DRFb3p1f4Fo4C
 Mq/rXLQLIJBJPuNQ=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr39471598edv.44.1622657851009; 
 Wed, 02 Jun 2021 11:17:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2oN509+nTdrCca9UrcwIHrB2+SWUokwV4NMe2lgeRHf0w3zhFoEIikLSFOFJUSFqEAwBiSQ==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr39471573edv.44.1622657850747; 
 Wed, 02 Jun 2021 11:17:30 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id v1sm341281ejw.117.2021.06.02.11.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 11:17:30 -0700 (PDT)
Subject: Re: [PATCH v8] qapi: introduce 'query-kvm-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210531123806.23030-1-valeriy.vdovin@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <266974fa-da6c-d0fc-ce12-6a7ce1752fa6@redhat.com>
Date: Wed, 2 Jun 2021 20:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531123806.23030-1-valeriy.vdovin@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Valeriy,

(Sorry for not looking earlier than v8)

On 5/31/21 2:38 PM, Valeriy Vdovin wrote:
> Introducing new qapi method 'query-kvm-cpuid'. This method can be used to
> get virtualized cpu model info generated by QEMU during VM initialization in
> the form of cpuid representation.
> 
> Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
> command line option. From there it takes the name of the model as the basis for
> feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
> that state if additional cpu features should be present on the virtual cpu or
> excluded from it (tokens '+'/'-' or '=on'/'=off').
> After that QEMU checks if the host's cpu can actually support the derived
> feature set and applies host limitations to it.
> After this initialization procedure, virtual cpu has it's model and
> vendor names, and a working feature set and is ready for identification
> instructions such as CPUID.
> 
> Currently full output for this method is only supported for x86 cpus.
> 
> To learn exactly how virtual cpu is presented to the guest machine via CPUID
> instruction, new qapi method can be used. By calling 'query-kvm-cpuid'
> method, one can get a full listing of all CPUID leafs with subleafs which are
> supported by the initialized virtual cpu.
> 
> Other than debug, the method is useful in cases when we would like to
> utilize QEMU's virtual cpu initialization routines and put the retrieved
> values into kernel CPUID overriding mechanics for more precise control
> over how various processes perceive its underlying hardware with
> container processes as a good example.
> 
> Output format:
> The output is a plain list of leaf/subleaf agrument combinations, that
> return 4 words in registers EAX, EBX, ECX, EDX.
> 
> Use example:
> qmp_request: {
>   "execute": "query-kvm-cpuid"
> }
> 
> qmp_response: [
>   {
>     "eax": 1073741825,
>     "edx": 77,
>     "in_eax": 1073741824,
>     "ecx": 1447775574,
>     "ebx": 1263359563,
>   },
>   {
>     "eax": 16777339,
>     "edx": 0,
>     "in_eax": 1073741825,
>     "ecx": 0,
>     "ebx": 0,
>   },
>   {
>     "eax": 13,
>     "edx": 1231384169,
>     "in_eax": 0,
>     "ecx": 1818588270,
>     "ebx": 1970169159,
>   },
>   {
>     "eax": 198354,
>     "edx": 126614527,
>   ....
> 
> Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>

---

> 
> v2: - Removed leaf/subleaf iterators.
>     - Modified cpu_x86_cpuid to return false in cases when count is
>       greater than supported subleaves.
> v3: - Fixed structure name coding style.
>     - Added more comments
>     - Ensured buildability for non-x86 targets.
> v4: - Fixed cpu_x86_cpuid return value logic and handling of 0xA leaf.
>     - Fixed comments.
>     - Removed target check in qmp_query_cpu_model_cpuid.
> v5: - Added error handling code in qmp_query_cpu_model_cpuid
> v6: - Fixed error handling code. Added method to query_error_class
> v7: - Changed implementation in favor of cached cpuid_data for
>       KVM_SET_CPUID2
> v8: - Renamed qmp method to query-kvm-cpuid and some fields in response.
>     - Modified documentation to qmp method
>     - Removed helper struct declaration
> ---

^ Below this '---' go your comments.

>  qapi/machine-target.json   | 43 ++++++++++++++++++++++++++++++++++++++
>  target/i386/kvm/kvm.c      | 37 ++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  3 files changed, 81 insertions(+)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..a83180dd24 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,46 @@
>  ##
>  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +
> +##
> +# @CpuidEntry:
> +#
> +# A single entry of a CPUID response.
> +#
> +# One entry holds full set of information (leaf) returned to the guest in response
> +# to it calling a CPUID instruction with eax, ecx used as the agruments to that
> +# instruction. ecx is an optional argument as not all of the leaves support it.
> +#
> +# @in_eax: CPUID argument in eax
> +# @in_ecx: CPUID argument in ecx
> +# @eax: eax
> +# @ebx: ebx
> +# @ecx: ecx
> +# @edx: edx
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuidEntry',
> +  'data': { 'in_eax' : 'uint32',
> +            '*in_ecx' : 'uint32',
> +            'eax' : 'uint32',
> +            'ebx' : 'uint32',
> +            'ecx' : 'uint32',
> +            'edx' : 'uint32'
> +          },
> +  'if': 'defined(TARGET_I386) && defined(CONFIG_KVM)' }

What about other accelerators?

> +
> +##
> +# @query-kvm-cpuid:
> +#
> +# Returns raw data from the KVM CPUID table for the first VCPU.
> +# The KVM CPUID table defines the response to the CPUID
> +# instruction when executed by the guest operating system.

What is specific to KVM here?

What about 'query-accel-cpuid' or 'query-vm-cpu-id'?

> +#
> +# Returns: a list of CpuidEntry
> +#
> +# Since: 6.1
> +##
> +{ 'command': 'query-kvm-cpuid',
> +  'returns': ['CpuidEntry'],
> +  'if': 'defined(TARGET_I386) && defined(CONFIG_KVM)' }
...
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index c98b78d033..48add3ada1 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -46,6 +46,7 @@ static int query_error_class(const char *cmd)
>          { "query-balloon", ERROR_CLASS_DEVICE_NOT_ACTIVE },
>          { "query-hotpluggable-cpus", ERROR_CLASS_GENERIC_ERROR },
>          { "query-vm-generation-id", ERROR_CLASS_GENERIC_ERROR },
> +        { "query-kvm-cpuid", ERROR_CLASS_GENERIC_ERROR },
>          { NULL, -1 }
>      };
>      int i;
> 


