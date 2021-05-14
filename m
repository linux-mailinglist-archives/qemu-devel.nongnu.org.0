Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC73801C2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:07:47 +0200 (CEST)
Received: from localhost ([::1]:43522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNEw-000874-Lt
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1lhNDb-0007QM-Bl
 for qemu-devel@nongnu.org; Thu, 13 May 2021 22:06:23 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1lhNDZ-0004ou-DW
 for qemu-devel@nongnu.org; Thu, 13 May 2021 22:06:23 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CF397580FD2;
 Thu, 13 May 2021 22:06:18 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 13 May 2021 22:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=odUz/
 T3jmCY8ZXlesc+TaDhNSgww6MR8zz8g4/4AJnM=; b=FkwHAoDLGffi7sSclAfB+
 WJcJxogGh+dUellsoXf+FTz65WpewyB91L9N5+OI75eG08IwuyGjy6+RIDuFBjeA
 IYK71RRsZOdTbu+oQXYAYOLH1ZF90eaCNqO0l72WL28rymYW+pzgBrCSSluFJDSy
 /Bhm3HdkhUtFuQLXqhD471wTzkISRlgSmY97La31DZD7lvEV3lbbnE9zypi3efi1
 H+nNqG5BATDkctOjuF/Lx2uzZzopIC7+3Pts2MY9MmwafHGWj/YGAlZ1BWqekcOW
 tJI02h9+Q7T4JVpkldhZHKgSh4KeKYUDY0WZxoLn1VXJLiO+I/Iqi5noB+NXhsT+
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=odUz/T3jmCY8ZXlesc+TaDhNSgww6MR8zz8g4/4AJ
 nM=; b=cDRS5+i3dNvIiUsNFn8m+dLEUbNAk1TzNkx3me5xokjyauLFAwtjemuHx
 oaJQUggB2RCb9w38mPxXMzVJfKbYiPqbQsI9nOQgoyd51qIpML/3DuffXw0YzZa2
 mdiYaQq0k1FsikKRR8HF/6zaK8Xz0qv37WZsiN8n28xfSPGp3mL185g7qzJhtdkV
 q07Q6gX48/Zt86VrM50+pcWnFlaQPh5v34jQNGAz3oBEryEbodlsLJmFQ2OYukGs
 XWnYLze5kaSGY3Fh0+D1QZg5cBomJ6+HzI5vfw1llyG8e5Dw9PM7m/K8z1SAbsZl
 gIQe7oRRQRYySRjTHzgNSa/fFqLXA==
X-ME-Sender: <xms:GdudYCYZ7KSatPoJaavGpN4oI3yTuIYK8MAG-IxiRKrsKpwKYc3Jug>
 <xme:GdudYFb1HML9EXAjvKzpPXT4XeEhAABIOAN-Api2vun_EGHhgG_79BHqD31AIPh2c
 ri37yToSr-XI51J-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeelhfetgfejueevvdfhvdeiiefhtedtvddvheeliedvudejheegvdeh
 jeeuvdduheenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmpdhkvghrnh
 gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GdudYM8RaGHt1e19mGwdHv3niFYsVYgrKbTy3PIuWIldu4DyJ2Ypyw>
 <xmx:GdudYEr7BisJZ3Z0uX-cpzKgjzRQq-tlCJW-vpUgedmEidAz4HyJZw>
 <xmx:GdudYNo-OajdsEmYWsCbcmJKzkiya5_38papvobY_QuR1-o_ZhdqSw>
 <xmx:GtudYLjC8LfpW-YiOVtxTodUiKz0VBu6rLSVAZ3-XrR-TAz1EFq9wA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DC491A00079; Thu, 13 May 2021 22:06:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <9cfae992-da4a-4829-bf1c-ce1efb230504@www.fastmail.com>
In-Reply-To: <20210513140018.00004560@Huawei.com>
References: <20210513124737.00002b2d@Huawei.com>
 <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
 <2d5fdb5f-36d3-c998-ee36-f9d66cea7120@redhat.com>
 <20210513140018.00004560@Huawei.com>
Date: Fri, 14 May 2021 11:35:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jonathan Cameron" <Jonathan.Cameron@Huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: =?UTF-8?Q?Re:_RFC:_Memory_region_accesses_where_.valid.min=5Faccess=5Fsi?=
 =?UTF-8?Q?ze_<_.impl.min=5Faccess=5Fsize?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.230; envelope-from=andrew@aj.id.au;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, Chris Browy <cbrowy@avery-design.com>,
 Linuxarm <linuxarm@huawei.com>, Peter Xu <peterx@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 13 May 2021, at 22:30, Jonathan Cameron wrote:
> On Thu, 13 May 2021 14:36:27 +0200
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
>=20
> > On 5/13/21 2:23 PM, Peter Maydell wrote:
> > > On Thu, 13 May 2021 at 12:49, Jonathan Cameron
> > > <Jonathan.Cameron@huawei.com> wrote: =20
> > >> My initial suggestion was to fix this by adding the relatively
> > >> simple code needed in the driver to implement byte read / write,
> > >> but Ben pointed at the QEMU docs - docs/devel/memory.rst which
> > >> says
> > >> "
> > >> .impl.min_access_size, .impl.max_access_size define the access si=
zes
> > >>    (in bytes) supported by the *implementation*; other access siz=
es will be
> > >>    emulated using the ones available. For example a 4-byte write =
will be
> > >>    emulated using four 1-byte writes, if .impl.max_access_size =3D=
 1.
> > >> "
> > >>
> > >> This isn't true when we have the situation where
> > >> .valid.min_access_size < .imp.min_access_size
> > >>
> > >> So change the docs or try to make this work? =20
> >=20
> > See also this patch from Francisco:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg636935.html
> >=20
> > And full unaligned access support from Andrew:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg461247.html

Much better to use lore.kernel.org:

https://lore.kernel.org/qemu-devel/20170630030058.28943-1-andrew@aj.id.a=
u/

because...

>=20
> Thanks - that's very similar to what I was carrying, but I think it
> only covers the read case.  That's backed up by the comment:
> /* XXX: Can't do this hack for writes */

It becomes easier to find Paolo's suggestion to fix that here:

https://lore.kernel.org/qemu-devel/cd1aba90-176f-9ec6-3e2b-d1135156a96d@=
redhat.com/

Would love to see this resolved! Unfortunately I haven't had the=20
bandwidth to fix it all up for ... a long time now.

Andrew

