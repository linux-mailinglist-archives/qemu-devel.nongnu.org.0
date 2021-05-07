Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA7D375E70
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 03:36:06 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lepPR-0008HG-Bp
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 21:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lepOK-0007sK-1n
 for qemu-devel@nongnu.org; Thu, 06 May 2021 21:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lepOB-0000KH-0j
 for qemu-devel@nongnu.org; Thu, 06 May 2021 21:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620351285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BOA0zK3EQovgulFQQvRf/L4tspRtUisXUZOIak5QPw=;
 b=XJV90n8oV3A2TTWqHM6fmwex2TTUDfeVAa8oXxeQr3KK4osMtBRDmzDvfWjRK9cc81/wx3
 E3XlDl5FVBahNiIQCO9BtO17hk6DhwL8jzrlZ7VzDPirTO3a1gcmMJdhHeGHxkuTKkYN65
 39WV04UWoZ8t/Vly7Sk9neC0rjDObCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-n1zTHQnfNr2ptdkz1aQ8sg-1; Thu, 06 May 2021 21:34:43 -0400
X-MC-Unique: n1zTHQnfNr2ptdkz1aQ8sg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB8BC107ACCA;
 Fri,  7 May 2021 01:34:42 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B2515D72F;
 Fri,  7 May 2021 01:34:41 +0000 (UTC)
Subject: Re: [PATCH 16/22] qapi/parser: add docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-17-jsnow@redhat.com>
 <877dkq5w9x.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <43a39889-5537-575a-54f9-4b2b48cddbdd@redhat.com>
Date: Thu, 6 May 2021 21:34:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877dkq5w9x.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 9:27 AM, Markus Armbruster wrote:
> Another ignorant doc string markup question...  how am I supposed to see
> that exprs and docs are attributes, and not global variables?
> 

The syntax is apparently supposed to be :py:attr:`MyClass.attr`. Though, 
it doesn't seem to be working for me. I can write :py:attr:`bzbxglkdsgl` 
and the build succeeds. I gotta hunch:

Sphinx was designed to parse ReST written by hand. The " .. py:method::" 
directives are ones you'd use when using sphinx in that style. Those 
directives are what create an object in Sphinx's cross-reference system. 
Later, if you use :py:meth:`foo`, it references that specific object.

Sphinx autodoc is a system that parses your code and automatically 
generates py:method:: and py:class:: directives for you, allowing the 
reference syntax to work.

MY HUNCH is that for field list markup within a docstring -- things like 
:ivar: -- that there is not any corresponding object being created, 
rendering cross-references for things at that scope when using autodoc 
ineffective.

BOO, BOO, A THOUSAND TIMES BOO TO THIS.

Argh, yep.

If I use:

     .. py:attribute:: exprs 

 

         Resulting parsed expressions. 


instead of

:ivar exprs: Resulting parsed expressions

then the syntax :attr:`qapi.parser.QAPISchemaParser.exprs` does resolve 
into a clickable hyperlink on the rendered output.

  ____   ___   ___   ___  _
| __ ) / _ \ / _ \ / _ \| |
|  _ \| | | | | | | | | | |
| |_) | |_| | |_| | |_| |_|
|____/ \___/ \___/ \___/(_)


Sigh. Well, while I'm here doing the research and talking to myself, the 
syntax :attr:`exprs` also works when you have the target defined. It 
doesn't have to be as verbose. With my testing setup of using the 
default role of "any", even just `exprs` works.

I wonder if there's the possibility of having sphinx enhance :ivar: and 
:cvar: to automatically create the same kind of reference target as 
py:attribute:: does.

Problems for later.

For now ...

``.exprs`` and ``.docs``?

--js


