Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177733F0EB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:14:46 +0100 (CET)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMW0b-0000N2-3c
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMVyw-00086A-Hw
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMVyp-0006o8-0p
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615986773;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=h2p7LjnNJaX3KuKm+T4UeCssHdDDxDjv+JiqXlnAX9c=;
 b=NbPCtZTdR7oQVmyyb6mmSOZ1PU9nqSYhQ3g3QPNzP8sWzUlg24MZN+VQqgyn2lKwN4nRts
 BKHBz3LbTZfLi2aqFYlsSkjRLzhN5yErBEb3VXBKzZ+BpHgOnQSFcg+MFZGjDAY0OUP4YF
 CZ9v+/Dtpgfo9U4smQHJUpLYmcAPClw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-HNf8fBphNXWMEDf7qPBCqw-1; Wed, 17 Mar 2021 09:12:39 -0400
X-MC-Unique: HNf8fBphNXWMEDf7qPBCqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87EF61005D47;
 Wed, 17 Mar 2021 13:12:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-247.ams2.redhat.com [10.36.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3C760853;
 Wed, 17 Mar 2021 13:12:23 +0000 (UTC)
Date: Wed, 17 Mar 2021 13:12:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
Message-ID: <YFIANJSi+FtVRYQY@redhat.com>
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-3-thuth@redhat.com>
 <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
 <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
MIME-Version: 1.0
In-Reply-To: <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Ed Maste <emaste@freebsd.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 01:44:05PM +0100, Thomas Huth wrote:
> On 17/03/2021 12.16, Peter Maydell wrote:
> > On Wed, 17 Mar 2021 at 11:09, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > FreeBSD version 12.1 is out of service now, and the task in the
> > > Cirrus-CI is failing. Update to 12.2 to get it working again.
> > > Unfortunately, there is a bug in libtasn1 that triggers with the
> > > new version of Clang that is used there (see this thread for details:
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
> > > so we have to disable gnutls for now to make it work again. We can
> > > enable it later again once libtasn1 has been fixed in FreeBSD.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > 
> > Is it feasible to make configure check for "is libtasn1 broken"?
> > I guess since it only shows up as "when you try to use it
> > it fails" that would be a runtime check rather than compile
> > time, which isn't really possible :-(
> 
> I don't really have a clue about this crypto stuff... Daniel, Stefan, Roman,
> Christian, Eric ... you debugged the original problem on macOS, do you think
> it's possible to add a check for this libtasn1 problem to our "configure"
> (or meson.build file)?

It is tricky because the flaw is not specific to the version of
tasn1, rather to the combination of tasn1 and the compiler used,
so there's no simple way to detect it statically from configure.

If don't want the big hammer of disabling gnutls, perhaps adding
a flag to disable tasn1 would be simpler, as that would only
disable test suite, and no actual QEMU core functionality (which
is all working fine)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


