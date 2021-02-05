Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D1310C00
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:42:18 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81NJ-0000iL-4Q
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81Lw-0008TE-7L
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:40:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l81Lq-0007gP-0q
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612532443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoRIKLAzBdYQa6P8tjHgcJvFGUkCshJiEKLBKvVzZN8=;
 b=LTxxVgYOPSjYAxl7nnJXL0fEPtGRWc/3MG3mMqyg5IIQExkSymEOAke6uE2hCr5WA/WjVA
 0+hnkaoWZNsspyGvEeporUJgSN1DL4meGeIpKScy2wCQaLNZ7+PJDR2t0b0EOVHPKPK6S2
 SvxXxZXGmGEabT4c5QDxOh5CB/itFqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-eOlSoOUzMYy9M8ID_TGgNA-1; Fri, 05 Feb 2021 08:40:42 -0500
X-MC-Unique: eOlSoOUzMYy9M8ID_TGgNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7A3280198A;
 Fri,  5 Feb 2021 13:40:40 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4675060C9C;
 Fri,  5 Feb 2021 13:40:37 +0000 (UTC)
Subject: Re: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-3-eblake@redhat.com>
 <20210205111302.GF908621@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f08f11a9-f76c-4473-a770-9939f28c7373@redhat.com>
Date: Fri, 5 Feb 2021 07:40:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205111302.GF908621@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:13 AM, Daniel P. Berrangé wrote:
> On Thu, Feb 04, 2021 at 01:07:07PM -0600, Eric Blake wrote:
>> Supporting '0x20M' looks odd, particularly since we have an 'E' suffix
>> that is ambiguous between a hex digit and the extremely large exibyte
>> suffix, as well as a 'B' suffix for bytes.  In practice, people using
>> hex inputs are specifying values in bytes (and would have written
>> 0x2000000, or possibly relied on default_suffix in the case of
>> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
>> sense for inputs in decimal (where the user would write 32M).  But
>> rather than outright dropping support for hex-with-suffix, let's
>> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
>> have an Err** parameter, we pollute to stderr.
> 
> Err** is only appropriate for errors, not warnings, so this statement
> can be removed.

The point of the comment was that we have no other mechanism for
reporting the deprecation other than polluting to stderr.  And if we
ever remove the support, we'll either have to silently reject input that
we used to accept, or plumb through Err** handling to allow better
reporting of WHY we are rejecting input.  But I didn't feel like adding
Err** support now.

>> @@ -309,6 +309,10 @@ static int do_strtosz(const char *nptr, const char **end,
>>      c = *endptr;
>>      mul = suffix_mul(c, unit);
>>      if (mul > 0) {
>> +        if (hex) {
>> +            fprintf(stderr, "Using a multiplier suffix on hex numbers "
>> +                    "is deprecated: %s\n", nptr);
> 
> warn_report(), since IIUC, that'll get into HMP response correctly.

Yes, that sounds better.  I'll use that in v2, as well as tweaking the
commit message.

> 
>> +        }
>>          endptr++;
>>      } else {
>>          mul = suffix_mul(default_suffix, unit);
> 
> Regards,
> Daniel
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


