Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71C49FED3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:18:50 +0100 (CET)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUtc-0007U2-I7
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDUbP-0007KQ-5M
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:59:59 -0500
Received: from [2a00:1450:4864:20::330] (port=34331
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDUbN-0002m0-8P
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:59:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so4985908wmb.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 08:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKZedNZpc+w6E9zPkTn3i+qviC5vdBfeuoznQzUZESs=;
 b=il1YscQ92s684FNHEYoUt+1T54T/+KbZ9bxycHExS9gF/a3aPT+6hPGkxLVyukX+RK
 KyG4PMUsG+KeOJETeZt9i5tKuA/SjKfLeua1qCgPzhK0jdBMKGVULVJ7eT8F84508Uce
 nxgLywjS2qKCdhM5gUdDBTkq2ScyRSgPIuEgng+5Th8KiU+8AXzi9z/h4XIv2uuuphLA
 tIfPEKSTa4i0vwn3DTDUWtFMciRpsERVmIbsuFYI3Auro+iEwtm0DgFl82kbwzYL8ScD
 xN38jcoKFepb9nA/27cG8xjvfw/Izz7H9DYxEbsNJ+nRV5wPK9cFZdRA3lmarFrwi4rk
 WSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKZedNZpc+w6E9zPkTn3i+qviC5vdBfeuoznQzUZESs=;
 b=wlsBEN+KAmSJNID2Jd+KkI0lFC4yGiEPfsUnDqOt+i82Ek8SJul4tfh30dJSqr8nMx
 uPdZCq2hbnupYl1Ap0QvgedxwXNOhWdAXOdpwsJeCK8dRKYUKDdLJh3Mip0zmpL3o9Gc
 dgJi6/VPVCWVfCtcxld3rSKed2pXvrrIXW6Xf/OTmOIUy9ae2akf89b4w+qu82c0Dm7a
 2eg8RMQYnM/qhu+FgMdhnUO4nldfYXlupy76/yep7//42kerWvYJj7rN1oNj4sE54obm
 wvFJ7YWpDHp85QbSlqF+chN6YklnaHC/qv5HpDn9Ehqf5yajIYQH6tnRrZFR/8Djod6o
 DNug==
X-Gm-Message-State: AOAM532EOBQTk0naKcfNy5wvTw5wrRqGktNTtJGocJ2OHy7m69+v5xRG
 758rMhRnkNWT0diy8lE+onfGqeMAyOw576ZqWkgAaA==
X-Google-Smtp-Source: ABdhPJzGmfbospbgfbqUW7lwgWB7H4NPSCIbJs7jhvCB5+ZTB89VXNKko9toDrC2PHNO0F2K+ftaIPr/5sZ4V/KIHLg=
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr16985537wmi.37.1643389195332; 
 Fri, 28 Jan 2022 08:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20220128101513.646792-1-pbonzini@redhat.com>
In-Reply-To: <20220128101513.646792-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 16:59:43 +0000
Message-ID: <CAFEAcA9mSW5uToVMng9qqDxQfEgW2dQzSnr_gdYFpF-GdwVQng@mail.gmail.com>
Subject: Re: [PULL v2 00/14] Misc patches for 2022-01-27
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 at 10:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit aeb0ae95b7f18c66158792641cb6ba0cde5789ab:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-01-22 12:03:22 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 479ca4ccd54afcd54b0163532709079233d64b97:
>
>   configure: fix parameter expansion of --cross-cc-cflags options (2022-01-28 11:13:33 +0100)
>
> ----------------------------------------------------------------
> * configure and meson fixes
> * "meson test" switch for iotests
> * deprecation of old SGX QAPI
> * unexport InterruptStatsProviderClass-related functions
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

