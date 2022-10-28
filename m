Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B96112EE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:35:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPW3-0004zO-5r; Fri, 28 Oct 2022 09:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ooPVz-0004ys-JS
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:35:16 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ooPVu-000797-5Q
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=MQ+p1TYdDJFP0Cy5obwPmUr9/8UN1y0zayMadiGx4iU=; b=HcUDxaX+Od/zA6YyH1gMoin+Y1
 w6reirqB4KIL9+ltOmaqOS3riRxX+OB8DJw9XVggY/mNgHp3ualKScvsmtclu9EM3cenKJVNwpPIB
 dfh0I2RlICL3EbxEXjjT5pqMbo2eQ3qNnsh+KbVv0hXilDRVYNqa5H0pPdRXn7b8PHoWhUbGxhK+6
 zqIV21OXNRyIujqapx0xaplfyQsd4h6ndRydohfeqLVf/0gps3a/09rv5BmeSubCRICmoPg+asowb
 Vvkn/KToR7covFd8U2R/MtwEXXD3Lu2Dfxkrn2s04nwS7B7gRyTwRnrpvp+HYPSC7Jblv4khifIeh
 2m7LFBXH/YlPtwXk8ISAIbaxPuQXXqWij+ezICsqHudm7C1UBQmAVFsa5l/Goolz8IMYDkJdRxWgJ
 C/pHk+pWqoiSsGmTw/zz2au8tyMoA07H4m1lgaib405Vs23S6ezs4cAFh0qZwW/zA6rqBmWWDiz6T
 DLt9pU8GlmvoXZ1wMR5oT77XLfT25/qzY3fjZpF5ZZUYi2wjWSzGs4+duQetBZV8qLSxU6ID6nUob
 00CmbnpmnKyla2+BX+jMWv1Oq2ES0MB/lpOIIMGnXVUOGY8hmITVsUPTfgnm3+grWR3gw3DHWGd5q
 E2hwoOyVe7GqLDVijv4bqPAGUE2hOBtfLS0ampJ4o=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 08/11] tests/qtest: libqos: Do not build virtio-9p
 unconditionally
Date: Fri, 28 Oct 2022 15:34:45 +0200
Message-ID: <4670841.EzQWk5tR0x@silver>
In-Reply-To: <552d9669-9db8-08e1-5931-644ec4c12c07@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <5007365.dktPthMeyv@silver>
 <552d9669-9db8-08e1-5931-644ec4c12c07@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Friday, October 28, 2022 3:09:06 PM CEST Thomas Huth wrote:
> On 28/10/2022 14.59, Christian Schoenebeck wrote:
> > On Friday, October 28, 2022 6:57:33 AM CEST Bin Meng wrote:
> >> At present the virtio-9p related codes are built into libqos
> >> unconditionally. Change to build them conditionally by testing
> >> the 'virtfs' config option.
> >>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>
> >> ---
> >>
> >> Changes in v6:
> >> - new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p unconditionally"
> >>
> >>   tests/qtest/libqos/meson.build | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> >> index 113c80b4e4..32f028872c 100644
> >> --- a/tests/qtest/libqos/meson.build
> >> +++ b/tests/qtest/libqos/meson.build
> >> @@ -33,8 +33,6 @@ libqos_srcs = files(
> >>           'sdhci.c',
> >>           'tpci200.c',
> >>           'virtio.c',
> >> -        'virtio-9p.c',
> >> -        'virtio-9p-client.c',
> >>           'virtio-balloon.c',
> >>           'virtio-blk.c',
> >>           'vhost-user-blk.c',
> >> @@ -62,6 +60,10 @@ libqos_srcs = files(
> >>           'x86_64_pc-machine.c',
> >>   )
> >>   
> >> +if have_virtfs
> >> +  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
> >> +endif
> >> +
> >>   libqos = static_library('qos', libqos_srcs + genh,
> >>                           name_suffix: 'fa',
> >>                           build_by_default: false)
> >>
> > 
> > I wondered why this change would no longer execute the 9p tests here.
> > Apparently because it changes the order of tests being executed, i.e. 9p tests
> > would then be scheduled after:
> > 
> >    # Start of vhost-user-blk-pci tests
> >    # Start of vhost-user-blk-pci-tests tests
> >    Environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY required
> >    [EXIT]
> > 
> > and I never cared about QEMU storage binary. Can we make a hack like the
> > following to not change the order of the tests?
> > 
> > diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> > index 32f028872c..389bca9804 100644
> > --- a/tests/qtest/libqos/meson.build
> > +++ b/tests/qtest/libqos/meson.build
> > @@ -1,7 +1,13 @@
> >   libqos_srcs = files(
> >           '../libqtest.c',
> >           '../libqmp.c',
> > +)
> >   
> > +if have_virtfs
> > +  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
> > +endif
> > +
> > +libqos_srcs += files(
> >           'qgraph.c',
> >           'qos_external.c',
> >           'pci.c',
> > @@ -60,10 +66,6 @@ libqos_srcs = files(
> >           'x86_64_pc-machine.c',
> >   )
> >   
> > -if have_virtfs
> > -  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
> > -endif
> > -
> >   libqos = static_library('qos', libqos_srcs + genh,
> >                           name_suffix: 'fa',
> >                           build_by_default: false)
> > 
> > Too ugly?
> 
> Looks a little bit ugly, indeed. What about marking the vhost-user-blk-pci 
> test as skipped instead of exiting? (i.e. use g_test_skip() instead of 
> exit()). Would that work for you?

In general, sure!

But it seems it needs a bit more tweaking, simply placing

  g_test_skip(...);
  return NULL;

there causes a hang.

Best regards,
Christian Schoenebeck



