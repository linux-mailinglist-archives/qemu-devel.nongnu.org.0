Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E22357E34
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:35:17 +0200 (CEST)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQ8C-0006AG-A9
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUQ5K-0005C8-6t
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUQ5H-0000Re-5M
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617870733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U41Nkca0/JCuokw/BGXEsuUVUgbyqhGDO6xGeXyrKdM=;
 b=W28fQ1dgR0Orz6B9sQ/pH0uU38nFOy/B/B/UlOkjqvDC95Zls13D44lou+f3k/6pOQoMGc
 Vvy1YYgoBaiXQC5MJc9g5nRnwJwu3LpM3wgynPcN35i++DfIRbBTTm5Q754LljOFN/6u/U
 ld0ztTbsebcGNr+tHHaX2T5u/LihotM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-Hi0WdVy0N5O9HaUUVUe7mg-1; Thu, 08 Apr 2021 04:32:10 -0400
X-MC-Unique: Hi0WdVy0N5O9HaUUVUe7mg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 286211006C81;
 Thu,  8 Apr 2021 08:32:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B6D5C5E1;
 Thu,  8 Apr 2021 08:32:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C60B3113865F; Thu,  8 Apr 2021 10:32:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for
 comments and docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
 <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
 <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
Date: Thu, 08 Apr 2021 10:32:06 +0200
In-Reply-To: <CAFEAcA8f-d7fPzrisUVkjkvpD0CCdQFBso3GiFmAPJ6gj-P_mg@mail.gmail.com>
 (Peter Maydell's message of "Fri, 26 Mar 2021 16:44:25 +0000")
Message-ID: <87tuohch2x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 26 Mar 2021 at 16:33, John Snow <jsnow@redhat.com> wrote:
>> Being less terse about it: Mostly, I don't like how it enforces this
>> column width even for indented structures. Generally, we claim that 72
>> columns is "comfortable to read" and I agree.
>>
>>                                     However, when we start in a margin, I
>>                                     am not convinced that this is
>>                                     actually more readable than the
>>                                     alternative. We aren't using our full
>>                                     72 characters here.
>
> I agree, and I don't see any strong reason to hold our Python
> code to a different standard to the rest of our codebase as
> regards line length and comment standards.

I can't see much of a conflict between canonical Python style and the
rest of our code.  (If there was a conflict, then I'd doubt we should
hold our Python code to a different standard than pretty much all the
other Python code out there.)

PEP 8 is expressly a *guide*.  It doesn't want to be treated as law.  It
tells you when to ignore its guidance even before it gives any, right in
the second section.  Applicable part:

    Some other good reasons to ignore a particular guideline:

    1. When applying the guideline would make the code less readable,
    even for someone who is used to reading code that follows this PEP.

Going beyond 72 colums to make the comment more readable is exactly what
PEP 8 wants you to do.

This is no excuse for going beyond when you could just as well break the
line earlier.

There's a reason pycodestyle distinguishes between errors and warnings,
and "line too long" is a warning.  We've been conditioned to conflate
warnings with errors by C's "the standard permits it, but you really
shouldn't" warnings.  However, treating style warnings as errors is
exactly what PEP 8 calls a folly of little minds.


