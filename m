Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116022FBC8B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:35:56 +0100 (CET)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tz0-0005F3-OL
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1tvM-0003t6-0t
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1tvD-0006la-E0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611073918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4ogm6SNPQjgCCfZxFZxZg9skYBg7J8ULXpTZnFQB4o=;
 b=NspRB6n/WuJ8nPe7cR0OFzsYB6SniRUTtKRqQxopV6lyffmIFm1H4dVAJWqsHjrBSI1aMM
 1REQqgmcl4Ck65i7bfFmIT1oDKCYsLOh6jlrDDfSXyc1gYlr6aC+OdtGSSoGk3dzYh73oS
 08KxlGQfxNY9Et+hvwlrhjUGAIbhmZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Q5tsdFiXM12DLgHgDJBUXQ-1; Tue, 19 Jan 2021 11:31:55 -0500
X-MC-Unique: Q5tsdFiXM12DLgHgDJBUXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030878066E7;
 Tue, 19 Jan 2021 16:31:54 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17AA31B47C;
 Tue, 19 Jan 2021 16:31:50 +0000 (UTC)
To: BALATON Zoltan <balaton@eik.bme.hu>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
 <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
 <20210114140217.GD292902@stefanha-x1.localdomain>
 <6bf62c67-7dff-11e2-37e8-a0e67da89bb2@eik.bme.hu>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <5b620b0a-a21a-e1c4-8f4f-f16bc5b484aa@redhat.com>
Date: Tue, 19 Jan 2021 10:31:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6bf62c67-7dff-11e2-37e8-a0e67da89bb2@eik.bme.hu>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 8:18 AM, BALATON Zoltan wrote:

>> I wasn't aware of the fact that some of the utilities are sensitive to
>> '--' vs '-'! I'm in favor of consistently using '--' in documentation
>> but allowing both for backwards compatibility where '-' is currently
>> supported.
>>
>> If we are in agreement, then let's:
>>
>> 1. Add a section to CODING_STYLE.rst or other developer documentation
>>   documenting this.

Seems reasonable to me.

> 
> I'd be more in favour of documenting that QEMU accepts - options but
> also -- as alternative and fixing the tools that currently use
> getopt_long to use getopt_long_only to keep it consistent with main QEMU
> executable. Otherwise this will get more and more inconsistent with new
> options added with -- and old ones only exist in - form so to keep
> consistency we should standardise on - not --.

I've got less practical experience with getopt_long_only(); I know there
are some utilities like gcc that have to use it, but GNU coding
standards prefer getopt_long() over getopt_long_only().  I think one of
the reasons is the potential for ambiguity: if you have a program that
accepts a series of short options without arguments, you can combine
them together (think 'ls -lF'), but what happens when your combination
of letters then resembles a long option?  A bit contrived, but 'ls --no'
is short for 'ls --no-group' (aka 'ls -G'), while 'ls -no' is the same
as 'ls -n -o', which has different behavior.  ls uses getopt_long(),
hence the use of -- matters; but if it were to use getopt_long_only(),
you would have changed the behavior of 'ls -no' (it would now favor
--no-group over -n -o).

That's not to say we can't switch qemu-img, qemu-storage-daemon,
qemu-io, and friends to use getopt_long_only(), but merely that we have
to be careful of what it will do to their command line parsing, and
whether it will introduce any unintended regressions.

So the conservative answer from me is to prefer documenting '--' options
everywhere, rather than trying to figure out when '-' is acceptable with
long option names.

> 
>> 2. Convert existing documentation to use '--'. This will make it more
>>   consistent and also avoid confusion about '-' vs '--'.
> 
> You could still use -- in documentation but what's the problem with - if
> -- is also accepted if one wants to type that?

Supporting lazy typists is one thing, but our documentation should stick
to the preferred form, even when shorter forms are possible.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


