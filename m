Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A52F52ED
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:02:26 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlPV-0007SN-BH
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzlN5-0006pv-1n
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:59:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzlN2-0005Ja-QR
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 13:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610564390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXgIwPqcdyMMV9UhOISIth7Vb80o60I9G0OEYdB90z8=;
 b=bebavMSYUt6rUuWJOdAsTnwt64TsPfPaBdzybRBQyA0g+XfXCL6BR2xcgg6qu7VeaZdks4
 7RZ5JI8mKvFaqU1duzDSOMsvJuSsOlotPB6iAu3j4wIlC0Ztl0kn7UqlYfNjkG6hKH0Gzw
 Hhi/m6b0cCrsdLcWGlbDGskJALoR3ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-zdD-dkZxPQqkvzWT11thPw-1; Wed, 13 Jan 2021 13:59:49 -0500
X-MC-Unique: zdD-dkZxPQqkvzWT11thPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25A46802B56;
 Wed, 13 Jan 2021 18:59:48 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F2371F400;
 Wed, 13 Jan 2021 18:59:43 +0000 (UTC)
Subject: qmp-shell TUI (was: Re: Call for Google Summer of Code 2021 project
 ideas)
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <CAJSP0QVRohWcfYY7AjispK8+VYat6APc3nNbmAxk+34nZmtFPw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e8938b53-a933-426c-0719-981ab0df123f@redhat.com>
Date: Wed, 13 Jan 2021 13:59:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAJSP0QVRohWcfYY7AjispK8+VYat6APc3nNbmAxk+34nZmtFPw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 3:53 AM, Stefan Hajnoczi wrote:
> On Tue, Jan 12, 2021 at 9:10 PM John Snow <jsnow@redhat.com> wrote:
>> I have one that is probably way too ambitious, but requires a particular
>> skillset that might be of good interest to a student that has some
>> experience in the area already.
>>
>> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
>> irssi-like REPL interface for QMP. The idea would be to mimic the
>> mitmproxy TUI interface (Check it out if you haven't!)
> 
> Great, I think this project idea lends itself to an incremental
> milestones. How far it gets will depend on the intern and we'll be
> able to merge useful patches regardless of how far they take it.
> 

Yeah. I wrote a lot, but I think a lot of the desires and goals can 
actually be split out.

You can start with just the REPL mode; no bells or whistles. Just type 
commands, issue them, and have the log pane populate with the raw JSON 
as a starting point.

That'd be useful enough already. From there, the bells and whistles that 
make it truly shine can be added.

> Two more ideas:
> 1. Ability to load libvirt log files for offline viewing. This could
> be a major use case for this tool because the raw libvirt logs can be
> hard to read today.

Yeah, that would be excellent. (Especially because I have such a hard 
time understanding libvirt-ese; seeing the QMP log in the same tool I 
use to communicate directly with QEMU would be an excellent debugging boon.)

mitmproxy has a similar feature where packet captures can be saved to 
file and loaded again later for analysis. A similar thing here would be 
nice.

I mentioned wanting to be able to save sessions for later viewing in my 
proposal; which likely means developing a QMP log format.

It's unlikely we'll want to use the libvirt log format here, so we'd 
need to develop a reader that can parse libvirt logs; but a writer is 
not likely important.

> 2. Ability to watch QMP activity on a running QEMU process, e.g. even
> when libvirt is directly connected to the monitor.
> 

That *WOULD* be extremely cool, and moves a lot closer to how mitmproxy 
works.

(Actually, mitmproxy could theoretically be taught how to read and 
understand QMP traffic, but that's not something I know how to do or 
would be prepared to mentor.)

Is this possible to do in a post-hoc fashion? Let's say you are using 
production environment QEMU, how do we attach the QMP listener to it? Or 
does this idea require that we start QEMU in a specific fashion with a 
second debug socket that qmp-shell can connect to in order to listen?

... Or do we engineer qmp-shell to open its own socket that libvirt 
connects to ...?

> Stefan
> 


