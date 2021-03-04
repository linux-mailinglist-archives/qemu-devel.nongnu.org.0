Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7A32D665
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:21:22 +0100 (CET)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpmz-0006T3-I4
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHpjR-00030g-4h
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:17:41 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHpjN-0003kJ-PG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 10:17:40 -0500
Received: by mail-ej1-x630.google.com with SMTP id bm21so31259332ejb.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIUQRA+PO7LR41jk9zKuGHTq718XRFveDOll1xWpxKY=;
 b=O3RzhHaQgihY1uDjLJ2pVUlYuDGQ/STuUSJesaXAireSsmZfbF4MMdHEuKc2nd5M5M
 sRIFIJkQzxoGXs6FcVV6y2ciBtSZGNg+iJMch77i3TzJGbJVxcKr7Ha/ZYusLfNiDdRG
 44PWmjduWcCsgk1AGBClrCjrifltMC3viyOGO7HposVcq2o/wvi61AczWTjt+YdkNyxx
 16Ol6g3rruY07q/8Dkqd6YuempPN557phFWXMq4fg6JYUzUP2WoTB5PyMyd3xX0uNr+F
 z6RwKWhYyO7IjPf7o2KXP2O70xeT8w52DJjmmk7rQeIjo5iYRjCgpKckJPQ/+iOmeehq
 J+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIUQRA+PO7LR41jk9zKuGHTq718XRFveDOll1xWpxKY=;
 b=HFiG+hUTnMhEX5rWIqxLv4n6XX48Nw7V9FHRsCJgB9ULr2AKMpee2DTHqqA3Gp/lGt
 RXTm7iH9wPcNYeE7tuf+uT24N+asXyIFqEbdT/hjF2ax9jb92llVdxnahltJnaYs8393
 4iPI/15ZEXBn++QNotxuJsf1DyxdQZKkxRBHRm4qOKzbwOYbPwbvQLIqjwGIB5jsjCOk
 17DccUi0NCYu7s/XMKt/yYMEK7KH+YBPTKnPuboeUkaHdN0aEaHwMESUnSR+LbcRgvly
 57AmmxP6TifPABuKR8GlZFJCE/+auCv3Ks1/3MjdcLGw03lZp+pXJZUgbWxSKvE4yq0c
 KIAg==
X-Gm-Message-State: AOAM532dVwcux17Hd3pUUAVoWJIQDn3A6eFRKOTwTrsV7oH8bVZL47iw
 m1V3es91ilzZJgq2gfpq+SkLV4fVDyspsBRPnxH1Ig==
X-Google-Smtp-Source: ABdhPJyh0Wslm6thB6j1K73UH2c7/CkKN4+dNeBhYZih0UQT9pDnxcAwnhgL7dpgySJPbaByIAQc3hNqUqOvFEVyJiQ=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr4819993ejg.482.1614871056061; 
 Thu, 04 Mar 2021 07:17:36 -0800 (PST)
MIME-Version: 1.0
References: <mailman.5018.1614765575.30242.qemu-devel@nongnu.org>
 <BE1A7AC3-5C89-4D23-A83A-1FA8ABED1562@gmail.com>
In-Reply-To: <BE1A7AC3-5C89-4D23-A83A-1FA8ABED1562@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 15:17:20 +0000
Message-ID: <CAFEAcA_aadFc5y6gfen1+XqA3wpRNB8nnFzujxLTBKrAY6c4Cg@mail.gmail.com>
Subject: Re: Qemu-devel Digest, Vol 216, Issue 57
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 15:13, Programmingkid <programmingkidx@gmail.com> wrote:
> This stinks. Older versions of Mac OS X were perfectly fine for
> running QEMU on. All my intel Macs run  Mac OS X versions before
> 10.13. I'm thinking we should at least support Mac OS 10.10 and
> higher.

This is a discussion we've had before. As a project we simply
don't have enough macos-focused developers or the CI resources
to support anything more than "two most recent versions".
(That's the same policy we have for our other host OSes; it's not
specific to macos.)

-- PMM

