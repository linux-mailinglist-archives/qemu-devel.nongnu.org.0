Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018A6B2B36
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:53:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJV7-0007LU-Bd; Thu, 09 Mar 2023 11:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paJV4-0007Ki-Vc
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:52:19 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paJV2-0007eo-Az
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:52:18 -0500
Received: by mail-pf1-x431.google.com with SMTP id cp12so1914960pfb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678380733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lclTBvmX9QBzaA9OmNkbBoHtQrb4Tl9960fmrHBlQqI=;
 b=uRSzSTJ6IsnwJU8nt0M68TW2kliTmnMwO5xq1iCowH5IGGs/wRZsOqON/DynBYD9s2
 BFlfXYEke4UOijxQ64osoQ2KkCo1rPSsVzx619SsQP/n3T+BhC5Ur2rtJFA6DwWiPXJL
 VON90DZX5YyP0pNsQQV1irD9V7e9EIRP+y9uHlASniZgmhCFwUXwFgmUl2DIiRAlCdyL
 lNKjAa5kFqBFeb8hryEW3Q9jAn/FZ2Q0Aen52qd+Fp1hV5py+/7Eq9Syg5HKNVQFTp2A
 +3z4/joa28qttzhlzaUtI9E9ILklhj2vq+adghdsIN3JB5FTLqZLtR6lBHRwoTsClCNf
 H67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678380733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lclTBvmX9QBzaA9OmNkbBoHtQrb4Tl9960fmrHBlQqI=;
 b=MtpjCur8NeJoaEBOfh0lkOmnB6+TOTqqSptI3Q5swb/9+SW0/DMSjg+RYx/5W4QLyX
 V71nXA4x1/4bQp0+hNZIN+IgXHSbq/1xBmXvPQ/neUm9U09TmWzK/kZ5/Ak0ZSLgOD3g
 Z7dKpnJ+KQdVGFJtN+gu5t5NupPxpNTaF04dnVolwAHN2rOYMRvL05siPxvl/ZFcC/IN
 +AenagNsTco4JHBqC9tvlIiv0LjQvGf8p7ib4zOYzK44QWkeVllfVKDay00eFWpDiqqe
 lPrE/XFuWfjmUwH25pC/sCNlazov6b0A4QF7V8vaIVcoDAeGq0jfYOxiSEn7q0b4W4jw
 Judw==
X-Gm-Message-State: AO0yUKXTMHx636DAaW5/br9B/Yv2kH1azhrcYtC9DRk4lNfCubkovLcx
 og8FFmTTUSBiKdQI5z9P+uRKDNf0YdOfTc19qa4AmQ==
X-Google-Smtp-Source: AK7set/m99ZkU+FSngoxaZQcdqDzvQNYlrt2Bv3ql/YuAeH85LCQPy+/l5mDYOrENqtpzLCWi76ORVcp9rUtQ3b/SPU=
X-Received: by 2002:a65:66c5:0:b0:503:99d9:d9a3 with SMTP id
 c5-20020a6566c5000000b0050399d9d9a3mr8029833pgw.6.1678380733404; Thu, 09 Mar
 2023 08:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20230307134631.571908-1-thuth@redhat.com>
 <008c8615-47f1-2d6d-12f7-01822a90797a@redhat.com>
In-Reply-To: <008c8615-47f1-2d6d-12f7-01822a90797a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 16:52:02 +0000
Message-ID: <CAFEAcA_F1CL1wcn12rpTZuO-5DSQS+KhPaX9homYwSnam5YM6g@mail.gmail.com>
Subject: Re: [PULL v2 00/13] Final tests, s390x and misc updates before the
 soft freeze
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Wed, 8 Mar 2023 at 08:04, Thomas Huth <thuth@redhat.com> wrote:
>
> On 07/03/2023 14.46, Thomas Huth wrote:
> >   Hi Peter!
> >
> > The following changes since commit c29a2f40cd5d1fdad4632b48343cd968db041a44:
> >
> >    Merge tag 'pull-target-arm-20230306' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-03-07 09:58:43 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-07
> >
> > for you to fetch changes up to 7687cd2b99454bd289c8854eec2653cb855cad67:
> >
> >    pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix (2023-03-07 14:30:43 +0100)
>
> FYI: I just repushed the tag to fix a typo in the arm 32-bit host
> deprecation patch ("continuous" -> "continues", thanks to everybody who
> spotted it, and sorry for missing to fix it earlier).
>
> New commit id is now e3b27e7985d57ce22fe0e308a27615acb07a1724 .
>
> I hope that's still ok, please let me know if I should send a v3 instead.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

