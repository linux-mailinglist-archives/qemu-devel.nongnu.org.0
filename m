Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B19357E3E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 10:37:16 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUQA7-0007Bf-81
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 04:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUQ8w-0006fG-7R
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUQ8u-0002Qq-3r
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 04:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617870959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G4A8zSuWMdk2/gJkln20erA5ZJkYqWuMPwPmydH9vK8=;
 b=The0I9ElHcYmRMeh+mOUVLy9nrYKDjghHTsvy4yF9+ZYh3tK+/95lI7fWLLU4O4SCV17Fs
 7caxA+MlHT5vJfWRQ/HwLfOhX3lPx81fb+7Ml5DAcNYvoYrUetSRf7sv6xV6wskqRK4MY4
 sWRPJMYLQjhPmD1K3HoY+8i8RX90hNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-qxDDbXH9P7yOmOBo8t5OgQ-1; Thu, 08 Apr 2021 04:35:48 -0400
X-MC-Unique: qxDDbXH9P7yOmOBo8t5OgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40C5318B9F84;
 Thu,  8 Apr 2021 08:35:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5E719D9F;
 Thu,  8 Apr 2021 08:35:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D11C113865F; Thu,  8 Apr 2021 10:35:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for
 comments and docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <877dlvs1gp.fsf@dusky.pond.sub.org>
 <ed5134b3-bff9-947e-f370-239e5c31a512@redhat.com>
 <871rc277mm.fsf@dusky.pond.sub.org>
 <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com>
Date: Thu, 08 Apr 2021 10:35:45 +0200
In-Reply-To: <33866c5d-1eab-739c-f2e8-a35f4a0b0f55@redhat.com> (John Snow's
 message of "Fri, 26 Mar 2021 12:30:37 -0400")
Message-ID: <87pmz5cgwu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/26/21 2:26 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 3/25/21 11:21 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> PEP8's BDFL writes: "For flowing long blocks of text with fewer
>>>>> structural restrictions (docstrings or comments), the line length should
>>>>> be limited to 72 characters."
>>>>>
>>>>> I do not like this patch. I have included it explicitly to recommend we
>>>>> do not pay any further heed to the 72 column limit.
>>>>>
>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>
>>>> I'd like to get the remainder of this series moving again before digging
>>>> into this patch.
>>>
>>> I am dropping it, then -- I have no interest in bringing a patch I
>>> dislike along for another respin.
>> Despite your dislike, there might be good parts, and if there are,
>> I'd
>> like to mine them.  I don't need you to track the patch for that,
>> though.  Feel free to drop it.
>> Thank you for exploring the max-doc-length option.
>> 
>
> Being less terse about it: Mostly, I don't like how it enforces this
> column width even for indented structures. Generally, we claim that 72 
> columns is "comfortable to read" and I agree.
>
>                                    However, when we start in a margin, I
>                                    am not convinced that this is
>                                    actually more readable than the
>                                    alternative. We aren't using our full
>                                    72 characters here.
>
> For personal projects I tend to relax the column limit to about 100
> chars, which gives nice breathing room and generally reduces the edge 
> cases for error strings and so on. (Not suggesting we do that here so
> long as we remain on a mailing-list based workflow.)
>
> I can't say I am a fan of the limit; I don't think it's something I
> can reasonably enforce for python/* so I have some concerns over 
> consistency, so I think it'd be easier to just not.

I'm with PEP 8 here: go beyond the line length limits juidicously, not
carelessly.

This cannot be enforced automatically with the tools we have.

> I *did* try, though; I just think it brought up too many judgment
> calls for how to make single-line comments not look super awkward. I
> imagine it'll cause similar delays for other authors, and exasperated
> sighs when the CI fails due to a 73-column comment.

Enforcing a hard 72 limit in CI would be precisely what PEP 8 does not
want us to do.


