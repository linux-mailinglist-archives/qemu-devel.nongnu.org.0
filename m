Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129932E9C65
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:53:48 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwU39-0007Sq-4Q
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwU1X-0006nG-Vr
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:52:08 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwU1V-0000Sf-Ja
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:52:07 -0500
Received: by mail-ed1-x529.google.com with SMTP id j16so28244191edr.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AMEKfDg/8hrza04HDJjs0a6rM10/e87rHh2DyVNmbrk=;
 b=RUA0P+RaFUXol11Cios4VW4yRRyrdgvcRGjcX7oUuRIG0vO6fYG6uBElbDOu2Ybljv
 7nk7wN4l1peokZivMtEcWjL7sV70gP+nbBrCxvpXvGRGzaE3xFhTdJUwHO2IZJXUxVgb
 05W0De52UF+wZ1h6uU/ROy7lZzC2rmTTaJn2WDFyl7mD+WQhmIage8VC4k0SyE/hSASc
 hh2ZHEPsnMdcabVm0pkbBC7r0xjvXptJ7hkcSYz+STcNzsLcFpjSWUf9qsL6qf17mNPO
 MZo99vvsTwEPl+wcsoeLIiAZdq3f5MBGxnM3jhsMbHxtkyM9grYUOmY0CJqCGQbJYl/G
 fDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMEKfDg/8hrza04HDJjs0a6rM10/e87rHh2DyVNmbrk=;
 b=k8HsTn1HAaVyOdJ40wLhmEPblD/kHvwtmfIt+FQj4ZRk31F9DSL8Egfw7eRD3FhSGx
 9FGNmlyIg+NWMWkoRGnDweuy26Iib5e45A1gDAXqAjBbS3bPqOUH4ZHXypIJsM9O8Xxm
 duf07EM6y7rzVx3VXHJYjTKZ5AqFed5nz9lozex3laa0qItpdYR1ewIU/Yvk6ZEfnVTc
 CfLjs6EkwtNmdsEG1a0u/IQogDQYaR4U6BMiiJ1s+1+uYRlimL82VO2lJDMuTQBv9MQX
 8BEISQFl8xrWo4CBuH67NnyW7mmSq4j2n93zFLRWyOoVSDkRxepdJyHodsu8+o/a7sUu
 7s6Q==
X-Gm-Message-State: AOAM530cDCTBfWTbgkzgRtctMvrw9RBEpVMEtltDeeGVe+jpzNL2tab8
 ZfDG5OHPHPtbW408tyKN9pfJHLATWs0f+kwmd4CKS+HaklflTA==
X-Google-Smtp-Source: ABdhPJz0eNRJBT+L/HxWdjMSjjIHBIEhd4wQvh8FtZnI+xh1GsUmtJoy4NiOoIeDYVSpE/04nnGF9MscBt0moVe6nEU=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr73065794eds.146.1609782723860; 
 Mon, 04 Jan 2021 09:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <20210104122149.GH640208@redhat.com>
 <CAFEAcA_3nv2N7zY5kwGWPLRx2dY3KB8wMAFX-MMrk_kXK1SUVg@mail.gmail.com>
 <7493bddf-d915-8faa-5612-f14a3067a574@redhat.com>
 <CAFEAcA8e916+AU4Ebvie504AOoOBP8wZ8rC90=Hcws76wpkMTQ@mail.gmail.com>
 <b9198e6f-fba6-921d-4530-dc257064809e@redhat.com>
In-Reply-To: <b9198e6f-fba6-921d-4530-dc257064809e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jan 2021 17:51:52 +0000
Message-ID: <CAFEAcA--zyabmAkGPB-e7RxQYe42_63ivTRtA6HifkxYtDm-uw@mail.gmail.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Jan 2021 at 17:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 04/01/21 16:19, Peter Maydell wrote:
> > Does this work recursively? For instance monitor/qmp-cmds.c
> > needs the gnutls CFLAGS because:
> >   * qmp-cmds.c includes ui/vnc.h
> >   * ui/vnc.h includes include/crypto/tlssession.h
> >   * include/crypto/tlssession.h includes gnutls.h
> >
> > I don't see anything in monitor/meson.build that says "qmp-cmds.c
> > needs whatever ui's dependencies are".
>
> Hmm, I would have thought it would be handled, but Roman said otherwise.
>   I'll look into it, at worst we can fix Meson and temporarily apply
> Roman's patch until it makes it into a release.

NB that for qmp-cmds.c in particular
https://patchew.org/QEMU/20210104161200.15068-1-peter.maydell@linaro.org/
will avoid the accidental inclusion of <gnutls.h>, though I guess
in principle the monitor still needs to say it depends on ui...

thanks
-- PMM

