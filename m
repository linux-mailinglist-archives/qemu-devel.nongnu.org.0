Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE64406FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 18:28:45 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOjOO-0002RY-Fl
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 12:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOjI1-0004mS-OU
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOjHy-0005wN-Hy
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 12:22:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631290924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVnKdlR2yzsyuocphoJzSErt0Gsf1DAAYVRO6ys2NuE=;
 b=XMfp+U3Dnf4FKFyrtbE660HwoUeBlDGgOYS3ZMR6phbAb89JX2ekXHVcCGVNntOhjx5Sm7
 zZNRvExKLFkMqiKJtz+Q54EGBTUQUTNDtwR9nsNjUXhxzws8QSE7l5gI1LDWOUUWDbe72O
 pcobmi8kX1quxxpUmgONNlsXnkF6CNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-vBgudPgHM96Tv4RH0izkBw-1; Fri, 10 Sep 2021 12:22:03 -0400
X-MC-Unique: vBgudPgHM96Tv4RH0izkBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y23-20020a05600c365700b003015b277f98so444487wmq.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 09:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QVnKdlR2yzsyuocphoJzSErt0Gsf1DAAYVRO6ys2NuE=;
 b=Cl0F1U2+nZF8dyOsYKZsZ2RKVTIvF0puKkFBVcf1o5kWSwJqC5i2THwCYdLilefR9s
 pQjEF1ABA1g/uj1AdUUIDUXOSFvC70pnbKAUbQ/QtjA074IkqoU0tpsVcF3folDT3dvU
 53TOcJzHOo2Hdd76iPMOyOAcY4iSeFGH7V+93GJEFiN5evq5GdklWxpvdRSyKyYE1XLT
 fu9tTz7A5UE0U/1MIAsJN0wAuUNOJRtWzLQJ4cPZLzY5HXsvFjiq1h+uC9exqjO3vcVo
 T2SOvCHmTVJbuYBtY8vfQStTgdDCuUCnH8rN9YMwTR3gLWi6W2Ct4xHugzpZyMMUipSQ
 w8QA==
X-Gm-Message-State: AOAM533RO2pHDmNaohtW66WQ9sPzkS76GOngXtBpoZUnsf8hd0dVZDBL
 zCIw3hLiCHSy9h5Y9U4tnrZhwmRqglSGXMT3ZNg9G/vvofhlww8KzZJ/4k5ae+9uFvCp6obkqMS
 hpF+MSaRkVbl9NIIDw/Z3cSZefmBpL3/+S2L+a7TTmPItYExYal68PyfG59fN885olHM=
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr10746146wrq.176.1631290922277; 
 Fri, 10 Sep 2021 09:22:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztDOCpHkDEbkXb1e9F4WPMWXF8v2KIHJ6JBWDDpEnNQxf4pB2ALNK8rNPlUvoyU74oVET2Mw==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr10746120wrq.176.1631290922030; 
 Fri, 10 Sep 2021 09:22:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b24sm4499627wmj.43.2021.09.10.09.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 09:22:01 -0700 (PDT)
Subject: Re: applied? Re: [PATCH v1 0/2] Update NVMM support to recent
 changes, [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined,
 [PATCH v1 2/2] Fix nvmm_ram_block_added() function arguments
To: Reinoud Zandijk <reinoud@13thmonkey.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210718134650.1191-3-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
 <20210718134650.1191-1-reinoud@NetBSD.org>
 <YSuwFI8vBJTDF2GW@gorilla.13thmonkey.org>
 <CAFEAcA8oLY-XYUFVguMDcQzZ+CykWnddpgdAcbrq3-2S1Q5X4Q@mail.gmail.com>
 <YTeNK86WAaRy7p/z@gorilla.13thmonkey.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <65a259f0-1e5e-3eff-85cb-8f34f70ffe6c@redhat.com>
Date: Fri, 10 Sep 2021 18:21:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTeNK86WAaRy7p/z@gorilla.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/21 18:02, Reinoud Zandijk wrote:
> ping?

Queued, thanks.

Paolo

> On Sun, Aug 29, 2021 at 05:39:07PM +0100, Peter Maydell wrote:
>> On Sun, 29 Aug 2021 at 17:06, Reinoud Zandijk <reinoud@13thmonkey.org> wrote:
>>>
>>> Hi :)
>>>
>>> Have these patches been applied? How can I easily check it without manually
>>> checking if they are there in a git pullup? Am I notified normally when
>>> patches are applied?
>>
>> Generally when a submaintainer picks up a patchset they'll send
>> an email reply to the patch cover letter to say they've done so.
>> At that point it should get into upstream git eventually.
>> Until that happens it's the initial submitter's responsibility to
>> 'ping' the patch after a few weeks if nobody's replied to it
>> or reviewed it.
>>
>> Ccing Paolo who seems to have taken the initial nvmm patches
>> through his tree.
>>
>> thanks
>> -- PMM
> 


