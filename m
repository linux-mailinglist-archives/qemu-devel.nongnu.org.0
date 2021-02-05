Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A414310C95
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:30:18 +0100 (CET)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l827h-0001Xc-O0
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l826E-0000cT-7t
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l826C-0003kp-OS
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612535319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBUVAxXgXUpb0FtTR5yhqX4TjqKgcrbnm9Akzr5taC0=;
 b=JazhfyAun4xJ1xmW6Q25AO8ysKX794+Ilvp7WVgoJVEMle3rzWHK+pHp2UT74U0dfu66ZF
 q/GXaU15B1AsPOPrUIzoQvUgzCQ6lIlBw2hYGO/bEP38pnforIm9g50dP83mnEB1mu5WSx
 bwyV7L3n7yY/cUEzS1AMvmEsaBm7Kfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-wWvzg-L0OPCxz8O370Ux_A-1; Fri, 05 Feb 2021 09:28:36 -0500
X-MC-Unique: wWvzg-L0OPCxz8O370Ux_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEC2310CE780;
 Fri,  5 Feb 2021 14:28:34 +0000 (UTC)
Received: from [10.3.112.253] (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A2AE679EE;
 Fri,  5 Feb 2021 14:28:31 +0000 (UTC)
Subject: Re: [PATCH 3/3] utils: Deprecate inexact fractional suffix sizes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-4-eblake@redhat.com>
 <20210205111036.GE908621@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c257a78a-1cc4-9d29-ac2c-fb4b5d68e469@redhat.com>
Date: Fri, 5 Feb 2021 08:28:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205111036.GE908621@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 tao3.xu@intel.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:10 AM, Daniel P. Berrangé wrote:
> On Thu, Feb 04, 2021 at 01:07:08PM -0600, Eric Blake wrote:
>> The value '1.1k' is inexact; 1126.4 bytes is not possible, so we
>> happen to truncate it to 1126.  Our use of fractional sizes is
>> intended for convenience, but when a user specifies a fraction that is
>> not a clean translation to binary, truncating/rounding behind their
>> backs can cause confusion.  Better is to deprecate inexact values,
>> which still leaves '1.5k' as valid, but alerts the user to spell out
>> their values as a precise byte number in cases where they are
>> currently being rounded.
> 
> I don't think we should be deprecating this, as I think it makes
> it very user hostile.  Users who require exact answers, won't be
> using fractional syntax in the first place. IOW, by using fractional
> syntax you've decided that approximation is acceptable. Given that,
> I should not have to worry about whether or not the fraction I'm
> using is exact or truncated. It is horrible usability to say that
> "1.1k" is invalid, while "1.5k" is valid - both are valid from my
> POV as a user of this.
> 
> 
> 
>> Note that values like '0.1G' in the testsuite need adjustment as a
>> result.
>>
>> Sadly, since qemu_strtosz() does not have an Err** parameter, we
>> pollute to stderr.
> 
> This is only an warning, so setting an Err ** would not be appropriate
> right now.
> 
> None the less we should add an Err **, because many of the callers
> want an Err ** object populated, or use error_report().

That is more effort.  What's the consensus - is it important enough that
I should spend that effort getting rid of technical debt by adding
versions of qemu_strto* that take Err** at this point in time?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


