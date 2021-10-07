Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002DA424C45
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 05:47:50 +0200 (CEST)
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYKNp-0007EQ-Jl
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 23:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYKL1-0005Yj-ER; Wed, 06 Oct 2021 23:44:55 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYKKy-00076q-On; Wed, 06 Oct 2021 23:44:55 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HPxxH0TX1z1DHHx;
 Thu,  7 Oct 2021 11:43:15 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:44:44 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:44:43 +0800
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
 <0343d17f-bb46-a266-7ba4-20bdf30631d0@redhat.com>
 <YVdCRYvRHIio6MZe@redhat.com>
 <afa63e10-2999-4073-e440-a5d87fd6da49@redhat.com>
 <87bl47ll9l.fsf@dusky.pond.sub.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0c458d28-563a-1c12-3b9e-2fd86ae576a6@huawei.com>
Date: Thu, 7 Oct 2021 11:44:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87bl47ll9l.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>, Pankaj
 Gupta <pankaj.gupta.linux@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/2 19:27, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> On 01/10/21 19:15, Daniel P. Berrangé wrote:
>>> On Fri, Oct 01, 2021 at 07:08:51PM +0200, Paolo Bonzini wrote:
>>>> On 29/09/21 04:58, Yanan Wang wrote:
>>>>> @@ -933,8 +935,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>>>>>             return;
>>>>>         }
>>>>> -    smp_parse(ms, config, errp);
>>>>> -    if (*errp) {
>>>>> +    if (!smp_parse(ms, config, errp)) {
>>>>>             qapi_free_SMPConfiguration(config);
>>>>>         }
>>>>>     }
>>>>>
>>>> This is actually a leak, so I'm replacing this patch with
>>> This patch isn't adding a leak, as there's no change in
>>> control flow / exit paths.  AFAICT, the leak was introduced
>>> in patch 15 instead, so the code below shoudl be squashed
>>> into that, and this patch left as-is.
>> Yes, even better make it a separate patch and fix the conflict in patch
>> 15.  But I'm still not sure of the wisdom of this patch.
>>
>> At this point smp_parse has exactly one caller and it doesn't care about
>> the return value.  The "return a boolean" rule adds some complexity (and
>> a possibility for things to be wrong/inconsistent) to the function for
>> the benefit of the callers.
> Yes, but returning something is only a minor burden.  It also makes
> success vs. failure obvious at a glance.
>
> I'm not worrying about inconsistency anymore.  In a way, void functions
> are an exception.  Many non-void functions return a distinct error value
> on failure, like NULL.  The only kind of inconsistency I can remember
> seeing in these functions is forgetting to set an error.  Can be screwed
> up in a void function just as easily.
>
>>                               If there is only one caller, as is the case
>> here or for virtual functions, the benefit can well be zero (this case)
>> or negative (virtual functions).
> Two small benefits here:
>
> 1. No need for ERRP_GUARD().
>
> 2. Conforms to the rules.  Rules are not laws, but let's stick to them
> when it's as easy as it is here.
>
> For what it's worth, GLib always advised users of GError to return a
> value.  We chose to deviate for our Error, then spent nine years
> learning how that leads to cumbersome code, leading us to:
>
> commit e3fe3988d7851cac30abffae06d2f555ff7bee62
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Tue Jul 7 18:05:31 2020 +0200
>
>      error: Document Error API usage rules
>      
>      This merely codifies existing practice, with one exception: the rule
>      advising against returning void, where existing practice is mixed.
>      
>      When the Error API was created, we adopted the (unwritten) rule to
>      return void when the function returns no useful value on success,
>      unlike GError, which recommends to return true on success and false on
>      error then.
>      
>      When a function returns a distinct error value, say false, a checked
>      call that passes the error up looks like
>      
>          if (!frobnicate(..., errp)) {
>              handle the error...
>          }
>      
>      When it returns void, we need
>      
>          Error *err = NULL;
>      
>          frobnicate(..., &err);
>          if (err) {
>              handle the error...
>              error_propagate(errp, err);
>          }
>      
>      Not only is this more verbose, it also creates an Error object even
>      when @errp is null, &error_abort or &error_fatal.
>      
>      People got tired of the additional boilerplate, and started to ignore
>      the unwritten rule.  The result is confusion among developers about
>      the preferred usage.
>      
>      Make the rule advising against returning void official by putting it
>      in writing.  This will hopefully reduce confusion.
>      
>      Update the examples accordingly.
>      
>      The remainder of this series will update a substantial amount of code
>      to honor the rule.
>      
>      Signed-off-by: Markus Armbruster <armbru@redhat.com>
>      Reviewed-by: Eric Blake <eblake@redhat.com>
>      Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>      Reviewed-by: Greg Kurz <groug@kaod.org>
>      Message-Id: <20200707160613.848843-4-armbru@redhat.com>
>      [Tweak prose as per advice from Eric]
>
Hi,

Thanks for the fix, Paolo!

I notice that with Paolo's fix applied first and then Patch15 removing
the sanity checks out, machine_set_smp() at last simply becomes:

static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
{
     MachineState *ms = MACHINE(obj);
     g_autoptr(SMPConfiguration) config = NULL;

     if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
return;
}

     smp_parse(ms, config, errp);
}

It looks good currently, neither the returned boolean nor the errp needs to
be checked here now, and smp_parse is only called here. So in this case,
we may avoid the boolean until we need to use it and honor the rule. :）

Thanks,
Yanan


