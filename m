Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBC65A7EB9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 15:28:12 +0200 (CEST)
Received: from localhost ([::1]:57214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNlL-0006do-2n
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 09:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTNfx-0001KF-Bq
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTNfv-0006eg-FB
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 09:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661952154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/i6dhph7aiQE8w8EAKBVg+i418lACY9jc66jx+fmaI=;
 b=UzsT5J5rNka54z6q0TnEzrcW2LkKnBpRMhcfrk+JQNiFvqcMEcwA1mJ8MAcwATFspVL345
 c2XMJ+bc7+RHL6eBPheOixQuJMMIzwkW9Ts50HpAh2VNDHA2Vs2LG5j/8G0FfM0vkTMyGS
 ktDWeA4LBO7cR2mYBkRTRVSkID4dkd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-Kywed6LrO_OHYUMkM14gKw-1; Wed, 31 Aug 2022 09:22:31 -0400
X-MC-Unique: Kywed6LrO_OHYUMkM14gKw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ACD5811E87;
 Wed, 31 Aug 2022 13:22:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11174492C3B;
 Wed, 31 Aug 2022 13:22:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EB20821E6900; Wed, 31 Aug 2022 15:22:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Gerd Hoffmann
 <kraxel@redhat.com>
Subject: Re: [PATCH v1 03/16] qapi: fix example of query-spice command
References: <20220830161545.84198-1-victortoso@redhat.com>
 <20220830161545.84198-4-victortoso@redhat.com>
 <87sflcaayg.fsf@pond.sub.org>
 <20220831125505.ezjevpomvsns7db7@tapioca>
Date: Wed, 31 Aug 2022 15:22:29 +0200
In-Reply-To: <20220831125505.ezjevpomvsns7db7@tapioca> (Victor Toso's message
 of "Wed, 31 Aug 2022 14:55:05 +0200")
Message-ID: <87czcg8s4q.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
> On Wed, Aug 31, 2022 at 01:50:31PM +0200, Markus Armbruster wrote:
>> Victor Toso <victortoso@redhat.com> writes:
>>
>> > Example output has an extra ',' delimiter and a foreign comment
>> > format. Fix it.
>> >
>> > Problem was noticed when trying to load the example into python's json
>> > library.
>> >
>> > Signed-off-by: Victor Toso <victortoso@redhat.com>
>> > ---
>> >  qapi/ui.json | 3 +--
>> >  1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/qapi/ui.json b/qapi/ui.json
>> > index 286c5731d1..901b84da8a 100644
>> > --- a/qapi/ui.json
>> > +++ b/qapi/ui.json
>> > @@ -356,8 +356,7 @@
>> >  #                "host": "127.0.0.1",
>> >  #                "channel-id": 0,
>> >  #                "tls": false
>> > -#             },
>> > -#             [ ... more channels follow ... ]
>> > +#             }
>> >  #          ]
>> >  #       }
>> >  #    }
>>
>> Hmm.  You're removing an ellipsis Gerd put there for a reason,
>> I presume (commit cb42a870c3 "spice: add qmp 'query-spice' and
>> hmp 'info spice' commands.")
>
> I guess the reason is just that we get a too big array of
> SpiceChannels so the example output would be big but not
> interesting.
>
>> Even if we can do without it here, We may still want a way to
>> abridge examples.  Thoughts?
>
> I just want something that can be a valid QMP message so we can
> transform JSON to a specific language type and then back to QMP
> message and compare that both matches.
>
> I don't think that, for the purpose of query-spice documentation
> it is worth to have a very similar but with 10 or more entries of
> array of channels. So, I'd say it is fine to simply cut it here.
> If we have a reason to put it out a 100% valid message, well, we
> would have that reason to back it up... but I don't have one.

I agree listing more channels in the example wouldn't help users.

But do we want to indicate that the example is abridged?

Gerd, I'd like to have your Acked-by for this patch.


