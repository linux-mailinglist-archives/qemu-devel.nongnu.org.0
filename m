Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA1216878
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 10:40:10 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsj97-0003R0-Ji
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 04:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jsj82-0002h8-Ah
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 04:39:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58975
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jsj80-0001vT-6B
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 04:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594111139;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9IP62BxojF7Csr0aGkg6F3PDNS09QR4dHj4iTjwoMs=;
 b=NK8RMcPtVR5VgJE3aV7mdq6mYL8u1vnJAK6q5jIzavb7LPSyH7mR32uu09HbdyaBKWtxqj
 5utvWFuNGSRr4qz6hC6Vppz+Vvrz93VJGS6j4FJRbwZI5kGbKiNFUsLmVG3hlC6GtEJ/xp
 I0De2satRYFu4OQZAbMX5SQgRr+vwUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-NnWHdqxMNBSfyaELLnTdQQ-1; Tue, 07 Jul 2020 04:38:46 -0400
X-MC-Unique: NnWHdqxMNBSfyaELLnTdQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA620108C28F;
 Tue,  7 Jul 2020 08:38:45 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FCD77F5C;
 Tue,  7 Jul 2020 08:38:38 +0000 (UTC)
Date: Tue, 7 Jul 2020 09:38:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] util/qemu-option: Document the get_opt_value() function
Message-ID: <20200707083835.GA2649462@redhat.com>
References: <20200629070858.19850-1-philmd@redhat.com>
 <1dec6cd5-42f8-8e9f-cc87-108e46a926cc@linaro.org>
 <82bd90f7-9e08-8ada-2a87-b031ea1d116f@amsat.org>
MIME-Version: 1.0
In-Reply-To: <82bd90f7-9e08-8ada-2a87-b031ea1d116f@amsat.org>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 07, 2020 at 04:14:40AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/7/20 3:14 AM, Richard Henderson wrote:
> > On 6/29/20 12:08 AM, Philippe Mathieu-Daudé wrote:
> >> Coverity noticed commit 950c4e6c94 introduced a dereference before
> >> null check in get_opt_value (CID1391003):
> >>
> >>   In get_opt_value: All paths that lead to this null pointer
> >>   comparison already dereference the pointer earlier (CWE-476)
> >>
> >> We fixed this in commit 6e3ad3f0e31, but relaxed the check in commit
> >> 0c2f6e7ee99 because "No callers of get_opt_value() pass in a NULL
> >> for the 'value' parameter".
> >>
> >> Since this function is publicly exposed, it risks new users to do
> >> the same error again. Avoid that documenting the 'value' argument
> >> must not be NULL.
> > 
> > I think we should also add some use of __attribute__((nonnull(...))) to enforce
> > this within the compiler.
> > 
> > I recently did this without a qemu/compiler.h QEMU_FOO wrapper within
> > target/arm.  But the nonnull option has optional arguments, so it might be
> > difficult to wrap in macros.
> 
> I have this patch after your suggestion from last year:
> 
> +#if __has_attribute(nonnull)
> +# define QEMU_NONNULL(LIST) __attribute__((nonnull((LIST))))
> +#else
> +# define QEMU_NONNULL(LIST)
> +#endif

The if/else branch is not required, as both clang and gcc support
this, and they are our only supported compilers.


Beware that __attribute__((nonnul)) has side-effects, as it was
originally implemented as a hint for the optimizer. It allows it
to eliminate any code in the method that does a comparison to
NULL.  Historically it only generated warning messages in very
few scenarios involving a literal NULL. Only more recently with
-fanalyzer can it generate warnings about indirect passing of
NULL via variables.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


