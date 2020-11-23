Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80ED2C0E55
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:04:14 +0100 (CET)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDO1-0002nI-VA
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khDMQ-0001w6-Ge
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:02:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:59050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khDMK-0008Us-7K
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:02:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33623ADD6;
 Mon, 23 Nov 2020 15:02:26 +0000 (UTC)
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
 <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
 <20201118173055.GM1509407@habkost.net>
 <e7b70933-acd1-668c-62cd-89f480945f0f@redhat.com>
 <20201118220750.GP1509407@habkost.net>
 <2984625a-15ee-f638-b1bb-050a4514bade@suse.de>
 <20201120171942.GA2271382@habkost.net>
 <f780a9e5-2142-3bf4-b3fb-1bdeeed61945@suse.de>
 <20201120180936.GD2271382@habkost.net>
 <a32dbea4-8381-d247-3443-441b484d39e3@suse.de>
 <3e8fac27-aea5-5f5d-5421-291df660a586@suse.de>
 <bd5d6bd7-a4a0-9f38-94ca-14f39e538e70@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <de219743-6605-8514-b54d-9e70f24a09c8@suse.de>
Date: Mon, 23 Nov 2020 16:02:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bd5d6bd7-a4a0-9f38-94ca-14f39e538e70@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Cameron Esfahani <dirty@apple.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Dario Faggioli <dfaggioli@suse.com>,
 Olaf Hering <ohering@suse.de>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 2:18 PM, Paolo Bonzini wrote:
> On 23/11/20 10:55, Claudio Fontana wrote:
>> One idea that came to mind is, why not extend accel.h to user mode?
>>
>> It already contains
>>
>> #ifndef CONFIG_USER_ONLY
>>
>> parts, so maybe it was meant to be used by both, and just happened to
>> end up confined to include/softmmu ?
>>
>> Basically I was thinking, we could have an AccelState and an
>> AccelClass for user mode as well (without bringing in the whole
>> machine thing), and from there we could use current_accel() to build
>> up the right name for the chosen accelerator?
> 
> Yes, extending the accelerator class to usermode emulation is certainly 
> a good idea.
> 
> Paolo
> 

Thanks, I'll work on this option.

Btw considering that CpusAccel for tcg is actually three different interfaces (for mttcg, for icount, and plain RR),
it will be tough to, in the stated objective, "remove all conditionals", even after removing the tcg_enabled().

I wonder how you see this issue (patches for 3 TCG split are in Richard's queue atm).

static void tcg_accel_cpu_init(void)
{
    if (tcg_enabled()) {
        TCGState *s = TCG_STATE(current_accel());

        if (s->mttcg_enabled) {
            cpus_register_accel(&tcg_cpus_mttcg);
        } else if (icount_enabled()) {
            cpus_register_accel(&tcg_cpus_icount);
        } else {
            cpus_register_accel(&tcg_cpus_rr);
        }
    }
}

Ciao,

Claudio

