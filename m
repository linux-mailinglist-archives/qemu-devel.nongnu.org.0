Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465C310BF7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:39:55 +0100 (CET)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81L0-0007EG-N6
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81JX-00062g-Fm
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81JV-0006hg-4u
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612532300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsui2dalQ5POsCv8LiEb8VF0CL3klyOITGAHeoyHrg8=;
 b=T1NBC6RChXB2AgpfKV3tamWrYDpFT/fR/BYQPvkx+YG9Av0xTTB4aAA9Rs8DImw46ZyCm1
 cOageADreA4PC7HEsjCIzB7BC62vkfKyEk8QCLJf4TzpVxiZikA1oAvKl7SdpD5KshhfnY
 63lZmZPoKCUhXFwJZm7vYF6AjePwcP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-E62E6PwPMzmnnDEPrBYHXA-1; Fri, 05 Feb 2021 08:38:17 -0500
X-MC-Unique: E62E6PwPMzmnnDEPrBYHXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76DCF1800D50;
 Fri,  5 Feb 2021 13:38:16 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB40360843;
 Fri,  5 Feb 2021 13:38:12 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-3-eblake@redhat.com>
 <7d2c705b-8bac-5229-00e1-0c3d2f1a6f07@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
Message-ID: <00271002-6329-8dd5-f714-85c0875c3733@redhat.com>
Date: Fri, 5 Feb 2021 07:38:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7d2c705b-8bac-5229-00e1-0c3d2f1a6f07@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, qemu-block@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 rjones@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:25 AM, Vladimir Sementsov-Ogievskiy wrote:
> 04.02.2021 22:07, Eric Blake wrote:
>> Supporting '0x20M' looks odd, particularly since we have an 'E' suffix
> 
> What about also deprecating 'E' suffix? (just my problem of reviewing
> previous patch)

No, we want to keep '1E' as a valid way to spell 1 exabyte.  That has
uses in the wild (admittedly corner-case, as that is a LOT of storage).
It is only '0x1E' where the use of 'E' as a hex digit has priority over
'E' as a suffix meaning exabyte.

> 
>> that is ambiguous between a hex digit and the extremely large exibyte
>> suffix, as well as a 'B' suffix for bytes.  In practice, people using
>> hex inputs are specifying values in bytes (and would have written
>> 0x2000000, or possibly relied on default_suffix in the case of
>> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
>> sense for inputs in decimal (where the user would write 32M).  But
>> rather than outright dropping support for hex-with-suffix, let's
>> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
>> have an Err** parameter, we pollute to stderr.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---

>> +++ b/util/cutils.c
>> @@ -264,7 +264,7 @@ static int do_strtosz(const char *nptr, const char
>> **end,
>>       int retval;
>>       const char *endptr;
>>       unsigned char c;
>> -    bool mul_required = false;
>> +    bool mul_required = false, hex = false;
>>       uint64_t val;
>>       int64_t mul;
>>       double fraction = 0.0;
>> @@ -309,6 +309,10 @@ static int do_strtosz(const char *nptr, const
>> char **end,
> 
> you forget to set hex to true in corresponding if(){...}
> 
>>       c = *endptr;
>>       mul = suffix_mul(c, unit);
>>       if (mul > 0) {
>> +        if (hex) {
>> +            fprintf(stderr, "Using a multiplier suffix on hex numbers "
>> +                    "is deprecated: %s\n", nptr);
>> +        }

D'oh.  Now I get to rerun my tests to see when the warning triggers.

>>           endptr++;
>>       } else {
>>           mul = suffix_mul(default_suffix, unit);
> 
> should we also deprecate hex where default_suffix is not 'B' ?

That's exactly what this patch is (supposed to be) doing.  If we parsed
a hex number, and there was an explicit suffix at all (which is
necessarily neither 'B' nor 'E', since those were already consumed while
parsing the hex number), issue a warning.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


