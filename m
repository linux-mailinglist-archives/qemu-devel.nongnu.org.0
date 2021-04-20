Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37C365F04
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 20:08:09 +0200 (CEST)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYunA-00071M-Eb
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 14:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lYum8-0006Ed-5E
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 14:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lYulw-0001JR-9a
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 14:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618942011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFVx3eyCNOGgMlo16fx29TWuYsND60JxaxaPrTl/faQ=;
 b=O3YZ+v3RCBMXCgsk/8BYwuWjN3VtRwXcmUCKfhSWMhwhVZbPbVLKKCyiRehJqyl+9zeS9W
 vvrT33ezkkWMqABBly/my7xS75xDJSrTiPpy3oiHLj6brA7Xlw/mqsCY4SeV+7r8NS3Rha
 e7ue6mJC7snd/I1gwKR8ZuGK0cWtPKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-f7gWXTJVMoCyc8z1Gi7vuw-1; Tue, 20 Apr 2021 14:06:49 -0400
X-MC-Unique: f7gWXTJVMoCyc8z1Gi7vuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717A718B9F85;
 Tue, 20 Apr 2021 18:06:48 +0000 (UTC)
Received: from [10.10.118.219] (ovpn-118-219.rdu2.redhat.com [10.10.118.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EDA31007604;
 Tue, 20 Apr 2021 18:06:47 +0000 (UTC)
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for comments
 and docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <878s5i5rgm.fsf@dusky.pond.sub.org>
 <929a61e6-dde7-597a-d741-79b6be44ff14@redhat.com>
 <87fszp18u4.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <e214622a-739c-126d-5899-b3cd433bfd9d@redhat.com>
Date: Tue, 20 Apr 2021 14:06:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87fszp18u4.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 4/17/21 6:52 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
>> On 4/16/21 8:44 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:

>> It will be an eventual thing, though: I think we need to agree on a
>> style guide document and in that same series, fix up the instances of
>> defying that guide. I think it's important to pair that work, because
>> the ease of finding and fixing those style deviations will help inform
>> how pragmatic the style guide is.
> 
> Makes sense.
> 
> The introduction of "sphinxy" doc strings (starting with commit
> adcb9b36c) may have been premature.
> 

Somewhat premature, but what other format is there? It would have been 
worse to adopt Numpy or google style.

We'll dial it in over time, it will be fine.

>> I feel like it's something I want to do very soon, but not right now.
>> Maybe during the next freeze we can tackle it?
> 
> Whenever you're ready.
> 
> Until then, I feel we should try to minimize doc string churn.  Leave
> existing doc strings alone unless they're harmful.  Add new ones only
> when we believe they're helpful enough to justify some churn later.
> 

OK. After the expr comments, I actually didn't add very many. I think I 
add one or two for the parser because I had trouble understanding at a 
glance how it worked, but most of the tiny functions and helpers I left 
alone.

I barely touched schema.py, because it was complex and I had some 
visions of refactoring it a little to make some of the typing better later.

>>> Improvement, but mind PEP 8's "You should use two spaces after a
>>> sentence-ending period in multi-sentence comments".
>>>
>>
>> How important is this, and why? My existing prejudice is that it's only
>> a superficial detail of writing with no real impact.
> 
> Holy wars have been fought over less.
> 

:)

>> (Of course, a single space typist WOULD believe that, wouldn't they?
>> Those single-space typists are all the same!)
> 
> I offer three reasons:
> 
> * Local consistency
> 
> * Stick to PEP 8 unless you have good reason not to.
> 
> * It makes Emacs sentence commands work by default.
> 

For me, it's another thing in the category of "I don't actually mind 
either way", and can foresee myself accepting a patch using either style 
without comment. Inconsistency here doesn't really bother me unless it's 
inconsistent within a single docstring.

For QAPI, since you're the maintainer, I can adhere to your style. For 
the purposes of all Python code, though, I am not sure I want to bother 
enforcing it myself.

You're always welcome to post-edit anything I've written for 
typographical consistency as you see fit, I genuinely won't mind. (It 
saves me the trouble of having to copy-edit for something I am visually 
blind to.)

That said, I'll try to match your preferred style for QAPI at a minimum. 
I notice that emacs' reflow command does not always insert two spaces if 
a paragraph already sneaks in under the column limit; is there a way to 
*force* it to add two spaces?

>> Unfortunately, omitting it from flake8 means I'll probably also miss
>> cases where I or someone else have gone slightly over the limit for
>> docstrings, and doubt it will be enforced consistently.
> 
> I'm happy to correct the occasional minor style issue manually.
> 

If you accept that burden then I have no leg to stand on, I suppose :)

>>> 1.2. you may drop it.  I can pick it up and take care of it.
>>
>> This one, please!
> 
> You got it.
> 

Thanks! You can do that whenever, it won't interfere with anything in 
the interim.

--js


