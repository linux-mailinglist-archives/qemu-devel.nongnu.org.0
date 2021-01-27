Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF4305B84
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:36:47 +0100 (CET)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4k3y-0002V3-JT
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l4k33-0001oV-OZ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:35:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l4k31-00084z-N7
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=iqaInxJLEvavXDY3rU6ek+pU5ml3tKM1ifyLVNd3OpI=; b=ItLvtj1u7ZbAndA7UdAG45PDcQ
 syo4xDFavEohUr9fKzaz6JBTtT3whC1nZn9+4yvLfemJz7FYAj3PkuuqC3mlZhgoASHfqAMfz+cr2
 HqLYzTR0+BhUSTsaZk4b3pwEZ8xtI1PJuyJR4orGIXyMFfyOPax7eJtSFxUNI4yyEAm5xacEqtMFt
 8zkOOYNbpvAUpHd6/dK0q7X1ho16gin+56Uq2kg6S8Ol3CkOcU9hw+fzWAX1o9Zq8bsyd9hgm3PuD
 6a9doDRJOg2b3R/peDb000Eos2hI2Kyfx/6GDEvr7mbjSkdBUxkE4iBDCZr/15OmHLAGIb19j+uxl
 AjZC8YerSTxhM+77z8kCR8JZC42i0Qnzow7c1C/QjuQT7q3uMNlY1yeJwdqMNcAFZkJ6NVQnE4MP0
 JonN2ggBw4LXqKuZPktBtIgWccBF+5pSRyP2ZHhM+/FRRXKjRKZlrni87ncXx8P/M6JN62xW5Gds8
 HaNOvAN5v8HBKEt8qTuVi6FivAwdRGjjw/DZtm1lGHpBmRMc4Is2HiIwEPDTphfTWiQ+lKgERcXTx
 detGd6wTIqreTZb0HGi14PUG4cBQmlxwQ7EfzRpgreX1bn2XiafG5PqIjC625ovIaJmTrgf+5MPpk
 aH+CWJrzXAz1AwJsbueqYHizMmykWp4OY+IILxyv0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: macOS (Big Sur,
 Apple Silicon) 'make check' fails in test-crypto-tlscredsx509
Date: Wed, 27 Jan 2021 13:35:37 +0100
Message-ID: <26424319.eypid10iWP@silver>
In-Reply-To: <20210127121723.GI3653144@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 27. Januar 2021 13:17:23 CET Daniel P. Berrang=E9 wrote:
> On Tue, Jan 26, 2021 at 04:41:13PM +0000, Peter Maydell wrote:
> > On Tue, 26 Jan 2021 at 16:37, Daniel P. Berrang=E9 <berrange@redhat.com=
>=20
wrote:
> > > On Tue, Jan 26, 2021 at 04:32:08PM +0000, Peter Maydell wrote:
> > > > ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.59=
0:
> > > > Failed to sign certificate ASN1 parser: Value is not valid.
> > > > ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
> > > > sign certificate ASN1 parser: Value is not valid.
> > > > make: *** [run-test-70] Error 1
> > > >=20
> > > >=20
> > > > Does this failure ring any bells for anybody?
> > >=20
> > > Not seen it before.
> > >=20
> > > Is this using a gnutls from homebrew, or one that apple
> > > ship themselves ?  Any idea what version it is ?
> >=20
> > Homebrew gnutls, 3.6.15.
>=20
> On further investigation it seems the error comes from libtasn1,
> but unfortunately there are 100's of scenarios it could arise
> so difficult one to debug.

I haven't looked into the relevant code of this discussion, but is the fail=
ing=20
code dealing with Apple certificates? Because Apple just announced a switch=
 of=20
one of their intermediate certificates, so just in case this might be relat=
ed.

Best regards,
Christian Schoenebeck



