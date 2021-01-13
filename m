Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E82F4DFE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:59:14 +0100 (CET)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhc9-0004Ce-HA
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzhaQ-0003NA-Kg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzhaL-0000wI-F2
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610549840;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9iK9wtO9D36RIvjXBTuVLkIYP6XPDNz3ZsYp60Mf34=;
 b=TkLg9xxJtiXE4ZIoHi8m4/OxMH4H9IGbkXjhXdhjwWi6q6rhwSbkNhZVlR8Ug3kpL5N9LX
 ixwf0RzbtpizWXpZ6mA8fUd1Ff/snV1wg0sqI6mszB1kdEDqDeFzOJn15NFED0dU9717du
 UwJvVHfHap39j1N/IO1nKtFrpqYOUh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-aCGyCvLrOMSQc1wzw_rKcA-1; Wed, 13 Jan 2021 09:57:16 -0500
X-MC-Unique: aCGyCvLrOMSQc1wzw_rKcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67FBA15722
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 14:57:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BF715C730;
 Wed, 13 Jan 2021 14:57:14 +0000 (UTC)
Date: Wed, 13 Jan 2021 14:57:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [qemu-web PATCH v2 00/16] Re-design the QEMU home page to better
 present information
Message-ID: <20210113145712.GE1568240@redhat.com>
References: <20201027132015.621733-1-berrange@redhat.com>
 <CABgObfZ+grQAax+dAJ626kTSHrC8mzwu9CPjNHcNaRxbbn7C7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfZ+grQAax+dAJ626kTSHrC8mzwu9CPjNHcNaRxbbn7C7w@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 03:54:51PM +0100, Paolo Bonzini wrote:
> I am going to apply patches 1-3, so that I can play with doing the
> final deployment via gitlab pipelines.

Probably worth taking the 16th patch too, since the CONTRIBUTING
file described how to use the CI results.

> 
> On Tue, Oct 27, 2020 at 2:20 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > This is a v2 of:
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg07025.html
> >
> > This series started off as a desire to add an "Edit page" link to every
> > page on the site. In doing this I felt that the footer would benefit
> > from simplication so that it was not a massive wall of links,
> > duplicating links elsewhere in the navigation or content pages. Then
> > after response to v1, I realized that the home page actually needed
> > alot more design work to better present information to contributors
> > immediately.
> >
> > The key theme was to ensure that the home page of the website has all
> > the important information available on screen without requiring the
> > user to scroll down or otherwise search for it.
> >
> > I also add gitlab CI jobs so that users can push a branch to gitlab and
> > then browse the rendered result.
> >
> > eg see this pipeline:
> >
> >   https://gitlab.com/berrange/qemu-web/-/pipelines/208194087
> >
> > and the rendered result of this series:
> >
> >   https://berrange.gitlab.io/qemu-web/
> >
> > Or browsable at
> >
> >   https://gitlab.com/berrange/qemu-web/-/jobs/814392582/artifacts/browse/publ=
> > ic/
> >
> > Or download ZIP at
> >
> >   https://gitlab.com/berrange/qemu-web/-/jobs/814392582/artifacts/download
> >
> > notice how the resulting content needs to cope with being used from a
> > variety of different paths. IOW, we cannot use absolute hyperlinks that
> > assume the root is "/".  Jekyll doesn't make this easy, so we use a hack
> > with a custom template that sets a variable we can then reference.
> >
> > The logical next step for this would be to accept merge requests, so
> > that once the user saves their edits in gitlab, they can directly submit
> > a MR, instead of sending via email.  I noticed we don't currently have a
> > CONTRIBUTING.md file in qemu-web.git telling people how to submit. So
> > this series includes such a file directing people to send patches via
> > email for now.
> >
> > Daniel P. Berrang=C3=A9 (16):
> >   Convert files to UNIX line endings
> >   gitlab: introduce a CI job to publish the site content
> >   make all links be relative to the root
> >   Make page header nav narrower
> >   Introduce support for "bxslider" jquery add on
> >   Rework display of screenshots to use a carousel slider
> >   Compress the two front page headings into one
> >   Simplify copyright and integrate into footer
> >   Put a full SFC membership blurb in footer of every page
> >   Use two column layout to display screenshots and releases
> >   Bring contribution links out of the footer into the home page
> >   Add recent blog posts to the front page featured content
> >   Move wiki link from footer into the header navbar
> >   Simplify and restructure the page footer
> >   Add link to "page source" for all pages
> >   Add a CONTRIBUTING.md file as guidance for contributors
> >
> >  .gitlab-ci.yml                 |   16 +
> >  CONTRIBUTING.md                |   32 +
> >  _config.yml                    |    1 +
> >  _data/screenshots.yml          |   14 +-
> >  _includes/assets.html          |   32 +-
> >  _includes/copyright.html       |    8 -
> >  _includes/footer.html          |   33 +-
> >  _includes/nav.html             |   13 +-
> >  _includes/relative_root.html   |   12 +
> >  _includes/screenshot.html      |    8 +-
> >  _includes/sidebar.html         |    6 +-
> >  _layouts/archive.html          |    4 +-
> >  _layouts/blog.html             |    4 +-
> >  _layouts/home.html             |    2 +-
> >  _layouts/page.html             |    2 +-
> >  assets/css/jquery.bxslider.css |  179 ++++
> >  assets/css/style-desktop.css   |  581 ++++++------
> >  assets/css/style-mobile.css    |  720 +++++++-------
> >  assets/css/style.css           | 1252 +++++++++++++------------
> >  assets/js/jquery.bxslider.js   | 1607 ++++++++++++++++++++++++++++++++
> >  blog/index.html                |    4 +-
> >  index.html                     |  195 ++--
> >  22 files changed, 3312 insertions(+), 1413 deletions(-)
> >  create mode 100644 .gitlab-ci.yml
> >  create mode 100644 CONTRIBUTING.md
> >  delete mode 100644 _includes/copyright.html
> >  create mode 100644 _includes/relative_root.html
> >  create mode 100644 assets/css/jquery.bxslider.css
> >  create mode 100644 assets/js/jquery.bxslider.js
> >
> > --=20
> > 2.26.2
> >
> >
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


