Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D028CA70
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 10:46:11 +0200 (CEST)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSFwg-0000bi-9O
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 04:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFte-0007Q7-3d
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 04:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSFtZ-0005z8-RZ
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 04:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602578572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cy5Umm45LAZG5+p/FZuyIVT+mHFYq4zbXyNxj1/WCmk=;
 b=GpUmq/18k6N4ZPjwmr8tq2emdlgYYqPm2N9xMGpYWdxdvRq0+Msmy4KGVl4OysB0ScQ3VG
 d94h21ZXcmWDZY54hZ24fVPWH4Q2cIV8ZQ8TnfoeefUyAEKRgoZaHt6SLG1bUG271SNfgI
 csXuhvQyD1Jukqo4R1zg6cShM19+uW4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-_gUrXs4APrKLa43DVakV5Q-1; Tue, 13 Oct 2020 04:42:49 -0400
X-MC-Unique: _gUrXs4APrKLa43DVakV5Q-1
Received: by mail-wm1-f72.google.com with SMTP id s25so6445205wmj.7
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 01:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cy5Umm45LAZG5+p/FZuyIVT+mHFYq4zbXyNxj1/WCmk=;
 b=OjOxG6jtwToALCY27BGcOzv7zuv5H1IAwwA2s2wALot2O63TYZQkPPFEpeMAzl3u8/
 r4FT+qg1l/tYxsOcHejRs5t6gAVmQ7Ztgog0dCm+jMVjE53zgJlbm60XaefHxRMqVRKA
 DNFrQHEBateNUCX81+X4fev28UmY8fKs25z9wI7A+pDYtaFlduPn9Hnk5Qm98lmGfAh0
 J+6zfJVKOhFhoUOTTqtc8Ig76c6CKmupMvjuFYg4Io/Is6OnTyNOaTsW1joJt4LLyPNw
 795tpnzzlif5yFE/yzFdEqHaoNXp4Cm/4G3vF4ADqK3d1cUXxRw/5SUApkJF5tfOJ09x
 6uUA==
X-Gm-Message-State: AOAM533axe9Wv5nXJSRJojdCmvOPOcwVqMFiEOl6804NS90PXCc4hlfp
 5ZZyMCoIA+nwBcsM+giheSpSFbCtFBPS4xKIPkGzuAmygtJAta3kHzxJ9OHySc7JAz+s1N0TEjt
 1QO24w+5I4e5qtbs=
X-Received: by 2002:a1c:2e53:: with SMTP id u80mr14675100wmu.58.1602578568574; 
 Tue, 13 Oct 2020 01:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQnxR/4TvkPrJhZ7T2WGOGG1UFL0hib7NXqP0OoMMU4JVYdxRNJTLW0wHk657n/DIXrbAuCQ==
X-Received: by 2002:a1c:2e53:: with SMTP id u80mr14675071wmu.58.1602578568373; 
 Tue, 13 Oct 2020 01:42:48 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id z5sm27778002wrw.37.2020.10.13.01.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:42:47 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add Xen CpusAccel
To: Claudio Fontana <cfontana@suse.de>, Jason Andryuk <jandryuk@gmail.com>
References: <20201012200725.64137-1-jandryuk@gmail.com>
 <c2b2ed9a-879c-f676-86f0-22b3a77b770f@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a88a1570-ccbd-987c-17db-53e8643c1ea8@redhat.com>
Date: Tue, 13 Oct 2020 10:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <c2b2ed9a-879c-f676-86f0-22b3a77b770f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 10:16 PM, Claudio Fontana wrote:
> On 10/12/20 10:07 PM, Jason Andryuk wrote:
>> Xen was left behind when CpusAccel became mandatory and fails the assert
>> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
>> Move the qtest cpu functions to a common location and reuse them for
>> Xen.
>>
>> Jason Andryuk (2):
>>    accel: move qtest CpusAccel functions to a common location
>>    accel: Add xen CpusAccel using dummy-cpu
>>
>>   .../qtest-cpus.c => dummy/dummy-cpus.c}       | 22 +++++--------------
>>   .../qtest-cpus.h => dummy/dummy-cpus.h}       | 10 ++++-----
>>   accel/dummy/meson.build                       |  7 ++++++
>>   accel/meson.build                             |  1 +
>>   accel/qtest/meson.build                       |  1 -
>>   accel/qtest/qtest.c                           |  7 +++++-
>>   accel/xen/xen-all.c                           | 10 +++++++++
>>   7 files changed, 34 insertions(+), 24 deletions(-)
>>   rename accel/{qtest/qtest-cpus.c => dummy/dummy-cpus.c} (76%)
>>   rename accel/{qtest/qtest-cpus.h => dummy/dummy-cpus.h} (59%)
>>   create mode 100644 accel/dummy/meson.build
>>
> 
> Yep, forgot completely, sorry.

Good opportunity to ask the Xen folks to add testing
to our Gitlab CI, so this doesn't happen again :)

> 
> Acked-by: Claudio Fontana <cfontana@suse.de>
> 
> 
> 


