Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D8337D1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 20:28:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXrgg-0008Oy-Tk
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 14:28:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hXrVk-0000IB-NJ
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hXrVi-0006pM-Qf
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:16:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hXrVg-0006jR-PR
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 14:16:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D7337FDFE;
	Mon,  3 Jun 2019 18:16:39 +0000 (UTC)
Received: from gondolin (ovpn-204-96.brq.redhat.com [10.40.204.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F22125DC1A;
	Mon,  3 Jun 2019 18:16:32 +0000 (UTC)
Date: Mon, 3 Jun 2019 20:16:29 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190603201629.0880a337.cohuck@redhat.com>
In-Reply-To: <236db86d-52df-5537-4f33-f3c09bbb6289@redhat.com>
References: <20190531192429.GH22103@habkost.net>
	<93e5101f-67f1-a416-5e80-f16371a35e6a@redhat.com>
	<871s0asvli.fsf@dusky.pond.sub.org>
	<236db86d-52df-5537-4f33-f3c09bbb6289@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 03 Jun 2019 18:16:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Deprecation policy and build dependencies
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Jun 2019 14:02:16 -0400
John Snow <jsnow@redhat.com> wrote:

> On 6/3/19 8:26 AM, Markus Armbruster wrote:
> > John Snow <jsnow@redhat.com> writes:
> >   
> >> On 5/31/19 3:24 PM, Eduardo Habkost wrote:  
> >>> Long story short: I would really like to drop support for Python
> >>> 2 in QEMU 4.1.  
> > 
> > The sooner, the better, as far as I'm concerned.
> >   
> >>> What exactly prevents us from doing this?  Does our deprecation
> >>> policy really apply to build dependencies?
> >>>  
> >>
> >> Normally I'd say it's only nice to also follow the depreciation policy
> >> for tooling as well to give people a chance to switch away, but with
> >> regards to Python2, I feel like we're in the clear to drop it for the
> >> first release that will happen after the Python2 doomsday clock.
> >>
> >> (So, probably 4.2.)  
> > 
> > In addition to our feature deprecation policity, we have a "Supported
> > build platforms" policy (commit 45b47130f4b).  The most common holdback
> > is this one:
> > 
> >     For distributions with long-lifetime releases, the project will aim
> >     to support the most recent major version at all times. Support for
> >     the previous major version will be dropped 2 years after the new
> >     major version is released. For the purposes of identifying supported
> >     software versions, the project will look at RHEL, Debian, Ubuntu
> >     LTS, and SLES distros. Other long-lifetime distros will be assumed
> >     to ship similar software versions.
> > 
> > RHEL-7 has Python 3 only in EPEL.  RHEL-8 came out last month.  Unless
> > we interpret our policy to include EPEL, this means supporting Python 2
> > for some 16 months after upstream Python retires it.  My personal
> > opinion: nuts.
> >   
> 
> I would rather not support Python2 a day after the clock expires.
> 
> > I didn't bother checking Debian, Ubuntu LTS and SLES.
> > 
> > For hosts other than Linux, we're less ambitious.
> >   
> 
> That policy strikes me as weird, because RHEL7 is not going to be, in
> general, using the latest and greatest QEMU. Usually stable versions of
> distros stick with the versions of the programs that came out at the time.

I think the idea was that folks might actually develop on a 'stable'
distro (in a previous life, I used to complain quite often that
building QEMU on a stable distro broke... it was one of my main
development machines, but not controlled by me).

> 
> What's the benefit of making sure that stable platforms can continue to
> run the *newest* QEMU? Is this even a reasonable restriction? If you are
> running RHEL7, how many projects do you expect to be able to git clone
> and build and have that work with the rest of your legacy/stable
> dependencies?
> 
> RHEL7 uses a 1.5.3 based version. I don't think it matters if we update
> 4.2 to be Python3 only, really.

It depends on how old the distro is and what update policy it
uses... if parts of it are regularly updated, it might actually be
usable. In this case, I think we really need to interpret our policy
to include EPEL, or it is completely nuts.

