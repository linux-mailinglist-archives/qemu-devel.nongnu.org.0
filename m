Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8957333480
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:45:08 +0100 (CET)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqiZ-0008UE-IQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJqhe-0007zV-E4; Tue, 09 Mar 2021 23:44:10 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJqha-00088x-SA; Tue, 09 Mar 2021 23:44:09 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id p186so16482380ybg.2;
 Tue, 09 Mar 2021 20:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H2/y900WHVnwKPVYI0BNKr7HXzfod7ZLJEYZDJP9iYc=;
 b=LzZmfBwLlEpAftG1ajFg5/xF+cNyT8jzf/uMITTyMeIga2li6MZqhVitRe9JSiKC5R
 Zrv0LO2tEUKnZq4hF6jr4meuomZ5Rv8zirhHDC3VQ0L0jXDguylsVyYyPWHcecdoFn2+
 LkPFKxlSikMz5/fVrms9gfmWDAu82j7QdM9SVZ73UF9IdpZi6xxwZb54901gkZgS/Wf2
 bxLAGObVCHX/Y9Ut0GIw8aE3sEW3gXSWvVnOeHyxqGPmWAXS3edFJwy3bpmknUERc+xn
 21l6i5jAtK8xVtjMECwUxo3nE6iA7HqBkBrvqw+WdY7lUXJqBXta+5tFov3rk47EXmnd
 mnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H2/y900WHVnwKPVYI0BNKr7HXzfod7ZLJEYZDJP9iYc=;
 b=lBeUCMIcZinj7PUXpbYczR3lNoD8kDcqkmRy0796HZZXM+tF0GuREI3LdqAus4Zlf4
 NJ/3G+mS2wgJXeRTOrt5JFvWBntedwc1wVcwTJX+/XQ2K2N9fdlnOnVqRXyMoZTjXjJ1
 S+yJ6OPQUWP2nb6gUiImU/S2oUU1hLX+3T1/UVMY6s/mTscStxa9H+Z/jRk+g/KKNKKk
 fdv0OrBGjTIlww7yKn6tbRe0I/4YjSy8+ty9qZVpNUoNQgiUIUWhNJPJ3D/IlvDBG3Ld
 NhmZmegrEG6QCbsdSxdlIQ3v/eRI6uW0DP4juxt+MzxiWgID/JzD0fD7Eu23HNPpFYdc
 Fb1A==
X-Gm-Message-State: AOAM532Vl9xZf6liNYVxo2M7M6uBfXFtCuaUThDVJL+47btLlAcRJ5PM
 4fTBaF1lSq+Wux0ONsCFGyfxnFNyTy1ZzEGHMt0=
X-Google-Smtp-Source: ABdhPJy9iG05bRSYwReUtBfNd4Y7U5UUwQh0aF3vh1VCMMvbpGIFvoJydb4rFnnrAuqT9eEXXFAM5TydHZZgovngLQE=
X-Received: by 2002:a25:d744:: with SMTP id o65mr1770010ybg.387.1615351445216; 
 Tue, 09 Mar 2021 20:44:05 -0800 (PST)
MIME-Version: 1.0
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 12:43:53 +0800
Message-ID: <CAEUhbmWKHYxHvRfZ+Z24+gxLQrSvxxq2uqRjB9Fx2jLqdiSrZw@mail.gmail.com>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Wed, Mar 10, 2021 at 12:10 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c94=
2a:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307=
' into staging (2021-03-09 13:50:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310
>
> for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517:
>
>   spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:07:=
09 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue for 2021-03-10
>
> Next batch of patches for the ppc target and machine types.  Includes:
>  * Several cleanups for sm501 from Peter Maydell
>  * An update to the SLOF guest firmware
>  * Improved handling of hotplug failures in spapr, associated cleanups
>    to the hotplug handling code
>  * Several etsec fixes and cleanups from Bin Meng
>  * Assorted other fixes and cleanups
>
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>       pseries: Update SLOF firmware image
>
> Bin Meng (2):
>       hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
>       hw/ppc: e500: Add missing <ranges> in the eTSEC node

It seems the following patch was missing?
http://patchwork.ozlabs.org/project/qemu-devel/patch/1613660319-76960-1-git=
-send-email-bmeng.cn@gmail.com/

>
> C=C3=A9dric Le Goater (1):
>       docs/system: Extend PPC section
>
> Daniel Henrique Barboza (11):
>       spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logical(=
)
>       spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unusab=
le
>       spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
>       spapr_drc.c: introduce unplug_timeout_timer
>       spapr_drc.c: add hotunplug timeout for CPUs
>       spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state
>       spapr.c: add 'unplug already in progress' message for PHB unplug
>       spapr_pci.c: add 'unplug already in progress' message for PCI unplu=
g
>       qemu_timer.c: add timer_deadline_ms() helper
>       spapr.c: remove duplicated assert in spapr_memory_unplug_request()
>       spapr.c: send QAPI event when memory hotunplug fails
>
> Fabiano Rosas (1):
>       target/ppc: Fix bcdsub. emulation when result overflows
>
> Peter Maydell (3):
>       hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
>       hw/display/sm501: Expand out macros in template header
>       hw/display/sm501: Inline template header into C file
>
> Vitaly Cheptsov (1):
>       target/ppc: fix icount support on Book-e vms accessing SPRs
>

Regards,
Bin

