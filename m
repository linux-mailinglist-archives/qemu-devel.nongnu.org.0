Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C021250B0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 19:32:47 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihe7q-0003Ku-GH
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 13:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihe6Y-0002tS-DZ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 13:31:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihe6V-0005g1-8c
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 13:31:25 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45560
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihe6V-0005a6-03
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 13:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576693881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=6lveHfzvYEhUQZQoLOEVVZLGBtKYwoKcLo/V2ABQGuc=;
 b=doUPLif3IeHBhY+NWJuRVJMp4+Fem6VZ87NGwA9fbv8kxhUk6Wcf1dUDsJNzLe83Edm9Ju
 sGweUdnu1pqFMrgSJ+UuonkGVrApLUEPHPGPuQIEYVvN5AiX8bmKyoxg8jiM0VWBhxAERF
 lQRbQ6jla5pbCeTvTDferYPddDhEJoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354--9EZz_owN7Gr_p0xr1P6JA-1; Wed, 18 Dec 2019 13:31:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BE3B800D41;
 Wed, 18 Dec 2019 18:31:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7045C1D4;
 Wed, 18 Dec 2019 18:31:14 +0000 (UTC)
Subject: Re: [PATCH 5/7] configure: Unnest detection of -z,relro and -z,now
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191218031920.6414-1-richard.henderson@linaro.org>
 <20191218031920.6414-6-richard.henderson@linaro.org>
 <881dff30-a729-6d7b-f823-5f136125ac0b@redhat.com>
 <6a556fb0-619f-ffab-e9b3-5afb17447bee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <81681a5d-6175-7fc8-6f39-0549a4db191e@redhat.com>
Date: Wed, 18 Dec 2019 19:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6a556fb0-619f-ffab-e9b3-5afb17447bee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: -9EZz_owN7Gr_p0xr1P6JA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: berrange@redhat.com, i@maskray.me, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2019 17.58, Richard Henderson wrote:
> On 12/17/19 10:11 PM, Thomas Huth wrote:
>>> +# Detect support for DT_BIND_NOW.
>>> +if compile_prog "" "-Wl,-z,now" ; then
>>> +  LDFLAGS="-Wl,-z,now $LDFLAGS"
>>> +fi
>>> +
>>> +# Detect support for PT_GNU_RELRO.
>>> +if compile_prog "" "-Wl,-z,relro" ; then
>>> +  LDFLAGS="-Wl,-z,relro $LDFLAGS"
>>> +fi
>>
>> Looking at
>> https://mudongliang.github.io/2016/07/11/relro-a-not-so-well-known-memory-corruption-mitigation-technique.html
>> the idea of specifying these two options together was likely to get
>> "Full RELRO" instead of only "Partial RELRO".
> 
> Sure.
> 
>> Thus, does it make sense to have "-Wl,-z,now" without "-Wl,-z,relro" in
>> QEMU? Or should this rather check whether both are possible, then use
>> both, otherwise just try to use "relro" alone?
> 
> Honestly, I expect them both to be supported in any binutils.
> 
> I split the two tests just because they didn't seem to be logically connected.
>  But I had forgotten about, or perhaps never heard, the terms "full" and
> "partial" relro.
> 
> I can put them back together with an appropriate comment it you like.  One less
> thing to run during configure...

Yes, please.

 Thanks,
  Thomas


