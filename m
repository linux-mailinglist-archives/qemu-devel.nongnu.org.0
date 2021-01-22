Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80C30046E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:43:34 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wir-0003Tl-Et
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2whm-0002Vz-07
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:42:26 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:38096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2whk-000227-Gm
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:42:25 -0500
Received: by mail-yb1-xb31.google.com with SMTP id r32so5483002ybd.5
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qCY6elwRVLEVFJUF3rbsGusV0Zza7A5yGGve7SpZ6yg=;
 b=vYtP7YK3/fZmczlyGrt6Qe4JMjUsjB31lxm6966btqDBRChQuZ+pvwpczEZNqXhzhM
 83tTLT0QQKvKUARo+uLpuczq0/uCYU/PkISIK1eza6pyJZlw53xj8OBAwv0JVA/klc10
 9t2x6dmm2AMCUnaeDmm1682af7VhE1Jy4HIywQwr6c7Zp/UE/+vs+nmSeJHYzXgyHN72
 LmgRRj/IZrY1nKHqxgqSMuQEyu/ZyX76pwacpjPu3y/ilkO+HvfZkDwVkmSEk69jKbGf
 GIj7V+KIXLPs5fEznluCsFh7tDaxG76RzWW0Nuuy3vag1cH4Ue8dBWJN+BmOLh6B/1TC
 wcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qCY6elwRVLEVFJUF3rbsGusV0Zza7A5yGGve7SpZ6yg=;
 b=dyPSpm+0ZMl2vs2dnV0k2l6X0Rvcq0jWi+e9xLU029NFEHh9NGhisC8gDu3+tEMsCg
 +KhxhEjBhCpU0lBEQy/RPFhS309r6m6H8uaNsldhcWNkt6sf4Qj6na4cCCZ/jdaEh25K
 mE2HvabVa8Bba3f0BJiWtKcb+AVvgszvlUvuhrWi0LSowzxc25cA40fASNNCHfW/sWo0
 doYodfX2ymsb3YPKLwTiVjYKi4nAO2PdtXxKbFUU+e+ZlJrq/4BCOm55I/yYC3cbe4zW
 20lRvIwivh4UlWQfGSEdb1ilG6oof4qGXO6dy4Hi2PolRZ/hvoMZva0SNOB3zI3DShoe
 uCZw==
X-Gm-Message-State: AOAM530R70R198HwJs8+ZRr7B6pyPrGqwEmHhFuKWJvHOyfr/TAfOXFT
 TLN32Ef7Rc7sK38fUsNGhaAYEuqCI+6a4fHLI/U=
X-Google-Smtp-Source: ABdhPJwME44tgZ8PfhIRyAoLR3Vzkvzj0SdD/w7Yay+xxtAP08lc7xktEC5HKGZJGRRHswh+1cRvfVC4IWi01+kCY+o=
X-Received: by 2002:a25:3bc5:: with SMTP id i188mr6544791yba.332.1611322943513; 
 Fri, 22 Jan 2021 05:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20210122122404.11970-1-bmeng.cn@gmail.com>
 <3ebc284a-71d0-2a0a-84e2-462c4b7b9b7f@amsat.org>
In-Reply-To: <3ebc284a-71d0-2a0a-84e2-462c4b7b9b7f@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Jan 2021 21:42:12 +0800
Message-ID: <CAEUhbmUvu=zkvYNozgdyJuYAQoz9TwKb5i0iFVcd-7NROhobAg@mail.gmail.com>
Subject: Re: [PATCH] hw/mips: loongson3: Drop 'struct MemmapEntry'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 9:37 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/22/21 1:24 PM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > There is already a MemMapEntry type defined in hwaddr.h. Let's drop
> > the loongson3 defined `struct MemmapEntry` and use the existing one.
>
> Not really... based on 0e324626306:
>
> $ git grep MemmapEntry origin/master -- include
> $
>
> What tree are you using?

The latest origin/master

Use $ git grep MemmapEntry origin/master --

It's not defined in include.

Regards,
Bin

