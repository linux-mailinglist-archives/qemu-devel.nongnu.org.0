Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398232F54DE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:19:14 +0100 (CET)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzoTx-0000iD-9F
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoQz-0007ft-P5
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:16:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzoQu-0003mE-Sp
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610576163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKxhf0wpapPeq4I009Ur2R7lw9chxfdgbkzK6JFVb1w=;
 b=ZP7IO+vRpgQrcJkbaJgqoE2uJVuut1Tr+wLfVC9k4NpBgZcw0ASzFkE4Ig58TOs1q+7Mi8
 omWOsq2y5o/KRgYgecMcZXUQDgA7H6+6gT6Gv/rgLFChbqZNCDSgLA48DfI0vywuC0idsm
 QQrJpAIIRyYob8oQ/iLs+1DWH0AjZhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-4mP1rwFNNSawDT5cQzjl1Q-1; Wed, 13 Jan 2021 17:16:00 -0500
X-MC-Unique: 4mP1rwFNNSawDT5cQzjl1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 290C8107ACF7;
 Wed, 13 Jan 2021 22:15:59 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9914C60BF1;
 Wed, 13 Jan 2021 22:15:55 +0000 (UTC)
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
Date: Wed, 13 Jan 2021 16:15:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 3:42 PM, John Snow wrote:
> On 1/13/21 4:48 AM, Stefan Hajnoczi wrote:
>>> QEMU options are single dash with double dash accepted for
>>> compatibility but
>>> help and other docs have single dash so these (and below) should be
>>> -trace.
>>> (Also a bit less typing for otherwise already way too long command
>>> lines.)
>> Is this documented somewhere?
>>
>> I was under the impression that '-' is legacy syntax and '--' is the
>> preferred syntax. There are examples of '--' on the QEMU man page.

Historically, uses of 'getopt_long()' support only double dash, while
'getopt_long_only()' support both single and double.  While qemu does
not use getopt_long_only() (because it rolls its own parser instead), it
certainly tries to behave as if it does.  Meanwhile, our other tools
like qemu-img or qemu-storage-daemon use getopt_long().  I'm in favor of
preferring the double-dash in documentation, even when single-dash
works, especially for any option (like --trace) that is used for more
tools than just qemu proper, because it makes for easier copy-paste
between options that work for all tools in the qemu suite rather than
just qemu.

>>
>> Let's reach agreement, document it, and then make the documentation
>> consistent.
>>
>> Stefan
> 
> My naive impression was that double-dash is the preferred idiom in
> linuxdom in general for any multi-character option.
> 
> We might hang on to single-dash for backwards compatibility, but I doubt
> we want to enshrine that as our preferred way.
> 
> Is there a reasoning I am unaware of?

Continuing to document '-machine' instead of '--machine' for qemu is
debatable because we don't support 'qemu-img --machine' or
'qemu-storage-daemon --machine'; but since 'qemu-img -trace' is an error
while 'qemu-img --trace' works, I'm definitely in favor of preferring
'--trace' everywhere in our docs.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


