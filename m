Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594423445C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 13:00:32 +0200 (CEST)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1Sm4-0003e1-Py
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 07:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k1SlH-0003AJ-7u
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 06:59:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:49910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k1SlF-0005wD-DJ
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 06:59:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13059AD0B;
 Fri, 31 Jul 2020 10:59:49 +0000 (UTC)
Subject: Re: [PATCH 3/3] cpu-timers, icount: new modules
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20200629093504.3228-1-cfontana@suse.de>
 <20200629093504.3228-4-cfontana@suse.de>
 <aa45a793-35b1-d3bd-18a8-4c52ad888029@redhat.com>
 <f89f249d-dbc4-779b-5b53-fc408461f072@suse.de>
 <ecf5f26b-ce86-3e13-5c5c-567919433acb@redhat.com>
 <e9dca3d1-f52d-13ce-2d7d-66958bc15765@suse.de>
 <996dc455-548e-5964-9c87-f4abe5b63907@redhat.com>
 <146b0cf2-509b-6a48-e82b-b93740e4c60d@redhat.com>
 <e3cc11a4-8ba7-917a-844b-4f6ec69d140a@suse.de>
 <76aac4ac-40f5-4870-ed2b-bab8b68b0a64@redhat.com>
 <9630c685-0a37-a1e7-4614-9d692988a799@suse.de>
 <22228280-f3b4-3f64-d2ba-30cfc47c8b0d@redhat.com>
 <994492fd-5ae2-52e2-0864-7216ec9dae34@suse.de>
 <b4de7352-87ba-df4c-fdcd-dab4028cef61@redhat.com>
 <5a41a63f-8397-64d3-0839-6990e2965339@suse.de>
 <8aaa983a-c720-88f2-5ad4-b88078ef705e@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8ea42cd4-02ef-8c5b-7286-bc9db37deba9@suse.de>
Date: Fri, 31 Jul 2020 12:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8aaa983a-c720-88f2-5ad4-b88078ef705e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 02:10:23
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 haxm-team@intel.com, Wenchao Wang <wenchao.wang@intel.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/20 12:09 AM, Paolo Bonzini wrote:
> On 30/07/20 18:33, Claudio Fontana wrote:
>> One problem I noticed is that qemu_clock_get_ns is util/qemu-timer.c,
>> which is tools _and_ softmmu, while I tried to extract the
>> softmmu-only timer code in softmmu/cpu-timers.c,
> 
> Not all of it, only the VIRTUAL clock which is
> 
>         if (use_icount) {
>             return cpu_get_icount();
>         } else {
>             return cpu_get_clock();
>         }
> 
> and would be changed to something like
> 
> 	return cpu_get_virtual_clock();
> 
> In turn cpu_get_virtual_clock() is
> 
> 	return (accel_ops->cpu_get_virtual clock ?: cpu_get_clock)();
> 
> in the emulators, plus a stub that replaces stubs/cpu-get-icount.c and
> is just
> 
> 	return get_clock_realtime();
> 
> as in stubs/cpu-get-clock.c.
> 
> Paolo
> 
> 

works, hooking up cpu_get_ticks() also works.

qemu_start_warp_timer seems to make sense only for tcg/icount and not for qtest, which directly sets and warps the clock, is that right?

Would you want a start_warp_timer cpu accel interface that is actually useful only for tcg, to avoid if (icount_enabled()) { qemu_start_warp_timer()? }

Thanks,

Claudio

