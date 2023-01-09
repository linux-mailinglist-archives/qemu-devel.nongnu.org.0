Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907A66227F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEp3S-0006Nj-MF; Mon, 09 Jan 2023 05:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEp3L-0006NG-Q1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:06:51 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEp3J-0000zT-ML
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:06:51 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso7122938pjl.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ytKt80EqX5FoLvaKgJ2+SxQdrfyHTckd5i0WAXrfV1w=;
 b=GLg6gwqtPEGt/wIfz467scDPuWBr5scsK20BlKw2wAuZWWtFZJQIR040pkoAKuwcnU
 pMkhtW/81xReNxAU7ipBIRNfp0d7KLhkWz1/1rz1lrJOx4tngefSm520IwsOyUzcHo26
 ygdNCnU+LWqWNCVUlmQKqYR4TbtnAHCmcDtV/9/w15S6akglScYIJ0EGU64ftcl74V+O
 OHFPqz+iOAYA7Eo7dUP8ZQOj2icoTenZ56geFJzP7hYXASixFgAU5rJVADaEHKY1XXA5
 F+VhDmCIkjWuCj10h7ve7BmwlhackorK1vckMvnvjaDJF09sV1PTE5qx5kOrDZdvYozn
 nLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytKt80EqX5FoLvaKgJ2+SxQdrfyHTckd5i0WAXrfV1w=;
 b=tf7DN9rnqBFJwm4SVs78tR2+h9GQapAzKhosr/NlGSq8frAVLjqImFC9MqmhPq3P3q
 E+uuzZmH/DEdxbel8vQOdwCPPNNfrWYhQzRt8KUa66wisrK3I6mWkWYp01ngT+pzDiWe
 6DszJauvi5l1zco6P62MBYchpOIp6QTrTDY7vcsSv289iFjYXKHBOpIEPfOb1P8GbalT
 yh+y999DjiJ0GY7CjH12EGe6nBTyUmwPMctu+h2PdjQHFnmdaAALDtuCJin5VzYYN2XM
 R7kENLfcGp29gtrMOgMzIXRLqNH9ZOlr/rVysATP9/rxdn+nTp4AdOA+hbgF0zZkAT7Q
 r4IQ==
X-Gm-Message-State: AFqh2krP2ovH3wa9bqAXTf8Pom3bkkAXB8J+ChPOyuNx3ns5MP2gpshS
 YStFP74StQw8/SG67hMxSSLyH22euP3OTWlQi40MHw==
X-Google-Smtp-Source: AMrXdXs8PwvFczIeYupfgRhSXVl/+hbhGQX7Quo0PyP2kBifR478vTHfwTKnpl5DmKNpPRKygZv1fXjtPr5TryxWTVQ=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr5113644pjs.19.1673258808272; Mon, 09 Jan
 2023 02:06:48 -0800 (PST)
MIME-Version: 1.0
References: <20230106082853.31787-1-thuth@redhat.com>
 <CAFEAcA_0hWNJWhmjW=yjSVgy1HK4c-_G3DBNPUpbj5KKpjjqeA@mail.gmail.com>
 <ae618c74-4a5b-79df-1285-dc336430e0a4@redhat.com>
In-Reply-To: <ae618c74-4a5b-79df-1285-dc336430e0a4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 10:06:37 +0000
Message-ID: <CAFEAcA__A62M8+3F1pr-xHXbojcOBbGztEFr5X85LBh0g4SCqw@mail.gmail.com>
Subject: Re: [PULL 00/15] First batch of s390x, qtests and misc fixes in 2023
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 9 Jan 2023 at 07:50, Thomas Huth <thuth@redhat.com> wrote:
>
> On 07/01/2023 15.25, Peter Maydell wrote:
> > On Fri, 6 Jan 2023 at 08:29, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >>   Hi Peter!
> >>
> >> The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> >>
> >>    .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-06
> >>
> >> for you to fetch changes up to 975f619662a46cb5dc7a3b17b84a1b540fb7df5c:
> >>
> >>    .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job (2023-01-05 21:50:21 +0100)
> >>
> >> ----------------------------------------------------------------
> >> * s390x header clean-ups from Philippe
> >> * Rework and improvements of the EINTR handling by Nikita
> >> * Deprecate the -no-hpet command line option
> >> * Disable the qtests in the 32-bit Windows CI job again
> >> * Some other misc fixes here and there
> >
> > Hi -- this produces new warnings during 'make check' on the bios-tables-test:
> >
> > qemu-system-i386: -no-hpet: warning: -no-hpet is deprecated, use
> > '-machine hpet=off' instead
> >
> > If we're deprecating that option, can we update the test suite
> > to not use it, please ?
>
> Oh, looks like these warnings now only show up in meson-logs/testlog.txt and
> not in the standard output anymore as they did in the past? ... that's why I
> didn't notice this.
>
> Thanks for the hint, I'll write a patch to fix it.
>
> Do you want me then to respin the pull request with the patch included?

Yes, please.

thanks
-- PMM

