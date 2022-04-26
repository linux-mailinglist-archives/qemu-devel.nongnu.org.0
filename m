Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E079250F38E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:20:18 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGQj-0003qd-JJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1njGMs-0002zx-5v
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1njGMn-0003a8-Mh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650960972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrseoYLozqDsADWlbob9nJLpvyIH4x/V1sYF+9LShAU=;
 b=AiA9C7+MdT/7W/9pwt3smGDAuQCebj15OwpKk1DQe4ZJRFWXpZQwMbmwtKxrY7gSzFFOLH
 0DjvKopqf/uYk8kkw8VeBLi7Jsn4kSlqJ4T6RNNT6hlY8bSPLIr7/GE6rb2GoT1FrImHwe
 sOlQ7lHZYseRczkuFKEPStFWN4dGkY4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-JUy08JtSNU6kIH97vQGHXQ-1; Tue, 26 Apr 2022 04:16:11 -0400
X-MC-Unique: JUy08JtSNU6kIH97vQGHXQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B87793C0D184
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 08:16:10 +0000 (UTC)
Received: from paraplu (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7FE403149;
 Tue, 26 Apr 2022 08:16:09 +0000 (UTC)
Date: Tue, 26 Apr 2022 10:16:07 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [qemu.qmp PATCH 04/12] update project URLs
Message-ID: <YmeqR3gbsZO9FH4u@paraplu>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-5-jsnow@redhat.com>
 <YmZ+X0XK3kcCHtMm@redhat.com>
 <CAFn=p-YAGKUscrVNWpVT6=n3Q_Xi4Bvt5YWV4mrAh3Eb4QRkNQ@mail.gmail.com>
 <YmelelTWDL9oLKC1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmelelTWDL9oLKC1@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 08:55:38AM +0100, Daniel P. Berrangé wrote:
> On Mon, Apr 25, 2022 at 02:19:27PM -0400, John Snow wrote:
> > On Mon, Apr 25, 2022, 6:56 AM Daniel P. Berrangé <berrange@redhat.com>
> > wrote:
> > 
> > > On Fri, Apr 22, 2022 at 02:49:32PM -0400, John Snow wrote:
> > > > Point to this library's URLs instead of the entire project's.
> > > >
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >  setup.cfg | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/setup.cfg b/setup.cfg
> > > > index c21f2ce..0a1c215 100644
> > > > --- a/setup.cfg
> > > > +++ b/setup.cfg
> > > > @@ -5,8 +5,8 @@ author = QEMU Project
> > > >  author_email = qemu-devel@nongnu.org
> > > >  maintainer = John Snow
> > > >  maintainer_email = jsnow@redhat.com
> > > > -url = https://www.qemu.org/
> > > > -download_url = https://www.qemu.org/download/
> > > > +url = https://gitlab.com/qemu-project/python-qemu-qmp
> > > > +download_url =
> > > https://gitlab.com/qemu-project/python-qemu-qmp/-/packages
> > >
> > > Auto-generated tarballs are not guaranteed to have fixed content forever
> > > so I tend to avoid pointing to those. Assuming you're intending to upload
> > > to pypi, I'd link to that instead as the "official" tarball source.
> > >
> > 
> > This metadata will also be used for PyPI, so that seemed cyclic.
> > 
> > I linked it to the gitlab package repository, where I *intend* to push
> > built wheels (and dev interstitial builds) but maybe that's too "inside
> > baseball" for a pypi link.
> 
> Oh wait, I mis-understood the URL. If it is the location for manually
> built & published dists, that's ok - it isn't the gitlab auto tarballs. 
> 
> > Seems weird for a Pypi package to point to itself on pypi, but maybe that's
> > correct?
> 
> I wonder what common practice is for some popular python libs....

E.g. if you look at SQLAlchemy (definitely one of the popular
libraries), it is pointing to itself (see the Ufiles under the "Download
files" link):

    https://pypi.org/project/SQLAlchemy

-- 
/kashyap


