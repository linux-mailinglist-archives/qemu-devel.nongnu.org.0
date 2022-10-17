Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925076013CF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 18:45:17 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okTEp-0002mu-3V
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 12:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1okTB4-0007w0-5L; Mon, 17 Oct 2022 12:41:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:57341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1okTB2-0001fh-8E; Mon, 17 Oct 2022 12:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=0W/i2TOJnvB/5OmeubmmeI5dN5r2Hn987wix/7X5hUk=; b=k95fPCLHGQZAJnHtfDtWlTbdGV
 JAki5HhdXYpbZoT2T+9CRA4tLGaCTUEAotShdAWkkmI/tF2i2e738C33WkqtUI/F1S+ZtEPdYgZUT
 8jBj2PE78appdxDCDSRqAlG2krDNXGjIIcFFn1/WEAVbq82SYPjBy2xOd6BL4Eavc3LoxrlN5UDjF
 4XmyXzkXIaEn+oo78jwQM7UvWcr80nmxlBxjNJPmPwGgg75UDWwVCDajuh4sZOyaJMuSs/77Dc5XR
 yzkvThDk4OrRbzygJFAgyZIcO05cBe320GKWUtD/kum5cblOyH51YA6vkOqpnsGLd8bRPy4JbOLHM
 m8+Y2G3ZNcrJhMFP3ozVwE123iLnjSpAdmPzIsQuOpe49qBX5hnDBhRJn1v4xMClGvyongYl/0jZ+
 JnXhCUlSLRsqI6jjLiAjsYh2Xo3jKyD8rGJlLNEXQ0oCmBnJ6Sq5tQfIYLYqRVGp4Rd+Zk7lTsnAD
 Jb4OWs+pWLHanzNIxXQuTfubaQYgAhS6yhumVM819opXZm+XgFN7SPOsy0QqluK0xqSvyxkaUhZzM
 o/0HYqnpPr7c0RVUVfq2eYz+L1yXGF3kq8ZGZfWONb5bD+IERYG6993vlT3DOVfnSlrBDCAt55voI
 dlk+7fCPRWCs3yOaJ27+w8H9REvbw0jS0VX4ructo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: Beraldo Leal <bleal@redhat.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v5 00/18] tests/qtest: Enable running qtest on Windows
Date: Mon, 17 Oct 2022 18:40:57 +0200
Message-ID: <1980190.m7hnA7CXWq@silver>
In-Reply-To: <CAEUhbmXc+7s6udZTNE7AeY+YkNr42fQ2HNHpDufZKDhB5qfL6g@mail.gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <CAEUhbmUfm+V-pN5j17VxRvYd1RGJYa3KF=op9Z-nB5Xq4RhUmA@mail.gmail.com>
 <CAEUhbmXc+7s6udZTNE7AeY+YkNr42fQ2HNHpDufZKDhB5qfL6g@mail.gmail.com>
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

On Monday, October 17, 2022 5:00:56 PM CEST Bin Meng wrote:
> Hi Alex,
>=20
> On Fri, Oct 7, 2022 at 1:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > On Fri, Oct 7, 2022 at 4:35 AM Alex Benn=E9e <alex.bennee@linaro.org> w=
rote:
> > > Bin Meng <bmeng.cn@gmail.com> writes:
> > > > In preparation to adding virtio-9p support on Windows, this series
> > > > enables running qtest on Windows, so that we can run the virtio-9p
> > > > tests on Windows to make sure it does not break accidently.
> > >=20
> > > I'm happy to take this whole series through my testing/next however I
> > > don't have working CI for the month so need to wait for my minutes to
> > > reset. Have you done a full CI run* with this?
> >=20
> > Yes, gitlab CI passed.
> >=20
> > > (*make sure any CI run is only on a repo forked from
> > > https://gitlab.com/qemu-project as you won't get the discount cost
> > > factor otherwise)
>=20
> Patch 4 and 10 are already applied in the mainline by Thomas.
>=20
> Daniel will queue patch 14, 15, 16.
>=20
> Could you please help queue patch 1, 2, 3, 5, 6, 7, 9, 13 from this serie=
s?

I already had patch 6 queued on my end:

https://github.com/cschoenebeck/qemu/commits/9p.next

Next 9p PR end of this week. But if somebody else is faster then I'll just
drop it later on.

Best regards,
Christian Schoenebeck



