Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1D19DA33
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 17:31:52 +0200 (CEST)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKOIQ-0002b8-6U
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 11:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arilou@gmail.com>) id 1jKOH5-00025D-Th
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 11:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arilou@gmail.com>) id 1jKOH4-0007i1-LX
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 11:30:27 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <arilou@gmail.com>) id 1jKOH4-0007gc-F6
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 11:30:26 -0400
Received: by mail-ed1-x542.google.com with SMTP id cf14so9668628edb.13
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=97xWYNAzVV5k15uDzWP+QgC30Q1BfCbuzMmp9qsUuzg=;
 b=bq1km/rdQVlPG6ybUGiIzKdSwVKNj22qqNwUhjC0l84+ARhv+64eZDPVskaMBuHNtS
 TbK3S34AWNyV6ob8ygHLVTk8+nIxxKGQIW2T19YvnpunS/9CU+gOyMNN5GFU6DGhFIfs
 NAqmzBxPmUVyrWKMPkkcY48FhT0E4Pvbch339Fixs9D9f/Do5+BVHWYpqhKyu5xNO92g
 TQVG3/xLToB0vBzHp3JfPpW1LnBronj3SJYS94/EeL71J9i2eIqvbUlglQ18ThJVs1Sx
 yZBYs811edODI3veYSu0PrBRN8CHvu6Oq+ymUBJhPaWjai+zP0OGfomI875Ed7ClyTOQ
 1Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=97xWYNAzVV5k15uDzWP+QgC30Q1BfCbuzMmp9qsUuzg=;
 b=SPtL9lNOduBZaVyAXZV7iVA1Zt2eFV5Mi/UGQUl2ubwAomgLy4N/78goc2rOvbQWoX
 P7p/e2ad0rgFA+R685HzVXMJ9qjV3ZRv3hRWp5XTfUvihFEN0ilTHJPILwHVSOWjqVcD
 m9x87wGfGmGF8k3qML8VFXqOwsxGeYhuMQTF0tBrUwFWWZRpjXCUuiWnPgVk0TvNswqE
 zsyjgyOaOGK5qkW4hDgQvZ9NqHmxkyysWhAxGNaP9Rliki/ZPHYICXBmwIBnaTZxvFZA
 DYVH0I9bv/m9WKPBSOfzcQTxzc8UQX8xiS5C5o71ZKsX6TRO2FnqEK21jnIwigj2eUIx
 O62g==
X-Gm-Message-State: AGi0PuYmLApNrzrAKJET2mDYUb71IpXxsaiMXWL+Kci7yaS4TkjmTgif
 w+aNzntzZi8upzYZI4iMd29BN1L3aujkZDawR/g=
X-Google-Smtp-Source: APiQypICXozj9/oSzpm0JDxoPP9vpsGKuiqxX6s05IskMtszq9gt1FjpA8hsc359+B6upSlqJU84XnSOa0zf4IvOnJ4=
X-Received: by 2002:a50:ec08:: with SMTP id g8mr8136781edr.321.1585927824934; 
 Fri, 03 Apr 2020 08:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200403142308.82990-1-arilou@gmail.com>
 <20200403142308.82990-6-arilou@gmail.com>
 <76017793-735b-4bb5-0e69-ecded78af54d@maciej.szmigiero.name>
 <CAP7QCog_EmLJ=O8Xi9Tc4Jst1=z62DXim9ScCyoPv7WugrSyOw@mail.gmail.com>
In-Reply-To: <CAP7QCog_EmLJ=O8Xi9Tc4Jst1=z62DXim9ScCyoPv7WugrSyOw@mail.gmail.com>
From: Jon Doron <arilou@gmail.com>
Date: Fri, 3 Apr 2020 18:30:13 +0300
Message-ID: <CAP7QCogMdUis-=KsC--0ar2Zt2Vwcpn4HS+qCxPn5khtDTu+mA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] i386: Hyper-V VMBus ACPI DSDT entry
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
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
Cc: Evgeny Yakovlev <eyakovlev@virtuozzo.com>, ehabkost@redhat.com,
 QEMU <qemu-devel@nongnu.org>, Roman Kagan <rkagan@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Thank you Maciej it seems like your version is really ahead I'll do
the required work and merge it so i can submit a v2 with the latest
patchset from Roman

On Fri, Apr 3, 2020 at 6:06 PM Jon Doron <arilou@gmail.com> wrote:
>
> Thank you Maciej, I based it on top of what Denis (den@openvz.org) gave me
> which was this:
> https://ftp.openvz.org/virtuozzo/releases/openvz-7.0.12-288/source/SRPMS/q/qemu-kvm-vz-2.12.0-33.vz7.14.4.src.rpm
>
> Do you think you have a more recent version I dont mind diffing and
> resubmitting a new version of the patchset?
>
> Thanks,
> -- Jon.
>
> On Fri, Apr 3, 2020 at 5:56 PM Maciej S. Szmigiero
> <mail@maciej.szmigiero.name> wrote:
> >
> > Hi Jon,
> >
> > On 03.04.2020 16:23, Jon Doron wrote:
> > > Guest OS uses ACPI to discover vmbus presence.  Add a corresponding
> > > entry to DSDT in case vmbus has been enabled.
> > >
> > > Experimentally Windows guests were found to require this entry to
> > > include two IRQ resources, so this patch adds two semi-arbitrarily
> > > chosen ones (7 and 13).  This results, in particular, in parallel port
> > > conflicting with vmbus.
> > >
> > > TODO: discover and use spare IRQs to avoid conflicts.
> > >
> > > Signed-off-by: Evgeny Yakovlev <eyakovlev@virtuozzo.com>
> > > Signed-off-by: Roman Kagan <rkagan@virtuozzo.com>
> > > Signed-off-by: Jon Doron <arilou@gmail.com>
> >
> > Nice work, thanks!
> >
> > However, it seems to be based on the code version that was posted in
> > February 2018, and not the latest version in OpenVZ qemu repository
> > dated October 2019:
> > https://src.openvz.org/projects/UP/repos/qemu/commits?until=refs%2Fheads%2Fvmbus
> >
> > This newer version has slightly different API here and there.
> > Any particular reason for selecting that older version for porting?
> >
> > I have actually rebased this latest version on the top of the current
> > QEMU master, and it basically seems to work fine.
> > However, I haven't done extensive tests whether there isn't a memory leak
> > somewhere or so on.
> >
> > Maciej

