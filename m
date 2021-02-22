Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A6B321E8D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:54:30 +0100 (CET)
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFPh-0005Rs-CO
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFHv-0007DP-CY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEFHs-0001oF-Bt
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3xauJaR66hfM3jitPOYh7RFO07zXJKYLcWPgDvmEWs=;
 b=PaUN9kSw/Dj9bhsaTEmJSH3renZze1rqu9xofHsz1Bk4bv5GDAqlrpjJNYCsX3BYGSDFhZ
 m7c5SY7jbZgxc81RmugyjdYZ0oYo0PhnUvJV5hhU1C6OjQil2OQbgfANzIRjCnu70NB4qb
 lwD+xdQbOsTT+a+bYmc0MfcawewiQSo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-p7F-mMs0O6qhJ6RDYtlEog-1; Mon, 22 Feb 2021 12:46:21 -0500
X-MC-Unique: p7F-mMs0O6qhJ6RDYtlEog-1
Received: by mail-ed1-f72.google.com with SMTP id u2so7392212edj.20
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a3xauJaR66hfM3jitPOYh7RFO07zXJKYLcWPgDvmEWs=;
 b=qVf8gwXr8qG7YXrn11zIEQa6Od3Ic5XbcanI7huP5ncggtYzoSExgw9k6r9AkBz2/t
 s33x4OO2I97JGRN1Jstx+PZR3Jg1PCLnCqkP6Qj3oHWUabTw4ckK2Tiq+upBT107GQub
 FqSdB2i2oXYqulFcXS3MKAkig2NF8njMZ0qLdRD9zymePxhbF5d1hpigAj8BSTvVtaMR
 Q+I17Y1FDvUlZt7771PRMP/WO8o8c8goGfrV3f00m1cR+U+WRKx9zq7KOebF6qe3QUcY
 obPpFPJhYLI31owpRYfMbNZVXzb9HdUsIa+GXjIyswqN6rFqU2/yKTSRoKcz6tOt/3Z0
 I3SA==
X-Gm-Message-State: AOAM530PJ8T6U7NKU47NockGcN/LQ1juCj9YOIqkU/LeZ5SuodHIpmRv
 xM/lossog289GOFYvplNgTlh9U1K/Je0glxS3ldxqOruJ/mk3XcfmYFczR6+iEGH973d87Ix2Xs
 b52EM0jWvZ/oiSn4=
X-Received: by 2002:a05:6402:17b6:: with SMTP id
 j22mr23112111edy.325.1614015978983; 
 Mon, 22 Feb 2021 09:46:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDAve+ys1o3Ix/SlRK4csT4W1S2Ma59p+Xf1UMouPtJ1ZRfjAz9b8cjfXQB2d67f6WzKBREw==
X-Received: by 2002:a05:6402:17b6:: with SMTP id
 j22mr23112063edy.325.1614015978791; 
 Mon, 22 Feb 2021 09:46:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s2sm8446265edt.35.2021.02.22.09.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:46:18 -0800 (PST)
Subject: Re: [PATCH v2 02/11] hw/boards: Introduce
 machine_class_valid_for_accelerator()
To: Cornelia Huck <cohuck@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-3-philmd@redhat.com>
 <20210222183400.0c151d46.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6ceff55c-6da4-e773-7809-de3be2f566ab@redhat.com>
Date: Mon, 22 Feb 2021 18:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222183400.0c151d46.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:34 PM, Cornelia Huck wrote:
> On Fri, 19 Feb 2021 18:38:38 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Introduce the valid_accelerators[] field to express the list
>> of valid accelators a machine can use, and add the
>> machine_class_valid_for_current_accelerator() and
>> machine_class_valid_for_accelerator() methods.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/boards.h | 24 ++++++++++++++++++++++++
>>  hw/core/machine.c   | 26 ++++++++++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>>
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 68d3d10f6b0..4d08bc12093 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>                                 const CpuInstanceProperties *props,
>>                                 Error **errp);
>>  
>> +/**
>> + * machine_class_valid_for_accelerator:
>> + * @mc: the machine class
>> + * @acc_name: accelerator name
>> + *
>> + * Returns %true if the accelerator is valid for the machine, %false
>> + * otherwise. See #MachineClass.valid_accelerators.
> 
> Naming confusion: is the machine class valid for the accelerator, or
> the accelerator valid for the machine class? Or either? :)

"the accelerator valid for the machine class".

Is this clearer?

"Returns %true if the current accelerator is valid for the
 selected machine, %false otherwise.

Or...

"Returns %true if the selected accelerator is valid for the
 current machine, %false otherwise.

How would look "either"?

The machine is already selected, and the accelerator too...

> 
>> + */
>> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name);
>> +/**
>> + * machine_class_valid_for_current_accelerator:
>> + * @mc: the machine class
>> + *
>> + * Returns %true if the accelerator is valid for the current machine,
>> + * %false otherwise. See #MachineClass.valid_accelerators.
> 
> Same here: current accelerator vs. current machine.
> 
>> + */
>> +bool machine_class_valid_for_current_accelerator(MachineClass *mc);
>> +
>>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>>  /*
>>   * Checks that backend isn't used, preps it for exclusive usage and
>> @@ -125,6 +143,11 @@ typedef struct {
>>   *    should instead use "unimplemented-device" for all memory ranges where
>>   *    the guest will attempt to probe for a device that QEMU doesn't
>>   *    implement and a stub device is required.
>> + * @valid_accelerators:
>> + *    If this machine supports a specific set of virtualization accelerators,
>> + *    this contains a NULL-terminated list of the accelerators that can be
>> + *    used. If this field is not set, any accelerator is valid. The QTest
>> + *    accelerator is always valid.
>>   * @kvm_type:
>>   *    Return the type of KVM corresponding to the kvm-type string option or
>>   *    computed based on other criteria such as the host kernel capabilities
>> @@ -166,6 +189,7 @@ struct MachineClass {
>>      const char *alias;
>>      const char *desc;
>>      const char *deprecation_reason;
>> +    const char *const *valid_accelerators;
>>  
>>      void (*init)(MachineState *state);
>>      void (*reset)(MachineState *state);
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 970046f4388..c42d8e382b1 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -518,6 +518,32 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
>>      nvdimms_state->persistence_string = g_strdup(value);
>>  }
>>  
>> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name)
>> +{
>> +    const char *const *name = mc->valid_accelerators;
>> +
>> +    if (!name) {
>> +        return true;
>> +    }
>> +    if (strcmp(acc_name, "qtest") == 0) {
>> +        return true;
>> +    }
>> +
>> +    for (unsigned i = 0; name[i]; i++) {
>> +        if (strcasecmp(acc_name, name[i]) == 0) {
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
>> +
>> +bool machine_class_valid_for_current_accelerator(MachineClass *mc)
>> +{
>> +    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
>> +
>> +    return machine_class_valid_for_accelerator(mc, ac->name);
>> +}
> 
> The implementation of the function tests for the current accelerator,
> so I think you need to tweak the description above?
> 
>> +
>>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>>  {
>>      QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
> 


