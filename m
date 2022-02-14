Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B864B531F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:22:01 +0100 (CET)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcEp-0003g1-1n
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:21:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJbin-0007rb-Tn
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJbik-0008Ap-EG
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644846529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XxpB41wnMfc4E1WAm/nhZ1fku295e/1gwm6x5DYca3A=;
 b=e8k5wwrl8VNyIR+aEvMoBHb3ke9dwLjcFqfGg76hNMSpPhYWi8HijXnV0TpUxTx7AjbuEj
 jntLqyazyBNhCHTzgYlWT1a/21208mNKKXd4/tuFwPI64HZhs/02jkFqI3F+dgJtYnFoCj
 HF+0WAxBA1r6T496T1ReoBkS8QogKuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-3NImYMXANKODPKZ6ewbx3A-1; Mon, 14 Feb 2022 08:48:47 -0500
X-MC-Unique: 3NImYMXANKODPKZ6ewbx3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2BAB5233;
 Mon, 14 Feb 2022 13:48:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8A577CAF0;
 Mon, 14 Feb 2022 13:48:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3651621E6740; Mon, 14 Feb 2022 14:48:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] scripts/qapi: minor delinting
References: <20220204225230.2114135-1-jsnow@redhat.com>
 <87leyibtqz.fsf@pond.sub.org>
 <CAFn=p-YSAe7Q+usWEv4b7UciYjm5iso9LH-pd-VbDoV196PfvQ@mail.gmail.com>
 <87o83d8vij.fsf@pond.sub.org>
 <CAFn=p-ZcCjx5eeVcZm0fnc_bzFoffx_GGnCAgQKngGcOXrFLBw@mail.gmail.com>
 <CAFn=p-ZVqhGF=6SEYtD4F=p0iyyWK+6oNvc_w-7ctkmEmpOP9w@mail.gmail.com>
Date: Mon, 14 Feb 2022 14:48:45 +0100
In-Reply-To: <CAFn=p-ZVqhGF=6SEYtD4F=p0iyyWK+6oNvc_w-7ctkmEmpOP9w@mail.gmail.com>
 (John Snow's message of "Fri, 11 Feb 2022 13:36:02 -0500")
Message-ID: <87v8xhimo2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Fri, Feb 11, 2022 at 12:11 PM John Snow <jsnow@redhat.com> wrote:
>>
>> On Fri, Feb 11, 2022 at 6:58 AM Markus Armbruster <armbru@redhat.com> wrote:

[...]

>> > Several of the names in scripts/qapi/pylintrc's good-names don't
>> > actually occur in the code.
>> >
>> > Could I persuade you to replace it with something like
>> >
>> >     good-names-rgxs=^[_a-z][_a-z0-9]?$
>> >
>> > and call it a day?
>> >
>>
>> I've been growing that good-names list out from python/, so they
>> probably appear over in there somewhere.

I see.

>>                                          And uh, eh. In the interest
>> of just moving on to something more interesting, sure. (I reserve the
>> right to change my mind when I attempt to get the CI system protecting
>> the type safety of qapi-gen, when we'll need a single configuration
>> for everything. We can fight about it then.)

Okay.

> (Oh, and some of the names are the default allow list, actually.
> Setting the variable overwrites the default configuration instead of
> amending it, so that's where some of those come from, too. My goal is
> generally to stick to as close to the default configuration as I can
> bear, in the hopes of preventing the fostering of a coding style that
> is too specialized to just qemu.git.)

I agree we shouldn't invent a Python coding style.  I just wish pylint
didn't, either ;-P


