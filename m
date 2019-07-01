Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E0C18A5B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:11:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOipP-000405-71
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:11:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOioN-0003ch-A2
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOioM-00020R-IJ
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:10:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44982)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hOioM-00020I-D2
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:10:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 901F8307DAC7;
	Thu,  9 May 2019 13:10:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99AD71A267;
	Thu,  9 May 2019 13:10:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id CAC70A1E0; Thu,  9 May 2019 15:10:03 +0200 (CEST)
Date: Thu, 9 May 2019 15:10:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190509131003.vowa3f7ikm5lurci@sirius.home.kraxel.org>
References: <20190508085645.11595-1-kraxel@redhat.com>
	<20190508085645.11595-13-kraxel@redhat.com>
	<12c8586d-5f43-f35c-0c43-939e535f93e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12c8586d-5f43-f35c-0c43-939e535f93e9@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 09 May 2019 13:10:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 12/13] tests/vm: fedora autoinstall,
 using serial console
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
Cc: Fam Zheng <fam@euphon.net>,
	=?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
	Ed Maste <emaste@freebsd.org>, David Hildenbrand <david@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > +        # shutdown
> > +        self.ssh_root("poweroff")
> > +        self.console_wait("sleep state S5")
> > +        self.wait()
> > +
> > +        if os.path.exists(img):
> > +            os.remove(img)
> > +        os.rename(img_tmp, img)
> > +        os.remove(iso)
> > +        self.print_step("All done")
> > +
> > +if __name__ == "__main__":
> > +    sys.exit(basevm.main(FedoraVM))

> Maybe you could also do a kickstart installation instead?

Well, the tricky part is how to get the kickstart/autoinstall/whatever
file passed to the guest then, in a way that works for every guest ...

cheers,
  Gerd


