Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B32EAD31
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 15:14:31 +0100 (CET)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwn6V-0004v9-0O
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 09:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwn5G-0004Es-Fd
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:13:15 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwn5E-0007Bw-M9
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:13:14 -0500
Received: by mail-ej1-x629.google.com with SMTP id jx16so41315233ejb.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIirAyH3XZ+mUgPKERQ/E7CPSyWgVqdiLqB1+gfTg/k=;
 b=AZLCROX0iNQLRvMbpVxlAXib62VSGAk/LU2OvCyPZCRue21dlXSWiauJBH2dxeSD4K
 9jKS4peN/dZrZXWP4IzwWbf3IZCNaCFDI10HHunNoo+iOd5esyH4PoAPpOu4ScMBdm81
 EYOCLX5qZuVFNTCDBuuBZ4CXWJPGS5BsREZIQ8OQyWpIFKF/J2TQFwxtszIVIfOTha9A
 3qtTCvPDjdlCu2ccxNmybiXIO9OUoyQ0yQUJLpg3CYX/vvusiOpu6omCUjy8SmMBp0ai
 2xCMVtF20d3nMRDg5F2tvZzzqUZwf9kz/Dlb1q9GNsOuTMnC95R9Rx/7BmCAMISUgsO4
 QnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIirAyH3XZ+mUgPKERQ/E7CPSyWgVqdiLqB1+gfTg/k=;
 b=YGnM1g+BN7Y1x92J7n68y1G4V6SjINJ/uSGqu3+IZjmUTEgsw1WZz7/bBj+acicycc
 5jKXos9XrnkAaxyXbeg2jv0yB0JpIleWeZIqhhXz4MT/27lmlK1ZeioBsQy9udNR+oTT
 qJLiqn2jdETzZxUDFp4A7qm64qRd59jn/1X8SL+LI14Gx0qzPu0fdRY2a8W/Zh7FsaFo
 KNPvkplu3I6VjADDiY93Y8TzegdPcEX6Jy2vYhyzT8REDeEMrIMTa3CMSDHvsjpaORv8
 nOFwwXbhY8n+X0SXr+V5VDsl+bM8fdnRms6CinR+44KxcIlIvXdKkXIiMZB3+Sw1yFCl
 sTrQ==
X-Gm-Message-State: AOAM533Qaf3y5jipWHNylRDZdoFX80abFXll2bQC6tV1xJ9FweUzesDW
 8ZTrB/TZTjgKaNBbN2Efb2L6x/T4BtCPgZWUzj7ukA==
X-Google-Smtp-Source: ABdhPJzqE7mA41GFB80bpFpZM01aCMssU3Wssu8WZAj1r5i9g7g7es3nuU/0wSJcuyYzXL0GSGJTouPSB+HIuhRu7P4=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr69902671eje.4.1609855990721; 
 Tue, 05 Jan 2021 06:13:10 -0800 (PST)
MIME-Version: 1.0
References: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
In-Reply-To: <672b8aa0-2128-23e1-b778-01a4d96b209d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 14:12:59 +0000
Message-ID: <CAFEAcA93iYHz2aXUY+sXwNqwNT3MD0HD6V+JoJJWt+xO9OUZNg@mail.gmail.com>
Subject: Re: [RFC] Using gitlab for upstream qemu repo?
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 at 17:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
> now that Gitlab is the primary CI infrastructure for QEMU, and that all
> QEMU git repositories (including mirrors) are available on Gitlab, I
> would like to propose that committers use Gitlab when merging commits to
> QEMU repositories.

> - right now Gitlab pulls from upstream repos and qemu.org pulls from
> gitlab, but this is not true for the qemu, qemu-web and openbios
> repositories where Gitlab pulls from qemu.org and qemu.org is the main
> repository.  With this switch, all the main repositories would be on
> Gitlab and then mirrored to both qemu.org and GitHub.  Having a
> homogeneous configuration makes it easier to document what's going on.

So IIRC we decided that we wanted to do this git.qemu.org -> gitlab
switchover, but not during the 5.2 release. 5.2 is now out the door,
so what's the next step to do the changeover? Now seems like a good
time to do it so we can be happy we've dealt with any snags well
before we get towards softfreeze.

thanks
-- PMM

