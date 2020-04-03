Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E495A19D9BF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 17:07:17 +0200 (CEST)
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKNuf-0002j6-0A
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 11:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arilou@gmail.com>) id 1jKNth-0001ny-WD
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 11:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arilou@gmail.com>) id 1jKNtg-00043u-Mz
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 11:06:17 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <arilou@gmail.com>) id 1jKNtg-00043Q-Gy
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 11:06:16 -0400
Received: by mail-ed1-x542.google.com with SMTP id o1so9667441edv.1
 for <qemu-devel@nongnu.org>; Fri, 03 Apr 2020 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BkST96XtZTTQC/2lA5f1DYJuPhhEIbPyH1zpEms64XQ=;
 b=b2K5Y+mHauhdowJ7abUHjmiQXILGiVZoyczCrm5pGL+Thh01LDuvP1cZchiWebByWw
 IjXCc2w2XAsOnW5QajPiDyr2pF6w4lYuoPjhZ+/JpuuHo7a7pOV8nP9KGAapLpDJROv/
 wjiYggAtcmIPuQlSrXwFl1LxYUmJMs/XM5aiui1Fgs5fPACriri/rdz8ZdH+uJL4zChW
 XaHA3RBv+7WdrD25fZqZsZCn+qiovhidVYDPdAWzp2sOqOYcwNoA9olT/4k24ZfysRDQ
 aT6W6R8hcaHlY2JKRAw3XYI9ugDD05jiMoShbpSbxO1SVA/7c6K0Y12tyzu+HSzyya6K
 tQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BkST96XtZTTQC/2lA5f1DYJuPhhEIbPyH1zpEms64XQ=;
 b=ofKTclhKMdqzxny+wIX/i+NoBRUQ5y+oJbPs9ieFKWzNL7QpqJjKLbQT8iGXl+DV5C
 i2PaTBgt03uSemnu95CM6E57R+bO1fNfKuffLD/+CygyiqsYeIrW3gUCT+M/Rvrm2lQm
 BOOV0od3WQSZMsQ6noprH/eXVAcAt9lbfl4NvdnE5execfl0k7tYoqxWBmTqs4N7x9Ww
 30/mox8AQzxZBY9rvgoojvMzlVqc7KKI0Xz9NB4mfMKfe649Srs9KSNdXGu15wU+CoGZ
 MyoNMKeKcwum1WYh5ge9kJKjz5pUDyxuVq0qywCSAY5LCW7q1ngpZBW+M1aWvNRwSlub
 e+JA==
X-Gm-Message-State: AGi0PuZCHcQc3n0FJzVEYDgenFZA/b34+gl84HvjXD/wLHXrVHTW0NU4
 7Wx7tKuBwZ9y5o7IcaQtSV7VhIpN9pdqa0hEeOEfMw2gBnXREQ==
X-Google-Smtp-Source: APiQypJRRjCoa7a7Ae1OINx1tuPz9WoIBQSkzpbfll+pcnUt93dw5YtrObexoIleJul1YpzV/ZtVQZG5s+WI71LJvdo=
X-Received: by 2002:a17:906:f249:: with SMTP id
 gy9mr9196859ejb.24.1585926375352; 
 Fri, 03 Apr 2020 08:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200403142308.82990-1-arilou@gmail.com>
 <20200403142308.82990-6-arilou@gmail.com>
 <76017793-735b-4bb5-0e69-ecded78af54d@maciej.szmigiero.name>
In-Reply-To: <76017793-735b-4bb5-0e69-ecded78af54d@maciej.szmigiero.name>
From: Jon Doron <arilou@gmail.com>
Date: Fri, 3 Apr 2020 18:06:04 +0300
Message-ID: <CAP7QCog_EmLJ=O8Xi9Tc4Jst1=z62DXim9ScCyoPv7WugrSyOw@mail.gmail.com>
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

Thank you Maciej, I based it on top of what Denis (den@openvz.org) gave me
which was this:
https://ftp.openvz.org/virtuozzo/releases/openvz-7.0.12-288/source/SRPMS/q/qemu-kvm-vz-2.12.0-33.vz7.14.4.src.rpm

Do you think you have a more recent version I dont mind diffing and
resubmitting a new version of the patchset?

Thanks,
-- Jon.

On Fri, Apr 3, 2020 at 5:56 PM Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:
>
> Hi Jon,
>
> On 03.04.2020 16:23, Jon Doron wrote:
> > Guest OS uses ACPI to discover vmbus presence.  Add a corresponding
> > entry to DSDT in case vmbus has been enabled.
> >
> > Experimentally Windows guests were found to require this entry to
> > include two IRQ resources, so this patch adds two semi-arbitrarily
> > chosen ones (7 and 13).  This results, in particular, in parallel port
> > conflicting with vmbus.
> >
> > TODO: discover and use spare IRQs to avoid conflicts.
> >
> > Signed-off-by: Evgeny Yakovlev <eyakovlev@virtuozzo.com>
> > Signed-off-by: Roman Kagan <rkagan@virtuozzo.com>
> > Signed-off-by: Jon Doron <arilou@gmail.com>
>
> Nice work, thanks!
>
> However, it seems to be based on the code version that was posted in
> February 2018, and not the latest version in OpenVZ qemu repository
> dated October 2019:
> https://src.openvz.org/projects/UP/repos/qemu/commits?until=refs%2Fheads%2Fvmbus
>
> This newer version has slightly different API here and there.
> Any particular reason for selecting that older version for porting?
>
> I have actually rebased this latest version on the top of the current
> QEMU master, and it basically seems to work fine.
> However, I haven't done extensive tests whether there isn't a memory leak
> somewhere or so on.
>
> Maciej

