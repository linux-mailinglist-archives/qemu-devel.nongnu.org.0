Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507B26DB18
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 14:08:03 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIshm-0002d2-7o
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 08:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kIsgV-0001hD-Cu
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 08:06:43 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kIsgT-0001WB-6V
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 08:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=lpDs5ndcla7kARbzQpLHTUruuOvr/hxUdCSnIvShhmI=; b=IJTbp8MiUmbflQ+sAYtLj1jS0T
 Ho/nxCFhKeJv5bh6Hq8OsoCz2+mRlLaCLPskKwVZv/IQbzkMY6S+DEQnONNW9H3+7RjHxnwalT5zj
 81YrsEW17vXulHV5PboM6Y3MBGIts6k6Qvc7L9MwgBykmQzgWmcvjqv0kmwRzqChW7ocqwNQhDIou
 xLcGnnwVPMGyd15z2yNVlDDrpFNBezQuO5fqBT4SgM0Vg14pHkKyvcua7n22N0r5OGXypDoUNio4x
 aZtwusBEQVzJT+hxS0THi2t+vk5ggH7HPal8lQh73k4Ic+Ks74IFWG294jMFU4mN2M3p8sGiomtba
 /uO43KnQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>
Subject: Re: QEMU policy for real file tests
Date: Thu, 17 Sep 2020 14:06:33 +0200
Message-ID: <2029663.ApTj1TM13Z@silver>
In-Reply-To: <8e3f59a3-925e-d89f-2073-6c9654bff75f@redhat.com>
References: <1836935.RIYQIvKipu@silver> <20200917093756.GC1568038@redhat.com>
 <8e3f59a3-925e-d89f-2073-6c9654bff75f@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:06:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 17. September 2020 11:55:00 CEST Thomas Huth wrote:
> On 17/09/2020 11.37, Daniel P. Berrang=E9 wrote:
> > On Thu, Sep 17, 2020 at 10:26:36AM +0100, Alex Benn=E9e wrote:
> >> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> >>> Hi,
> >>>=20
> >>> is there a QEMU policy for test cases that create/write/read/delete r=
eal
> >>> files and directories? E.g. should they be situated at a certain
> >>> location and is any measure of sandboxing required?
> >>=20
> >> I don't think we have a hard and fast policy. It also depends on what
> >> you are doing the test in - but ideally you should use a secure mktempd
> >> (that can't clash) and clean-up after you are finished. This is a bit
> >> easier in python than shell I think.
> >=20
> > mktempd will end up on /tmp usually which can be tmpfs and size limited,
> > so be mindful of the size of files you create. Don't assume you can
> > create multi-GB sized files !  Creating a temp dir underneath the build
> > dir (effectively CWD of the test) is a reasonable alternative.
>=20
> Another thing to consider: If you want to create Unix sockets in your
> tests, make sure that the file name does not get too long, since there
> are limits on certain systems - i.e. socket files should be created in a
> /tmp subdirectory, indeed.
>=20
>  Thomas

These answers already cover everything I need right now. Thanks!

=46inal question: if at some later point one large file needs to be created=
 for=20
some test case, is there some approximate size limit to stay below for not=
=20
causing issues with free CI cloud services?

Best regards,
Christian Schoenebeck



