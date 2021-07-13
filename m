Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A463C7691
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:40:34 +0200 (CEST)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3NKb-0000cZ-JH
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3NJS-00087v-Kq
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3NJP-0005Db-WA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626201559;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4amw+Ib7tuuwlff1mZA/opCK7Xlzyj2qdVz8QwMFE84=;
 b=Xv1ZPPPEsbb7yzmTA7+tVlyTB+gimCaujrX4fgPSPPpT+0f2qXm2GEwzr1DhgyFcQ34BPU
 lGLrkPhZb5Z8NXjmSVErUk6weySjOqaUR/wg/OadrFO3maGLd5W5pZJB9GK5e3bCJQQLH5
 pshCh1/eloKWaPOQwMsTIKzEDrkL/w0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-BsrpUmwJPwi_61ST0tJu2g-1; Tue, 13 Jul 2021 14:39:15 -0400
X-MC-Unique: BsrpUmwJPwi_61ST0tJu2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B48A81940920
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 18:39:14 +0000 (UTC)
Received: from redhat.com (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D767D19C45;
 Tue, 13 Jul 2021 18:39:12 +0000 (UTC)
Date: Tue, 13 Jul 2021 19:39:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: License advice for Async QMP
Message-ID: <YO3dzXb9qhXSb88e@redhat.com>
References: <CAFn=p-Y_j0fQJCGHrwryk9=7qjPPU6VHYiOSqiAuz==Mn2s4jw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Y_j0fQJCGHrwryk9=7qjPPU6VHYiOSqiAuz==Mn2s4jw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Luiz Capitulino <lcapitul@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Andrea Bolognani <abologna@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 02:26:28PM -0400, John Snow wrote:
> Hi,
> 
> I'm deep into writing a new Async QMP library for QEMU, one that I intend
> to ship outside of our castle walls and host on PyPI.
> 
> I need to choose a license for it. I slapped GPLv2 on it in keeping with
> the license on the original library by Luiz Capitulino (And it is generally
> my preference), but I was debating loosening the license to MIT so that it
> plays nicer with Apache-licensed projects. ...Maybe.
> 
> I don't know if that's really necessary, though, and I do generally prefer
> a "copyleft" to "permissive" these days.
> 
> My current understanding:
> 
> 1. Apache-licensed projects probably cannot vendor GPL code of any kind
> (v2, v3, LGPL)
> 2. Apache-licensed projects can *probably* import GPL'd Python code (v2,
> v3, LGPL) at runtime without creating a "derivative work", but it isn't a
> settled matter, legally.
> 3. LGPL has little or no effect on a Python library, because you do not
> link against Python as such to produce a combined work -- The PIP installer
> generally re-acquires the original distribution and uses that at runtime
> instead, which avoids legal hassle from bundling GPL code.
> 4. I would *probably* need a permissive license only if I wanted to allow
> the vendoring of this Python code by non-GPL projects.
> 
> Does that sound about right?

AFAIK, "vendoring" is not relevant as a point to consider from a license
compatibility POV. Vendoring is just a fancy word for bundling 3rd party
software, and this doesn't create a derivative work - they remain separate
entities. I see this as the same situation as the FSF example of an
installer bundling the software it is installing:

   https://www.gnu.org/licenses/gpl-faq.en.html#GPLCompatInstaller

The main time I've had people raise questions about bundling GPL code in
an Apache project, the problem wasn't about license compatibility. It was
simply their personal desire to never be hosting & distributing any code
that is GPL licensed themselves. They are certainly entitled to hold that
view, but at the same time I'm disinclined to use that as the only reason
to alter my own license preferences, if the licenses are otherwise
compatible from a legal POV.

IOW, if your preference is to use a copyleft license I don't see a
reason to change it. GPL is a common license choice for a lot of python
stuff.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


