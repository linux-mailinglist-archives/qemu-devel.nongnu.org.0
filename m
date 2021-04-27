Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EB436BF1F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 08:10:04 +0200 (CEST)
Received: from localhost ([::1]:37854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbGv6-0006ch-1K
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 02:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbGsf-0004xi-BM
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbGsc-0001oQ-HD
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 02:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619503648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eG4o3S/RQr+VUMe9GzV2EZ4XoZGOSwN4JqC85zb6NnY=;
 b=OMCfmWfIvwRDFsLvlLQCZhjZKIxY1RVapm5xFG7TY5WjISQJaqRsRI+K1p5f8s4vMAgAEY
 +g5RnEcVd5hdAfda4AA9KURUV5Bhj2W8/WLkUs3IJer93CTU7LnnV4/4Mikk63OIeN3u/j
 Jiv+AQuzKTZhJzLyo049T2I8Hs5CEsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-NN1EcylHM4moaY6crjITEg-1; Tue, 27 Apr 2021 02:07:26 -0400
X-MC-Unique: NN1EcylHM4moaY6crjITEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF8E41006CAD;
 Tue, 27 Apr 2021 06:07:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8948A2AABD;
 Tue, 27 Apr 2021 06:07:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 135E8113525D; Tue, 27 Apr 2021 08:07:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 03/22] qapi/source: Remove line number from
 QAPISourceInfo initializer
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-4-jsnow@redhat.com>
 <87o8e49oha.fsf@dusky.pond.sub.org>
 <c6636089-02a4-97e2-5828-04bb94f6bb3b@redhat.com>
Date: Tue, 27 Apr 2021 08:07:24 +0200
In-Reply-To: <c6636089-02a4-97e2-5828-04bb94f6bb3b@redhat.com> (John Snow's
 message of "Mon, 26 Apr 2021 19:14:34 -0400")
Message-ID: <87zgxk6z1f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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

> On 4/24/21 2:38 AM, Markus Armbruster wrote:
>> Mixing f-string and % interpolation.  I doubt we'd write it this way
>> from scratch.  I recommend to either stick to % for now (leave
>> conversion to f-strings for later), or conver the column formatting,
>> too, even though it's not related to the patch's purpose.
>
> True. Two thoughts:
>
> 1. I don't like using % formatting because it behaves differently from
> .format() and f-strings. My overwhelming desire is to never use it for 
> this reason.
>
> Example: {foo} will call foo's __format__ method, whereas "%s" % foo
> will simply add str(foo). They are not always the same, not even for 
> built-in Python objects.

I only care for readability, which profits from local consistency.
Maybe I'll sing a different tune once I got actually bitten by the
difference between interpolation and f-strings.

> 2. Cleaning up the formatting here without cleaning it up everywhere
> is a great way to get the patch NACKed. You have in the past been
> fairly reluctant to "While we're here" cleanups, so I am trying to cut
> back on them.

Yes, I've been pushing back on such cleanups.  But it's really a
case-by-case issue.  When a patch fits on a page, squashing in a bit of
losely related cleanup is usually fine.  When it's long, keep it focused
on a single purpose.

> This is why my habit for f-strings keeps trickling in: whenever I have
> to rewrite any interpolation, I reach for the one that behaves most 
> idiomatically for Python 3. I am trying to balance that against churn
> that's not in the stated goals of the patch.
>
> In this case: I'll clean the rest of the method to match; and add a
> note to the commit message that explains why.

Okay.

>                                               I will get around to
> removing all of the f-strings,

The opposite, I presume.

>                                but I want to hit the clean linter
> baseline first to help guide the testing for such a series. I regret
> the awkward transitional period.

I'd leave converting interpolation to f-strings for later.

I can tolerate early, partial conversion, since I trust complete
conversion will happen, and as long as the resulting local inconsistency
isn't too grating.  Subjective, I know.


