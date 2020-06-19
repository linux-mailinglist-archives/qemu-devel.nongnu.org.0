Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4313200870
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 14:12:40 +0200 (CEST)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmFst-0004Oc-Pb
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 08:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmFrG-0002ZK-CI
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:10:58 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:39549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmFrE-0008V6-55
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 08:10:57 -0400
Received: by mail-oo1-xc44.google.com with SMTP id c4so341058oou.6
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5wVyyiiuhzkwOinvjyniL/wdBrDKmU9kEVr45dWQs0=;
 b=BWvB1MT4EBeLogmWuTnT4Dr1PyW8kLZNSU5ct/WsILFxi+XVK4cy2nrPgLgyEqjEJv
 QXyLbxdMh/5C9nSqM68Iwmd8Mdol8+CPBWRM0K3VXqGdoQQ1+00cwKCRSxi/kwWuFqQi
 OzBuk0UJA3s8GcIPCX5netjZW8XKi2VHQhKI/9hgDW+LyNRZAAXjDNSV3hxMqn4k45gm
 Gxtlxv8MHjNX9EmFSJDeGdXb0YmtPNJpguO4x6xrt6xfLX2upk7mLbPZ1mAq79b89DnQ
 oHz4aBkWPdKiamEFFbZEvBd0Hm6NOouuOA3+A2qxi5WVgodftKYiHq1KomaGYdUU66aL
 0UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5wVyyiiuhzkwOinvjyniL/wdBrDKmU9kEVr45dWQs0=;
 b=RGqEvXVs7HlhvSTMawwbUJBXhhLdnuu+ZrnLTJ78VXaEEdN8515UnX91V/W7j1eqZm
 8TL6tJ+mWW6AVaOJpfj3i+IkmiMNbt7vOzJO793f2XC+hGPcEZUTq0H2vl84ODCk7/FF
 1anc++WgnZKQEumKDcKzmqD7BmbKSQpvLsSyiW4CDnvtBbGlZWbuPGE42vWtDlU4fcnP
 Qm/lCyKIZlnFXYmNNiIMLzwTC+mJH3H2EAAD2R222PiuZXwP4WEuMEg6K8a2NSK3sZ1Q
 whqdQdQWnKUzDnMRq42lBZF1l2VlTw1fHc7E1raAPVZzU1xp4qAY+lfAh8jifcApNoRX
 JjeQ==
X-Gm-Message-State: AOAM531R5Ws6qHxprC+bvyP8IxVp/moaW+VKAF8XBPdZWjdQR6D5hLTC
 zdHN4zBbaUkiz4kGbJFhHmMsKdWI76/gfy6P3KA60Q==
X-Google-Smtp-Source: ABdhPJzUZBI9dcTo7m0Vv0PYP/wTSZoAkF2itzkuovlVCTxfNkQ8Vnykrtiu+mGz3QKsn6WkdfpIImwvxVjH1uCHpos=
X-Received: by 2002:a4a:a20b:: with SMTP id m11mr2995082ool.20.1592568654580; 
 Fri, 19 Jun 2020 05:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200618153854.271723-1-cohuck@redhat.com>
In-Reply-To: <20200618153854.271723-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 13:10:43 +0100
Message-ID: <CAFEAcA_9_E7Xm0xrXVA6JC=t8d4Y+ApERDaBo9bewpsP7f2LoA@mail.gmail.com>
Subject: Re: [PULL 0/7] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Jun 2020 at 16:39, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 26bf4a29213b432eb390726c698a1915550a9cf9:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200617-pull-request' into staging (2020-06-17 16:24:24 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20200618
>
> for you to fetch changes up to 458e056257e67254546e58158f3f74ce040c7ca1:
>
>   docs/s390x: fix vfio-ap device_del description (2020-06-18 12:14:06 +0200)
>
> ----------------------------------------------------------------
> s390x update:
> - update Linux headers to 5.8-rc1 (for vfio-ccw path handling)
> - vfio-ccw: add support for path handling
> - documentation fix
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

