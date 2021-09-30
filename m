Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188F41DEC9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:20:34 +0200 (CEST)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVynR-00056j-55
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1mVyft-0004Xs-QG
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:12:48 -0400
Received: from [209.195.0.149] (port=60466 helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1mVyfr-0002dx-Lu
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:12:45 -0400
Received: by npcomp.net (Postfix, from userid 1000)
 id E1D3EA67D9; Thu, 30 Sep 2021 15:57:49 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1633017469;
 bh=Gmdl8YMwzWi/rXN0AMWiesHs2dQ3gDQ9WPRLpkGGxmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=RnnUIFt2ITDLkyioNYYb1+rSdWNi541qiuAXyEIL2nq5zFh/GETPY06/QtTHZirWt
 H4uJsZv/EOQPzZkEJ7NkbY4SPyD9vB67Atft1J1KVaa9J0Z6DIVmy0JzqtKW2aPviM
 fgGFSplQem0WjnQFwsgoBRtinKaQ9b0BF2dwksW0=
Date: Thu, 30 Sep 2021 15:57:49 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
Message-ID: <YVXePK28T7nl9J7k@invalid>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 michael.roth@amd.com, qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!
I'd be happy to help with this. I'm mostly a consumer of QEMU, but
greatly appreciate all the work this community has done, and was able
to contribute a little by helping with QEMU advent this past year. I
would be happy to help streamline some of this activities if that would
be welcome, and would gratefully contribute time and resources. Hosting
and serving data like this has been core to my recent experience.

I would be happy to suggest and build out a distribution strategy for
these packages, and believe I could cut some costs, and even convince a
small consultancy I am a part of here that uses QEMU to foot a
reasonable bill.

A brief introduction, since I haven't had the pleasure of attending
FOSDEM or any other QEMU meetups: I am a startup-oriented Cloud Security
Architect, based out of Atlanta, previously with companies like
DataStax, but now working on AWS video pipelines for a startup here.

Thanks, and hopefully I can be of service!
Eldon

On Thu, Sep 30, 2021 at 03:28:53PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 3:08 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > Hi Mike,
> > QEMU downloads are currently hosted on qemu.org's Apache web server.
> > Paolo and I were discussing ways to reduce qemu.org network traffic to
> > save money and eventually turn off the qemu.org server since there is no
> > full-time sysadmin for it. I'd like to discuss moving QEMU downloads to
> > GitLab Releases.
> 
> Daniel Berrange posted this in another discussion:
> 
> "gitlab releases have a per-file size limit that is somewhere on the
> order of 10 MB IIRC. Our release tarballs are 100+ MB, so I don't
> believe that's going to be viable.
> 
> The gitlab package registry doesn't directly support plain file
> downloads afaik, and is also size limited to 50 MB per package
> 
> I'd love to find a good solution for large release artifact hosting,
> since I need a better solution for virt-viewer windows MSI releases
> wich are similarly large to QEMUs. For that I'm using pagure.io
> provided by Fedora, but I don't have confidence in that service
> surviving long term."
> 
> So it looks like GitLab Releases won't work for QEMU :(.
> 
> Stefan
> 

