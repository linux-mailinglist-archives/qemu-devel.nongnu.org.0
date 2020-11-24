Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7A2C1F6A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 09:07:44 +0100 (CET)
Received: from localhost ([::1]:46040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khTMU-0007Ci-W4
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 03:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khTJz-0006OV-70
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:05:07 -0500
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:57928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khTJx-0002Ds-1T
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 03:05:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 850DF21B640;
 Tue, 24 Nov 2020 09:05:00 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 09:04:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a35818e6-8482-4c8f-a859-8742d98a044e,
 886B3C846F729F79F342FB8F3892F62368E4F687) smtp.auth=groug@kaod.org
Date: Tue, 24 Nov 2020 09:04:58 +0100
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 for-5.2] tests/9pfs: Mark "local" tests as "slow"
Message-ID: <20201124090458.138fda63@bahia.lan>
In-Reply-To: <8f6b304b-1a7c-e16d-c413-170605599347@redhat.com>
References: <160620382310.1423262.7364287092069513483.stgit@bahia.lan>
 <8f6b304b-1a7c-e16d-c413-170605599347@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5dbae22c-b9b7-4841-b218-7c12762f1f2f
X-Ovh-Tracer-Id: 13739356564108515808
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegjedgudegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkedvgfeugfdtvdelfeffueevfeegudekhefftdejvefgveeileeludffkeeuvdffnecuffhomhgrihhnpehnohhnghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=groug@kaod.org;
 helo=9.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 08:54:38 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 24/11/2020 08.43, Greg Kurz wrote:
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
> > v2: - less noisy patch
> > ---
> >  tests/qtest/virtio-9p-test.c |    9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 21e340fa5f43..92a498f24925 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -1456,6 +1456,15 @@ static void register_virtio_9p_test(void)
> >  
> >  
> >      /* 9pfs test cases using the 'local' filesystem driver */
> > +
> > +    /*
> > +     * XXX: Until we are sure that these tests can run everywhere,
> > +     * keep them as "slow" so that they aren't run with "make check".
> > +     */
> > +    if (!g_test_slow()) {
> > +        return;
> > +    }
> > +
> >      opts.before = assign_9p_local_driver;
> >      qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
> >      qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I assume you'll take this via the 9p tree? I don't have any other qtest
> patches pending right now, so I did not plan to send another pull request
> today...
> 

Yeah, I plan to do that later today.

Cheers,

--
Greg

