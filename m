Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F533B1689
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:13:02 +0200 (CEST)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvywO-0005Ud-Tb
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvyvB-0003xP-SO; Wed, 23 Jun 2021 05:11:45 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvyvA-0007pU-7w; Wed, 23 Jun 2021 05:11:45 -0400
Received: by mail-qk1-x72e.google.com with SMTP id f70so3281411qke.13;
 Wed, 23 Jun 2021 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sbgQ+dgX/YFNp+VZi3Sm4aaO3zO7UObFSJWwrHYj2aY=;
 b=JJ+jD1csEGeqR2+lukqdJ9wBk2QJbfTSaFpQycHfOH8H+po28w+M5Ieg7u8mTfAegw
 H0iKuuCoQZR8EAjJsFb6iyuXeYU7wgg5W7l2LrYnpmbVOEbn/xs+UvsfcExiRpa9Td6X
 l+iNW7axbrobOPGx+sMHbbGooLqTzA+KGWlCGMJwH7a7jkQnWngCe/4a36wbpX20wIny
 EkJihftRHCKsHjHea78IsGqU9eH9T2Zf08i7S8VrlDJTjodo9F9Xjae8wkCYDatYrsTX
 JbmfGPCT0LiAuju+F7fH516YoBpNtuA8uNhjewHiXqHuil/20sCEOe/4U1yRRY733NU9
 ktIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sbgQ+dgX/YFNp+VZi3Sm4aaO3zO7UObFSJWwrHYj2aY=;
 b=i7nRceXgxZqNg3GGcwQIDtioG/2f6E7l4r5521YRQ/ERK6vi4Dc8IcxIhfhJsaCyo1
 X29ZnRBAkGyWem1S/ZUQlGcaVeELxLHKUFh6c2IENXBOIdhXiDwefu2zWBAuop3B6vZ1
 0hMl5+YjAtoY1ZphMqyJrzBlq584y8GYOEwsu6iTKoF9ll4yYsAyRkzjybpGZaFAu1Ad
 QZCixUkMwXNk0aFcizPHl/c8B8pA/QUIkux0oVm1VsTztuBEgvBJIaNhRB2ELnYWF6v7
 2XjZJpaVc6c5XnLzH9OflcPDAuSz7SLZBVHU0uVqtjY1zbFNFzHB5+wWLpguG6+iU5Sm
 vDag==
X-Gm-Message-State: AOAM531odq7WLYUA5pzuXzWLJFpEhbhXL4MZFwVSoCKwEfzEm5j0E04B
 3beIY7F0jpyKAiP5gcZtF3QWNb28afiKAkukLvM=
X-Google-Smtp-Source: ABdhPJzpDbTW+Xor3bXpOUYezUhCAGl+eO3aYHm3h85ixeL4C0Qwl8mqbfT1OaVGyoMquNXFd969LB6TZcWVLnWPkbc=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr10654827ybc.122.1624439502968; 
 Wed, 23 Jun 2021 02:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
 <efa3958c-8a08-76f3-a963-8424c660e4e5@amsat.org>
In-Reply-To: <efa3958c-8a08-76f3-a963-8424c660e4e5@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 23 Jun 2021 17:11:31 +0800
Message-ID: <CAEUhbmVO6Wo=JNDbqL0CqoP7kzZC1xmDsbHHTVywCmAMJ8ucjA@mail.gmail.com>
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 4:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 6/23/21 10:39 AM, Bin Meng wrote:
> > On Wed, Jun 23, 2021 at 4:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
> >>
> >> The number of blocks is defined in the lower bits [15:0]
> >
> > I checked the physical spec v8.00 and it says bits [31:0] for CMD23 arg=
ument.
>
> Watch out, we only support 1-3:
>

Yes

> enum SDPhySpecificationVersion {
>     SD_PHY_SPECv1_10_VERS     =3D 1,
>     SD_PHY_SPECv2_00_VERS     =3D 2,
>     SD_PHY_SPECv3_01_VERS     =3D 3,
> };
>

However the physical sepc v8.00 should document any difference between
ver 3.0 and ver 8.0 if there are indeed any, but for CMD23 it does
not. So it means it's 32-bit since day 1.

To double check, I just downloaded the spec 3.01 and confirmed it's
still 32-bit.

Regards,
Bin

