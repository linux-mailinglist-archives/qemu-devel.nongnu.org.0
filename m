Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971A4B8BB3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:43:29 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLWh-0002Dl-MQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:43:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKLVX-0001Xg-QE
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:42:15 -0500
Received: from [2a00:1450:4864:20::429] (port=42525
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKLVL-0007Dq-8Z
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:42:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id h6so3834282wrb.9
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVSJlG0V7GxVPQrFiXXOo2cQwU1Np8Wo9oR6ovExMw8=;
 b=T+XCsstV5TT2oPJZdAJ+XiTnfPLMk57GIDQEgfyX3kKJozS4muPnbrE0r25E0uv7BU
 W0kQ76wCukTCRvmp3JDBvK7rzSuuLG9NCPcwyJQl7ioxfz63ll34pDPqbzg7AAF8fsH9
 Ku/dkx8z4Qm09yVOq950uUmYaQpPu2APQ6r3jMBVNh3AGjXROI7IsrbKlATjsm7De7yL
 W6B+hVNggeqKRdZlQwVh4RTj4+0TPk3XYuNRLaBwn+uBDwy3Yq551z5p4Hi3BIImxFcE
 fxEy1dZI5IyVX43WK/PMdTFbTGE5sKI612A6NO8gtx1i1RrAmi3aGBSlcIBn572nJghx
 izJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVSJlG0V7GxVPQrFiXXOo2cQwU1Np8Wo9oR6ovExMw8=;
 b=vGvr5VGKSlPNYIQw/C4aKILfY/T+GjJ7UZBlpkplSaktC3pxq6yOP1qFQAOjSdFB6W
 +Z1c2JWeaUjCFPduyjXPma/uc6A/KrOBGVzE5fQ9VGmBYv0B4pvmeuRm92ukT8z1CRaP
 am82N6SMRdNaloSLJ4+ObII4Douu9YEctR02RrYHY7bN1iCJEb+0lux9Z/SLerd1UBFg
 kjSO9V0VPm05lb1CvWeTvYSxYrJ2VZYlH2z0+AC4NtfM0uMKpgZx6eRC9igGdrJP6TKi
 qJwHyVNI75RlIqPFIL9/ICjfzWosOd/AbhTiI6cvykwU/6tCiRlDvq2rfq0kBjbtLzf9
 yHUQ==
X-Gm-Message-State: AOAM533mlCWrBTYwV6r5N8NvLKHP05Kik4IQ9B1ncEkNg14pYscf+Ut9
 ID2ZzrWJV/9u4Hq5C92n0c8DVSuuxzLgofRt3JbPtA==
X-Google-Smtp-Source: ABdhPJzWgxmULHSCl1luDh5VEp2VD1So9G5l6v9UPESyIf2G0yQW04Z21FMq46L65MLyxGNfx+oVvTs3d0WblCyIhxE=
X-Received: by 2002:adf:d20e:0:b0:1e4:a0a0:9da2 with SMTP id
 j14-20020adfd20e000000b001e4a0a09da2mr2560465wrh.319.1645022521071; Wed, 16
 Feb 2022 06:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20220215093223.110827-1-pbonzini@redhat.com>
 <CAFEAcA_xPeknSFpf0M9vETUXk8fW0gfiKg7eiJszJfagsJubqw@mail.gmail.com>
 <d4976978-b8bc-83ec-1a8a-9618d6ea6e98@redhat.com>
In-Reply-To: <d4976978-b8bc-83ec-1a8a-9618d6ea6e98@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 14:41:50 +0000
Message-ID: <CAFEAcA_DvHUN_TJ4-4oDsu9sDOAqde967YtcJhGCqvBC8u4zbg@mail.gmail.com>
Subject: Re: [PULL 00/30] Misc mostly build system patches for 2022-02-15
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Feb 2022 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/16/22 10:56, Peter Maydell wrote:
> > Hi; this fails to build on OpenBSD (on the tests/vm/ setup).
> >
> > Meson thinks it's found OpenGL:
> >      OpenGL support (epoxy)       : YES 1.5.4
> >
> > but either it's wrong or else it's not putting the right
> > include directory onto the path, because the compiler
> > fails to find the headers:
> >
> > In file included from ../src/hw/arm/virt.c:42:
> > In file included from
> > /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-calxeda-xgmac.h:17:
> > In file included from
> > /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-platform.h:20:
> > In file included from
> > /home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-common.h:27:
> > /home/qemu/qemu-test.sr5128/src/include/ui/console.h:11:11: fatal
> > error: 'epoxy/gl.h' file not found
> > # include <epoxy/gl.h>
> >            ^~~~~~~~~~~~
> > 1 error generated.
>
> Yeah, there's a lot of uses of ui/console.h and they all need
> epoxy/gl.h.  That's in need of some cleanup.

Why can't meson just do the same thing configure was doing,
ie add the include path to the cflags and the library path
to the linker flags?

thanks
-- PMM

