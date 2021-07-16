Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AED3CBA01
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:39:21 +0200 (CEST)
Received: from localhost ([::1]:53654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pvs-0001l5-Kk
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Puq-00014K-4l
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:38:16 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4Puo-0002aP-Dy
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:38:15 -0400
Received: by mail-ed1-x529.google.com with SMTP id ee25so13491966edb.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GiXkqX0jmvUO1/hfoNhakgQoffzQqE1qH79jibPqL6I=;
 b=o7VmNlAQT4C6sc+2ZemiSJ5XhbBoTdI79bs/qZKuxuW5rAHlJlZhggNTNZEtfIzYvz
 octQrHTD6uzFMOXWMmZbDLn7Akox3pPVvTE6Y0B9ij71lwbglJY6zwndvtP/tc3QHBa0
 Mx1Ex1GN8DeiALKIDQPsamyWfZvTQfTsA4h3AjE5u8G7gRagtRLgL9quQ+HEqPEyme7a
 6TLsKA0GfsoKgD+5xp4qOL35yVizYyfGR/63iTK2ZnRiqVS+HEhDrup6qD8YGPi35NIn
 eUGUxHgzBfZ4DZqtSdjnFqiX8w//TCoXu96xV1VqpOvwT3FrGUWkTW5+0Jbckg57xEPv
 qoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GiXkqX0jmvUO1/hfoNhakgQoffzQqE1qH79jibPqL6I=;
 b=mdGAlFsXg+qv7v+EpProCixl7UrC4xh82miqqUwf+7CVsZVcMj7y5KrObb3t9VDZes
 ZihsRBZnIJnpbFeFpOZ/ukimj1UZBCdFamoSl4VpHN5t5YnAPMjD7dQPtdNr3w7761Dv
 0iKwSko4ETsFqhC1n0uoe4R3UdiTU0WH211TnfaEC16lmhc9GcO6Hhv7tXWsgIIjiwAR
 xUwc/29M8ZNYt/GAzgH3iBcnDIER2pTjszZ8Ua4L/LDiE7op2ZG+Y3KfQC1K69RKwuZQ
 YfV94QWVHcANBXpteGAb7bLIK911p+5eW6XWCHAtDjJrFNUHMhKRbuIyrurDh/sU6kDL
 MU/w==
X-Gm-Message-State: AOAM533WNt4GLdDv/+BoRlPh03CxCAUyPZpsOCJQt6LLBnllJ9izE9XY
 A0i2ySjkjCUq8KXACUDP2sx33Ic9KgaqirX8LhbV2A==
X-Google-Smtp-Source: ABdhPJx2zEZa8rGG8naGewDfQBSP8JQqlcnhJO0SHkfes8iikaD6LDN574Odo8tHKPJ+Oen4536sg9G+7QrYboEqPz4=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr15717703edq.146.1626449892635; 
 Fri, 16 Jul 2021 08:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
 <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
 <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
In-Reply-To: <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 16:37:32 +0100
Message-ID: <CAFEAcA8rGR9=f9Nt+Z0FeFR_m77OvC4SrmJ91+fU5NjR4ATcKg@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Jul 2021 at 16:16, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> When I go to build the qemu softmmu target the shared files - the i386_ss=
 of my arch - gives problems where the build system isn't specifying the in=
clude headers for the compiler to find the surrounding headers that belong =
to different parts of the qemu library. I was able to edit my own source on=
ly so much before recursive header dependencies had included their own resp=
ective qemu library components subdirectories, at which point the build fai=
ls with cannot find header. I want to know, are these shared source set fil=
es not supposed to include those qemu subcomponents? Or resolve a different=
 way for each target using #ifdef guards? I would think that this would be =
modularized from within the qemu subcomponent library. And I think that con=
figure and meson are working together to generate the correct build command=
s to these shared components. So I'm unsure what to do.

Upstream QEMU builds fine for me, so you'll need to be more
specific about what you're trying to do and how it fails.
The top level meson.build always includes the current source
directory and the top level include/ directory on the compiler
include path, which should be all you need.

thanks
-- PMM

