Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E1411160
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:52:30 +0200 (CEST)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSF2L-00084W-MO
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSF0w-0007OJ-SL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:51:02 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSF0u-0004p7-74
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:51:02 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so27411499wrc.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0sMUT7p8bEPX0PjXxAGhf2Z00A+d0ITKD5EqQ4e6FAI=;
 b=oWU6Iq9SSvdvobp5WZYf56cmRR/AJw/if0XzHJPX3z/zDJWWr2wTWLZLhUO7jQ4mId
 8zrdLNFajR3u/33VpvFgUSBSqmnUtsQ7FCmYQPmXYPq+D6V5wwZ0U6VZG48ce0Tn+6y9
 3Qs+KtBl7Nw4stFM8FU11tUB/eidDZZj/gUodXtT2YgVDysqd0JF6rLZQVBtdr+/8yX+
 vOXthBMBYwgb3M9s4gO85nlXPloujCT8/T1srIf6+11BCr3wLbtJpYCDxP+BiTLuP2Fr
 SElRU6fdX6x/Of+qJMMKni+XenqpPH9JFny0/9Rdk3R8YOgvsqqm9EqlVBz8/fG/SYaw
 yRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0sMUT7p8bEPX0PjXxAGhf2Z00A+d0ITKD5EqQ4e6FAI=;
 b=YRx1axbd3MhP5U4hhzX5Uybq6Qgm/TkhZRpxT0eH98JUDNuGO/h1vnX1lRzWd6SraW
 wp6e8l2KLnsyI6gc5eORcKx2gxi5W/ANINgCpl4FKXLFqlvnJsSeZZmLQ97XcpAfy9TU
 ZnSdC75Rwe8wn0N38iz5aRzqGR1FcZupYIllyezr68WWTdruXUo99df11cB/Zaoykjwq
 4ukXLnQm/BTv64DEb9pvQFGJyYmfYK4zg1Sl/H9Fa3iNMH5JvUcbNsZcobFLc/Sjx8Hm
 MsDELRYYWF/lgQELf8uG+dK3+jsY4rp0l66tbf/MNZ0sgo8F7H/T87XEsYIp5UI76i3q
 gtLA==
X-Gm-Message-State: AOAM530tWltoBvyxGjXxwkHedoXo8JD1v7ED021vSFVzqa0BLtscQCtR
 inBmPMaj0Vj2sDDhyoG+W3MlJ8QFeockADJ6fyAjMQ==
X-Google-Smtp-Source: ABdhPJzKzMjKPiYMcQUJZQ5JkEUncdGIJVOseWkd/+VoFEY8dZu/TkWqh3GjYm5ltUCeljgIzSBf4vlo5FkY99Y+6Cg=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27463103wro.302.1632127858564; 
 Mon, 20 Sep 2021 01:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210916135241.150566-1-dgilbert@redhat.com>
In-Reply-To: <20210916135241.150566-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 09:50:06 +0100
Message-ID: <CAFEAcA8-zv9nhj_P_XpQG4b1WLrZiEh43h+T7AH+BrdcaTpNjw@mail.gmail.com>
Subject: Re: [PULL 0/2] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 14:58, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
>
>   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210916
>
> for you to fetch changes up to 046d91c83caac29e2ba26c63fd7d685a57463f6d:
>
>   virtiofsd: Reverse req_list before processing it (2021-09-16 14:50:48 +0100)
>
> ----------------------------------------------------------------
> virtiofsd pull 2021-08-16
>
> Two minor fixes; one for performance, the other seccomp
> on s390x.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

