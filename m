Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F6F30F505
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:33:38 +0100 (CET)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fhQ-0005YX-RY
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7ffk-0004dD-6x
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:31:52 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7ffi-0005LR-DN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:31:51 -0500
Received: by mail-ej1-x62f.google.com with SMTP id hs11so5695789ejc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QH75qojPyWFSDNZbeOnrpAUYY95u58vKv1gk+W+Btzk=;
 b=R0nZLgE7wIWtDn8L++ILi5pn+qf7JJ8OSUrTPpuXbCOHDrm1NIzVSvBKyM0nth812+
 3u6c4TCAHGzN3OU5uCoRLnsatkJifO4LzkQXYCbHQapsL6cvHPmAEP5MEmm1mpbXF+A/
 a3axQT48w0Cl4YEA94nCiICJSyBS84hJT3gYEgPAzgiYFQelqgJvitieUuaZxwuxZw7J
 PlFFOxZL7D/qk18hO4jgFMwvZSQLQe31yTkMZF4EHxx0F0x5ItS2Fg8ThNPMEu+ECiWp
 ikfY1hYts/GQLt1fmQOL4QUnuwyBE8ZRCZRsBeaclrzxnv19sDNw0gq7GTc2fiMXbHId
 irzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QH75qojPyWFSDNZbeOnrpAUYY95u58vKv1gk+W+Btzk=;
 b=JRo5hb2ksbz4OTLsozBPdo+qNQbv9dlSvLQRzKGK5ciFcmWH6fy2u7tk/ozxNM4wVF
 PogHK9K9COMhfV+HjAAgegu5q784J1AEMMft7Qhx+CSICWxBLjIi8YebxD7MGNZ7Ngrl
 17La2hHzqNXL+VlAj5091sMahk5cj8qPuzdnG1g5gPTbCIggQd11mcm5fMqgPKpMuYKD
 IFbqua0MhtWIWxYcGbBSsmsCypE6UAmQVKcmBXke1ApfgUhNKOw/Tmhj3V0qqt5M9Eui
 TXm+h/ObUKfPuZVPEV+w2nzBaVjUobS2iEuu6hcbE5MX8bIaxxuXIcoNFG+rkzKkMwGP
 NbMw==
X-Gm-Message-State: AOAM53272KBCqbk05L4hXcLCsRgeR/PWG5sApFOxL9Xm8V4eCaCVL7hv
 WsqshLooLNjrpxd59pGF/DHnAL8uFGAKu1ZssSQS0g==
X-Google-Smtp-Source: ABdhPJwmeh5/fpJTXjiO0OFiTGB02cVcCBL6Va5IkdT67b5rmtZvAwCcaq0sgQH+00iSZjZrLb7taMvZgBkO9BjYq88=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr8455850ejd.250.1612449108710; 
 Thu, 04 Feb 2021 06:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
In-Reply-To: <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 14:31:37 +0000
Message-ID: <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 14:23, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
> Unrelated too, but allow me to ask:
>
> Should we move the tools (qemu-img, qemu-io, qemu-nbd...etc) to the
> tools directory (virtiofsd seems to feel alone there)?

I think that would be a good thing, yes (things documented in docs/tools
should have their source code in tools).

-- PMM

