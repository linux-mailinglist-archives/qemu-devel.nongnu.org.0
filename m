Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7C6487934
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:47:46 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qWv-0005o2-7a
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.ramage@infinite-omicron.com>)
 id 1n5qFa-0001OE-LF
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:29:51 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158]:54236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.ramage@infinite-omicron.com>)
 id 1n5qFY-0006PP-9M
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:29:50 -0500
Date: Fri, 07 Jan 2022 14:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=infinite-omicron.com; s=protonmail2; t=1641565782;
 bh=1xeQQRqFrSTkWfGPP2AV12frDziV7P6Lj+2lqlCHcKE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=UE7zwIEvZGQa0wd+D9NUI0mnQvYjxBD09szt2FkEM14BKLSZ15TEmhm46lR6A9mny
 gq4oqBMFZxGnf8SevJfriaDLHih8x7peXlia9DO4amlJvuUI6ddpxxNSfWJhAM1J+p
 4XCxnLFA2p++jVbTnN9EbCmykCwjdFe0OvJxEIo1foulAkmvv63XM4bs2HyMAogKmv
 vLuyZ5sREJjGC053KFNkq1h8bJ7E7VALld0Sb3Znnn7nKuvBjlM7iHYDq/tzj/hFb4
 X8KkFtQKqNxIVAGqZGpw4zyFWQMPzUK1KdG1bYQgBKuHmbwEkN0lQD4t73xE3GF9H/
 OQx5aPqlrKtGQ==
To: Thomas Huth <thuth@redhat.com>
From: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Subject: Re: [PATCH] docs/can: convert to restructuredText
Message-ID: <GeiU77Lzyu0epg3Ib0hR1Aeny41CUSuPAPAzXOK1Lg5t3_t4b019ATAwEdOriMtWdKR6VEFZLZIfA84_yALJlOis6BUb0o-etqtlLJnIREQ=@infinite-omicron.com>
In-Reply-To: <f46243a7-dca7-00d5-9cd6-991dca3b1522@redhat.com>
References: <20211217212146.2573-1-oxr463@gmx.us>
 <9311d288-22bc-fb94-ad64-ddbd1c5e32f8@redhat.com>
 <UzkASXLpdM1kPkwP0fy-YM9n_cqQD5FJcSpZLwil4YCIZNm8XXWF8D18XU4cxjiOwfDf4oDILe-HmF3WcLKaifLTuT4Lq9V5cF-8LBQJ5MM=@infinite-omicron.com>
 <f46243a7-dca7-00d5-9cd6-991dca3b1522@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=51.77.79.158;
 envelope-from=lucas.ramage@infinite-omicron.com;
 helo=mail-0201.mail-europe.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Jan 2022 09:41:34 -0500
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
Reply-To: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Cc: oxr463@gmx.us, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

Not sure if you saw my latest patch, but I fixed all of the warnings alread=
y.

I also updated the references at the bottom to use inline web links.

Regards,

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Friday, January 7th, 2022 at 2:19 AM, Thomas Huth <thuth@redhat.com> wro=
te:

> On 05/01/2022 20.52, Lucas Ramage wrote:
>
> > Hi Thomas,
> >
> > I intentionally sent the email via my gmx address. But I want my commit=
 under the infinite-omicron email address.
> >
> > I had a few warnings on my end, but it builds fine with Sphinx v3.4.3 o=
n Debian Bullseye. I can clean up the warnings in the new patch.
>
> Yes, please do so. If you add "--enable-werror" to your "configure" optio=
ns,
>
> the warnings should be turned into errors as well - and that's what we do=
 in
>
> our CI, so the warnings have to be fixed first before this patch can be
>
> included.
>
> Thanks,
>
> Thomas

