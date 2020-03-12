Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567241835A6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 16:59:18 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCQEv-0001Ih-Da
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 11:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jCQ8E-0002Oe-GL
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jCQ8D-0007DG-8j
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:52:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59719
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jCQ8D-0007C3-3K
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 11:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584028340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7GOpK3/gyjplTCGGtQYiZFql9ANjhE63p4+WcIgY14=;
 b=KzVqf0gwXpDuSlFgE3IvLZ2CrUhOAexPZTrAEFQKlsEy2pAq/FF3HOosEAztw+9sMZHBg2
 YP6pPqyHUQ3ht5v+QGyy/JqjEC4PZUgzraziNNHx0L/2lmNyxH/s9+MjYO/7cHlQYwc1wp
 wYaa9FpAG9EBdejhD7c0WyZGIKJvXiA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-F4wouPLFOfKVxiTmB9q7rw-1; Thu, 12 Mar 2020 11:52:19 -0400
X-MC-Unique: F4wouPLFOfKVxiTmB9q7rw-1
Received: by mail-wr1-f71.google.com with SMTP id c6so2794175wrm.18
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 08:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z7GOpK3/gyjplTCGGtQYiZFql9ANjhE63p4+WcIgY14=;
 b=Rbxhylh0x4oOJ2LqFMCsrJehcuixakSg8uP7CVXFLmm+eEzZ7B+YdXyKdngoFqYsdo
 c6q/H4EugzPU9aAe9vVHu1YiQGQ2S5BvzLSVd1GabggUaJYaZayi6YBDQ7+stc0TmVgb
 6iRj6ftqOGKBOsQTLHwcEvBpsRZs5dPiUgWfoTh11oaRQZkH4iFX0eFTfrikRU5lTsCh
 eTQ1L2bNwUwvZ9qzAqXTViJX3G0H2qTPHKZpHJ2yBlMG3kAEadau2y6TBhSkcE1G6E3L
 NkXIH2VinXb/XlrcTnWrTl++/+FRDuwCGvVaNEE0PWeTS/ykafWwkNHMZXJhud9olP1J
 mzQw==
X-Gm-Message-State: ANhLgQ1Cf4bLCorLpbvFQzlGa8h1A7fJZdYHUJNrv99tqI+FCKTy7yut
 WeX//A3jzRpgyrC4M1uPTEPP8hLwpXMMHWTYKQdUq1JKgmWCYSAj7/9/4kkf4F0qZoV77i6CIar
 WygxM8S3jt9BsruU=
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr5485412wmc.103.1584028337224; 
 Thu, 12 Mar 2020 08:52:17 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsCB4IXIDEhxar8Nb6NRpNZ/9568Qi4VFBhv1JUV41YF+jN+PqM80FqtB6PUu1KSCayE1Zkdw==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr5485392wmc.103.1584028336983; 
 Thu, 12 Mar 2020 08:52:16 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.186])
 by smtp.gmail.com with ESMTPSA id 133sm13626490wmd.5.2020.03.12.08.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 08:52:16 -0700 (PDT)
Subject: Re: [PATCH V4 0/5] Introduce Advanced Watch Dog module
To: "Zhang, Chen" <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <20191217124554.30818-1-chen.zhang@intel.com>
 <fa1ed6cb-63d7-ee83-a5a0-b099b662fef2@intel.com>
 <0502a0db0a17484c9220b3a63c40b397@intel.com>
 <08a1a225-52c1-4e6c-85f7-fcf6612b5383@redhat.com>
 <3049425105b94f6cb9cd846c84c95a84@intel.com>
 <783bac16-0e4d-f027-3e4a-b6fff500c244@redhat.com>
 <c6564993-ec06-7fe1-137d-956f3d554e74@intel.com>
 <679426098de74479a19c2287c68785c4@intel.com>
 <029efd6f-f461-da09-c6b6-1acf67818b64@redhat.com>
 <c16e2cda-a498-4913-2811-6c6ea6b0b0df@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <460ee5fb-fd36-0da3-0f81-22d9be12814b@redhat.com>
Date: Thu, 12 Mar 2020 16:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c16e2cda-a498-4913-2811-6c6ea6b0b0df@intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/20 10:32, Zhang, Chen wrote:
> 4. Implementation issue.
> 
> The AWD script as an optional feature is OK for me.
> 
> And report the triggering of the watchdog via QMP events is enough for
> current usage.
> 
> But it looks have limitation to notify outside Qemu. I don't know which
> is better choice.
> 
> If the QMP events solution is better, I will fix it in next version.

Good, thanks.

Naming-wise, it's ugly that we already have a WATCHDOG event for guest
watchdog devices.  The following design however should allow setting up
multiple watchdogs

- Creating a watchdog from the command line:

-object watchdog,id=STR,timeout=NNN,chardev=CHR

and object_add/object-add can also be used for HMP and QMP.

- Reporting a watchdog timeout via QMP:

{ 'event': 'WATCHDOG_TIMEOUT',
  'data': { 'id': 'str' } }

- Protocol: the data sent on the chardev to QEMU must be

WATCHDOG=1

optionally followed by exactly one \n character.  All other data is ignored.

Paolo


