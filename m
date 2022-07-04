Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98543565B1D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:35 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OlS-0007tp-9t
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8OjF-0006ap-Ps
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8OjD-0002UU-DW
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656951314;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2FRqwMboMt8lc00zCZGZzK2/OSX6qliTp1Zz/f53Eo=;
 b=BkUE7jl2WZZFBSPEd01lwBqcTDHmy1B4DlIOKcbtZ7Nv1KEwfU6XsVswiulqqdf+n3sMEI
 s5bQw+LvlpxP7BlLqdaSCTXBcUl+ituYAgm/ssa99t3P/zGkwcZloyQMiwa0OiZ5EwCgte
 p5zob1jXemwcpRChrIrrFDTOilVTzho=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-86_BHR2KPTyUgxA5CJ29OQ-1; Mon, 04 Jul 2022 12:15:13 -0400
X-MC-Unique: 86_BHR2KPTyUgxA5CJ29OQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2E0E299E773;
 Mon,  4 Jul 2022 16:15:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A90F74010D2A;
 Mon,  4 Jul 2022 16:15:11 +0000 (UTC)
Date: Mon, 4 Jul 2022 17:15:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 7/7] tests/style: check qemu/osdep.h is included in
 all .c files
Message-ID: <YsMSDVDoe/7/zIDT@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-8-berrange@redhat.com>
 <CAFEAcA-DeKXAq8o_pYt5oyWRnLPvhWMfTbM+vCFpx8MYyC3ZoQ@mail.gmail.com>
 <YsMMUosglBjbKRgy@redhat.com>
 <CAFEAcA-fK4qqJ7zyNYf5hyGDeWF9YDX0oG_gEWvXMZg4+bmnSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-fK4qqJ7zyNYf5hyGDeWF9YDX0oG_gEWvXMZg4+bmnSw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 04:55:45PM +0100, Peter Maydell wrote:
> On Mon, 4 Jul 2022 at 16:50, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Jul 04, 2022 at 04:47:16PM +0100, Peter Maydell wrote:
> > > On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > >
> > > > +
> > > > +sc_c_file_osdep_h:
> > > > +       @require='#include "qemu/osdep.h"' \
> > > > +       in_vc_files='\.c$$' \
> > > > +       halt='all C files must include qemu/osdep.h' \
> > > > +       $(_sc_search_regexp)
> > >
> > > The rule is not just "included in all C files", but "included
> > > as the *first* include in all C files".
> >
> > Oh right, so we can copy a rule from libvirt to validate that.
> >
> > It would look like this, but s,config.h,qemu/osdep.h,
> >
> >
> > # Print each file name for which the first #include does not match
> > # $(config_h_header).  Like grep -m 1, this only looks at the first match.
> > perl_config_h_first_ = \
> >   -e 'BEGIN {$$ret = 0}' \
> >   -e 'if (/^\# *include\b/) {' \
> >   -e '  if (not m{^\# *include $(config_h_header)}) {' \
> >   -e '    print "$$ARGV\n";' \
> >   -e '    $$ret = 1;' \
> >   -e '  }' \
> >   -e '  \# Move on to next file after first include' \
> >   -e '  close ARGV;' \
> >   -e '}' \
> >   -e 'END {exit $$ret}'
> >
> > # You must include <config.h> before including any other header file.
> > # This can possibly be via a package-specific header, if given by syntax-check.mk.
> > sc_require_config_h_first:
> >         @if $(VC_LIST_EXCEPT) | $(GREP) '\.c$$' > /dev/null; then \
> >           files=$$($(VC_LIST_EXCEPT) | $(GREP) '\.c$$') && \
> >           perl -n $(perl_config_h_first_) $$files || \
> >             { echo 'the above files include some other header' \
> >                 'before <config.h>' 1>&2; exit 1; } || :; \
> >         else :; \
> >         fi
> 
> As an example syntax checking rule I think this makes a pretty
> convincing case for the argument "make is the wrong language/framework
> for this job"...

Matching contextually across multiple lines of text is admittedly hard.
IME most of the usage of this syntax checking facility we had in libvirt
can be handled using single line matches, which are trivial to provide.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


