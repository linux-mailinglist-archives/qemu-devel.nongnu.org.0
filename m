Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6E37777E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 18:07:34 +0200 (CEST)
Received: from localhost ([::1]:37480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflxt-0006iN-T2
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 12:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lflwD-0004KP-ET
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:05:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lflw9-0001eL-Vd
 for qemu-devel@nongnu.org; Sun, 09 May 2021 12:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620576342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Phu0Gq2lXB5vTXJBR068GUFQWZuOX4rSAvBziqsUrgw=;
 b=cNTQ9qA8lYj1hVvSu9S01Qwm0LEWtB9bisqpzDYTZHxnUP0LTdclx8kSgbniQxRf+iMo1/
 eB7tbD1Ur9fLbtpQc9WTEdr/2PjvFDQ5LUANsEdcIT1JKpPo+SpcHea/7KMZODFibcQERU
 1j8U9MUQllw/Ag+uO9+XjBj4S8QNx9w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-tJpyCnv_OG610m9V24nAog-1; Sun, 09 May 2021 12:05:40 -0400
X-MC-Unique: tJpyCnv_OG610m9V24nAog-1
Received: by mail-wr1-f70.google.com with SMTP id
 f1-20020adf9f410000b029010e8048a0e3so1030089wrg.4
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 09:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Phu0Gq2lXB5vTXJBR068GUFQWZuOX4rSAvBziqsUrgw=;
 b=XoTir9OCH/aHxiA/H1IcTCZgSjLvSvoqLuj99JhmDb+9W7g3VkIz4V4v6CBFyKzKNL
 joI9oQbAb3JInYDTwIjqF3KfDC/bWuEb6ekqOmOF+Xhbel62hHc1fHEKSOMtmI5SHh7n
 WspY/+ErNsdAiUsCvAcvnOdnRkUG1cKJRn17O42s8cMSA6aqQA6Nb8DRlV8BIV0LRj+3
 sWN3bDl/KqJpJMhPDYVfCFR4URI1hZFFlwlv7vjMZK95Hixy34Z834NGa0iEwEEQESUk
 GmsgVZN2Lk/XcSmqp0GppWEkCeJUE5N7sUEvFWB7FpS9kLu96qrzp2ZO8uWB4n2Ehwtl
 5K+Q==
X-Gm-Message-State: AOAM532XflCy1r6TrPgAFDgMYQOxP5YtuITHbI6M1JZbrxWnKDRPpSpw
 aRpDPiSt4qKcqVAR7lrXZPMVTHfrrqpSW3UOhs1aYWjEm6pqauIkYxMx64IjFUfuZlmf+2VY0XF
 Z1IhnvXXbgYhonHG53eUyAT365Y/OI2l05vK1bMr8FdwTQOEIXdsxw2vYzt3MLms=
X-Received: by 2002:a5d:6041:: with SMTP id j1mr24956674wrt.374.1620576339672; 
 Sun, 09 May 2021 09:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4GHqokB3e3LS423rvldR5qXvAvovIr3u6xIMPvqt21EDizklU31ykRjnUgENUOFKJQQ3RDw==
X-Received: by 2002:a5d:6041:: with SMTP id j1mr24956654wrt.374.1620576339410; 
 Sun, 09 May 2021 09:05:39 -0700 (PDT)
Received: from thuth.remote.csb (p5791d04c.dip0.t-ipconnect.de.
 [87.145.208.76])
 by smtp.gmail.com with ESMTPSA id q19sm21756960wmc.44.2021.05.09.09.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 09:05:38 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
 <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
Date: Sun, 9 May 2021 18:05:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/2021 14.41, Paolo Bonzini wrote:
> On 07/05/21 11:45, Thomas Huth wrote:
>>
>>
>> diff --git a/Makefile b/Makefile
>> index bcbbec71a1..3088502329 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -85,7 +85,8 @@ x := $(shell rm -rf meson-private meson-info meson-logs)
>>   endif
>>
>>   # 1. ensure config-host.mak is up-to-date
>> -config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios 
>> $(SRC_PATH)/VERSION
>> +config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios 
>> $(SRC_PATH)/VERSION \
>> +                $(SRC_PATH)/default-configs/targets
>>          @echo config-host.mak is out-of-date, running configure
>>          @if test -f meson-private/coredata.dat; then \
>>            ./config.status --skip-meson; \
>>
>> I.e. re-run configure if somethings in default-configs/targets changed.
>> Does that look sane?
> 
> I am not sure if using a directory is reliable (it's pre-existing for
> pc-bios).  However you probably can use
> 
> # currently in tests/Makefile.include, move it to toplevel Makefile
> TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
> config-host.mak: $(SRC_PATH)/configure $(TARGETS:%=default-configs/targets/%)
> 
> And then if a file goes missing it will trigger the rebuild of config-host.mak.

Sounds like an idea, too ... but I'm unsure whether it's doable due to the 
order of the statements there... TARGETS gets populated from ninja-targets, 
but ninja-targets gets set *after* the config-host.mak block ... would it be 
safe to move the config-host.mak block around?

  Thomas


