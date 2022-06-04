Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511EB53D5FF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 09:59:54 +0200 (CEST)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxOhM-0002hv-S0
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 03:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nxOeY-0001vE-8J
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 03:56:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nxOeW-0006iN-H1
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 03:56:58 -0400
Received: by mail-ej1-x629.google.com with SMTP id gl15so5967244ejb.4
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 00:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3hGslzDFKPHs0/T0YW26W8nFP3xOgHMcGqsxyo4uCw=;
 b=m6X6HHmf036YEPET+xmSfrI8KRY365D0pW7i+75E95g9EyuAXvkWykgVyKReXs8HF6
 OC+UN36JCyG8A3A9hl1tqu3Hr/CvRhH8HB0mpIG8bjooyYEIeBJKxKZ7AbMvdwvg1QaK
 287rIuQKkdkmgGMdw8X/RX52jR3hWR2AjuZhyeYd0VPBUB6Fg++u8IJRf56I3ZA72xa7
 ketpDYUTWFW0iJS99LrNcCqqNTjaHG03BBaoIVZgppjo8/nkz8LhfHsp1bZ2ZfAlNAf5
 r47dFrOWb5cW3hG1hjRdsWaDMjQXoSytu5RIiEvCmSKxr1Tw1v+BCpt2/kiNV1/sDUcd
 emdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3hGslzDFKPHs0/T0YW26W8nFP3xOgHMcGqsxyo4uCw=;
 b=52Wx4OwFYIXk2xQkuZQeADM/ls/Qwla4xsC97SboR09JxRFTt3+BxOm4tZmZPx/5ce
 fzaMimF6OjZPeXuMXVQ//hK5vF33zMeAq3+Ru78mRDaJE7Dft+6XpZfb82OJsUZypgsE
 hKda1a5Prn4fzNBGJLRR0odmVrBO0dcEyEtov2CgYTVAy6L3k0FID6/x+wi+TiiGGH8N
 E+bo8mMZZCZqho+0KOF7ipCUHNmpsl9i02d3Huz2+0UhqMiMf9N2eA+8rbk9FSqGDTuV
 BNfH64LVrAxVifUnuxPCKuelr4U5sn6JxqXoibAOYMrWOR7/F28LOUYiLbA1/VTe/1bv
 P6Ag==
X-Gm-Message-State: AOAM532vsFBsjahct+FRx4xvHIOKra2Ko6jZPyR1Y1PTwXFaAcAdHHR2
 Vx2+RWC2FS6XZjwy8EREkE116gXHJt0nqMeBDw800A==
X-Google-Smtp-Source: ABdhPJxgWHb6H3ecpP5gLBls4SaHywmtw9mzkPC6P0XgFj/mywpSHLvLODXU05emNLp4avhXhLYPhWbGbJPGhGH/5e0=
X-Received: by 2002:a17:906:acb:b0:709:d274:611b with SMTP id
 z11-20020a1709060acb00b00709d274611bmr12022860ejf.147.1654329405698; Sat, 04
 Jun 2022 00:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwyg-n-u+ATuYWsCu35kqos1z7UwcfCAPz-6LTgbQ3q2VA@mail.gmail.com>
 <CAARzgwwJ1xeW46+RX779sBf7nWs1okwBBE3qtZXYL4ODsGVPCw@mail.gmail.com>
In-Reply-To: <CAARzgwwJ1xeW46+RX779sBf7nWs1okwBBE3qtZXYL4ODsGVPCw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 4 Jun 2022 13:26:34 +0530
Message-ID: <CAARzgwxx37Pm0et_Pt_ky7MSi59nFwrue+SR=PVK-6xagu2rWA@mail.gmail.com>
Subject: Re: Changes for building bits on newer gcc 9.4 compiler
To: Josh Triplett <josh@joshtriplett.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 3, 2022 at 9:38 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On an additional note, my changes are not backward compatible with
> older compiler. The build will break when built with a centos 7
> docker/vm/host:
>
> /home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:
> In function '_build_callargs':
> /home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:3707:6:
> error: empty declaration [-Werror]
>       __attribute__ ((fallthrough));
>       ^
> /home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:3707:6:
> error: ISO C90 forbids mixed declarations and code
> [-Werror=declaration-after-statement]
> /home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:
> At top level:
> cc1: error: unrecognized command line option
> "-Wno-shift-negative-value" [-Werror]
> cc1: error: unrecognized command line option "-Wno-cast-function-type" [-Werror]
> cc1: error: unrecognized command line option
> "-Wno-address-of-packed-member" [-Werror]
> cc1: error: unrecognized command line option
> "-Wno-discarded-array-qualifiers" [-Werror]

I have fixed these. The code seems to build both on new and old compilers now.

>
> If fixing this is essential, we can ifdef some of these changes
> between compiler version checks.
>
> On Fri, Jun 3, 2022 at 2:06 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > Hi josh :
> > Here are the pull requests. Please feel free to review and merge:
> >
> > Main bits module:
> > https://github.com/biosbits/bits/pull/13
> >
> > Submodules:
> > https://github.com/biosbits/grub/pull/1
> > https://github.com/biosbits/python/pull/1
> > https://github.com/biosbits/libffi/pull/1
> > https://github.com/biosbits/fdlibm/pull/1
> >
> > Thanks
> > ani

