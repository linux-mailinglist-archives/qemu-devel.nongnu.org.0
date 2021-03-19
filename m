Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFB3423EF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:03:39 +0100 (CET)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJTG-00044Z-BR
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNJRF-00032S-BP
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:01:33 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNJQz-0004bH-Mo
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 14:01:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id h13so11803916eds.5
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lg+1EFpUNObhbEKEsPjfZNN6NzEf5myZraMO91KszkY=;
 b=VovapAG1Y6sfF/ZrtcexPhmH/Pys6NJGId3TN9gUmfOTBmzRDNg5O5UvY11a9fAFC2
 OMTn63zThMDxEWqqsVPTZmscKX1jj1a3Q528dCdcCl1rxA4N5vu71442qlI+mXCALE2p
 HRS63n89McEStUDN/WzMaeLdj9sLi50N/04YRP/HB3+02ZX4+dvMWAeAu37FTs3i1ZxQ
 A4TJQDboYf5XT39PL0j6cdrpV3/GddYyWBwESMOPTmBo1CdD+qYSS4PxiqEsgw9IcZOh
 IEIMDVqcYj46RL3Us8Z39KVy2xwqC94eArQyZsoKGStKmxfcmYBmtSxgPG6Eup2Yoi5V
 8tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lg+1EFpUNObhbEKEsPjfZNN6NzEf5myZraMO91KszkY=;
 b=mGAS5yaV8RMOU2MHrtt1TW7z6U2QhI7jat/CGTZrA3Sg/2nykJoE9UHKrY6D1Tl7is
 dwwJaYHRGQa7Quc0zxwwXSNU3pkBEEu1Uo3DqTghbWvrb5V9GdaE7yJLK95zF3Vl0oEw
 LFlalDZYTKfMzPa6JNVza9ntTYi8p9OvGnVFI7/B/S77alY8OZWznEUpjOU5y+oBJWAP
 wtT8RYPX/n5VmwT/eUMUviLAVSnwnQPArh0lnGT1J+NPgn49+Qre4Gk9aZJH/yD+mvOq
 a2oaye2Flv+WIecBeVJjAEhYHZ5rxNyZ2kHYCwc79vj2v+i6qyjbXeDpho/r7Ly1wiU0
 glIA==
X-Gm-Message-State: AOAM533S/PN/fyENhlNtnSNy457EgEpewbfJFbdeeHEamdxO+53HUleX
 El3zArUODnVyzi8T9xEX3Dv88/qtuV6eWlb0rZxeWg==
X-Google-Smtp-Source: ABdhPJzqocH9KVKuACCgbkxrMgNlAY2RZX1KUTe71qZO/H8/xDAIcCSw/6gre6ie4z+3D2bfEK0ca/fibwYGrluG1BA=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr10895924edv.44.1616176875468; 
 Fri, 19 Mar 2021 11:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210319152337.2321634-1-armbru@redhat.com>
In-Reply-To: <20210319152337.2321634-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 18:00:50 +0000
Message-ID: <CAFEAcA9Ymw=L3iaEuWVK_mCG7_tuwk+QDBTQ1aonemN6Ac33JQ@mail.gmail.com>
Subject: Re: [PULL v4 00/11] QAPI patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 at 15:23, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 92566947b3ac5ca75f91a34acb188219c455fc71:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-03-19 11:27:40 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-16-v4
>
> for you to fetch changes up to dbb675c19aa6ca328f4449ccd1ff605f9cb744e9:
>
>   qapi: New -compat deprecated-input=crash (2021-03-19 16:05:11 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-03-16


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

