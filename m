Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972A49403B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:58:07 +0100 (CET)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAG9e-0004jx-P6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAFyR-0002CU-4r
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:46:23 -0500
Received: from [2a00:1450:4864:20::333] (port=38484
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAFyP-0005M7-GS
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:46:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso9660447wmb.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDyX6FSSU6mWt5GKIkd2Hb/eSvnuU0jNe7E0/e8oRl4=;
 b=jBYdWt5FmJXAOehH3LsrWAtSeRbDWPBH1Yu3vMrn1xzbGO1L38VgkNUWUemjSt+fIj
 wdu/SRDW7K95c5xY0MBcVrer0lJzag+9PN/e6FFZKwEjXROh8u37vFsd0l22wjxqOVvN
 gOFRQPoC00XUnPpWD97F3KgoEFbyUYEUWMOpfPWkh2kaTJ3ojSzXK0WnVtYZT9EtNClz
 VFgxMQa8pik+dcqCKPxI/agBlTv8x9hKDQ0cNeB3KD0F4vsYv0HxQ46wg3wiGPbM8YHx
 ocW0+GCXFudFjtKXbEJF2jPVGA7ChhN7q9nMmYMMAO9X/6sGvZmVjTCqtZCEAdw19IHt
 UiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDyX6FSSU6mWt5GKIkd2Hb/eSvnuU0jNe7E0/e8oRl4=;
 b=r7XxYysDMizH5I3+NoTy2UkKPVUpK5PB1jzSPSXr9B7XGe+tluY8fBpnX/SUjB4H2q
 kjVriQZx6WjDvOxG6V27BJWNk3lCJp0RhXxFBVHqwdOayQdyo4+1ZNJkiNlupwc3iOyN
 eFWPZ8LWNrIt9LGP2ROIqBNdXpkDDt7KBCX9nMaSaj5XEdgoMO++94Mimm7yU6TYODk3
 oZja1+sU38zY2CAcWwAuAtMS+Uie3jtyIzHeK756T1SWMcnMUWJFSbgcvmfhyuCCtfuq
 WHP2WWNBox/AnVzBtr7ocHvztnnsnNfRf4RixMfD5EUJi8zp+K5yYL5VY6btyarLvBCU
 dvdA==
X-Gm-Message-State: AOAM533WkWv0buM8Zy/gezBwqm7WQFi0/z7Nn4eezh6WfkUdwVYxOUKk
 g4cEgPTv3igv4YKeqlH2XGAZITECLV6Gc5EIi5xpPA==
X-Google-Smtp-Source: ABdhPJwIHAU/jfmOsncfLxhZK2nN91ludfeq2F8FFOzcyCszuOL9Ubfgsjii5sXGrdKSIcc5eLv/kvKxcF4G4xVqFMw=
X-Received: by 2002:adf:e907:: with SMTP id f7mr30217752wrm.319.1642617979846; 
 Wed, 19 Jan 2022 10:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20220119083215.120911-1-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jan 2022 18:46:08 +0000
Message-ID: <CAFEAcA-bv7kSJ1ABYYkg2ZzpQXKyZqgc4b543BLCW0_vHFcigw@mail.gmail.com>
Subject: Re: [PULL 00/10] s390x patches (shift instructions, MAINTAINERS, ...)
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 at 08:32, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit 69353c332c558cead5f8081d0bb69f989fe33fa3:
>
>   Merge remote-tracking branch 'remotes/konstantin/tags/qga-win32-pull-2022-01-10' into staging (2022-01-16 16:32:34 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-01-19
>
> for you to fetch changes up to 59b9b5186e44a90088a91ed7a7493b03027e4f1f:
>
>   s390x: sigp: Reorder the SIGP STOP code (2022-01-18 15:00:57 +0100)
>
> ----------------------------------------------------------------
> * Fix bits in one of the PMCW channel subsystem masks
> * s390x TCG shift instruction fixes
> * Re-organization for the MAINTAINERS file
> * Support for extended length of kernel command lines
> * Re-order the SIGP STOP code
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

