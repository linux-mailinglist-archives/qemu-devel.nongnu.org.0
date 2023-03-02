Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D446A85F7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:16:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXla9-0005Hp-FH; Thu, 02 Mar 2023 11:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXlZx-0005HA-LX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXlZv-0008Er-Ne
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OxVAs019BMTeBm9vS97gxsi1jYuz4vGP7nfpHS33agI=;
 b=Ix8Ebw+565MNBG/q084Wh3l7lO9bRwSBSimGNaGlIhsiiMa6aF9dMnCipwS+eZPpA/7mzY
 Uaird7fb2FhOXYbm9Qt77rl9sba6isQbWBXz0KOTQ98bYkt4LbwUifknggUztsrJwTnWfb
 5YC27Ahx9Mb4s7pG9tMt5RWy15GiF/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-Wz4tC-gEO4eNkaTPaHAcwQ-1; Thu, 02 Mar 2023 11:14:43 -0500
X-MC-Unique: Wz4tC-gEO4eNkaTPaHAcwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98A23857A94;
 Thu,  2 Mar 2023 16:14:41 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6F12166B26;
 Thu,  2 Mar 2023 16:14:40 +0000 (UTC)
Date: Thu, 2 Mar 2023 11:14:38 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Feiran Zheng <fam.zheng@bytedance.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, fam@euphon.net,
 Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [External] [PATCH] hostmem: Add clear option to file backend
Message-ID: <20230302161438.GC2497705@fedora>
References: <20230302110925.4680-1-fam.zheng@bytedance.com>
 <377c3521-ffe1-074b-48ac-71fd445b3bb4@redhat.com>
 <ZACMKL5MOeD59OLl@redhat.com>
 <45E8FC3F-B444-4137-8C9D-9BAF9DEE49D9@bytedance.com>
 <742db562-5d63-5ef7-8d8b-c4ab9469feff@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T+eNP0HsFtQZdPd2"
Content-Disposition: inline
In-Reply-To: <742db562-5d63-5ef7-8d8b-c4ab9469feff@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--T+eNP0HsFtQZdPd2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2023 at 02:56:43PM +0100, David Hildenbrand wrote:
> On 02.03.23 12:57, Feiran Zheng wrote:
> >=20
> >=20
> > > On 2 Mar 2023, at 11:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
> > >=20
> > > On Thu, Mar 02, 2023 at 12:31:46PM +0100, David Hildenbrand wrote:
> > > > On 02.03.23 12:09, Fam Zheng wrote:
> > > > > This adds a memset to clear the backing memory. This is useful in=
 the
> > > > > case of PMEM DAX to drop dirty data, if the backing memory is han=
ded
> > > > > over from a previous application or firmware which didn't clean up
> > > > > before exiting.
> > > > >=20
> > > >=20
> > > > Why can't the VM manager do that instead? If you have a file that's
> > > > certainly easily possible.
> > >=20
> > > This feels conceptually similar to the case where you expose a host
> > > block device to the guest. If that block device was previously given
> > > to a different guest it might still have data in it. Someone needs
> > > to take responsibility for scrubbing that data. Since that may take
> > > a non-trivial amount of time, it is typically todo that scrubbing in
> > > the background after the old VM is gone rather than put it into the
> > > startup path for a new VM which would delay boot.
> > >=20
> > > PMEM is blurring the boundary between memory and disk, but the tradeo=
ff
> > > is not so different. We know that in general merely faulting in guest
> > > memory is quite time consuming and delays VM startup significantly as
> > > RAM size increases. Doing the full memset can only be slower still.
> > >=20
> > > For prealloc we've create complex code to fault in memory across many
> > > threads and even that's too slow, so we're considering doing it in the
> > > background as the VM starts up.
> > >=20
> > > IIUC, this patch just puts the memset in the critical serialized path.
> > > This will inevitably lead to a demand for improving performance by
> > > parallelizing across threads, but we know that's too slow already,
> > > and we cant play the background async game with memset as that's
> > > actually changunig guest visible contents.
> > >=20
> > > IOW, for large PMEM sizes, it does look compelling to do the clearing
> > > of old data in the background outside context of QEMU VM startup to
> > > avoid delayed startup.
> > >=20
> > > I can still understand the appeal of a simple flag to set on QEMU from
> > > a usability POV, but not sure its a good idea to encourage this usage
> > > by mgmt apps.
> >=20
> > I can totally see the reasoning about the latency here, but I=E2=80=99m=
 a little dubious if multi-threading for memset can actaully help reduce th=
e start-up time; the total cost is going to be bound by memory bandwidth be=
tween the CPU and memory (even more so if it=E2=80=99s PMEM) which is limit=
ed.
>=20
> Right, daxio is the magic bit:
>=20
> daxio.x86_64 : Perform I/O on Device DAX devices or zero a Device DAX dev=
ice
>=20
> # daxio -z -o /dev/dax0.0
> daxio: copied 8587837440 bytes to device "/dev/dax0.0"

I think Dan's concerns are valid, but I noticed daxio also just calls
pmem_memset_persist(), so it's doing pretty much the same
single-threaded thing as the patch:
https://github.com/pmem/pmdk/blob/master/src/tools/daxio/daxio.c#L506

Stefan

--T+eNP0HsFtQZdPd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQAy24ACgkQnKSrs4Gr
c8hSfggAhHuOh4rnsgT5M98lkZgDWhB+n7e1HGpQC2hJoFz1moCMshx11p4EJ3yl
TfaZwQDcgJuSHJKMf2xNFZJ6tWC9hAVE6fVk4kfNjb0ruaSoVsjzn7yaMIvZDhIA
UKgmACTJW5jsHR+6zqZEuH4jvPXTxAwbIRNd2bnufrpiwmylBpXhVvs5ogRQZBkE
NHXO9qoaZVEmWuS+/x1yoN/NE4mKtAivwrY/dGQ1FVz8J29lrvyFdGXewm9tAbZl
avhON1OEpWSl6xzLUldMecENLVEbd7s/IH2zH/jbDWP5I9O7CaVhAI1SS1nMFawA
kiTDviZ0Jp85prz/a++mgFtkEwS45Q==
=27Np
-----END PGP SIGNATURE-----

--T+eNP0HsFtQZdPd2--


