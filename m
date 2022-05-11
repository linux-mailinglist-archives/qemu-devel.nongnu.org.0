Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8C15233C2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 15:14:17 +0200 (CEST)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nomAS-0007Nt-He
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 09:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nom86-0006K7-0K
 for qemu-devel@nongnu.org; Wed, 11 May 2022 09:11:50 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nom82-0001Lu-0a
 for qemu-devel@nongnu.org; Wed, 11 May 2022 09:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652274631; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=9UxeoHqHyM6Je4X1BSqkJH/s+jGp1/QDjdOEI92hNu8=;
 b=bfhTnHr9HQ3dSaVRkOCggeA1AoE6Wf5s3F8Du+FhCbSftAQdrw/OCsKDYix7dxMs
 flWxc5p0wPDZpC+TVjkzYihjFR2CrzSS/775GxrB9O0kfKxtHjX+0QVSq93096tuz2Z
 zfmLA5xspXZZK7ZixDgWMjuuidXx5AQ9aSaEeaAk=
Received: from localhost (46.69.19.220 [46.69.19.220]) by mx.zoho.com.cn
 with SMTPS id 1652274629365130.06379688182892;
 Wed, 11 May 2022 21:10:29 +0800 (CST)
Date: Wed, 11 May 2022 14:10:22 +0100
From: Fam Zheng <fam@euphon.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20220511131022.GA5183@fam-dell>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
 <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
 <f40ceb7b-8412-8da2-7c16-2590debecaed@redhat.com>
 <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAAdtpL4oGW28-r0ZuMV9nBoZGDR5L9PYM2jsKw0Fmuwx68MWdw@mail.gmail.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-05-11 13:13, Philippe Mathieu-Daud=E9 via wrote:
> +Fam
> On Wed, May 11, 2022 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:
> > On 11/05/2022 12.46, Philippe Mathieu-Daud=E9 wrote:
> > > +Robert
> > >
> > >   On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrang=E9
> > > <berrange@redhat.com> wrote:
> > >>
> > >> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> > >>> According to our "Supported build platforms" policy, we now do not =
support
> > >>> Ubuntu 18.04 anymore. Remove the related files and entries from our=
 CI.
> > >>>
> > >>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > >>> ---
> > >>>   Seems like nobody touched the 18.04-based tests/vm/ubuntu* files =
in a
> > >>>   very long time, so I assume these are not used anymore and can co=
mpletely
> > >>>   be removed now.
> > >>
> > >> Or it could mean that they are working fine and so haven't needed
> > >> changes...
> > >
> > > Yes :)
> >
> > At least for me "make vm-build-ubuntu.aarch64" is only failing with ssh
> > timeouts (on my x86 laptop) ... is this really supposed to work with TC=
G, or
> > is this KVM (on arm hosts) only?
>=20
> Yes this timeout code is not working. I suppose it is tied to the TCG hos=
t perf.
> I suggested a pair of patches to increase it but back then Fam didn't acc=
epted
> them because IIRC these VMs were used by patchew (previous to Gitlab).
> Today we have better framework for testing, so I wouldn't use this script=
 on
> CI, but it is still valuable for manual testing.

Yes I believe these are not needed by patchew anymore.

Fam


