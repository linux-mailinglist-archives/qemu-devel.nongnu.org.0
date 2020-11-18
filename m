Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0532B7F6F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:31:57 +0100 (CET)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOV2-000746-3g
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfOTi-0006WC-Pw
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:30:34 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfOTh-0002X8-6p
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:30:34 -0500
Received: by mail-ed1-x542.google.com with SMTP id cq7so2215533edb.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nTSCAXsgi8sjD4Uf6C1b/knxApnbtd+dTJ9rc0xw4ew=;
 b=KbuKr/uoous6QIOUo/gjJEpQDsOZ8tgwrNaSBDiuxdPbsMCmZzi6opEFHFXI0t1NAx
 c+/usYer8/oXIJ64qZjiUlzNagfVdYzlzVH0S1BtqPo+98ltPv0DkR/7JG5gWvgvmY8/
 g2yHMJR6mG2J+nibYOMcL8m5BKkSLKG9neNz4RbFiB3HTBPjxpi34D3ySdmn6MP5xrOq
 1oVOSv1HpPNH3VV2JkCJVmsUROcEvokBq92AmAGoXnrTNMMm6x8cNquiS+CUSU7EWsa6
 v1Dll9cvDNP59Bpp6ywWYi4n9jSib7QkODLMZfMWQapsrBnnpAulMw621rTYRE+pMaij
 +hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nTSCAXsgi8sjD4Uf6C1b/knxApnbtd+dTJ9rc0xw4ew=;
 b=XXPyBfM5fn41uFFrUOi9/tUNOaFnpAo+DgfsOmOsF914NAiFa3CIyaI7blIPh1M4Lc
 plVHQ8Zn9fs/B/kkJrT+KyMZNXsIqCfibG0iVUinGWk8uITvZPQXKIUM5EB/Et2k/Ufu
 UGPPubxTIrtSlDPyrDcl17iENLTGqs0yChtOiTMQx1l2FeGNLZ7Kcfvo6ewkGOnzY9CQ
 EH4OGGKxt/KF0Bygup9TKmy8hpTQ78uDeRCc0GZOJIdQjb15J+iaXdGJKW85CH/VeywL
 /dLqte/T+t84DRnfoBfAaRmOo/Vd0HHTKXzswTOW5se/Yt3opPqupUdSOxF27OFGBz18
 jSHA==
X-Gm-Message-State: AOAM531CPKe4QONAVhGRkgxApHMpfG5rEljHMgrbkdgXsFj6WaPPkwme
 lP55TV28Ozqu3AOMhOX7vtd3EcH2PPE0u9ueJG1k0Q==
X-Google-Smtp-Source: ABdhPJzmG3FltcFE8hpv4YyaEDkEELK5ULg8B1XR7qy0JO1MXfrgGypW09kEsYVDeJ3o22n9ueoyXWDvQyhpse8PSFI=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr25020743edy.251.1605709828347; 
 Wed, 18 Nov 2020 06:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20201118090344.243117-1-thuth@redhat.com>
 <800135fc-4552-b872-0117-4d9194393094@redhat.com>
 <873616kan8.fsf@dusky.pond.sub.org>
In-Reply-To: <873616kan8.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2020 14:30:16 +0000
Message-ID: <CAFEAcA9gg_cxcG59BHKosJmTeyyJ_7_Uofcyb9kMXSRAFnYebg@mail.gmail.com>
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 at 14:24, Markus Armbruster <armbru@redhat.com> wrote:
>
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
> > On 11/18/20 10:03 AM, Thomas Huth wrote:
> >> Both headers, sysbus.h and module.h, are not required to compile this =
file.
>
> module.h is: it defines type_init().

> >>  #include "qemu/timer.h"
> >>  #include "hw/watchdog/wdt_diag288.h"
> >>  #include "migration/vmstate.h"
> >>  #include "qemu/log.h"
> >> -#include "qemu/module.h"
> >
> > Cc'ing Markus because of:

> >     Include qemu/module.h where needed, drop it from qemu-common.h
>
> If it still compiles and links, it must get it via some other header.

Yes: wdt_diag288.c -> include/hw/watchdog/wdt_diag288.h ->
 include/qom/object.h -> include/qemu/module.h

thanks
-- PMM

