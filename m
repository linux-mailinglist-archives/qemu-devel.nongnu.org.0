Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F949420366
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:18:26 +0200 (CEST)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX649-0005HB-8X
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mX60z-0004Iy-N6
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 14:15:11 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:43191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mX60w-0004eq-6l
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 14:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=mZSjS7ofGbYSB7RIgqqBbZpnFuCX2o5Qyyro4rV6i9w=; b=OUUWcnS+0lIsXrWbn1p6P9jIC2
 blJf5GzuI0y+JDInmDMdt3AsdEj00+wCmX2WXbz8lY8Ct2WrW2EVYPa23Q7nBTjwZ3EpxxA70w73z
 pdlQ9F79LYNIAGV17c9rPfyjeYxN8CZDXPKPkPIeKZIH2xpi6ChhijWJeFQF3MuwYHDmOilAa02Us
 vCA7Vu3HLcxSQZB/qiMuAX+dqPCXRq9NfSYJIYSvua/inglVspFw0+Za2WUNMkOcLRmZtaJvPFC+y
 FBWanGo6WZDGxb/eGvwCYinZrmUPqJV9MnbJdqU90zkKTM63xGOSDZDzHNCM/fUqsGjBY9ytydlMJ
 JeSLBz5hm7yFDoeCawpl+kQ24b3iua8FaQQyeN9tI7/1Wv6xzXXPzNhqipPkNyPyzNgxt/2bsKQj5
 OzwdQ5EtvqkaSreeeDyLn13q7x5jaeKWaLzoEeUOanI4HsbxIPAAgx0o5PPLATh+Eu1kVKW5dz7zw
 zOpJvaF0ftF//+PmFiAiYLEq2EVTrAPCtnERxxvyfstePijuR7/GzvH9u1Tm/8s79pXhh1qWYOY/a
 sa1QCTi2oiIMpUEdOMAarwdOSwr4VyPaIiCKl8YQSIn5nEPHEYlBm9qPW+OKNENaikX46v7oD9uro
 aWv09i4oBGQmyTEyrUkP4WlRoWNjEBl/yhTMcAa7s=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: virtio 4M limit
Date: Sun, 03 Oct 2021 20:14:55 +0200
Message-ID: <9125826.uuVAOS58fx@silver>
In-Reply-To: <2311207.AWRhmksWK6@silver>
References: <2311207.AWRhmksWK6@silver>
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

On Freitag, 1. Oktober 2021 13:21:23 CEST Christian Schoenebeck wrote:
> Hi Michael,
> 
> while testing the following kernel patches I realized there is currently a
> size limitation of 4 MB with virtio on QEMU side:
> https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte.com/
> 
> So with those kernel patches applied I can mount 9pfs on Linux guest with
> the 9p 'msize' (maximum message size) option with a value of up to 4186112
> successfully. If I try to go higher with 'msize' then the system would hang
> with the following QEMU error:
> 
>   qemu-system-x86_64: virtio: too many write descriptors in indirect table
> 
> Which apparently is due to the amount of scatter gather lists on QEMU virtio
> side currently being hard coded to 1024 (i.e. multiplied by 4k page size =>
> 4 MB):
> 
>   ./include/hw/virtio/virtio.h:
>   #define VIRTQUEUE_MAX_SIZE 1024
> 
> Is that hard coded limit carved into stone for some reason or would it be OK
> if I change that into a runtime variable?

After reviewing the code and protocol specs, it seems that this value is
simply too small. I will therefore send a patch suggsting to raise this value
to 32768, as this is the maximum possible value according to the virtio specs.

https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006

> If that would be Ok, maybe something similar that I did with those kernel
> patches, i.e. retaining 1024 as an initial default value and if indicated
> from guest side that more is needed, increasing the SG list amount
> subsequently according to whatever is needed by guest?

Further changes are probably not necessary.

The only thing I have spotted that probably should be changed is that at some
few locations, a local array is allocated on the stack with VIRTQUEUE_MAX_SIZE
as array size, e.g.:

static void *virtqueue_split_pop(VirtQueue *vq, size_t sz)
{
    ...
    hwaddr addr[VIRTQUEUE_MAX_SIZE];
    struct iovec iov[VIRTQUEUE_MAX_SIZE];
    ...
}

> And as I am not too familiar with the virtio protocol, is that current limit
> already visible to guest side? Because obviously it would make sense if I
> change my kernel patches so that they automatically limit to whatever QEMU
> supports instead of causing a hang.

Apparently the value of VIRTQUEUE_MAX_SIZE (the maximum amount of scatter
gather lists or the maximum queue size ever possible) is not visible to guest.

I thought about making a hack to make the guest Linux kernel aware whether
host side has the old limit of 1024 or rather the correct value 32768, but
probably not worth it.

Best regards,
Christian Schoenebeck



