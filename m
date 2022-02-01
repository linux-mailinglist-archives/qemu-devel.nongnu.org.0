Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291D4A58F9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:12:27 +0100 (CET)
Received: from localhost ([::1]:50684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpD8-0002am-83
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEoit-0004Uj-NI
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEoiq-0006Nr-Ki
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643704864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mzzv0bUTJesH+JqoHpjEQSWhon9zlKw2NomOs0mxs98=;
 b=KlsnaWG7sJ//f9er660DLDj7sPQOg+69ltgvSXvFua5POoWEY3cWbYi3JwxvSkQdcrug/3
 B3uYTs0L0FVHist+/n71NJG5OoJuzAxKlIos48DuBQwldFFwrCtvuSCB3QZJnw1oMLR/jO
 6viOsQeFRuftVAH/nGs3Y5fO/zdJwTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-Fh9BYQBSMq-ArBQOpfr_NQ-1; Tue, 01 Feb 2022 03:40:59 -0500
X-MC-Unique: Fh9BYQBSMq-ArBQOpfr_NQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE49B1091DA0;
 Tue,  1 Feb 2022 08:40:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D05BC56A84;
 Tue,  1 Feb 2022 08:40:57 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:40:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/5] docs: Only mention iscsi in the man page when
 available
Message-ID: <YfjyGH9W70UnyunI@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
 <20220131170411.125198-3-kwolf@redhat.com>
 <CAFEAcA-HS3VA4o-ZOAz1bMAymC39ntfba0HouOXH31FVZy230w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-HS3VA4o-ZOAz1bMAymC39ntfba0HouOXH31FVZy230w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.01.2022 um 19:57 hat Peter Maydell geschrieben:
> On Mon, 31 Jan 2022 at 17:33, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > If libiscsi is disabled in the build, the man page shouldn't contain
> > information on how to construct iscsi URLs etc.
> >
> > This patch is best viewed with whitespace changes ignored.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> 
> > -``iSCSI``
> > -   iSCSI support allows QEMU to access iSCSI resources directly and use
> > -   as images for the guest storage. Both disk and cdrom images are
> > -   supported.
> > +.. only:: not DISABLE_LIBISCSI
> 
> Unfortunately the Sphinx "only::" tag is unusably broken by design.
> It doesn't work the way you might expect (similar to ifdef, making
> the docs be built as if the markup disabled by only:: was not
> present in the source rst files). Instead it filters out generated
> doctree nodes very late. The effect is that documentation that you
> try to suppress with an 'only' directive will still show up in
> the table of contents, index and search.
> 
> Upstream bug, closed 'wontfix':
> https://github.com/sphinx-doc/sphinx/issues/1420
> 
> I ran into this when I was looking at whether there were nicer ways
> to structure how we generate some of our manpages etc. Unfortunately
> my conclusion was that the only safe approach was to avoid use
> of the 'only::' directive entirely :-(

Hm, that's very disappointing. :-(

Does it affect anything that is used in man pages, though? Otherwise I
guess we could have something like ::only (not man) or (not DISABLE*) to
make things conditional at least in the man pages even if we can't in
HTML.

Or I guess the alternative would be manually preprocessing docs (maybe
even just with cpp) before feeding them to sphinx...

In fact, a large part of the man pages is already preprocessed by
hxtool. But obviously, the changes I make in this patch are outside of
it for the most part.

Kevin


