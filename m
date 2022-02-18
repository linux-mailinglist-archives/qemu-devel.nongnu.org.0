Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0D4BB98C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:56:58 +0100 (CET)
Received: from localhost ([::1]:41852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL2oi-0001Vy-Lt
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:56:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL2b4-0007iY-RT
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:42:50 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=35511
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL27Y-00053B-Us
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 07:12:23 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id bt13so19181760ybb.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 04:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKZZrmDoVqGgoawkfxA7Kv9YcQsOL2D7sZaTTbefRco=;
 b=vWKYUVAvdNgXwNI6dVcnl2PD0Sy6mMwQvgm3Aplo+QHBw6zN34sGXc9/nNOVQPca0Y
 F1WIagVun6+PQ7x3QYFt56HKlHI2vOhSrOVtPX1RY3KGBD0q32kLDESogYHkJDPIIsJR
 ydu69c7rCtMLIKIZqLgmrSdxE+k4fYX1LIqMM55TmWrzvVsdS9yMjJNivFgqgJ2sseKe
 8cMT1pzfVmNVfev7bI2TJxGgDH9XdItPyfvoqA9AxIvwzGzDDkHRS/DGCI74FXf5roEg
 1fx5OslIl5XGHy0AgfKWbTcytRjgFabY/x4Vqlb/MVFeN8NE9/WSZor658rEew2FThUW
 DgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKZZrmDoVqGgoawkfxA7Kv9YcQsOL2D7sZaTTbefRco=;
 b=NII4jSJ80zNYsPRvHHKMBAqzzhDF0jdXC8D9sxbcu7WiQZ4kGHDhfgrNV06QRoRzS3
 H3Wl4WI5nQ3nDmST9ejqk1DTzA91apcx2TvH+ZOZ1n2DKja/Cb/fDxmHcQHSGYsieoGl
 yDhscEHgFj2DeoAMPf/PtFJlCLniT4Z1i6R7NxgTeWDABDDkqoT+NucyBSGkjGl1LzrJ
 +ASYc0aGQJKlM+Lcr7hGFMFOp9+h3tnf46S1VifSVS3rblLCwR6UJu5EMhPI5rmNivVW
 Jo2F0g2TADkF2wNRcDB+E1PnW3rxTBFgl/G9AeyFCqoWCa6ovo6LCEdL5EB3/63XZtWh
 qRnQ==
X-Gm-Message-State: AOAM531/XQWKgVT5oVIyCXZoaeTpxtgGM0s55ra/qNYb3lBzujpOnj17
 FgbWpAcNvff60BPRau+Mcr/b1JT/jiAr1U7efCkuow==
X-Google-Smtp-Source: ABdhPJxCb5pgoCK5J6Iehk8F0mKW3xqaSCHiPTu9IhnBkg0lNWWrW7PF/j3A4+7PbYTknScwxX3HXNeRiC9BuY1ahH0=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr6966002ybb.288.1645186338543; Fri, 18
 Feb 2022 04:12:18 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8nyOuQ_HziMVxgjFZYer9LUv-_QsKxzQY50By=6YUO=w@mail.gmail.com>
 <fafc47f7-2801-92e3-61ca-fbdf407a8f92@redhat.com>
In-Reply-To: <fafc47f7-2801-92e3-61ca-fbdf407a8f92@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 12:12:07 +0000
Message-ID: <CAFEAcA87801w2625NaqDU_9PTp4NGY+ADEv75PsHptLGK04TFA@mail.gmail.com>
Subject: Re: meson incremental build doesn't handle config file going away
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 at 12:08, Thomas Huth <thuth@redhat.com> wrote:
>
> On 18/02/2022 12.59, Peter Maydell wrote:
> > I've noticed that the meson incremental build doesn't seem to
> > cleanly handle a config file going away, as ppc64abi32-linux-user
> > has recently. The build fails with:
> >
> > ../../meson.build:1941:2: ERROR: Failed to load
> > /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/targets/ppc64abi32-linux-user.mak:
> > [Errno 2] No such file or directory:
> > '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/targets/ppc64abi32-linux-user.mak'
> >
> > where line 1941 is
> >    config_target += keyval.load('configs/targets' / target + '.mak')
> >
> > Rerunning make doesn't help; you have to manually re-run
> > configure.
> >
> > Something here should figure out that "config file deleted" means
> > it needs to rerun configure, I think.
>
> That's weird, since the patch that removed that target actually change the
> configure script, too, so it should have re-run configure afterwards... or
> is that broken, too?

I'm not sure exactly what's going on -- I didn't see this when I
originally applied the pullreq, but I have seen it a couple of times
later. I guess that some amount of switching between branches and
incrementally-building of older build trees might be involved.

-- PMM

