Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99564E9368
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 13:21:11 +0200 (CEST)
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYnQs-0006GB-Pg
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 07:21:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nYnPX-0005XQ-3E
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 07:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nYnPV-0002Iw-K8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 07:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648466384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jK0wGB6FFUOeuCp72Xy74PpJqktEak8TFLGTdr39hNI=;
 b=dm/wF/TdcwdTdgLnfMxbPV8rBLMCkNfC/5ms0iYY1CpdPsIwx3ppSZYGEmPDq2/4VhtoMc
 vbmQ/4+JobUmIztcof2ECm83rELxXJTQxteFDr46yWHnSvW0ZBJ8gem+3muw/hXn6cnd97
 nZb0yYBjdFSPrR0yM4EBlhbrk7DUpHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-RgTZpFIyMfWXaIxiWT3Rtw-1; Mon, 28 Mar 2022 07:19:43 -0400
X-MC-Unique: RgTZpFIyMfWXaIxiWT3Rtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B36800882
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:19:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A69AC15D40;
 Mon, 28 Mar 2022 11:19:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F20521E691D; Mon, 28 Mar 2022 13:19:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v2 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
References: <20220325220707.52118-1-victortoso@redhat.com>
 <20220325220707.52118-3-victortoso@redhat.com>
 <87czi6bgoe.fsf@pond.sub.org>
 <20220328090635.asa3jcwxdapt4f6s@tapioca>
Date: Mon, 28 Mar 2022 13:19:42 +0200
In-Reply-To: <20220328090635.asa3jcwxdapt4f6s@tapioca> (Victor Toso's message
 of "Mon, 28 Mar 2022 11:06:35 +0200")
Message-ID: <87ilry9ve9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> On Mon, Mar 28, 2022 at 10:54:41AM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>> 
>> > Fatal is not optional.
>> 
>> Recognizing that "Fatal" refers to member "fatal" takes mental
>> effort.  Always use identifiers verbatim, including case.
>> Where that makes for confusing prose, prefix with a @ like
>> @fatal, or rephrase, like "The
>> member fatal".
>
> That's true.
>
>> >
>> > Signed-off-by: Victor Toso <victortoso@redhat.com>
>> > ---
>> >  qapi/block-core.json | 7 +++----
>> >  1 file changed, 3 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/qapi/block-core.json b/qapi/block-core.json
>> > index e89f2dfb5b..63c30a5378 100644
>> > --- a/qapi/block-core.json
>> > +++ b/qapi/block-core.json
>> > @@ -5006,10 +5006,9 @@
>> >  # Example:
>> >  #
>> >  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
>> > -#      "data": { "device": "ide0-hd0", "node-name": "node0",
>> > -#                "msg": "Prevented active L1 table overwrite", "offset": 196608,
>> > -#                "size": 65536 },
>> > -#      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
>> > +#      "data": { "device": "", "node-name": "drive", "fatal": false,
>> > +#                "msg": "L2 table offset 0x2a2a2a00 unaligned (L1 index: 0)" },
>> > +#      "timestamp": { "seconds": 1648243240, "microseconds": 906060 } }
>> >  #
>> >  # Since: 1.7
>> >  ##
>> 
>> Changing the value of @msg makes sense, but is worth a note in the
>> commit message.
>> 
>> Here's my try:
>> 
>>     qapi: fix example of BLOCK_IMAGE_CORRUPTED event
>> 
>>     Example output lacks mandatory member @fatal.  Provide it.
>> 
>>     Example output shows a value of @msg no version of the code
>>     produces.  No big deal, but replace it anyway by one that today's
>>     code does produce.
>> 
>> How do you like it?
>
> I agree. I'll be more careful in near future. Thanks for the
> suggestion. I've submit a v2.1 of this patch.

That's okay.  Asking me to replace the commit message in my tree is also
okay.

PATCH 3's commit message could use the same treatment.  Would you like
to go over all of them and respin?  Should be quick, no code changes.

Thanks!


