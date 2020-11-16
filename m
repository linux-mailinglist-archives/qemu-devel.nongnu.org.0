Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CE92B5444
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 23:27:24 +0100 (CET)
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kemy3-0000bk-HI
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 17:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kemxJ-00009q-AI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:26:37 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kemxH-0006nc-Hm
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 17:26:36 -0500
Received: by mail-ej1-x62b.google.com with SMTP id f23so26729938ejk.2
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 14:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qRw3JcutFwZT5LBu77k4wiiTaer0piLMPSYqxWUuPmU=;
 b=P/RZXlrV6GoQ01ckx8iasrlM58FcW6attd/NdUPc4ddo1CPFADZmOAvMGKYVpUZ4Ox
 a/2WEd8RStkIN90vB2Unk8VRw1tptDbYLigOMrK+k/pj2Va3GsMCeQBa3ZC/9GSZ8Xbc
 N40Z45XjHiZC0bLY0W6t2bA0lBNgEw06JWapRgbO7sWMLSL7nBplewha6ZoAJUgpmh/k
 4c2cuPNRHGQd5P95k/yqXUY2LMBNVf9jfVqRgSEK3m4cgcyEfn2zHGHftVZmbvRD3GDU
 Ox/r/cuGRIzaHJZ/+wbhBuikkRQZ70LHzq/p8lDc79xoKdQ65rNwJMjC0UQSc1Q6QT17
 uwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qRw3JcutFwZT5LBu77k4wiiTaer0piLMPSYqxWUuPmU=;
 b=pCt9Q9gK+tnmCwfT4ulXbR3G8smgWH9M8KHCtKabo/rD1YIygT6O5zLacZrl2Mxu4X
 mRnnms46EQGzJu3PphLE+oHRvBIMS6bBj4qKP7gB/SiBRmYw4mySE8ZSeDloAqaQuWLb
 a8A/aklmcgQtqrWK0Qbtl2Zd1o1P6OnUfP5/MwNPC9Go/livlaweKNZyx9/3LeQ6qFyk
 oyYlQWLtAzA6xuNGui646rD9zQ9eHFJB7x3uI+1vtmqjJ4Ev0ny4EEQQT2+AzjkAXgYG
 r528fSPksQZ0K8JCxn6kDppaZoTf3U05rx/U19w6vL1dCaZp8uN88Dms7VEt/j3RfLfP
 ttZg==
X-Gm-Message-State: AOAM532+lvLE1ycxMI15ZVSgEX7HuO+OE8au0w4Ia/3u4STByOgyRU3K
 rGndtWay/naECkioR8AaCgqav/jIww4rxcyRx/OKEQ==
X-Google-Smtp-Source: ABdhPJwLKddx2rUYAMf/GOSQmsyYccIpgA7Is1saY2h9EMnt+JAJOERrCBgxlhhOMW1Sny1+wEclvwRhfMf2/EW/uZQ=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr17466600ejr.56.1605565593956; 
 Mon, 16 Nov 2020 14:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20201116192117.45930-1-michael.roth@amd.com>
In-Reply-To: <20201116192117.45930-1-michael.roth@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 22:26:22 +0000
Message-ID: <CAFEAcA9_SVjgH5SCzPHZEDBeC2FtVvMboWVHTPG64ieUb5tVBg@mail.gmail.com>
Subject: Re: [PULL for-5.2 0/1] qemu-ga patch queue for hard-freeze
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 19:22, Michael Roth <michael.roth@amd.com> wrote:
>
> The following changes since commit 2f7c9dd5181524ceaf75ba3ef8d84090b1e9e8d8:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20201116-pull-request' into staging (2020-11-16 14:19:31 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mdroth/qemu.git tags/qga-pull-2020-11-16-tag
>
> for you to fetch changes up to a8aa94b5f8427cc2924d8cdd417c8014db1c86c0:
>
>   qga: update schema for guest-get-disks 'dependents' field (2020-11-16 10:48:11 -0600)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for hard-freeze
>
> * fixes for schema data-type declarations for guest-get-disks
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

