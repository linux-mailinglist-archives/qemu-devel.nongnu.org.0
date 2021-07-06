Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679313BC83A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:02:42 +0200 (CEST)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gyX-0006O8-DH
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1m0gwS-0004uT-G1
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1m0gwO-0000dv-Kn
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625562025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNCoQM6cIQuVQTeSdZXN96RR8OR6ZFYEDHnncOuuXWw=;
 b=BCFcs1n+zHl4qIFnIT3WDY0yLsdZBiSwmwz6AtSuM/7Fn1L7PQmuowIAsMD6zV7tc0C3Th
 4wNa4ZybgezpxLHMZyhnCvDaA7ZOnmTBG6hGQDE/iC3HZJ2snLRrUiKvN4kTgsCBO0fxjo
 dnQ0Lw9f7VxcNU9p/W0SgbtrRgmh8PQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-iFFos1BaOR-9c5i8kPAOvg-1; Tue, 06 Jul 2021 05:00:24 -0400
X-MC-Unique: iFFos1BaOR-9c5i8kPAOvg-1
Received: by mail-pj1-f70.google.com with SMTP id
 t5-20020a17090a4485b029016f7fcb8a3dso1297903pjg.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pNCoQM6cIQuVQTeSdZXN96RR8OR6ZFYEDHnncOuuXWw=;
 b=nRBCWsSoPxFW2vbvprBgZx9hw45wcQAqU1PcYwLiaxOh7r3cSqEGOrdlj6JzK8Zs41
 kCJcb0NJechoI0MdfxGc0ql5Jns9ywlI7jitgOq7TsWUmGYgdXt+iinPss6Gzcn0klG1
 C4dczVT6s3/cc0pch9SfZe4N0YRS2XgwRFaqjsJoZSY3akboFHKb1GelrV+GQIvMgxqh
 C4QoxoAe7AeFs6GsYDHFiOE0AvNEfoi6h4TFlMtTWH2v7lETehBmV8SyyjoScLaEL/1u
 UmrbgHcALilaRKbvDgQq7ud5ntzGLHAnChfTMlqB+PuGxZw2jCyDJfJZnYyWWJvdmUUV
 ec3g==
X-Gm-Message-State: AOAM530F/c4jU369n4oJqnsHN0kSEoA50y3NKkJ1fh3m08xUt+a/nsoJ
 CgAGBYRtxpnPTShXVSf3IIJcFeRBMwuFzES9D6et/Mm8IBZKsuZcbyqVoUeKPLePwGHhd9FCH7A
 r5L+o0Wr9BvL7KlxIxqY8HgE8wf98PMY=
X-Received: by 2002:a17:90a:b284:: with SMTP id
 c4mr19993951pjr.213.1625562023552; 
 Tue, 06 Jul 2021 02:00:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzThBsAeQZ/X14QkFD3j7Rdr8R3xP14vGf5yQUvubVjQhyhhPCn2NrIixc7ov/Aw4ZrAxQz0gXtAaTzABVXG3g=
X-Received: by 2002:a17:90a:b284:: with SMTP id
 c4mr19993918pjr.213.1625562023149; 
 Tue, 06 Jul 2021 02:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210705084011.814175-1-philmd@redhat.com>
In-Reply-To: <20210705084011.814175-1-philmd@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 6 Jul 2021 11:00:12 +0200
Message-ID: <CAA8xKjXwrbw-xo+YG8KaU8+Jg0zV4+GXW+hNjBfLDNwN7KG-ZA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <thuth@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Philippe,

I think you don't need root privileges to craft such a highly
fragmented packet from within the guest (tools like hping3 or nmap
come to mind). Right? If so, we may consider allocating a CVE for this
bug. If not, this is not CVE worthy - root does not need an assertion
failure to cause damage to the system.

On Mon, Jul 5, 2021 at 10:40 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Our infrastructure can handle fragmented packets up to
> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
> been proven enough in production for years. If it is
> reached, it is likely an evil crafted packet. Discard it.
>
> Include the qtest reproducer provided by Alexander Bulekov:
>
>   $ make check-qtest-i386
>   ...
>   Running test qtest-i386/fuzz-vmxnet3-test
>   qemu-system-i386: net/eth.c:334: void eth_setup_ip4_fragmentation(const=
 void *, size_t, void *, size_t, size_t, size_t, _Bool):
