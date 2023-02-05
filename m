Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397868AFBB
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 13:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOeGV-0004fq-6o; Sun, 05 Feb 2023 07:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOeGT-0004fi-5b
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 07:37:01 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOeGR-0006Rm-Jq
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 07:37:00 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 143so6489027pgg.6
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 04:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TgUXPOHO969D1YU4qHcHbDtdC8ZubZN7ePQnVTilqUk=;
 b=norBI33xbqtH/7Um6HIe0SBmlzZnmRcWsDLD5QWFft+odfC3K9qCv10iQakk21iRl9
 gtpJM23iHd4l3d+Hll+EvOPZD1Z7KuVqr5P7kZ2Z8NUI6geQ2GGDx8wDa8QwPkcQzRwZ
 Rjo5QnusXoKrJIhhS4B2cU6UXu3rkG94qL0Srjyl0S3cOuBb9qKMWOU1D2O0yb8owZXf
 2JwKmpMHJ5rxknkEiezzUl0iVFu48CJx75c1+MF+DKVIl+TvsxH6M9alJDzpzqQ6x9TZ
 0owZs9uowONp18MsMIucSLycxerNkKAzWuu1b1f7X1iGoWzozzpJugdPwB6y5Odvy44W
 RA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TgUXPOHO969D1YU4qHcHbDtdC8ZubZN7ePQnVTilqUk=;
 b=xSkVy3/sFWZcu9Ls6BfB+D/MHwnqGdsnqf0hVmBfrnqpMojgIOTGdt4w8SmyXBBBqu
 pS0sdgzc/SJN6gv0SH2bLfDVkKNZs1+a+ZHTO6HL/18GPJIvxZVtAJm44ADYPA+r2+ax
 FCSmoL8RsCXlTYmoXO6l35XIJdf2F50PBiFHF8ErgpugFMU0gZ6ckajgA1TSld7MAA13
 don41alPShN14Ll0/5B5MiZdiGMhZpM8Hcq6mh8/sv7s0MTho9MJnUy+2xF2pWjOzzIM
 OPOtlbk3o3f+WvCoG8/gVq5OFQgP5QqrtBMLzkzYPz9HEoQwbc4kQbGospQa65VwyjiW
 813Q==
X-Gm-Message-State: AO0yUKWyVbdpq9hK9xf/OkgJUGQXWZFMknZgXlFcrvf43JXo6c9nGv9R
 LImSJrjqhYGOtw4j9cu+qrw4K/ktUT4KcuhBeMu1vA==
X-Google-Smtp-Source: AK7set8llkK3XCQVR29dqMukPZBbATx4cTyeGcT2qfOTjrn/mCBiXyWYZnOfleJn3wnH/zJSrzZuRZZwS4qE+OloX4Q=
X-Received: by 2002:a05:6a00:1490:b0:593:dc7d:a31d with SMTP id
 v16-20020a056a00149000b00593dc7da31dmr3755990pfu.23.1675600617768; Sun, 05
 Feb 2023 04:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20230202062126.67550-1-jasowang@redhat.com>
 <CAFEAcA8TbQFZTG_M3djxiXD+42y8C=QtXrfO9jVEOY4V1PAGGA@mail.gmail.com>
 <fe517a25-b7fc-3227-fb1b-b10be66898f0@redhat.com>
In-Reply-To: <fe517a25-b7fc-3227-fb1b-b10be66898f0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Feb 2023 12:36:46 +0000
Message-ID: <CAFEAcA9Z4G74W8k4t3=+vJ5x-W6Skuq_rjbxEj7GHq+7BWEeug@mail.gmail.com>
Subject: Re: [PULL 00/11] Net patches
To: Laurent Vivier <lvivier@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Sat, 4 Feb 2023 at 20:09, Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 2/4/23 15:57, Peter Maydell wrote:
> > On Thu, 2 Feb 2023 at 06:21, Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
> >>
> >>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>    https://github.com/jasowang/qemu.git tags/net-pull-request
> >>
> >> for you to fetch changes up to 2bd492bca521ee8594f1d5db8dc9aac126fc4f85:
> >>
> >>    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-02 14:16:48 +0800)
> >>
> >> ----------------------------------------------------------------
> >
> > Something weird has happened here -- this pullreq is trying to
> > add tests/qtest/netdev-socket.c, but it already exists in the
> > tree and doesn't have the same contents as the version in your
> > pull request.
> >
> > Can you look at what's happened here and fix it up, please ?
>
> Thomas and Jason have queued the patch:
>
>    tests/qtest: netdev: test stream and dgram backends
>
> For Jason it's because it's needed by
>
>    net: stream: add a new option to automatically reconnect
>
> For me, both patches (in tree and Jason's one) are identical to my v7
> (except the one that is merged does not have Thomas' acked-by).

When I tried to merge the pullreq I got conflicts because they
weren't the same, notably in the set of #include lines.

thanks
-- PMM

