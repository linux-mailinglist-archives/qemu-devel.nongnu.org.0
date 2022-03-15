Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822844D9F21
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:50:14 +0100 (CET)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9R7-0006N5-A3
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:50:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU9Lq-0000ry-0G
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:44:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU9Lo-0003B4-4s
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647359083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxCWIhSOrzQo1i8kBRalF6/WLm2slMv099zEPNRF0/w=;
 b=VEsxRmvrXe0ofCWbb//xSGBIeND9eaFUIwGC/vA190cDd4FaZNdcJFV/zzFkKEwBG4ex6T
 gMXhzl9qFcxzV8ZwPJ8fjtXT4V+Hl8JeeBEMuDflzii7fwXVYIIMAz+Eedl4I6U8UCOAnl
 o17yqCk5+o+jMjxTx6ZKW7B/eiDO5jk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-Aeg3a14tP82gfy0VaDKLwg-1; Tue, 15 Mar 2022 11:44:41 -0400
X-MC-Unique: Aeg3a14tP82gfy0VaDKLwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z16-20020a05600c0a1000b0038bebbd8548so731973wmp.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 08:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TxCWIhSOrzQo1i8kBRalF6/WLm2slMv099zEPNRF0/w=;
 b=WaJjI/F8ndwbtlZ+jF/LuDX0jei3XYcv5VL620u7XY+POmZFIIDME+NtEaORSnnWCC
 CHv3B6oCbSvLJ78go+mJhyQ3a5y/WqW7Z3GJcyaH0kG42MM5uXcYls03ihgZtpcUy6IO
 7Zw1lFa8f8t3BosejByXjSIlGE4dAyQqr5Sa1B32Micw97KF4BgrKz9suX0zB7Ngxk7J
 UHrsQVHC1Ccm+owUFnEkCMYuAPMCINl7qmc0ZcC0eD7jEnKAxsD5fgptRmtiTtMVdlkY
 TMakvyoIN5KL602hQ3Xvthyy3hTMZSw8j8rsm6hYfJ1Ax/PnPcix+yPifohwS6F/DWK4
 PFGA==
X-Gm-Message-State: AOAM531cSTYHZGiZ6/6dzknT0j5CSdJbcpLFIkWbRKtLjBWzv/ambcl8
 BZ+IOr+fCGeJvA39872R9R9bQGtlhq1exfNfs7pMXPmOvuLxLBv7RLW3Y0DHYBN/5NGXpfrOgAh
 7XV1XCAWrIKhuI/o=
X-Received: by 2002:adf:fbd1:0:b0:203:cfa8:5dab with SMTP id
 d17-20020adffbd1000000b00203cfa85dabmr3597566wrs.496.1647359080400; 
 Tue, 15 Mar 2022 08:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVeH+TJFTf1lJC133vKAiwx/oWyGkAuxHVKhlwTlVb3f9pqTnjGVtR7NVA38KDt+XGU8Rw2A==
X-Received: by 2002:adf:fbd1:0:b0:203:cfa8:5dab with SMTP id
 d17-20020adffbd1000000b00203cfa85dabmr3597544wrs.496.1647359080160; 
 Tue, 15 Mar 2022 08:44:40 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm2636072wmr.8.2022.03.15.08.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 08:44:39 -0700 (PDT)
Message-ID: <2c9eab2b-a166-1722-4fc0-68b0e4abdd8e@redhat.com>
Date: Tue, 15 Mar 2022 16:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: multifd/tcp/zlib intermittent abort
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <CAFEAcA-bhoyo+EfQGOuHWeEWC8-M-tGv=fXjEAJ6XX==iiO14w@mail.gmail.com>
 <CAFEAcA96Jx4XsdveTVgxkqWT-TBVm_K06sN+U+fofnxzGaVOWw@mail.gmail.com>
 <CAFEAcA-3PRgVaQ_GXg_ZDp6hNUh=_rc3PiY6_6_7wUYi-oqEow@mail.gmail.com>
 <CAFEAcA_SUCgXCL3yE9e2H=ZUwn24uLvqSeTQVKuT+RUukOKrEQ@mail.gmail.com>
 <CAFEAcA8vj8NxP0yq_PCofNfn6h_nTaLJJQ6+5Qkcn8U4M0PSGg@mail.gmail.com>
 <YjCzhhCLHzpDoKl0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YjCzhhCLHzpDoKl0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 s.reiter@proxmox.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, f.ebner@proxmox.com,
 Jinpu Wang <jinpu.wang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2022 16.40, Daniel P. Berrangé wrote:
> On Tue, Mar 15, 2022 at 03:30:27PM +0000, Peter Maydell wrote:
>> On Tue, 15 Mar 2022 at 15:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Maybe we're running into this bug
>>> https://bugs.launchpad.net/ubuntu/+source/zlib/+bug/1961427
>>> ("zlib: compressBound() returns an incorrect result on z15") ?
>>
>> Full repro info, since it's a bit hidden in this long thread:
>>
>> Build an i386 guest QEMU; I used this configure command:
>>
>> '../../configure' '--target-list=i386-softmmu' '--enable-debug'
>> '--with-pkgversion=pm215' '--disable-docs'
>>
>> Then run the multifd/tcp/zlib test in a tight loop:
>>
>> X=1; while QTEST_QEMU_BINARY=./build/i386/i386-softmmu/qemu-system-i386
>> ./build/i386/tests/qtest/migration-test  -tap -k -p
>> /i386/migration/multifd/tcp/zlib ; do echo $X; X=$((X+1)); done
>>
>> Without DFLTCC=0 it fails typically within 5 or so iterations;
>> the longest I've ever seen it go is about 32.
> 
> So if this is a host OS package bug we punt to OS vendor to fix,
> and just apply workaround in our CI ?  eg
> 
> $ git diff
> diff --git a/.travis.yml b/.travis.yml
> index c3c8048842..6da4c9f640 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -218,6 +218,7 @@ jobs:
>           - TEST_CMD="make check check-tcg V=1"
>           - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
>           - UNRELIABLE=true
> +        - DFLTCC=0
>         script:
>           - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
>           - |

Sounds like a good idea - but you should certainly add a proper comment 
here, too, so that we can later remind ourselves to remove the workaround again.

  Thomas


