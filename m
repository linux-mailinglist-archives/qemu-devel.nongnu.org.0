Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9A55F016
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 23:00:36 +0200 (CEST)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6IK3-0003K5-Jj
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 17:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o6IIZ-0002RE-Ut; Tue, 28 Jun 2022 16:59:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o6IIX-0006GH-Dp; Tue, 28 Jun 2022 16:59:03 -0400
Received: by mail-ed1-x533.google.com with SMTP id r18so11420002edb.9;
 Tue, 28 Jun 2022 13:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=VYyYVaguM9AiFz2TacfiRyojZpDmxjlgMkPeylJcdgQ=;
 b=mF8IcLcvwuMm6Be0+eyVflbaFtOrEUkx2oDWudB0rvhcP3nnoJpFFyJzqlgu1ouxTU
 PEt0871jMzuVjrOrpAC5V1HejZYdYGefXtzUK8HVxefBgJ/HQksV1wAnrdGRx7tnroOo
 0mzGEUhOYLweECH17El+RhxCDSlYQX3PxbrZvsK1Zg+3KLARmzs0yG+FpLjrINLjZVWR
 1YwxKYRoOmUs5Sy5MvGrziqRJi01v8gji08yCwY222RRt41gP27pA+ii6EjXFABzllXL
 0coiCUqWPcr92Td8O5ovc8NYErIo/adThn2kECuTfAwb0xqOVwktjcOrmpq13Kumanzp
 uG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=VYyYVaguM9AiFz2TacfiRyojZpDmxjlgMkPeylJcdgQ=;
 b=TIcJBwecV1adZHZMm/WGPAQ23T6PIxp3vP73iR6xq+1KclMT/ITuTNrf3dmOh4HB7U
 FWlyEY8+s/QYsCKGMhNJ65NPbu7nHLIROYrGyvT+wvY9gfwNsUJQVgVs/CkGxnmVg6NV
 HZJ5J6mGRtm9QQD+a4kN4JmVcbMoSgB/JA4Xcqt44MG4rKb/Kz8cNIo61b/9pWs7DaE6
 0IkVrqaHpnLMOR7csQyKMnssGzaQjLQ+nsfRzX+bz7LgYDyowhfQMuqH6uSGEaSgdwt4
 REBHt1MacT0JWOyQGCqP9CSNQ81OvIzdPhWOhW9zEvzxTf9143d9hrARcWHTD2yEiKXh
 hn/w==
X-Gm-Message-State: AJIora8GbmBjPnVfZF0mBx1BXX+SOF83xWOPJxgqzoPtyl1FX9f+16Gs
 oOSGyzVvA3EzJkJ7Ickf+S7nIr3gABY=
X-Google-Smtp-Source: AGRyM1s3dozt9bvArLV6A7D/jktCc2unZFpP4SoY0M8gCtHnEeirqTD4xhcTN6fkDmV7R6YoFH0EOQ==
X-Received: by 2002:aa7:d38e:0:b0:435:6785:66d1 with SMTP id
 x14-20020aa7d38e000000b00435678566d1mr25310422edq.393.1656449938552; 
 Tue, 28 Jun 2022 13:58:58 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-111-114.77.13.pool.telefonica.de.
 [77.13.111.114]) by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b00435d4179bbdsm10331687edv.4.2022.06.28.13.58.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jun 2022 13:58:58 -0700 (PDT)
Date: Tue, 28 Jun 2022 20:58:52 +0000
From: B <shentey@gmail.com>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
CC: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 0/2] Decouple Xen-HVM from PIIX
In-Reply-To: <20220626094656.15673-1-shentey@gmail.com>
References: <20220626094656.15673-1-shentey@gmail.com>
Message-ID: <D8EF825B-45A2-4DE5-A787-8FE7BE88D2E6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 26=2E Juni 2022 09:46:54 UTC schrieb Bernhard Beschow <shentey@gmail=2E=
com>:
>hw/i386/xen/xen-hvm=2Ec contains logic which is PIIX-specific=2E This mak=
es xen-hvm=2Ec depend on PIIX which can be avoided if PIIX logic was isolat=
ed in PIIX itself=2E
>
>
>
>Bernhard Beschow (2):
>
>  hw/i386/xen/xen-hvm: Allow for stubbing xen_set_pci_link_route()
>
>  hw/i386/xen/xen-hvm: Inline xen_piix_pci_write_config_client() and
>
>    remove it
>
>
>
> hw/i386/xen/xen-hvm=2Ec       | 17 ++---------------
>
> hw/isa/piix3=2Ec              | 15 ++++++++++++++-
>
> include/hw/xen/xen=2Eh        |  2 +-
>
> include/hw/xen/xen_common=2Eh |  6 ------
>
> stubs/xen-hw-stub=2Ec         |  3 ++-
>
> 5 files changed, 19 insertions(+), 24 deletions(-)
>
>
>
>-- >
>2=2E36=2E1
>
>
>

Hi Laurent,

would you like to queue this as well? Both patches have been reviewed at l=
east once, piix twice=2E Or would you rather keep the review period open fo=
r longer?

Best regards,
Bernhard

