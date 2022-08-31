Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB35A80C7
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:59:00 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTPBD-00074O-3H
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTP6N-0000Y8-Vs
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTP6K-0000bU-Do
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661957635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bdrpuejXuERJeqYR7SiiBsoU+YuUdDmg93nViryYrsg=;
 b=dNRGNGyyDMzed4xD5tw5wQVix1In1sJZs/uCu+pXSGST5YIi9eqC7ycB8c/dGe9gxb3m4t
 ZpBe2klRujeVMARgl2aks5zSe0EkYOncSaTNVx0CbLcVb9c8GGQ17xd5cB3Eg+VH96hwkd
 Fb4+YyCCyI57CnVGD1bCLlnnVNdic1s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-5vKsIGAWNuG2_89673qC5w-1; Wed, 31 Aug 2022 10:53:51 -0400
X-MC-Unique: 5vKsIGAWNuG2_89673qC5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D39380231E;
 Wed, 31 Aug 2022 14:53:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45660909FF;
 Wed, 31 Aug 2022 14:53:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 09F5921E6900; Wed, 31 Aug 2022 16:53:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>
Subject: Re: [PATCH v1 12/16] qapi: fix example of blockdev-add command
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-13-victortoso@redhat.com>
 <87zgfkabel.fsf@pond.sub.org>
 <20220831124512.ngotphuwnsx6pyqn@tapioca>
 <87pmgg8se1.fsf@pond.sub.org>
 <20220831134725.j7lsf7nzt2tc3glr@tapioca>
Date: Wed, 31 Aug 2022 16:53:49 +0200
In-Reply-To: <20220831134725.j7lsf7nzt2tc3glr@tapioca> (Victor Toso's message
 of "Wed, 31 Aug 2022 15:47:25 +0200")
Message-ID: <87y1v45urm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> On Wed, Aug 31, 2022 at 03:16:54PM +0200, Markus Armbruster wrote:
>> Cc: Kevin for an improved chance of getting any nonsense I might write
>> corrected.
>>
>> Victor Toso <victortoso@redhat.com> writes:
>>
>> > Hi,
>> >
>> > On Wed, Aug 31, 2022 at 01:40:50PM +0200, Markus Armbruster wrote:
>> >> Victor Toso <victortoso@redhat.com> writes:
>> >>
>> >> > The example output is setting optional member "backing" with null.
>> >> > This has no runtime impact. Remove it.
>> >> >
>> >> > Problem was noticed when using the example as a test case for Go
>> >> > bindings.
>> >>
>> >> "Fix example" and "problem" implies there's something wrong.
>> >> "No runtime impact" sounds like it's redundant, but not wrong.
>> >> Wrong or not wrong?
>> >
>> > I take your comment is more about the wording which is confusing.
>> >
>> > Would it be better if I change to:
>> > '''
>> >    The example output is setting optional member "backing" with
>> >    null. While this has no runtime impact, setting optional
>> >    members with empty value should not be encouraged. Remove it.
>> > '''
>> >
>> > While I think the above is true, my main reason for proposing
>> > this change is to re-use the example as a test case, but I'm not
>> > sure if adding anything related to it would make it better (only
>> > more confusing!).
>> 
>> I had a closer look at the schema.
>> 
>> The definition of backing is
>> 
>>     ##
>>     # @BlockdevOptionsGenericCOWFormat:
>>     #
>>     # Driver specific block device options for image format that have no option
>>     # besides their data source and an optional backing file.
>>     #
>>     # @backing: reference to or definition of the backing file block
>>     #           device, null disables the backing file entirely.
>>     #           Defaults to the backing file stored the image file.
>>     #
>>     # Since: 2.9
>>     ##
>>     { 'struct': 'BlockdevOptionsGenericCOWFormat',
>>       'base': 'BlockdevOptionsGenericFormat',
>>       'data': { '*backing': 'BlockdevRefOrNull' } }
>> 
>> Meaning, if I remember correctly (with some help from commit
>> c42e8742f52's message):
>> 
>> 1. Present @backing
>> 
>> 1.a. of type 'str' means use the existing block device with this ID as
>>      backing image
>> 
>> 1.b. of type 'BlockdevOptions' means use the new block device defined by
>>      it as backing image
>> 
>> 1.c. that is null means use no backing image
>>
>> 2. Absent @backing means default to the backing file named in the COW
>>    image.
>
> Over the wire, how you get the difference between 1.c and 2? Are
> you saying that for optional member "backing" we should be
> explicit sending null over the wire?

In the QAPI schema language, absent optional members do not default to
any specific value.  Or in other words, "absent" is distinct from
"present with value V" for any value V.

Now, the *semantics* of "absent" are often identical to some default
value.  Documentation should then say something like (default:
DEFAULT-VALUE).

In this particular instance, it isn't: "absent" means something else
than any possible value.

Aside: no, I don't like this part of the QAPI schema language design
either.  "Absent defaults to DEFAULT-VALUE" is easier to explain and
understand.

Back to your question: to get 1.c., you pass a member "backing": null on
the wire, and to get 2., you pass no "backing" member.

>> Therefore, ...
>>
>> >
>> > Cheers,
>> > Victor
>> >
>> >> > Signed-off-by: Victor Toso <victortoso@redhat.com>
>> >> > ---
>> >> >  qapi/block-core.json | 4 +---
>> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/qapi/block-core.json b/qapi/block-core.json
>> >> > index dcc6d41494..302164d575 100644
>> >> > --- a/qapi/block-core.json
>> >> > +++ b/qapi/block-core.json
>> >> > @@ -1542,9 +1542,7 @@
>> >> >  #      "arguments": { "driver": "qcow2",
>> >> >  #                     "node-name": "node1534",
>> >> >  #                     "data-file": { "driver": "file",
>> >> > -#                                    "filename": "hd1.qcow2" },
>> >> > -#                     "backing": null } }
>> >> > -#
>> >> > +#                                    "filename": "hd1.qcow2" } } }
>> >> >  # <- { "return": {} }
>> >> >  #
>> >> >  # -> { "execute": "blockdev-snapshot",
>> >>
>>
>> ... your patch changes the example from 1.c. to 2.  Which is probably
>> not what you intended.
>
> Yep, you are correct but not just with my patch. It is confusing
> that an optional member must be set to JSON Null over the wire..
> I'll need to think a bit more on this.
>
> Many many thanks for your review. Really appreciate it.

You're welcome!


