Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9CE28E0C1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 14:52:23 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSgGU-0006lL-N1
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 08:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kSgEs-0005r1-N4; Wed, 14 Oct 2020 08:50:42 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>)
 id 1kSgEn-00009j-Er; Wed, 14 Oct 2020 08:50:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1602679815; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=J+6P9l5rUCgKCc5P6DlGt/5tnChat6akDHP/bQX/41gxL1ybCzz59V1PdTugWgSAiPvzjXZwHHxRnUP/ZOFXXckJ27p+k/uu568tbEU5V2isxpLsND9v1OF3kmIqsyfd3+OvzjVcd3Vx1iaCqHDuzwso47FBI8e87gfULSdowwM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1602679815;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=e2db/alTKEYfM7zgai4HlT1Otr34/jnZvpJ/gfuQd4I=; 
 b=K2pXa1K6sXFzLYSYez/E5MH+GNmDZ1JW8GdtQ5rS3eQjOULa+U3WCRtlp6SL3NvYLohAxEkFZxNEkTV1ACqQjicJolhk79Bqt7OUNIntFJu8isyhJbe4St+aNHIQgJ/SEM7cDpESq/YUPJh5Mz62CgJKoxIsKyfZ8MWtZcR6v+Y=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602679815; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:Mime-Version:Content-Transfer-Encoding;
 bh=e2db/alTKEYfM7zgai4HlT1Otr34/jnZvpJ/gfuQd4I=;
 b=HF3FBUpf+w06t+J+i3TDQHI0gid3wRX9KcQO8+FQCXy4+gsaYkDdzje5OJTF40gy
 rzRf0iUDCg2JrdRHmlF0/mPPqrinZTRI032yctN4kB7LnpwLhIT3YkS9GgytA42Obaq
 4mkeC3L0aMiYRQESQVt43qCwf24gxY/weNAxy9ws=
Received: from u60bdefc337955a.ant.amazon.com (54.239.6.186 [54.239.6.186]) by
 mx.zoho.com.cn with SMTPS id 1602679813882427.3971076189829;
 Wed, 14 Oct 2020 20:50:13 +0800 (CST)
Message-ID: <4370cd2e0e6e76875943eaeaed1a94c9dc26d970.camel@euphon.net>
Subject: Re: [PATCH 0/9] util/vfio-helpers: Improve debugging experience
From: Fam Zheng <fam@euphon.net>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
Date: Wed, 14 Oct 2020 13:50:07 +0100
In-Reply-To: <81d80fdd-e2f2-db5c-f358-e28eeb291c82@redhat.com>
References: <20201014115253.25276-1-philmd@redhat.com>
 <9d08c9ab6310a5f0c796c4d98d1c51f071802369.camel@euphon.net>
 <81d80fdd-e2f2-db5c-f358-e28eeb291c82@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 08:23:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-10-14 at 14:42 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/14/20 2:34 PM, Fam Zheng wrote:
> > On Wed, 2020-10-14 at 13:52 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> > > A bunch of boring patches that have been proven helpful
> > > while debugging.
> > >=20
> > > Philippe Mathieu-Daud=C3=A9 (9):
> > >    util/vfio-helpers: Improve reporting unsupported IOMMU type
> > >    util/vfio-helpers: Trace PCI I/O config accesses
> > >    util/vfio-helpers: Trace PCI BAR region info
> > >    util/vfio-helpers: Trace where BARs are mapped
> > >    util/vfio-helpers: Improve DMA trace events
> > >    util/vfio-helpers: Convert vfio_dump_mapping to trace events
> > >    util/vfio-helpers: Let qemu_vfio_dma_map() propagate Error
> > >    util/vfio-helpers: Let qemu_vfio_do_mapping() propagate Error
> > >    util/vfio-helpers: Let qemu_vfio_verify_mappings() use
> > > error_report()
> > >=20
> > >   include/qemu/vfio-helpers.h |  2 +-
> > >   block/nvme.c                | 14 ++++----
> > >   util/vfio-helpers.c         | 66 +++++++++++++++++++++---------
> > > ---
> > > ----
> > >   util/trace-events           | 10 ++++--
> > >   4 files changed, 54 insertions(+), 38 deletions(-)
> > >=20
> > > --=20
> > > 2.26.2
> > >=20
> > >=20
> > >=20
> >=20
> > Modular the g_strdup_printf() memleak I pointed out:
> >=20
> > Reviewed-by: Fam Zheng <fam@euphon.net>

Overlooked the auto free qualifier, so that one is okay too!

Fam

>=20
> Thanks!
>=20
>=20


