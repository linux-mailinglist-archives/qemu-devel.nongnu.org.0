Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6C2C1EEC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 08:33:46 +0100 (CET)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khSpe-00062f-24
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 02:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khSdE-0000ci-UJ
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 02:20:57 -0500
Received: from 1.mo51.mail-out.ovh.net ([178.32.121.110]:47776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khSdC-0003aY-9v
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 02:20:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id B50E523C973;
 Tue, 24 Nov 2020 08:20:50 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 08:20:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001bb5dbd60-7c7c-469c-b79f-4ff6a42300d9,
 886B3C846F729F79F342FB8F3892F62368E4F687) smtp.auth=groug@kaod.org
Date: Tue, 24 Nov 2020 08:20:48 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH for-5.2] tests/9pfs: Mark "local" tests as "slow"
Message-ID: <20201124082048.15c89e16@bahia.lan>
In-Reply-To: <1652137.SzlE5fuBRn@silver>
References: <160615331159.1339160.8458952247626802787.stgit@bahia.lan>
 <1652137.SzlE5fuBRn@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 9e237b8a-85af-4165-a961-a0e42ddad723
X-Ovh-Tracer-Id: 12993447876079426016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkedvgfeugfdtvdelfeffueevfeegudekhefftdejvefgveeileeludffkeeuvdffnecuffhomhgrihhnpehnohhnghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=groug@kaod.org;
 helo=1.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas
 Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 19:08:18 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 23. November 2020 18:41:51 CET Greg Kurz wrote:
> > The "local" tests can fail on some automated build systems as
> > reported here:
> > 
> > https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05510.html
> > 
> > This will need to be investigated and addressed later. Let's go for a
> > workaround in the meantime : mark the "local" tests as "slow" so that
> > they aren't executed with a simple "make check" like in the case above.
> > 
> > Reported-by: Cole Robinson <crobinso@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > 
> > Unless there's a strong argument against merging this, I'll post
> > a PR with this fix for RC3.
> > ---
> >  tests/qtest/virtio-9p-test.c |   35 +++++++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 21e340fa5f43..dad37ace9772 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -1454,20 +1454,27 @@ static void register_virtio_9p_test(void)
> >      qos_add_test("synth/readdir/split_128", "virtio-9p",
> >                   fs_readdir_split_128,  &opts);
> > 
> > -
> > -    /* 9pfs test cases using the 'local' filesystem driver */
> > -    opts.before = assign_9p_local_driver;
> > -    qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
> > -    qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
> > -    qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir,
> > &opts); -    qos_add_test("local/create_file", "virtio-9p", fs_create_file,
> > &opts); -    qos_add_test("local/unlinkat_file", "virtio-9p",
> > fs_unlinkat_file, &opts); -    qos_add_test("local/symlink_file",
> > "virtio-9p", fs_symlink_file, &opts); -   
> > qos_add_test("local/unlinkat_symlink", "virtio-9p", fs_unlinkat_symlink, - 
> >                &opts);
> > -    qos_add_test("local/hardlink_file", "virtio-9p", fs_hardlink_file,
> > &opts); -    qos_add_test("local/unlinkat_hardlink", "virtio-9p",
> > fs_unlinkat_hardlink, -                 &opts);
> > +    if (g_test_slow()) {
> 
> If you don't mind, I would suggest simply using
> 
> if (!g_test_slow()) {
> 	return;
> }
> 
> here to keep the diff noise low.
> 

Sure, I'll do that.

> > +        /* 9pfs test cases using the 'local' filesystem driver */
> > +        /*
> > +         * XXX: Until we are sure that these tests can run everywhere,
> > +         * keep them as "slow" so that they aren't run with "make check"
> > +         */
> > +        opts.before = assign_9p_local_driver;
> > +        qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
> > +        qos_add_test("local/create_dir", "virtio-9p", fs_create_dir,
> > &opts); +        qos_add_test("local/unlinkat_dir", "virtio-9p",
> > fs_unlinkat_dir, &opts); +        qos_add_test("local/create_file",
> > "virtio-9p", fs_create_file, &opts); +       
> > qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, +       
> >              &opts);
> > +        qos_add_test("local/symlink_file", "virtio-9p", fs_symlink_file,
> > &opts); +        qos_add_test("local/unlinkat_symlink", "virtio-9p",
> > fs_unlinkat_symlink, +                     &opts);
> > +        qos_add_test("local/hardlink_file", "virtio-9p", fs_hardlink_file,
> > +                     &opts);
> > +        qos_add_test("local/unlinkat_hardlink", "virtio-9p",
> > +                     fs_unlinkat_hardlink, &opts);
> > +    }
> >  }
> > 
> >  libqos_init(register_virtio_9p_test);
> 
> I agree that this is okay for now to avoid inconveniences with nearby 5.2 
> release, but do we agree that this is going to be reverted when 6.0 
> development phase starts?
> 
> In 6.0 I would rather handle this by introducing a previously mentioned 
> 'loglevel' option for 9p, and asking for the required log data if the local 
> tests fail for somebody. I can take care about the loglevel option when 6.0 
> phase starts.
> 
> Best regards,
> Christian Schoenebeck
> 
> 


