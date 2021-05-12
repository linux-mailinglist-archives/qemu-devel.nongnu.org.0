Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2B37BF2B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:02:57 +0200 (CEST)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpRw-0002zJ-4b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lgpPi-0000gT-Lv
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:00:40 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lgpPc-0003QY-1K
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=OwhFw13IIxGuB4o/DxOspuur6+JHDLxidR5rqYnphLY=; b=TmoOuoGmq8+KQvU+UM8+QmM/Lr
 C2rkTkdDoiKUlgpEiez4lVBATpPKginHIbb+FKvb9YtzQwcv1GY1OKau2GRtaC1EXFx6k6NtbIM+t
 vIlNJzBFJUO/XmLpTlx8RrePqaBZV+OcDdnMXehjxiBFtDrtaofWA0aeEVDAZ3ZR5bUhCWZhBm1gg
 10AQVVjiczt73JeGcrakErCS3l6aybuj2/xZvBO7wMVwJRbeLNA5S0STsKJruPK8EoHOnAMct/3Rj
 jOXucNjiOHH1GDikGO7NpQxBAZTkRZDFfoeVYrerjfS1zWs7Qo+7ODxT1RBWx+NQV3JnnNf+4ySUF
 IRmC2G8GAM+eBUbHcySuwsGtDM/DkRl9dWJ/FbZ7NIoxj+qXp9STs8XzX9GF/Z/U47ccjg3HACHVB
 h5NIj0Z0FnMfeS8snjKrlRbaDam/hNlc67ppQE4M9pGM0TJuEljO4m+UW4RwNppw7dqc2zKeImxlx
 HF1/yK8On1K3vf2Km4iGqo+lcQeSiMAszXp/erM1JN6P8UovKZMBML4pZhTsxtskZRrkmyJuFpNZ4
 vEDUei/KvG3+PXEKD1Nrndov4+A/RNeUSJlNyDOG32wdi7+46rZW3AWEeWrH15XQ5ccaBZwOrINWg
 4EmXQlf7dmBxvV6pouMQB3u7VEsGreOI3nX62Com8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH] 9pfs: add link to 9p developer docs
Date: Wed, 12 May 2021 16:00:27 +0200
Message-ID: <21328014.1JMQAdTcbD@silver>
In-Reply-To: <20210512143906.73ee6d43@bahia.lan>
References: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
 <1839394.9N4xr98ZK1@silver> <20210512143906.73ee6d43@bahia.lan>
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

On Mittwoch, 12. Mai 2021 14:39:06 CEST Greg Kurz wrote:
> On Wed, 12 May 2021 12:25:56 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 11. Mai 2021 21:57:53 CEST Connor Kuehl wrote:
> > > On 5/6/21 8:12 AM, Christian Schoenebeck wrote:
> > > > To lower the entry level for new developers, add a link to the
> > > > 9p developer docs (i.e. qemu wiki) at the beginning of 9p source
> > > > files, that is to: https://wiki.qemu.org/Documentation/9p
> > > > 
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > > 
> > > >  hw/9pfs/9p-local.c             | 5 +++++
> > > >  hw/9pfs/9p-posix-acl.c         | 5 +++++
> > > >  hw/9pfs/9p-proxy.c             | 5 +++++
> > > >  hw/9pfs/9p-synth.c             | 5 +++++
> > > >  hw/9pfs/9p-util.c              | 5 +++++
> > > >  hw/9pfs/9p-xattr-user.c        | 5 +++++
> > > >  hw/9pfs/9p-xattr.c             | 5 +++++
> > > >  hw/9pfs/9p.c                   | 5 +++++
> > > >  hw/9pfs/codir.c                | 5 +++++
> > > >  hw/9pfs/cofile.c               | 5 +++++
> > > >  hw/9pfs/cofs.c                 | 5 +++++
> > > >  hw/9pfs/coth.c                 | 5 +++++
> > > >  hw/9pfs/coxattr.c              | 5 +++++
> > > >  hw/9pfs/virtio-9p-device.c     | 5 +++++
> > > >  hw/9pfs/xen-9p-backend.c       | 5 +++++
> > > >  tests/qtest/libqos/virtio-9p.c | 5 +++++
> > > >  tests/qtest/virtio-9p-test.c   | 5 +++++
> > > 
> > > Would it be helpful to also add this link to the virtio-9p stanza in
> > > MAINTAINERS? Something like:
> > > 
> > > W: https://wiki.qemu.org/Documentation/9p
> > > 
> > > Connor
> > 
> > Right, makes sense to me. I think I can just handle that as a separate
> > patch subsequently, not worth a threaded V2 IMO.
> > 
> > @Greg: a humble PING from the silent 9p front.
> 
> Sorry for lack of care... I agree both with the patch and with
> Connor's suggestion. No need to even post anything more. You
> can just fix this patch in your tree.
> 
> Acked-by: Greg Kurz <groug@kaod.org>
> 

Queued. Thanks! 

https://github.com/cschoenebeck/qemu/commits/9p.next

Best regards,
Christian Schoenebeck



