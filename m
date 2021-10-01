Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E141F23E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:39:56 +0200 (CEST)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLZj-0008DD-5B
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mWLX7-0005rX-W1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mWLX3-0008Gw-MB
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633106170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pu/Lo/8PIcVP2w18pMUuKpKdni82TYWbWCVM3bXJdyE=;
 b=OxsiESFzo1oWMh0vZ+mPneAvPcTZzBa+YDPL/7NqFyVgyG+7FORhUteWx+ysK9kDopm/7+
 an8RHhnn8liiXnmYcF3vj9rDWRMnGNZ8Nws17M/0JWXYM+i2eHXVspGdBpnvpttmAnbY2e
 0FBV9JNCbdEsZ+irNxBy9jEJ1HH+AXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-Gq9idoBgPeePeb96LPjoWQ-1; Fri, 01 Oct 2021 12:36:05 -0400
X-MC-Unique: Gq9idoBgPeePeb96LPjoWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639F119200D3;
 Fri,  1 Oct 2021 16:36:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5B51608BA;
 Fri,  1 Oct 2021 16:36:00 +0000 (UTC)
Date: Fri, 1 Oct 2021 17:35:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sohil Mehta <sohil.mehta@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 00/13] x86 User Interrupts support
Message-ID: <YVc47ohb4nxrBO5h@stefanha-x1.localdomain>
References: <20210913200132.3396598-1-sohil.mehta@intel.com>
 <456bf9cf-87b8-4c3d-ac0c-7e392bcf26de@www.fastmail.com>
 <YVXmGTo5Uzp44QQq@stefanha-x1.localdomain>
 <778d40fe-ad8e-fd7c-4caa-499910bb0925@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9EVyQ6g1a8JZP43O"
Content-Disposition: inline
In-Reply-To: <778d40fe-ad8e-fd7c-4caa-499910bb0925@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, qemu-devel@nongnu.org,
 Dave Hansen <dave.hansen@intel.com>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Zeng Guang <guang.zeng@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>,
 "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Ramesh Thomas <ramesh.thomas@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Christian Brauner <christian@brauner.io>,
 Jens Axboe <axboe@kernel.dk>, Tony Luck <tony.luck@intel.com>,
 Linux API <linux-api@vger.kernel.org>, Randy E Witt <randy.e.witt@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9EVyQ6g1a8JZP43O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 10:24:24AM -0700, Sohil Mehta wrote:
>=20
> On 9/30/2021 9:30 AM, Stefan Hajnoczi wrote:
> > On Tue, Sep 28, 2021 at 09:31:34PM -0700, Andy Lutomirski wrote:
> > >=20
> > > I spent some time reviewing the docs (ISE) and contemplating how this=
 all fits together, and I have a high level question:
> > >=20
> > > Can someone give an example of a realistic workload that would benefi=
t from SENDUIPI and precisely how it would use SENDUIPI?  Or an example of =
a realistic workload that would benefit from hypothetical device-initiated =
user interrupts and how it would use them?  I'm having trouble imagining so=
mething that wouldn't work as well or better by simply polling, at least on=
 DMA-coherent architectures like x86.
> > I was wondering the same thing. One thing came to mind:
> >=20
> > An application that wants to be *interrupted* from what it's doing
> > rather than waiting until the next polling point. For example,
> > applications that are CPU-intensive and have green threads. I can't name
> > a real application like this though :P.
>=20
> Thank you Stefan and Andy for giving this some thought.
>=20
> We are consolidating the information internally on where and how exactly =
we
> expect to see benefits with real workloads for the various sources of User
> Interrupts. It will take a few days to get back on this one.

One possible use case came to mind in QEMU's TCG just-in-time compiler:

QEMU's TCG threads execute translated code. There are events that
require interrupting these threads. Today a check is performed at the
start of every translated block. Most of the time the check is false and
it's a waste of CPU.

User interrupts can eliminate the need for checks by interrupting TCG
threads when events occur.

I don't know whether this will improve performance or how feasible it is
to implement, but I've added people who might have ideas. (For a summary
of user interrupts, see
https://lwn.net/SubscriberLink/871113/60652640e11fc5df/.)

Stefan

--9EVyQ6g1a8JZP43O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFXOO4ACgkQnKSrs4Gr
c8j1LQf/SZwCRlCZlWue5FvVhDmWF//uX4PGQQMaisI7h989XbCnOAuKgojBX/CZ
juXKMDJAuLrBR85BOl/7mEz/bM4m1b7pkMq4GR73ER/5/aupQv/yldA+MPklTyzQ
8DXcmTsApJk7CQvCOheb6CWKwtCZ0pkZu12vnk8w+IiL601ZYzyWr/wPUFCjxWXa
GjqeLxGzpHjczrw4f9zjTsheGhZaX7TVLh6ULQ2dsLxIRXw+23tQPmCd19mAh0Oc
Zgg/Mk4la+cNm5RXfdSTbunqafjGQLeNYBRLMA4DzigKxeU2wCULezW9ZLN8LJ6u
MNGacFSLGXxsd2Waa5fBTjGyji5qwg==
=GlvG
-----END PGP SIGNATURE-----

--9EVyQ6g1a8JZP43O--


