Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B637A96B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:34:25 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTSq-0000SF-LE
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTQG-0006n1-Qv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTQD-00061F-Vu
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620743500;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVApZmHzGhtIVw7dmCFQTFlTD0L+Hx25aTjrUaFfjzM=;
 b=GFRirBQMO2Me2VCOgO+bbf0fp5d23jQmK32wpKgfJPTqEUycFWnm4vTP94KoaG155MiRG4
 6PBOL3gVjhtHEJpFdeegxSQaCUIZx7z1qJCAheYJxcWtZOJH4O552scCRuWLAvfjAqVBUU
 42uTyV3YpuWhPEEU6p4gBoizOoSfe3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-Ro1dBwE9MLa_yXLjt5jHEg-1; Tue, 11 May 2021 10:31:36 -0400
X-MC-Unique: Ro1dBwE9MLa_yXLjt5jHEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8018A180F18E;
 Tue, 11 May 2021 14:31:35 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55E921037F42;
 Tue, 11 May 2021 14:31:14 +0000 (UTC)
Date: Tue, 11 May 2021 15:31:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 11/12] configure: bump min required GCC to 6.3.0
Message-ID: <YJqVL+i1ST5TMrHT@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-12-berrange@redhat.com>
 <b84c71fd-e00f-3de1-c061-dadd44e55dab@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b84c71fd-e00f-3de1-c061-dadd44e55dab@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 04:15:57PM +0200, Thomas Huth wrote:
> On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> > Several distros have been dropped since the last time we bumped the
> > minimum required GCC version.
> > 
> > Per repology, currently shipping versions are:
> > 
> >               RHEL-8: 8.3.1
> >       Debian Stretch: 6.3.0
> >        Debian Buster: 8.3.0
> >   openSUSE Leap 15.2: 7.5.0
> >     Ubuntu LTS 18.04: 7.5.0
> >     Ubuntu LTS 20.04: 9.3.0
> >              FreeBSD: 10.3.0
> >            Fedora 33: 9.2.0
> >            Fedora 34: 11.0.1
> >              OpenBSD: 8.4.0
> >       macOS HomeBrew: 11.1.0
> > 
> > With this list Debian Stretch is the constraint at 6.3.0
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   configure | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/configure b/configure
> > index a1a40577c9..43d2470bb6 100755
> > --- a/configure
> > +++ b/configure
> > @@ -2059,8 +2059,8 @@ cat > $TMPC << EOF
> >   #  endif
> >   # endif
> >   #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> > -# if __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
> > -#  error You need at least GCC v4.8 to compile QEMU
> > +# if __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 3)
> > +#  error You need at least GCC v6.3.0 to compile QEMU
> >   # endif
> >   #else
> >   # error You either need GCC or Clang to compiler QEMU
> > @@ -2068,7 +2068,7 @@ cat > $TMPC << EOF
> >   int main (void) { return 0; }
> >   EOF
> >   if ! compile_prog "" "" ; then
> > -    error_exit "You need at least GCC v4.8 or Clang v3.4 (or XCode Clang v5.1)"
> > +    error_exit "You need at least GCC v6.3 or Clang v3.4 (or XCode Clang v5.1)"
> >   fi
> >   # Accumulate -Wfoo and -Wno-bar separately.
> 
> I'm surprised that we could not remove some spots related to GCC 4.8
> compatibility here, but if I grep'ed it right, there are indeed none ...

Yeah I was surprised too. I think what's happened is that we've ended
up changing the code to avoid hitting problems from older GCC, rather
than conditionally using them. If you read git history you can find
examples of changes talking about old GCC problems being avoided.

The same for Clang.

So these change mostly free us from having to make sub-optimal in the
future.

The most immediate change we could potentially do is s/gnu99/gnu11/
for the C standard.

> thus:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


