Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADB31FC69
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:52:36 +0100 (CET)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD855-0006ju-0K
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD7do-00031A-AE
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD7dk-0001ws-Uj
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 10:24:23 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-fUZL9gRfNFyeEA4a1vuZOQ-1; Fri, 19 Feb 2021 10:24:11 -0500
X-MC-Unique: fUZL9gRfNFyeEA4a1vuZOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92985192D78B;
 Fri, 19 Feb 2021 15:24:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 374895B69C;
 Fri, 19 Feb 2021 15:24:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8DB6618000A2; Fri, 19 Feb 2021 16:24:08 +0100 (CET)
Date: Fri, 19 Feb 2021 16:24:08 +0100
From: Gerd Hoffmann <gerd@kraxel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: FreeBSD build regressions
Message-ID: <20210219152408.34ibwagyqzgye4yd@sirius.home.kraxel.org>
References: <8735xss5q3.fsf@linaro.org>
 <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 10:41:44AM +0000, Peter Maydell wrote:
> On Fri, 19 Feb 2021 at 10:39, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> >
> > Hi,
> >
> > It looks like the build has been broken on Cirrus since at least 7b2c4c:
> >
> >   https://cirrus-ci.com/github/qemu/qemu
> >
> > I did attempt to have a look but "vm-build-freebsd" seems to be failing
> > with a different error
> 
> FWIW the vm-build-freebsd build-and-test works for me, as I
> continue to run it as part of the merge tests. Is this something
> to do with whether you already have a freebsd image cached
> as opposed to it getting re-built from scratch (perhaps with
> a newer FreeBSD)?

The base image should be the same no matter what (updating that needs a
tests/vm/freebsd update which in turn triggers a rebuild).  The addon
package versions may differ though, so in case a broken package enters
the freebsd package repos it may happen that old, existing vm images
continue to work whereas newly created images don't ...

Trying to rebuild the freebsd image here results in this:

[ ... ]
### Installing packages ...
Bootstrapping pkg from pkg+http://pkg.FreeBSD.org/FreeBSD:12:amd64/quarterly, please wait...
Verifying signature with trusted certificate pkg.freebsd.org.2013102301... done
Installing pkg-1.16.1...
Newer FreeBSD version for package pkg:
To ignore this error set IGNORE_OSVERSION=yes
- package: 1202000                          <- freebsd 12.2 expected ?
- running kernel: 1201000                   <- freebsd 12.1 running ?
Ignore the mismatch and continue? [y/N]: 

So it seems the freebsd 12.1 images tries to fetch 12.2 packages when
running "pkg install -y <list>", which would explain why they don't
work.

Switching to freebsd 12.2 should solve this, at least until 12.3 is
released, but I'm wondering why the freebsd pkg utility fetches
incompatible packages in the first place and whenever there is any
way to avoid this ...

take care,
  Gerd


