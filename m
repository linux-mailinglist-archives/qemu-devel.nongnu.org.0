Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA1347DA1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:26:17 +0100 (CET)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6Km-0005eI-HK
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP6IG-00049s-UA; Wed, 24 Mar 2021 12:23:41 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP6IE-0006XN-Mp; Wed, 24 Mar 2021 12:23:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id e14so15666786ejz.11;
 Wed, 24 Mar 2021 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=08QknEMVbFPKdWe+/ybwNg+01FPmaos85tyxPEgGMAc=;
 b=ZsJkh16ohJ6z6gPzLusBx49oGAVOW0XGU73KOlDrQHuv3IjCL7Ce9JMQp7ZQt0Lkhq
 vVruCnvNBjSu4Owdlcx6JB0GNtwOsVFqy+Cqw+JbF/YefFmY2IOuK9kVn3h6m6ntrKV1
 sSNuE+r6CpS9pwlsQtKcP7qO3mqoLJp7jQ3MOYIg/JZLBeOa0uk5/vLDED1Kr5ZPoCRg
 tiVsg6TmQhaZcTqJE+DA851eDlwSdkZCVAK3eepk6S36YIhhsQpeSuiJj1Lm2ttZO4WC
 AhhpJ4ehgug4Kz/V4+bCr6wQgYeLhz9IZjpaLEDaxmxTtpLJfBaYgzWhyGYcbXa0buHM
 le1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=08QknEMVbFPKdWe+/ybwNg+01FPmaos85tyxPEgGMAc=;
 b=ASAZTqm6EnuIvHGAp42MZluilR1fT75A0lO04lRYyU0FzM/RRK6Vwe8p+ShOdDIpGT
 Dnl4I073YV7qLOQK537u2vXQiJF36SBA+IDM1TjfzfmJFDhJPyO2yczT7tNK9UQ7KYBu
 H1kgPHxlc3UM5ppvzQvN9b22T++xpFtFnNFodQEtkxvb3BbTciYohiMou+3jF/Q8EQi4
 IKxBtjdGZk6olqC9TmER5tPpLfrFuVqvXVSgRgRek8ftkq39N0xv08wSzXkmICbU2YQU
 S5/iunQZI5TTpxTgaVTA3zXoAPcF+TihA7Uf1h/3qm+tNuBLk0JnRiMewTX02r6NmY00
 86Ew==
X-Gm-Message-State: AOAM531O5tVLwyvLB3H4vBz7yeKNwzSTzAabx9x86mwsf+BA7kDHosGS
 U9JvJUNF4QiiYlnmNIVF16g=
X-Google-Smtp-Source: ABdhPJwq/TMylGnIyxY6Q792yFfOhQwZmWdRm/ErhV/h2qakBk9S8ekNYuWVAQiQ98fVl+Lxw2VAyA==
X-Received: by 2002:a17:906:4dce:: with SMTP id
 f14mr4503343ejw.349.1616603016302; 
 Wed, 24 Mar 2021 09:23:36 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id bm10sm1388596edb.2.2021.03.24.09.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:23:35 -0700 (PDT)
Date: Wed, 24 Mar 2021 16:23:34 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 0/6] coroutine rwlock downgrade fix, minor VDI changes
Message-ID: <YFtnhusysS2c8f6D@stefanha-x1.localdomain>
References: <20210317180013.235231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+NLek3ZWZlLEcYJM"
Content-Disposition: inline
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+NLek3ZWZlLEcYJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 07:00:07PM +0100, Paolo Bonzini wrote:
> This is a resubmit of David Edmondson's series at
> https://patchew.org/QEMU/20210309144015.557477-1-david.edmondson@oracle.c=
om/.
> After closer analysis on IRC, the CoRwlock's attempt to ensure
> fairness turned out to be flawed.  Therefore, this series
> reimplements CoRwlock without using a CoQueue.  Tracking whether
> each queued coroutine is a reader/writer makes it possible to
> never wake a writer when only readers should be allowed and
> vice versa.
>=20
> v2->v3: new CoRwlock implementation
>=20
> v3->v4: fix upgrade and add a test for that, too
>=20
> v4->v5: typo
>=20
> David Edmondson (4):
>   block/vdi: When writing new bmap entry fails, don't leak the buffer
>   block/vdi: Don't assume that blocks are larger than VdiHeader
>   coroutine/mutex: Store the coroutine in the CoWaitRecord only once
>   test-coroutine: Add rwlock downgrade test
>=20
> Paolo Bonzini (2):
>   coroutine-lock: reimplement CoRwlock to fix downgrade bug
>   test-coroutine: add rwlock upgrade test
>=20
>  block/vdi.c                 |  11 ++-
>  include/qemu/coroutine.h    |  17 ++--
>  tests/unit/test-coroutine.c | 161 ++++++++++++++++++++++++++++++++++++
>  util/qemu-coroutine-lock.c  | 149 +++++++++++++++++++++------------
>  4 files changed, 274 insertions(+), 64 deletions(-)

I had questions about the rwlock implementation. The other patches look
ready to go.

Stefan

--+NLek3ZWZlLEcYJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbZ4YACgkQnKSrs4Gr
c8hTFggAtLWv3SuPyFOj/SjCMQd6UhwWVot7oilb9k2TgqEHj/4GI2dFU/i/MHSb
DlLYdflztMm394EEYOoVSVbEvlhne5+IYV3t6ZEe0mfxhdfHxvi1R0iFWx2U4zOB
Wngp3uisnvAOtAROw+69JgD4lqtdsRQCRj0Gldoa1QlnrJTQKaUO618LNqEdYAP+
Lg/tA84uiMKNyLMKEb4Ly3JE9wmI8/NCJ4H8Q/enYGQFxra0GSbH3d6hucbk9W1i
feC8d3E4VBOfm7FlvQjvVvZMDRH8oxB+yYg59chi/9V0zjViEH4flZ6Tzx43qrmf
HkH6ufOidfqEp3emQ99PCBR0C5LeGA==
=YCtt
-----END PGP SIGNATURE-----

--+NLek3ZWZlLEcYJM--

