Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B24565AC0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:15:00 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Oix-0005mN-M1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Oh5-0004IE-OS
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Oh0-00024S-5B
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656951177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyMia1jvmVc/OHPnytQqw5rdwnD8QwgJu8FU152rJ0g=;
 b=OlwrVG/M/K9FY77JGBKhnlvXz+zbPSBNpqXWHBKyllSGHYThrq2pfFQqQFhJhTwLv+n6Ak
 yNUGy/Ohk0usyy0O/IHLIV+dYIBJLlhJ9Pyk3wf3VHkpYM3qxyGYngt8zD6KkKEdMR4yMj
 Od0o3z3Ek9GkeIaTSgA7/5MRUu5srb4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-bDHVciZ3NbWNyNlc0iWvgg-1; Mon, 04 Jul 2022 12:12:54 -0400
X-MC-Unique: bDHVciZ3NbWNyNlc0iWvgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FB803802B9C;
 Mon,  4 Jul 2022 16:12:53 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6053E1121315;
 Mon,  4 Jul 2022 16:12:52 +0000 (UTC)
Date: Mon, 4 Jul 2022 17:12:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/7] tests: introduce tree-wide code style checking
Message-ID: <YsMRgUjJthbRS5qT@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-2-berrange@redhat.com>
 <CAFEAcA__aTeaeB8JbMQdUz=4_6W8J5m0wOsYWBgj3RLrm=G_uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA__aTeaeB8JbMQdUz=4_6W8J5m0wOsYWBgj3RLrm=G_uQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 04:46:53PM +0100, Peter Maydell wrote:
> On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Historically QEMU has used the 'scripts/checkpatch.pl' script to
> > validate various style rules but there are a number of issues:
> 
> >  meson.build              |   3 +
> >  tests/Makefile.include   |   3 +-
> >  tests/meson.build        |  19 +++
> >  tests/style-excludes.mak |   4 +
> >  tests/style-infra.mak    | 265 +++++++++++++++++++++++++++++++++++++++
> >  tests/style.mak          |  24 ++++
> 
> From my point of view the main issue with checkpatch.pl is
> that nobody in the QEMU developers particularly understands
> it or is enthusiastic about trying to add more tests to it
> or adjust the existing ones where QEMU style diverges from
> the kernel style (but nor are we tracking and upgrading to
> newer versions of the kernel's script).
> 
> This seems to be aiming to replace a complex and hard to
> understand perl script with a complex and hard to understand
> makefile. I can't say I'm terribly enthusiastic :-/

I think the downsides comapred here are rather different orders of
magnitude. The checkpatch.pl script is 3000 lines of code where we
have years of experiance that no one in QEMU likes touching it.

The makefile here is 265 lines of which 50% is comments of license
text.  In terms of what contributors most care about though, is
how you add new rules, and most of the time that's involves just
adding a 3 line make rule based off a regex to match the code
pattern you want to prohibit. Some of this is a bit crufty to
look at, but we've got years of experiance in libvirt with many
contributors frequently adding new tests.

It only gets hairy if the pattern you're trying to forbid needs
to match across multiple lines of text - hence the difference in
complexity between matching 'osdep.h' exists in .c, vs 'osdep.h'
exists as the very first #include.  IME, the single-line matches
are most typical need that is addressed.

So while I wont claim this proposal is perfect, IMHO this would
be a significant step fowards over checkpatch.pl.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


