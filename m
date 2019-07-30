Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B370C7A8F3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 14:48:00 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsRXr-0006Bw-V5
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 08:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsRXA-0005Ys-NU
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsRX9-0002kH-GH
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:47:16 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38776)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsRX9-0002jq-Ap
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:47:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so35167620wmj.3
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 05:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jAwznU8TBe9Zfuvv9OoyFCohs23KpFP78UQQWruPTjw=;
 b=WwmSD2YBprFjDwKOihwDq/HUBk2uH0wDMnB1rPJKKaKsmP45LcEKGRzX/tLsg9Vnhh
 LUqoE7w4bRBCs/ePuNUFUFVp3Kfe7Ip+lbTZzUPE94fg/LaZ2ScZ1tqlz1z+59Qx87ca
 4na5Wi3wbO0MLqlG0R8KamRNtgr3jVG4y044L9y1Ph2qZyKbfZPcdUo4y8vnTMtkxzq1
 rR8X8ieyBlVGw2XraFL7TivP27A0hrTIwCaeGsDNsroUDLMP47NllFd+IW+FT/VG7nVA
 +7vGPZfDSxIUXRnbClVwM+ITNkj1tZaL0i341GIa00btKZGEOixqyooqdVvOs1u5hkiZ
 SEIg==
X-Gm-Message-State: APjAAAW1jns8073yA49TEbbN3t/RcATV3w1Xj9G/A/tDEdmhZGQSqZa0
 ZmkXplDgAmE5omF3bOJAN6segiXMn3U=
X-Google-Smtp-Source: APXvYqxqAxfP7WxrdFWz8KXHOpz1szQ0oOjA+VJ/IUsr/1dRMmMY8VIR+SkruwGoYyg0fGWICfLIYA==
X-Received: by 2002:a1c:a997:: with SMTP id
 s145mr102593747wme.106.1564490834380; 
 Tue, 30 Jul 2019 05:47:14 -0700 (PDT)
Received: from [192.168.1.38] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id v16sm49401312wrn.28.2019.07.30.05.47.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:47:13 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20190729223605.7163-1-jsnow@redhat.com>
 <7324bc78-1d7b-7b7f-272d-c2932651b007@redhat.com>
 <075eaba0-7e50-b240-7679-825c5bd03e0f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <084951ee-2837-6396-84eb-1b5c5fcf8bd6@redhat.com>
Date: Tue, 30 Jul 2019 14:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <075eaba0-7e50-b240-7679-825c5bd03e0f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH] Revert "ide/ahci: Check for -ECANCELED in
 aio callbacks"
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
Cc: Fam Zheng <fam@euphon.net>, Shaju Abraham <shaju.abraham@nutanix.com>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/19 1:37 PM, Paolo Bonzini wrote:
> On 30/07/19 11:54, Philippe Mathieu-Daudé wrote:
>> Hi John,
>>
>> On 7/30/19 12:36 AM, John Snow wrote:
>>> This reverts commit 0d910cfeaf2076b116b4517166d5deb0fea76394.
>>>
>>> It's not correct to just ignore an error code in a callback; we need to
>>> handle that error and possible report failure to the guest so that they
>>> don't wait indefinitely for an operation that will now never finish.
>>
>> Is this 4.1 material? It looks so.
> 
> Perhaps could have been last week, but now I suggest Cc qemu-stable and
> delaying it to 4.2.

I was wondering because Kevin was preparing a block@ pull request.

Anyway this seems fair because the reverted commit is dated from 2014.

Thanks,

Phil.

