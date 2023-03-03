Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705F6A9F9D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAXQ-0005LF-Tc; Fri, 03 Mar 2023 13:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pYAXM-0005Kv-Sv
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:53:48 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pYAXK-0003GU-US
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:53:48 -0500
Received: by mail-pf1-x434.google.com with SMTP id cp12so2193320pfb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677869625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydKW5SQF9yq6HXmYqUxneLdg/4czG9TexjKa7Y+O6WY=;
 b=aZoE7qDMeY+/VT6M/9Q7K7Upyk0cwZBSvhq9Ub9qqUSnvnROG8tpY8iqs/yhXbeWKX
 3Px2mA+z95yfV8ZA3/ZcwWoyHedtM8WrRqy1AoJBtDpJzyQDjeibbKfvBbfkyxKRTMsO
 2PAKjm3XUBTgY+ZknanElwBB7a/NOmzXF2YVMwxPd6lFFP/1ar/eZKWNN+GFLp+qNfkB
 uh53VyNR20un4kR7Vtc2qfSJD28Uln/TjfEwu+vYMMafHIhc1SGWcLOj4ALffSu3Ocy4
 Thl5IhIHl1+JpGX4ETtSAaJyNHiPSGfBOzvhnV08gMLuoEar0c1EotXAIxJWdnSmHIKc
 hsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydKW5SQF9yq6HXmYqUxneLdg/4czG9TexjKa7Y+O6WY=;
 b=wZQ7/QnE6fvu1kslENmYPbBGgd66BE+aPnvD/q0/0q2eYlDyAyVGFGzCy0eI+oGA4H
 bc/nQGwdhBg+ZX0VwU/huGI+l3JBrl12Tc4tt6+b6mVIXe9tSRbsdyWXLfjJfxJLvXIK
 8PYAposp1LoJwGWWwyVMu+PU7KTVTot1uUP7KS17C5VnnhqO6Po/LxJQndvPza/RAVPI
 xjbJiFU7WngbkFXbIMDTd7kKDxZv2uMn57Oy//vvai5UnqHQjR+eUDTxAWNs53/xX/2s
 HERHbvgVmSEwhp9qD3jGXgU5GtYMqN3JDHMFdYqWujiH0i9zy/RPWKux9LQWT6sPtuoe
 Ii7Q==
X-Gm-Message-State: AO0yUKWzvRAnxS6j9rvYEugzTiHsMJCrFaXN+OutxMS9KZLR6LWygGem
 BhDRGWQLRyFjWNqunW+ryRqHRWmFbCYQZviEy081Cw==
X-Google-Smtp-Source: AK7set/0S3CRdlhxIpvzKoe1gaqnovFbiUXvMw9QhslgHtLwZtdTEvzYw+vmsN7tZI6KMv9/Hmf6eX5KlzM8Uuf5VcU=
X-Received: by 2002:a63:2948:0:b0:503:7bcd:9806 with SMTP id
 bu8-20020a632948000000b005037bcd9806mr848235pgb.4.1677869625173; Fri, 03 Mar
 2023 10:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-6-hshan@google.com>
 <dfb74ad1-a228-4a63-a01b-70e935de57d0@linaro.org>
In-Reply-To: <dfb74ad1-a228-4a63-a01b-70e935de57d0@linaro.org>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 10:53:34 -0800
Message-ID: <CAGD3tSxRstXkb5JscJnvvKZjG_LGLJUZx1tSieSw-OGDo4ddJw@mail.gmail.com>
Subject: Re: [PATCH 6/6] Add the AEHD implementation.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Haitao Shan <haitao.shan@google.com>, 
 "open list:Android Emulator..." <emu-dev@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=hshan@google.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 3, 2023 at 2:15=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 3/3/23 03:26, Haitao Shan wrote:
> > Implement the AEHD accelerator including the AEHD AccelClass,
> > AccelCPUClass, AccelOpsClass.
> >
> > Signed-off-by: Haitao Shan <hshan@google.com>
> > ---
> >   hw/i386/x86.c                     |    2 +-
> >   include/exec/ram_addr.h           |    2 -
> >   include/sysemu/aehd.h             |   87 ++
> >   include/sysemu/hw_accel.h         |    1 +
> >   target/i386/aehd/aehd-accel-ops.c |  119 ++
> >   target/i386/aehd/aehd-accel-ops.h |   22 +
> >   target/i386/aehd/aehd-all.c       | 1020 +++++++++++++++
> >   target/i386/aehd/aehd-cpu.c       |  150 +++
> >   target/i386/aehd/aehd-cpu.h       |   41 +
> >   target/i386/aehd/aehd-stub.c      |   22 +
> >   target/i386/aehd/aehd.c           | 1915 ++++++++++++++++++++++++++++=
+
> >   target/i386/aehd/aehd_i386.h      |   26 +
> >   target/i386/aehd/aehd_int.h       |    2 +-
> >   target/i386/aehd/meson.build      |    4 +
> >   target/i386/cpu.c                 |   12 +-
> >   target/i386/cpu.h                 |    5 +-
> >   target/i386/helper.c              |    3 +
> >   target/i386/meson.build           |    1 +
> >   18 files changed, 3428 insertions(+), 6 deletions(-)
>
> I'm not going to review a 3000+ LoC patch, sorry.
>
> 1/ it is too big for my brain and I'm going to miss things
I fully understand. I also struggled quite a bit when preparing
the patch set. I know it is good to keep patches as small
as possible. At the same time, each patch is required to
compile and function independently. As the user space
codes for AEHD are kind of a whole, I don't know how
to split them.

While I will continue finding a good strategy to split the
big patch, do you happen to have some suggestions?

> 2/ it is likely duplicating KVM identical code; if so we
>     should refactor to use common code. In particular because
>     we can fix bugs once.
I agree. Hope the KVM maintainer can give me some
guide or he might disagree completely.

>
> >   create mode 100644 target/i386/aehd/aehd-accel-ops.c
> >   create mode 100644 target/i386/aehd/aehd-accel-ops.h
> >   create mode 100644 target/i386/aehd/aehd-cpu.c
> >   create mode 100644 target/i386/aehd/aehd-cpu.h
> >   create mode 100644 target/i386/aehd/aehd-stub.c
> >   create mode 100644 target/i386/aehd/aehd_i386.h
>
>
> > --- /dev/null
> > +++ b/target/i386/aehd/aehd-accel-ops.c
> > @@ -0,0 +1,119 @@
> > +/*
> > + * QEMU AEHD support
> > + *
> > + * Copyright IBM, Corp. 2008
> > + *           Red Hat, Inc. 2008
> > + *
> > + * Authors:
> > + *  Anthony Liguori   <aliguori@us.ibm.com>
> > + *  Glauber Costa     <gcosta@redhat.com>
>
> In various files you add in this series you use incorrect
> author / (c). While you copy/paste their implementation,
> they didn't authored this AEHD implementation (which is based
> on their work).
This is a surprise to me. I thought the practice was to
copy and keep the original license header. I should be
able to add but probably not to delete.

So just let me confirm, it is OK to remove them while
keeping the license text. Or I can change something
like:
Originally Authored by:
  Original Authors list
Modified by:
  Me

--=20
Haitao @Google

