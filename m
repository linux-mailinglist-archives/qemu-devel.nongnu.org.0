Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A020B23E734
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 08:23:17 +0200 (CEST)
Received: from localhost ([::1]:37994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3vme-0006Wi-Bd
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 02:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3vl9-0005Mr-FC
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 02:21:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48548
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3vl5-0004yg-To
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 02:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596781297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hm8KGGqrZJme7fRGhL36IgYRkJm4JbjasmrRhJ75doY=;
 b=JQHzZDIQwTgCsFnh/EsZPU7oLVXkT8Y7YuDnen+3/s56K08Nt9vsU7jlU9IgO0Wg0wt+2J
 JgtWM18saEE2Zj/XmCxWmDKLzfw6v5kipkTLzJ45xk3Nr+L97XD0ihg4EJiYBkzgEIDH6c
 +OfHhpXIFw0+T8XTFID4SrpIfVwfedg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-GDRGDj9lPj-80Zob1RDwqQ-1; Fri, 07 Aug 2020 02:21:36 -0400
X-MC-Unique: GDRGDj9lPj-80Zob1RDwqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 098F4106B242;
 Fri,  7 Aug 2020 06:21:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D0A987A44;
 Fri,  7 Aug 2020 06:21:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A8DB71132801; Fri,  7 Aug 2020 08:21:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC] checkpatch: detect missing changes to trace-events
References: <20200806153331.23907-1-cfontana@suse.de>
Date: Fri, 07 Aug 2020 08:21:27 +0200
In-Reply-To: <20200806153331.23907-1-cfontana@suse.de> (Claudio Fontana's
 message of "Thu, 6 Aug 2020 17:33:31 +0200")
Message-ID: <87imdv0ye0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  scripts/checkpatch.pl | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> We could do something similar to MAINTAINERS for trace-events,
> ie warning about files added, moved, deleted if we don't see
> an update to a trace-events file.

I like the idea, but...

> To make it more solid it would be better to check the
> actual file contents for #include "trace.h" or "trace-root.h",
> but I guess this is not possible/practice from checkpatch?

... I'm also concerned about false positives.

> If we could only warn for files moved that actually include
> trace.h or trace-root.h, we could avoid a lot of false positives.

The existing MAINTAINERS check warns even when an existing pattern
covers the new file, e.g. when I create or rename a file scripts/qapi/*
or qapi/*.json.  The former is definitely a false positive, and mildly
annoying.  The latter, however, could be a true positive: even though
the new file is covered by the "QAPI Schema" section, *additional*
coverage by some other section may be called for, just like
qapi/machine.json is additionally covered by "Machine core".  So, even
if checkpatch.pl looked at more than just the patch, suppressing false
positives would involve guesswork.

The new trace-events check is simpler: it's *always* a false positive
when the file doesn't include trace.h or trace-root.h.

Complication: it could include via some header.  I figure that's rare
enough to be ignored.

Howver, checkpatch.pl checks *patches* by design[*].  It doesn't read
the patched files to get more context, or additional files.

Perhaps it's simply the wrong place both for the MAINTAINERS check and
the trace-events check.  We put the MAINTAINERS check there, because it
exists and developers run it.  "make check-source" would be another
option, except it doesn't exist.  CI would be yet another option, but we
should be careful about what to check only in CI.


[*] There's -f to check a source file, which checks "diff -u /dev/null
$filename".


