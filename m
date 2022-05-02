Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CB5175B7
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 19:27:07 +0200 (CEST)
Received: from localhost ([::1]:34292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlZpC-0001FB-1b
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 13:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlZnN-0000Gq-Dz
 for qemu-devel@nongnu.org; Mon, 02 May 2022 13:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlZnK-0001CD-5q
 for qemu-devel@nongnu.org; Mon, 02 May 2022 13:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651512309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RaBH4mScFY/vN04/0KRWKZoYoKXG1maaDr9i5PRFXgI=;
 b=ZB0ouOrK7eV8FYvaM+5CIel8rg1XGdiY/4ryMEu8NMi2YAB7uk+SRZ1m6PICIWrpAVDfYq
 gaacI7xnIbQ8eClxKwtaiACMtJrdL02gBXDxRISniUeIFt0OGa34VgSBOMrfta+yRW34nr
 EKlojYsKdZQNbB4nLkudB8DKBIUkK60=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-KrZCuR_gNzitR0GR3Owa2w-1; Mon, 02 May 2022 13:25:06 -0400
X-MC-Unique: KrZCuR_gNzitR0GR3Owa2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B446E29ABA03;
 Mon,  2 May 2022 17:25:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB58040D1B9A;
 Mon,  2 May 2022 17:24:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8B7021E68BC; Mon,  2 May 2022 19:24:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 6/7] qapi: Drop unnecessary horizontal spacing in comments
References: <20220429154758.354610-1-abologna@redhat.com>
 <20220429154758.354610-7-abologna@redhat.com>
 <874k28s4hs.fsf@pond.sub.org>
 <CABJz62PTMG6GvZM7nCGxLAb0YhDuA-Yn-q+iNgcZb4=Wpq-Mfw@mail.gmail.com>
Date: Mon, 02 May 2022 19:24:53 +0200
In-Reply-To: <CABJz62PTMG6GvZM7nCGxLAb0YhDuA-Yn-q+iNgcZb4=Wpq-Mfw@mail.gmail.com>
 (Andrea Bolognani's message of "Mon, 2 May 2022 10:34:09 -0400")
Message-ID: <87ee1bkftm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> On Mon, May 02, 2022 at 10:50:07AM +0200, Markus Armbruster wrote:
>> Andrea Bolognani <abologna@redhat.com> writes:
>> > -# @writeback:   true if writeback mode is enabled
>> > -# @direct:      true if the host page cache is bypassed (O_DIRECT)
>> > -# @no-flush:    true if flush requests are ignored for the device
>> > +# @writeback: true if writeback mode is enabled
>> > +# @direct:    true if the host page cache is bypassed (O_DIRECT)
>> > +# @no-flush:  true if flush requests are ignored for the device
>>
>> I'm no fan of horizontally aligning descriptions, because when you add a
>> longer name, you either realign (I hate the churn) or live with the
>> inconsistency (I hate that, too).
>
> We seem to be in violent agreement on the topic, but it's apparent
> that other people feel diffently :)
>
>> I doubt changing to a different alignment now is useful.  The next
>> patch, however, drops the alignment entirely.  Possibly useful.
>>
>> Thoughts?
>
> My rationale for splitting things the way I did is that, if dropping
> the horizontal alignment entirely was not considered desirable, we
> could at least get rid of the extra whitespace.

Understood.

>                                                 But if you think that
> the benefit from the half measure doesn't offset the cost of the
> churn it causes, I'm happy to drop these hunks and go straight from
> the current status to no horizontal alignment at all in one fell
> swoop with the next patch.

Show us the patches, and then we can decide whether the improvement is
worth the churn.

>> > -# Since:  0.14
>> > +# Since: 0.14
>>
>> This one is TAG: TEXT, whereas the one above is a multiple @NAME:
>> DESCRIPTION.  Extra space in the latter can provide alignment.  Extra
>> space in the former is always redundant.  I'd take a patch dropping
>> these obviously redundant spaces without debate :)
>
> Okay, I'll respin this so that the first patch drops all extra
> whitespace in contexts where horizontal alignment is either not
> attempted or not possible, and the second one implements the more
> controversial changes.

The first one is another no-brainer.


