Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4E2CBD08
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:32:00 +0100 (CET)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRId-00040F-8T
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkRHC-0003TK-CL
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkRH9-0008Rx-OJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606912226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jtlw4mgi4Dfi3Qn5tAwRcAQyEIteyAmyVQz/aJxxpc=;
 b=I2XniUka6WUTjOA/npBV2ie+zKWW3a2G2c4RV6Y3SFS0PCbqWCKyk36nDrrb+c6qwc1zm7
 e/Wm0NmOJgTdH+RqyLHRLgWt1AvoFtH6pZ7fs3Q4YPmqXzknCRY1isZbwy+8evO810+AlL
 fGPz2VxFSqHXM0QSzGJ4+FICOCJ1o/4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-OgxyL34SP8uvK97bMXS8Iw-1; Wed, 02 Dec 2020 07:30:21 -0500
X-MC-Unique: OgxyL34SP8uvK97bMXS8Iw-1
Received: by mail-ed1-f71.google.com with SMTP id i1so2884203edt.19
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 04:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9jtlw4mgi4Dfi3Qn5tAwRcAQyEIteyAmyVQz/aJxxpc=;
 b=pZYGYr06LVhKcuTlTcm0Ugnpz+HyGek8jepTucx11eH7jd19WtAIo1T9iMerFQvueZ
 DsFPNp7Fzl89nVYCpIH+8g0286KSQ/d5VoNF7aNXVNUwr0ndZWrJoVYm9bzTwVOHJw0p
 KsBY7m8/6Bxw6i50OQ42EVD2MEJQl1CNJiGOeV4hB84yJNbsvXq1u1xCQIOp+z3UILYJ
 UMC5kbQvTax0L1YvQqsNyLSbABDi5PaOYGfg7SGkR0zliTufrYaVPCT96pW6z0PHhamU
 awv0wdcofmGfKa5iEPZH1/+6D8a6dWCONFn7ZeMI+11TC1zrrr4lbusL11aae6tyBZBG
 F+Bg==
X-Gm-Message-State: AOAM533kWcoDZAFqrYTQBJD33xRBYnoDeGtdjRhEN1tAI2mIvsIcdmWn
 yjV9D8gLxLbchYQ8TmKbRkyHDk8f4vHbTL3PwLPxK+WIlov+J516gQF7NK7FOwe+dPz7U09iSNt
 QSQJ8xLLm3TbZb7Q=
X-Received: by 2002:a05:6402:1646:: with SMTP id
 s6mr2276717edx.319.1606912220563; 
 Wed, 02 Dec 2020 04:30:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv9AASefJlQ6CLVBHNVOk9oeRPhNvgBq/na6aKqTuAeqOAT3jTQe87f21npCH9nWjObZPRAQ==
X-Received: by 2002:a05:6402:1646:: with SMTP id
 s6mr2276685edx.319.1606912220373; 
 Wed, 02 Dec 2020 04:30:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n14sm1094611edw.38.2020.12.02.04.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 04:30:19 -0800 (PST)
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
To: Kevin Wolf <kwolf@redhat.com>
References: <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
 <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
 <20201202103824.GB16765@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0a904bef-6341-f950-3f8c-4170c7ba6af8@redhat.com>
Date: Wed, 2 Dec 2020 13:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202103824.GB16765@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, armbru@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 11:38, Kevin Wolf wrote:
> Am 02.12.2020 um 10:30 hat Paolo Bonzini geschrieben:
>> On 01/12/20 23:08, Eduardo Habkost wrote:
>>>> Properties are only a useful concept if they have a use.  If
>>>> -object/object_add/object-add can do the same job without properties,
>>>> properties are not needed anymore.
>>>
>>> Do you mean "not needed for -object anymore"?  Properties are
>>> still used by internal C code (esp. board code),
>>> -device/device_add, -machine, -cpu, and debugging commands (like
>>> "info qtree" and qom-list/qom-get/qom-set).
>>
>> Yes.
> 
> Are internal uses mostly just right after object creation, or do we make
> a lot of use of them during runtime?

Not "a lot" but enough to be nasty.  There are a couple uses of 
"well-known" QOM properties (e.g. to access the RTC time or the balloon 
stats), plus "info qtree".

Paolo