>   Assertion `frag_offset % IP_FRAG_UNIT_SIZE =3D=3D 0' failed.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: OSS-Fuzz (Issue 35799)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/net/net_tx_pkt.c             |   8 ++
>  tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   1 +
>  tests/qtest/meson.build         |   1 +
>  4 files changed, 205 insertions(+)
>  create mode 100644 tests/qtest/fuzz-vmxnet3-test.c
>
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 1f9aa59eca2..77e9729a7ba 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -590,6 +590,14 @@ static bool net_tx_pkt_do_sw_fragmentation(struct Ne=
tTxPkt *pkt,
>          fragment_len =3D net_tx_pkt_fetch_fragment(pkt, &src_idx, &src_o=
ffset,
>              fragment, &dst_idx);
>
> +        if (dst_idx =3D=3D NET_MAX_FRAG_SG_LIST && fragment_len > 0) {
> +            /*
> +             * The packet is too fragmented for our infrastructure
> +             * (not enough iovec), don't even try to send.
> +             */
> +            return false;
> +        }
> +
>          more_frags =3D (fragment_offset + fragment_len < pkt->payload_le=
n);
>
>          eth_setup_ip4_fragmentation(l2_iov_base, l2_iov_len, l3_iov_base=
,
> diff --git a/tests/qtest/fuzz-vmxnet3-test.c b/tests/qtest/fuzz-vmxnet3-t=
est.c
> new file mode 100644
> index 00000000000..d69009bf5ce
> --- /dev/null
> +++ b/tests/qtest/fuzz-vmxnet3-test.c
> @@ -0,0 +1,195 @@
> +/*
> + * QTest testcase for vmxnet3 device generated by fuzzer
> + *
> + * Copyright Red Hat
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqos/libqtest.h"
> +
> +/*
> + * https://gitlab.com/qemu-project/qemu/-/issues/460
> + */
> +static void test_oss_35799_eth_setup_ip4_fragmentation(void)
> +{
> +    QTestState *s;
> +
> +    s =3D qtest_init("-machine q35 -m 32M -display none -nodefaults "
> +                   "-device vmxnet3,netdev=3Dnet0 -netdev user,id=3Dnet0=
");
> +    qtest_outl(s, 0xcf8, 0x80000814);
> +    qtest_outl(s, 0xcfc, 0xe0000000);
> +    qtest_outl(s, 0xcf8, 0x80000804);
> +    qtest_outw(s, 0xcfc, 0x06);
> +    qtest_outl(s, 0xcf8, 0x80000812);
> +    qtest_outl(s, 0xcfc, 0x2000);
> +    qtest_outl(s, 0xcf8, 0x80000815);
> +    qtest_outb(s, 0xcfc, 0x40);
> +    qtest_bufwrite(s, 0x0, "\xe1", 0x1);
> +    qtest_bufwrite(s, 0x1, "\xfe", 0x1);
> +    qtest_bufwrite(s, 0x2, "\xbe", 0x1);
> +    qtest_bufwrite(s, 0x3, "\xba", 0x1);
> +    qtest_bufwrite(s, 0x28, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x29, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x2a, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x2b, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x2c, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x2d, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x2e, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x2f, "\xff", 0x1);
> +    qtest_bufwrite(s, 0x37, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3e, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xe0004020, "\x00\x00\xfe\xca", 0x4);
> +    qtest_bufwrite(s, 0x9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xd, "\x10", 0x1);
> +    qtest_bufwrite(s, 0x12, "\x10", 0x1);
> +    qtest_bufwrite(s, 0x19, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1b, "\x21", 0x1);
> +    qtest_bufwrite(s, 0x1d, "\x0c", 0x1);
> +    qtest_bufwrite(s, 0x2d, "\x00", 0x1);
> +    qtest_bufwrite(s, 0x10000c, "\x08", 0x1);
> +    qtest_bufwrite(s, 0x10000e, "\x45", 0x1);
> +    qtest_bufwrite(s, 0x100017, "\x11", 0x1);
> +    qtest_bufwrite(s, 0x20000600, "\x00", 0x1);
> +    qtest_bufwrite(s, 0x38, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x39, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x48, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x49, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x58, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x59, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x68, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x69, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x78, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x79, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x88, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x89, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x98, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x99, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xa8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xa9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xb8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xb9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xc8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xc9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xd8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xd9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xe8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xe9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xf8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xf9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x108, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x109, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x118, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x119, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x128, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x129, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x138, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x139, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x148, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x149, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x158, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x159, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x168, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x169, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x178, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x179, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x188, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x189, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x198, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x199, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1a8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x1a9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1b8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x1b9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1c8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x1c9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1d8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x1d9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1e8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x1e9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x1f8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x1f9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x208, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x209, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x218, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x219, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x228, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x229, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x238, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x239, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x248, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x249, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x258, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x259, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x268, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x269, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x278, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x279, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x288, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x289, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x298, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x299, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x2a8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x2a9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x2b8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x2b9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x2c8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x2c9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x2d8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x2d9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x2e8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x2e9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x2f8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x2f9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x308, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x309, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x318, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x319, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x328, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x329, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x338, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x339, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x348, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x349, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x358, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x359, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x368, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x369, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x378, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x379, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x388, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x389, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x398, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x399, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3a8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x3a9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3b8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x3b9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3c8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x3c9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3d8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x3d9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3e8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x3e9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0x3f8, "\x01", 0x1);
> +    qtest_bufwrite(s, 0x3f9, "\x40", 0x1);
> +    qtest_bufwrite(s, 0xd, "\x10", 0x1);
> +    qtest_bufwrite(s, 0x20000600, "\x00", 0x1);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch =3D qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D 0=
) {
> +        qtest_add_func("fuzz/test_oss_35799_eth_setup_ip4_fragmentation"=
,
> +                       test_oss_35799_eth_setup_ip4_fragmentation);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb8f3ea2c2e..43e5050ad96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2001,6 +2001,7 @@ S: Maintained
>  F: hw/net/vmxnet*
>  F: hw/scsi/vmw_pvscsi*
>  F: tests/qtest/vmxnet3-test.c
> +F: tests/qtest/fuzz-vmxnet3-test.c
>
>  Rocker
>  M: Jiri Pirko <jiri@resnulli.us>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index b03e8541700..42add92e9d4 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -66,6 +66,7 @@
>    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-te=
st'] : []) +        \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] :=
 []) +              \
>    (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e100=
0e-test'] : []) +   \
> +  (config_all_devices.has_key('CONFIG_VMXNET3_PCI') ? ['fuzz-vmxnet3-tes=
t'] : []) +   \
>    (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []=
) +                 \
>    qtests_pci +                                                          =
                    \
>    ['fdc-test',
> --
> 2.31.1
>


--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


