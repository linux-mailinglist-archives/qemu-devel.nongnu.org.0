Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857E27CE49
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 14:58:24 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNFD5-000129-GB
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 08:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNF19-00051A-Vh
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 08:46:05 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNF16-0001Y1-4y
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 08:46:03 -0400
Received: by mail-ej1-x642.google.com with SMTP id p15so14777315ejm.7
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tiLWtIOYgRN9d6nagK7a0qiUslc8etCA4wEhaK9Yj9I=;
 b=wSFIJ4JEwrN/2f6U+OrgN1MCPyJl+1UDK+Q9+872Dc5W+rVijHW3DMeAFyAsggY1ri
 45ldS+lBuAQplpLDXZ3C0EbGEg5/6Lg6KsnEXV3quCzGsa5mx73k+XrHEhc/8RZ3Mlo0
 9lqBbfW1xhJAZJPQTsKe8i11lZWHZ5s6XdEhOTVVfd/UO5JDY5oOvWLOU2CK8OOpbv84
 BCJQK/1peR+yQCYSnfbi6pGoRMjZke+E4TVfAd7vBLQSL/H/KENupdMv373qzK68dZJY
 CntOiF8aCfMwKbhulGDWlbVs8+4szSmrplcEvz71ftAVUDbr1xCXLAeIu49naLnkwSqL
 7DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tiLWtIOYgRN9d6nagK7a0qiUslc8etCA4wEhaK9Yj9I=;
 b=rwDQGQIwH0/+1qHjE/HpGBSSbRj0w+ZVNlAvHxLgZ8sxbw4m7K70HFrbSqOVRh5piH
 zxcnyGdyZxM1MGn2fc+Wg06RwtU8glNtYJ90HSD5N+LlyE9DlOBgJsu59yuTTJ0zOn1C
 /PWyGVi3ms66I0e9+v7EAJ8XHnAAJCLxItihFKJMB+YvNyRKRDAKhTjWAG4j7nL6q0ax
 CA6TOb6y+kmlB5nerXZlMeoloenMeWR+7urhfZrmADtS60r58XBsVvRenQdF+BMHqVEj
 5BesgqRhblM9t1SeE6Lvb3y8CVYax/V1/NE2uZQW0g7r9hvaUfd3pq6vDkDTie14A4Ss
 d8lQ==
X-Gm-Message-State: AOAM5325iVirADPO67O3uCvdUO//MUEoVv+JjHfydHhtzNmXufpVvbMP
 IdUEd1ZplTX7DGWJPEucIjY8rLjvnD7FjXFXfBY5Xw==
X-Google-Smtp-Source: ABdhPJx76C+JMbD197l1GKtmOpAJvOhmqmU/FD6p27ebv3CMMH+C4oILLsE093gY39b1jGD1Kl0t8roQmCqeXPSncRs=
X-Received: by 2002:a17:906:24d6:: with SMTP id
 f22mr3551451ejb.85.1601383558668; 
 Tue, 29 Sep 2020 05:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200929111255.381871-1-mst@redhat.com>
 <ed9c633d-63c0-4e84-4eb1-adf634416bec@redhat.com>
In-Reply-To: <ed9c633d-63c0-4e84-4eb1-adf634416bec@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Sep 2020 13:45:45 +0100
Message-ID: <CAFEAcA-p3hZPi+xmNOgS4=Dd6EJV38n2=2B6rDiEvANDGF+oXA@mail.gmail.com>
Subject: Re: [PULL 0/1] acpi: fixup
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Sep 2020 at 13:36, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 9/29/20 1:13 PM, Michael S. Tsirkin wrote:
> > The following changes since commit 213057383c9f73a17cfe635b204d88e11f91=
8df1:
> >
> >   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into sta=
ging (2020-09-29 11:10:29 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to f142e4ede72853aaa7d306bc79b099caed45769b=
:
> >
> >   tests/acpi: drop unnecessary files (2020-09-29 07:10:37 -0400)
> >
> > ----------------------------------------------------------------
> > acpi: fixup
> >
> > My last pull included a ton of useless files by mistake.
> > Drop them all.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> It might be cleaner to directly apply this as a "buildsys fix",
> sometimes Peter accepts to do it.

I apply patches directly sometimes to avoid somebody else having
to construct a pullreq just containing a patch. In this case we
started off with a pullreq anyway...

thanks
-- PMM

