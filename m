Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6141C31C3C7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:48:03 +0100 (CET)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlis-0003gC-6S
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBli7-0003FT-Fn
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:47:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBli5-0004qY-P0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613425632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UD6zYD3zBOWLIBzBkYthJmB/vsfMNix+S6tzbCJ9bE0=;
 b=YktkXLtSs8luo8T6tl92tkPPLy7bz+SCue/Hu2SxfxEjAQWkLwY4u6shl/vC0soMPhBnUS
 gunPl7/hTJnScbD7YFEBF+ipOoo6MjRhvW+hQf90xHVmDDp+PeOonykTuv0cvSMJMzbBZ7
 onsc6wcrhjH5sFLYJr+DqAYDmMAI4rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-BU3tWdc0OACWhBYfsyHFLg-1; Mon, 15 Feb 2021 16:47:11 -0500
X-MC-Unique: BU3tWdc0OACWhBYfsyHFLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F409AC285
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 21:47:09 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 639D17048B;
 Mon, 15 Feb 2021 21:47:06 +0000 (UTC)
Subject: Re: Call for Google Summer of Code 2021 project ideas
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
 <87pn29kxcp.fsf@dusky.pond.sub.org>
 <b860c470-cbe3-00b5-1966-59fa87045024@redhat.com>
 <87h7njsnui.fsf@dusky.pond.sub.org>
 <c26786ac-159e-149a-aa5e-dd08f418d11e@redhat.com>
 <cc4e606b-eb39-f423-f60b-fec7b622175c@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <1b44e8b8-62e8-876b-4bab-41645b1a52b9@redhat.com>
Date: Mon, 15 Feb 2021 16:47:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cc4e606b-eb39-f423-f60b-fec7b622175c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 6:05 AM, Paolo Bonzini wrote:
> On 14/01/21 17:36, John Snow wrote:
>>
>>> The sane way to evade the language design problem is to use the existing
>>> QMP language.
>>
>> I wouldn't mind implementing this for version 0.1 -- just allow 
>> copy-pasting JSON into the input bar -- it's a feature I wanted anyway.
> 
> I think the only way out of language design is to instead design a TUI 
> for inputting JSON.  For example:
>  > * after typing the ' for a key you can autocomplete the next field,
> using the TAB key similar to vi
> 
> * after typing the : the TUI tells you the field type
> 
> * after typing the ' for an enum, the TAB brings up a menu to pick an enum
> 
> * after typing the last character in a key or value you automatically 
> get a suggestion for what to type next (comma and next apostrophe after 
> a value, colon and possible apostrophe/bracket/brace for a key)
> 
> One idea that has worked for me in the past was to write a mockup that 
> shows what things are going to look like, with fake user interaction. 
> You would have something like
> 
>     // {
>     keypress("{")
>     show_suggestion("'")
>     // '
>     keypress("'")
>     start_autocomplete_choices(["execute", "arguments"])
>     // TAB
>     await asyncio.sleep(1)
>     do_autocomplete()
>     // '
>     await asyncio.sleep(1)
>     keypress("'")
>     // string argument, propose ' for the value automatically
>     show_suggestion(": '")
>     // TAB
>     await asyncio.sleep(1)
>     do_autocomplete()
>     start_autocomplete_choices("query-status", "query-kvm") # many more
> 
> etc.
> 
> Then you plug in an incremental lexer, so that you can e.g. replace
> 
>     show_autocomplete(": '")
> 
> with
> 
>     lex_state(Lexer.AFTER_KEY); // this would come from the lexer
>     show_autocomplete("'")      // this would come from the schema
> 
> And then again plug the incremental visitor to autocomplete on the 
> schema types.
> 
> Another advantage of this approach is that you also have a natural API 
> for the mocks, and thus it becomes easier to write testcases.
> 
> Paolo
> 

Yes, I follow.

I quite like the VSCode auto-suggest behavior for writing JSON when you 
have a schema, but that's baked into their borg-cube, I assume.

I wonder if there's any libraries or more re-usable pieces out there 
that would allow us to write a nice interactive TUI for complex 
structures in Python, or if we'd have to design and build it ground-up.

Changes how willing I am to embark upon the quest.

--js


