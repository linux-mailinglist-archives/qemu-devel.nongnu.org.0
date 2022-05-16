Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631E528B10
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:53:09 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdxy-00048t-5E
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqd7E-0005DI-PU
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqd7C-0003ay-Sa
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxqU0w0bKZgB185wHX1AOUanD+x7eidYI7FFEk1A3Hs=;
 b=aHlVeZcT0bD9EjuFbYww8pEPm5iomCPrRVxQ+N9Zept28gicvyl5gbQ7LINECjeq1jd0RN
 7zmeETVuLHreiqmGjygm2A+DNpwJ+RvMUym6r7qDY/+G9E+n+fF1Hq8GHUoNTmUsLoI+WV
 Mxcak/SDPjfMp86+DoGzUQsIRMxbUNs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-EpthrCmWMYSsiswwCeacQA-1; Mon, 16 May 2022 11:58:28 -0400
X-MC-Unique: EpthrCmWMYSsiswwCeacQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B76D986B8B6;
 Mon, 16 May 2022 15:58:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DECE2026D6A;
 Mon, 16 May 2022 15:58:07 +0000 (UTC)
Date: Mon, 16 May 2022 16:58:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
Message-ID: <YoJ0jEH9eNbeTtz9@redhat.com>
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
 <b89bb57d-bf00-806c-52e6-9e55c24257a8@kaod.org>
 <CAFEAcA-nA4sKyPyRwc-MZbUt14y_4OJrhT3=momO2Cqi8r_9tA@mail.gmail.com>
 <3c93e737-538a-aacc-e893-3f9e2c0f4692@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c93e737-538a-aacc-e893-3f9e2c0f4692@kaod.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 04:50:29PM +0200, Cédric Le Goater wrote:
> On 5/16/22 15:55, Peter Maydell wrote:
> > On Mon, 16 May 2022 at 14:51, Cédric Le Goater <clg@kaod.org> wrote:
> > > 
> > > On 5/16/22 14:43, Peter Maydell wrote:
> > > > I think we can get away with just dropping ppc64be -- we have
> > > > coverage for it as a cross-compile setup, and hopefully the
> > > > s390x CI runner will catch the various "fails tests on big-endian host"
> > > > issues. (Alternatively if anybody has a ppc64be machine they'd like
> > > > to let us run a gitlab CI runner on, we could do that :-))
> > > 
> > > No recent HW (P8 and above) would run a PPC64 BE distro if LE is
> > > supported by HW.
> > 
> > FWIW, the machine I use for ad-hoc CI is one in the gcc compile
> > farm, which is supposedly a "IBM POWER8 8284-22A", running Debian sid.
> 
> Since the P8 have been around (~2014), the focus is really on LE.
> I think debian is the last distro still providing BE binaries.
> But no iso, you have to start with a debian 1O and do the upgrade.

If even Debian 11 has stopped providing ppc64be images, then
the end really is nigh. We still support Debian 10 as a target
in our platform support matrix until Debin 12 comes out in
mid/late 2023.

So IMHO we've got at most 1 year left of needing to worry
about ppc64be targets.

> > If BE PPC is fading away then that's another argument for
> > living with the loss of CI coverage, I guess.
> 
> yes.
> 
> It would good to keep a BE host for test coverage. It doesn't have
> to be ppc64be if it is too complex to maintain.

IIUC, we've got s390x giving BE coverage right now, at least
for certain configure option combinations.
 
> I can help on setting up a debian BE sid vm on the above IBM POWER8
> 8284-22A system if you need to. I have an image ready to use.

If we have a means to run CI for the next ~1 year great, but it
doesn't seem like worth investing masses of resources into it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


