Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94157467523
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 11:32:48 +0100 (CET)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt5rz-0002Gl-O2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 05:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mt5qk-0001Q8-5L
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mt5qh-0004zL-01
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638527485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eizJsW8KwfaDqELQJ4jNSPvzfjeW5QIy2uo2WjmnbjI=;
 b=Q6z3AVQJzQqDxwmahZutCW4DVNI4THJtVw/jv0OxRCmOAcnflMdoJC1JGwsZXn62aF+NPJ
 mtar7ekJYdiMJyfLdzKBYuWRlC++xbyZQhYNPQMHVuL629ErpeltkBrWitl+9gz8Jkb2tz
 c/TkgLqUM9qmxcMzPbTyfNS3tzBc/Ac=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-Yx8-4Xc1MjutwybSxqU77w-1; Fri, 03 Dec 2021 05:31:24 -0500
X-MC-Unique: Yx8-4Xc1MjutwybSxqU77w-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so1321233wme.6
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 02:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eizJsW8KwfaDqELQJ4jNSPvzfjeW5QIy2uo2WjmnbjI=;
 b=1dPp3pG2g/o+W9uTNsS0jGcpqL6QZwVQ/HU+ZZ6CjohslLHbOlGTpunv+0jceTbjtD
 pKU0K6uQQ/r2Jud02P6r/gmiuDR/qBX7Pw/WPwt3quXqIt/ZcaffDE70NgpjSXUCFaOF
 XhBVqwzaltuCmw9a6gSA8NwkGinDEmwMuaFJM1PFH6Pjg0mw1TefXmg7DkcynyERj/d1
 EX2bZRl/U19PVayV/aC19wivbISvbcfOCc8h1aAlcj1Y+wn6pEJON0iUIWkAROFwxXBH
 w92VkYmpmwzx0iGK2VkN+mvP41I4v+p8QYp1EeryJj1AoIpnhJs1U2/G289uglIOHuZn
 a/9w==
X-Gm-Message-State: AOAM531LonsyFF/RaPOibJ4RbQtqfjNCZT8Xxm85LISdGW+PuDwySrBa
 Urh0WSPlhhQThabYgoMDzPYMmlMImAddcJaPFTFouof+daCi5+50N4Tv3MkAtaeK7kVMp1sXL8c
 do/5qyJxIS9qxaBw=
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr20866395wry.66.1638527483106; 
 Fri, 03 Dec 2021 02:31:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTdSxSmMEbLSiIjPARGt1ynUAMuQ5kWJAL2TuQOhEQDaKRkvJMhmDv79B1/idynP4ir5+5UQ==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr20866349wry.66.1638527482750; 
 Fri, 03 Dec 2021 02:31:22 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d8sm2153417wrm.76.2021.12.03.02.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 02:31:22 -0800 (PST)
Message-ID: <75b27dfe-cb8f-d40c-c1bd-79415264a87f@redhat.com>
Date: Fri, 3 Dec 2021 11:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 LEROY Christophe <christophe.leroy@csgroup.eu>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
 <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
 <32012645-274e-9ee9-2d8a-a3d87c4a6bf5@csgroup.eu>
 <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <599e5aa0-d7a9-b89c-2da9-5e7c909a6064@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/12/2021 11.27, Cédric Le Goater wrote:
> On 12/2/21 20:32, LEROY Christophe wrote:
>>
>>
>> Le 02/12/2021 à 20:19, Cédric Le Goater a écrit :
>>> On 12/2/21 20:17, Thomas Huth wrote:
>>>> On 02/12/2021 20.14, Cédric Le Goater wrote:
>>>>> The default addresses to load the kernel, fdt, initrd of AMCC boards
>>>>> in U-Boot v2015.10 are :
>>>>>
>>>>>      "kernel_addr_r=1000000\0"
>>>>>      "fdt_addr_r=1800000\0"
>>>>>      "ramdisk_addr_r=1900000\0"
>>>>>
>>>>> The taihu is one of these boards, the ref405ep is not but we don't
>>>>> have much information on it and both boards have a very similar
>>>>> address space layout. Change the kernel load address to match U-Boot
>>>>> expectations and fix loading.
>>>>
>>>> You could additionally mention that U-Boot corrupts the kernel if it
>>>> gets loaded to address 0.
>>>
>>> True. The first word is overwritten with zeros. I looked for it
>>> in the code but could not find the reason.
>>>
>>
>> Isn't it because U-boot unzips the kernel at address 0 ?
> 
> Address 0 is trashed before U-boot loads the kernel.

I guess it's an accidential NULL pointer dereference somewhere in the u-boot 
code ... which will be quite hard to track down when the first page of 
memory is marked as writable... :-/

  Thomas


