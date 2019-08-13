Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF88A8B7F1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 14:06:19 +0200 (CEST)
Received: from localhost ([::1]:51794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxVZD-00051u-5D
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 08:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hxVYi-0004Xx-0V
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:05:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hxVYg-0004Iz-Js
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:05:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hxVYg-0004IO-DS
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 08:05:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so1233711wmg.0
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 05:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kYSnU3M9tnu2B5qcAis+c65F8HPZfiPszFaCA/33B2E=;
 b=cSEZDbHETRbxQyyYAScrtUAutWERFaxGlp7auYjG/qrvQEWIdHTceB4WhBnULqzOG+
 eCgFfsPH+aXb9Ce2yQ5GsQQBcNsedrBpXnz47DCWbySLuKWMR4oMs1wKsCaRbg90UVOn
 s25RsekNiwYMrns15jTMRNrsKvJqiV0D9nFYKGaDqMIkvM1hK3flmP8dyOPVY7KVrMnI
 PUXTNtcenFrRAUGZ4PaTEEhvp3YGRqV7MGfC3Pp2aMCCDIUFkZlREB/NAFDSwGVZ1NU7
 rVm7PA2kLJ9QaVHaeIc+2/kiWLyVaeqrwReBPTcMwRKBgl+fmDDfLChcilSOBWNgWnCa
 IuDg==
X-Gm-Message-State: APjAAAVmrvvS00KT7vEG4FnbQj/60sHmT7nKI3AQsA4vfteWXVtfokxz
 0guDxRMPYWjIiemyCiO403Z5aw==
X-Google-Smtp-Source: APXvYqwDvXE1vatdw3dMr0IGP0oj23Rxr3k5pb4T9pBfUJblc9ZP55o2J4hoNtnFIQoBFt/yDxh4ag==
X-Received: by 2002:a1c:ca0c:: with SMTP id a12mr2702757wmg.71.1565697945224; 
 Tue, 13 Aug 2019 05:05:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5193:b12b:f4df:deb6?
 ([2001:b07:6468:f312:5193:b12b:f4df:deb6])
 by smtp.gmail.com with ESMTPSA id c11sm5274291wrt.25.2019.08.13.05.05.44
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 05:05:44 -0700 (PDT)
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <1564502498-805893-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <fe62e531-dbe9-c96e-d2c0-28fd123df347@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <92c9ff07-178e-0c7a-c0a0-2c21f3f481db@redhat.com>
Date: Tue, 13 Aug 2019 14:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe62e531-dbe9-c96e-d2c0-28fd123df347@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 0/3] Reduce the number of Valgrind reports
 in unit tests.
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "berto@igalia.com" <berto@igalia.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Denis Lunev <den@virtuozzo.com>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "armbru@redhat.com" <armbru@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/08/19 14:02, Andrey Shinkevich wrote:
> PINGING...

I thought I had already said I queued the series?

Paolo

> On 30/07/2019 19:01, Andrey Shinkevich wrote:
>> Running unit tests under the Valgrind may help to detect QEMU memory issues
>> (suggested by Denis V. Lunev). Some of the Valgrind reports relate to the
>> unit test code itself. Let's eliminate the detected memory issues to ease
>> locating critical ones.
>>
>> Andrey Shinkevich (3):
>>    test-throttle: Fix uninitialized use of burst_length
>>    tests: Fix uninitialized byte in test_visitor_in_fuzz
>>    i386/kvm: initialize struct at full before ioctl call
>>
>>   target/i386/kvm.c                 | 3 +++
>>   tests/test-string-input-visitor.c | 8 +++-----
>>   tests/test-throttle.c             | 2 ++
>>   3 files changed, 8 insertions(+), 5 deletions(-)
>>
> 


