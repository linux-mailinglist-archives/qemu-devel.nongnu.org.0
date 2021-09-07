Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF80402345
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 08:15:00 +0200 (CEST)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNUNn-0001kY-4C
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 02:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNUMx-00014l-WE
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNUMu-0005nc-Ob
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630995242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muR2fYNglk1WsXLJWum4axKQ25Y306tpO6ooVuXZpVY=;
 b=gJB8HW9RXSKsT+e7Us+XSC3ZCrpuZSo4UmU7eJJkkFbDSgW3b61pojAwzTTBFqoKqleMK3
 WW34gT4rqMOenyaUaJaC5PHThOwInQE8qGWlBtIA8H2128saoEXTJzYl7vCUs8WvRROXWK
 S76raRgDfqIuoH1s0nMLWSURhUt35YY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-VyCGKecbN7axS0SjQuzlfA-1; Tue, 07 Sep 2021 02:14:01 -0400
X-MC-Unique: VyCGKecbN7axS0SjQuzlfA-1
Received: by mail-wm1-f71.google.com with SMTP id
 s197-20020a1ca9ce000000b002e72ba822dcso710715wme.6
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 23:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=muR2fYNglk1WsXLJWum4axKQ25Y306tpO6ooVuXZpVY=;
 b=skvvUuprdkjCjV42KkApySoPK3fixEDTk7M3snk0XMcMPXv5it6CfsFTvFqPKhvodV
 6+ohDBOVoiyoKmcz6SIZJRAEpk0zhDgfRasNmN1xzcaptbaJgXsT7tyyEU6zUcRjYUDu
 lrmvHpiONQvpRewiofqmL5TaFvpD/KbHNhB/ghWMJOd/PWXw/3t/qVoTfU13k/68V0Yo
 1fpQ/qp3y2AZkUMMoFEAJcIe/ex2BkrMhXAD/aeUWLOGn3zrek1FMdvPDgE6OAX8AGRv
 cizFdJKCAqLhdrgAEOVyvpVRu9Zc7tDrMOUtP/DVoPs7YtwMmuVCY5scC42IQ9eW9oKE
 y6wQ==
X-Gm-Message-State: AOAM531onugV9wS+S23yqjd2CMReeX1Kdkt6dCKbZa2m3EywfQ5dyzs3
 eqdAzZxzKQZ7xSOVR9J1eq9e8WpxlE8isfHAM38EcxSY1ycRoWnlx/Uk1uRXOmt4A0xb0ohQ+zr
 L4G4JNMJNMAr9vP4=
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr2237013wrx.221.1630995240481; 
 Mon, 06 Sep 2021 23:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMQ9krHS7RjDORLfvqH8fJ1UxD5NLpU4S0tI8e7muQR/wIo7hya18xxZE0oPhMocf00tg4JQ==
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr2236991wrx.221.1630995240254; 
 Mon, 06 Sep 2021 23:14:00 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id c15sm1371358wmr.8.2021.09.06.23.13.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 23:13:59 -0700 (PDT)
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: Ani Sinha <ani@anisinha.ca>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
 <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
 <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
 <CAARzgwzkMPwgwbbSnHGH5yLF=mbr7_z1zpKTjbVkg6rgpX4MfA@mail.gmail.com>
 <CAARzgwxXCJ_a4Z-x0Bc_4PV_pEScxr2fp0cMxRf49BiZUvQ9dA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <81639a95-654b-9064-de24-347561b6783e@redhat.com>
Date: Tue, 7 Sep 2021 08:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAARzgwxXCJ_a4Z-x0Bc_4PV_pEScxr2fp0cMxRf49BiZUvQ9dA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 7:55 AM, Ani Sinha wrote:
> On Mon, Sep 6, 2021 at 4:19 PM Ani Sinha <ani@anisinha.ca> wrote:
>>
>> On Mon, Sep 6, 2021 at 3:54 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> On 9/6/21 12:03 PM, Ani Sinha wrote:
>>>> On Mon, 6 Sep 2021, Philippe Mathieu-Daudé wrote:
>>>>> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
>>>>>> From: Ani Sinha <ani@anisinha.ca>
>>>>>>
>>>>>> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
>>>>>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
>>>>>> This brings in support for whole lot of subsystems that some targets like
>>>>>> mips does not need. They are added just to satisfy symbol dependencies. This
>>>>>> is ugly and should be avoided. Targets should be able to pull in just what they
>>>>>> need and no more. For example, mips only needs support for PIIX4 and does not
>>>>>> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
>>>>>> etc. This change is an effort to clean this up.
>>>>>> In this change, new config variables are added for various acpi hotplug
>>>>>> subsystems. Targets like mips can only enable PIIX4 support and not the rest
>>>>>> of all the other modules which were being previously pulled in as a part of
>>>>>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
>>>>>> are not required by mips (for example, symbols specific to pci hotplug etc)
>>>>>> are available to satisfy the dependencies.
>>>>>>
>>>>>> Currently, this change only addresses issues with mips malta targets. In future
>>>>>> we might be able to clean up other targets which are similarly pulling in lot
>>>>>> of unnecessary hotplug modules by enabling ACPI_X86.
>>>>>>
>>>>>> This change should also address issues such as the following:
>>>>>> https://gitlab.com/qemu-project/qemu/-/issues/221
>>>>>> https://gitlab.com/qemu-project/qemu/-/issues/193
>>>>>
>>>>> FYI per https://docs.gitlab.com/ee/administration/issue_closing_pattern.html
>>>>> this should have been:
>>>>>
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
>>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
>>>>>
>>>>
>>>> Ah my apologies. Will do this next time.
>>>>
>>>>> Can we close these issues manually?
>>>>
>>>> Since both you and I have verified that those issues gets fixed with my
>>>> change, yes we can close them. I do not have a gitlab account. Should I
>>>> have one? Is there special permissions needed to handle these tickets?
>>>
>>> Since you are listed in the MAINTAINERS file, long-term you'll
>>> eventually use it anyway (i.e. to run the CI pipelines before sending
>>> patches, to subscribe to the 'ACPI' label to get notifications or
>>> comment ACPI-related issues).
>>>
>>> The process is quite straight-forward, once having an account you
>>> simply request to be member of the project via the WebUI then you
>>> can help triaging the issues (and closing these two).
>>
>> Hmm. I created an account and added a comment to the tickets. However
>> I am unable to close them. I requested access to the project.
> 
> I could be wrong, but I think only reporters can open and close bugs
> like yourself on gitlab.

Hmm it is unclear who can close an issue, per:
https://docs.gitlab.com/ee/user/permissions.html#project-members-permissions

Let's wait until you get added to the project as a member: I assume
you are currently 'guest' and would become 'reporter'.


