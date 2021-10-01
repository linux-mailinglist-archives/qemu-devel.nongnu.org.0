Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B560741EE41
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:08:29 +0200 (CEST)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIH6-0004ny-PS
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWIAF-0006oo-7E
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWIA7-0000n4-0b
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633093273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/dp7NDqmqrinxlXHzDpqEriLso+oTPGr740OsKXtMg8=;
 b=IYXQgLOXCZ3aZ9fWx9E9l3DJJ2E2KLFG4GKH+NUEBt2wLXjXon2Kb+txa2C4KW//ney4bz
 +VAXBdjkAoX6C0MgHwtu8xr3nuQ+W8vXv1TDX5HAnH6j2APqc/SqukWr8bXRgAsUZ2Dm5n
 gE85ID2SNwPKpqLA/qN9Glfx1wslo40=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-f_pkI8VLPvCeX5_qSQzIzQ-1; Fri, 01 Oct 2021 09:01:12 -0400
X-MC-Unique: f_pkI8VLPvCeX5_qSQzIzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x23-20020a05600c21d700b0030d23749278so3702995wmj.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 06:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/dp7NDqmqrinxlXHzDpqEriLso+oTPGr740OsKXtMg8=;
 b=vzXoXEwnPRNQU0eo0E3x+7nTXEkpzCqn9S56+T0zJsQ/ZbaD9OxGkssyqAhFNVei4i
 +FHQh/UgDtpgHr3bFTLsZV6wvREwLy0wulDgWH1D77f4gDoTNbpROpQcmKldtw0JAWYo
 q+7A6kjIwks9Uv9Ft2b8NG29OVHVnxp/a7mvLCgLpPUqhAGiv3OnmsCyFSssyqRLari3
 JGVOdZa5tYadUnZHKf0Ru/6VR+Y1/wDWbIkKLBPWyaK42yNOc2qwlGF1v1XQDyYU783Z
 fCAyIkhpbsb/+Z3hlKaSKobLgwOZn7/ReS7MVUA9uyE3intR0z78w8fHFSrjYK0c8E2l
 vuFA==
X-Gm-Message-State: AOAM532/SpjAMG4P/dg9SJOFnhFtZSs/pE3V0cheU02k0OANGybjN3V6
 yokYj+y8BxBAf+qMxw3nX1gyHf/azWxUBEjiox0uVX1XxpsrC5wLj/893Jf+BglP/KAIKSkY4H7
 a8SffK/df1e49ZTw=
X-Received: by 2002:adf:b185:: with SMTP id q5mr11140613wra.359.1633093270168; 
 Fri, 01 Oct 2021 06:01:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQuxuSfen03MdS+N7aJSbwKGD+mYedK2PGzZVclmww5+tkRbphn/KDhXTmuBLWV0Oe6QrcGA==
X-Received: by 2002:adf:b185:: with SMTP id q5mr11140560wra.359.1633093269812; 
 Fri, 01 Oct 2021 06:01:09 -0700 (PDT)
Received: from thuth.remote.csb (tmo-099-118.customers.d1-online.com.
 [80.187.99.118])
 by smtp.gmail.com with ESMTPSA id 8sm5754683wmo.47.2021.10.01.06.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 06:01:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211001121943.1016447-1-thuth@redhat.com>
 <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and the
 405 CPU models
Message-ID: <ee30cba8-9da1-eefa-0e91-3f5f85708348@redhat.com>
Date: Fri, 1 Oct 2021 15:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 14.46, Peter Maydell wrote:
> On Fri, 1 Oct 2021 at 13:22, Thomas Huth <thuth@redhat.com> wrote:
>>
>> These machines need a firmware image called 'ppc405_rom.bin', and nobody
>> seems to have such a firmware image left for testing, so the machines are
>> currently unusable. There used to be support in U-Boot, but it has been
>> removed a couple of year ago already.
>> Thus let's mark these boards and the 405 CPU as deprecated now, so that we
>> could remove them in a couple of releases (unless somebody speaks up and
>> says that these are still usefull for them).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 15 +++++++++++++++
>>   hw/ppc/ppc405_boards.c    |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 2f7db9a98d..27c03ef624 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>>   this CPU is also deprecated.
>>
>> +PPC 405 CPU models (since 6.2)
>> +''''''''''''''''''''''''''''''
>> +
>> +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
>> +
> 
> What is this "too" a reference to? The immediately preceding section
> in the document is about the MIPS I7200 CPU model.

It was meant as a reference to the machines below. I'll try to rephrase in v2.
(As far as I can see, the 405 can only be used on these boards, it does not 
seem to be possible to use these CPU types on other boards)

> The not-being-deprecated sam460ex board also uses the ppc405 CPU
> I think, so I don't think we can drop the CPU models.

No, that board uses a 460exb CPU which is a slightly different kind of 
embedded PPC CPU, as far as I know.

>>   QEMU API (QAPI) events
>>   ----------------------
>> @@ -258,6 +263,16 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
>>   machines. It can be easily replaced by the ``witherspoon-bmc`` or the
>>   ``romulus-bmc`` machines.
>>
>> +``ref405ep`` and ``taihu`` machines (since 6.2)
>> +'''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +These machines need a firmware image called 'ppc405_rom.bin', and nobody seems
>> +to have a working copy of such a firmware image anymore. `Support in U-Boot
> 
> "any more".
> 
>> +<https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdfdba62c069>`__
>> +has been removed a couple of years ago, too, so it is very unlikely that
>> +anybody is still using this code at all.
> 
> (I'm not sure whether anybody ever actually successfully booted a
> u-boot binary on QEMU's taihu/ref405ep boards.)

Me neither. Maybe I should rather drop that reference in v2...
but I still wonder where that "ppc405_rom.bin" originally came from...

>>   Backend options
>>   ---------------
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 972a7a4a3e..1578c0dac8 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -317,6 +317,7 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>>       mc->init = ref405ep_init;
>>       mc->default_ram_size = 0x08000000;
>>       mc->default_ram_id = "ef405ep.ram";
>> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>>   }
>>
>>   static const TypeInfo ref405ep_type = {
>> @@ -547,6 +548,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
>>       mc->init = taihu_405ep_init;
>>       mc->default_ram_size = 0x08000000;
>>       mc->default_ram_id = "taihu_405ep.ram";
>> +    mc->deprecation_reason = "ppc405 CPU is deprecated";
>>   }
> 
> We're not deprecating the machine types because we're deprecating
> the CPU types. We're deprecating them because we believe that
> nobody's using them.

Ok, I'll try to come up with a different text instead.

  Thomas


