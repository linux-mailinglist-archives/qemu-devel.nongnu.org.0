Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5569284E38
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 16:44:47 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPoCs-0007Qz-Nj
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 10:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kPoAg-0006Db-O0
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 10:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kPoAe-0007FN-Uy
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 10:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601995347;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=be7LIixgisk9/eC5nBFQ8KB6zY1zNbj5ofDamAVEMY8=;
 b=bkO9GTr2Y6wDXuCDhB3ukZRPtwPJI7oecr9oenFuBy92+suy/YVaihyQYZ8m0/mJG8GafF
 XXWy+xulk2fGvzmvZsEFl7ltGzgPJ9rrP+hMej9n2FvqBryR32bKgVoNRyHBgF1aRwGJoy
 yhsQDCRF1rWyKehnMdNHX3fOADVtqMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-LEjOFWr5PCmKDE1jIvu9ZQ-1; Tue, 06 Oct 2020 10:42:21 -0400
X-MC-Unique: LEjOFWr5PCmKDE1jIvu9ZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E44E8018A1;
 Tue,  6 Oct 2020 14:42:20 +0000 (UTC)
Received: from redhat.com (ovpn-114-125.ams2.redhat.com [10.36.114.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA80973676;
 Tue,  6 Oct 2020 14:42:18 +0000 (UTC)
Date: Tue, 6 Oct 2020 15:42:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/21] machine + QOM queue, 2020-10-05
Message-ID: <20201006144215.GK2482221@redhat.com>
References: <20201005211000.710404-1-ehabkost@redhat.com>
 <CAFEAcA_+4b4HHP_8BBqqy+QmoyF6Lx1jmuFvcsbW5THZQDrXww@mail.gmail.com>
 <20201006143637.GP7303@habkost.net>
 <CAFEAcA97upqUtasSsg+wxLFvak5rz+t3DBD7zMu4dnwvpw73AQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97upqUtasSsg+wxLFvak5rz+t3DBD7zMu4dnwvpw73AQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 06, 2020 at 03:38:56PM +0100, Peter Maydell wrote:
> On Tue, 6 Oct 2020 at 15:36, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Tue, Oct 06, 2020 at 03:03:57PM +0100, Peter Maydell wrote:
> > > Compile failure on OSX:
> > >
> > > ../../hw/core/numa.c:429:20: error: format specifies type 'unsigned
> > > char' but the argument has type 'int' [-Werror,-Wformat]
> > >                    node->level - 1);
> > >                    ^~~~~~~~~~~~~~~~
> > > /Users/pm215/src/qemu-for-merges/include/qapi/error.h:319:35: note:
> > > expanded from macro 'error_setg'
> > >                         (fmt), ## __VA_ARGS__)
> > >                          ~~~      ^~~~~~~~~~~
> > > 1 error generated.
> >
> > Is there a CI system where this is tested?  I'd like to be able
> > to detect this kind of failure before sending pull requests.
> 
> Currently this is still my ad-hoc setup. I think there is
> some CI that tests OSX compiles, though I have no idea how
> individual maintainers set up to use it.

Cirrus CI will cover macOS builds.  You just need to register with
Cirrus CI via your GitLab login, then pushing a branch to gitlab
should trigger both GitLab CI and Cirrus CI, which covers a vast
majority of combinations.

If you register with Travis and push to GitHub too, you'll get
some non-x86 coverage too. Alternatively setup mirroring from
GitLab to GitHub, so you don't have to separately push to GitHub,
just use GitLab to trigger all three CI systems.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


