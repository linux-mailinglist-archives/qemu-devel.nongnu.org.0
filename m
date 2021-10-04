Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEB3421847
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 22:18:26 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXUPp-0002mT-K8
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 16:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXUI1-00015T-CF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:10:24 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXUHz-00053a-Cd
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 16:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=/Ww3Y2yKctJfkbv98BvAUvbEF+TXDbzYkdj6oTQ2OK0=; b=NtTYkyOrJvRkgPC8UVPiamnqUu
 yP4mpU0Lk4gWGkaaxa0pNqfUBiGEPP4CxpYuqI3SprsQPxxcRSXFZCDFljsO0VvymSoXxshamSpYn
 1K9gRXoHXbX5U9CGFc0ayqFqmMm1TEZaqaV07VCHZRKMb86vykatwCBmL+vMEBr9BjnVuPotahdaz
 38dIPGydfCBKdGAdPbqMH+s2+Enhvs7UKBbLPy7puYd4oGXX03PkdAIXHOSetQ3KhPWxel+r7HZae
 pM0+MrsecZidUv8kuDxctA/fhvXjso4Zsa8cdrTwDHzO75Q3jTuZBfiGxaNT3HLHtu/cZDQOKf/4q
 KAkZ57RKzUPFs6aR4bzgEy5/zSZJRltFeoKYMQRteyMGbqEI0+ZSQJzIk3b4QPMExdIU0Unbj3Xhq
 ywQ/ILGsb0cyL0wEWCnirFChe2Acb4b7Ofb9f6flrXBlhsDSJB0gq8t9PoXAhjkC+Gxx5D3nVgXEX
 B9D67Gflw2h9WPUz8lMFgGOk5Rb2CY/viCyTu7lmOXNOJtZdNMPrTcQnS7SFFixUbsSYJN2bKa7NQ
 vLgJOdGkFEe8qST7EfeoWShNIqA18/zZI8nnyBragk8jUxzbYzabYOhcAP1dytu1aiaSrkldQxEkY
 ++eR2og+Wj+DDCI2agQvwSjdr6ywEcve+U0CyiATk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: virtio 4M limit
Date: Mon, 04 Oct 2021 22:10:14 +0200
Message-ID: <6050874.m5DA7AeI2Q@silver>
In-Reply-To: <20211004155652-mutt-send-email-mst@kernel.org>
References: <2311207.AWRhmksWK6@silver> <25522755.cqRP6gS9TD@silver>
 <20211004155652-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 4. Oktober 2021 21:59:18 CEST Michael S. Tsirkin wrote:
> On Mon, Oct 04, 2021 at 12:44:21PM +0200, Christian Schoenebeck wrote:
> > On Sonntag, 3. Oktober 2021 22:27:03 CEST Michael S. Tsirkin wrote:
> > > On Sun, Oct 03, 2021 at 08:14:55PM +0200, Christian Schoenebeck wrote:
> > > > On Freitag, 1. Oktober 2021 13:21:23 CEST Christian Schoenebeck wrote:
> > > > > Hi Michael,
> > > > > 
> > > > > while testing the following kernel patches I realized there is
> > > > > currently
> > > > > a
> > > > > size limitation of 4 MB with virtio on QEMU side:
> > > > > https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudeb
> > > > > yte.
> > > > > com/
> > > > > 
> > > > > So with those kernel patches applied I can mount 9pfs on Linux guest
> > > > > with
> > > > > the 9p 'msize' (maximum message size) option with a value of up to
> > > > > 4186112
> > > > > successfully. If I try to go higher with 'msize' then the system
> > > > > would
> > > > > hang
> > > > > 
> > > > > with the following QEMU error:
> > > > >   qemu-system-x86_64: virtio: too many write descriptors in indirect
> > > > >   table
> > > > > 
> > > > > Which apparently is due to the amount of scatter gather lists on
> > > > > QEMU
> > > > > virtio side currently being hard coded to 1024 (i.e. multiplied by
> > > > > 4k
> > > > > page size =>> >
> > > > > 
> > > > > 4 MB):
> > > > >   ./include/hw/virtio/virtio.h:
> > > > >   #define VIRTQUEUE_MAX_SIZE 1024
> > > > > 
> > > > > Is that hard coded limit carved into stone for some reason or would
> > > > > it
> > > > > be OK if I change that into a runtime variable?
> > > > 
> > > > After reviewing the code and protocol specs, it seems that this value
> > > > is
> > > > simply too small. I will therefore send a patch suggsting to raise
> > > > this
> > > > value to 32768, as this is the maximum possible value according to the
> > > > virtio specs.
> > > > 
> > > > https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.h
> > > > tml#
> > > > x1-240006
> > > 
> > > I think it's too aggressive to change it for all devices.
> > > Pls find a way to only have it affect 9pfs.
> > 
> > So basically I should rather introduce a variable that would be used at
> > most places instead of using the macro VIRTQUEUE_MAX_SIZE?
> 
> I guess so.

Good, because I just sent out a v2 series minutes ago.

> > > > > If that would be Ok, maybe something similar that I did with those
> > > > > kernel
> > > > > patches, i.e. retaining 1024 as an initial default value and if
> > > > > indicated
> > > > > from guest side that more is needed, increasing the SG list amount
> > > > > subsequently according to whatever is needed by guest?
> > > > 
> > > > Further changes are probably not necessary.
> > > > 
> > > > The only thing I have spotted that probably should be changed is that
> > > > at
> > > > some few locations, a local array is allocated on the stack with
> > > > VIRTQUEUE_MAX_SIZE as array size, e.g.:
> > > > 
> > > > static void *virtqueue_split_pop(VirtQueue *vq, size_t sz)
> > > > {
> > > > 
> > > >     ...
> > > >     hwaddr addr[VIRTQUEUE_MAX_SIZE];
> > > >     struct iovec iov[VIRTQUEUE_MAX_SIZE];
> > > >     ...
> > > > 
> > > > }
> > 
> > What about these allocations on the stack? Is it Ok to disregard this as
> > theoretical issue for now and just retain them on the stack, just with the
> > runtime variable instead of macro as array size?
> 
> I think it's not a big deal ... why do you think it is? Are we running
> out of stack?

No no. :) That was just a theoretical consideration for who knows what kind of 
platform and usage. I have preserved it on stack in today's v2.
 
> > > > > And as I am not too familiar with the virtio protocol, is that
> > > > > current
> > > > > limit already visible to guest side? Because obviously it would make
> > > > > sense if I change my kernel patches so that they automatically limit
> > > > > to
> > > > > whatever QEMU supports instead of causing a hang.
> > > > 
> > > > Apparently the value of VIRTQUEUE_MAX_SIZE (the maximum amount of
> > > > scatter
> > > > gather lists or the maximum queue size ever possible) is not visible
> > > > to
> > > > guest.
> > > > 
> > > > I thought about making a hack to make the guest Linux kernel aware
> > > > whether
> > > > host side has the old limit of 1024 or rather the correct value 32768,
> > > > but
> > > > probably not worth it.
> > > > 
> > > > Best regards,
> > > > Christian Schoenebeck



