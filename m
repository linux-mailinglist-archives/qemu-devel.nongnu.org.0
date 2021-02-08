Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F123129B9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:26:08 +0100 (CET)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8y7i-0007ju-Uf
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8xbm-0001Rf-EI; Sun, 07 Feb 2021 22:53:07 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:42805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8xbh-0005q2-6f; Sun, 07 Feb 2021 22:53:06 -0500
Received: by mail-yb1-xb36.google.com with SMTP id b187so13204576ybg.9;
 Sun, 07 Feb 2021 19:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o18JuL2rmKbDeTint5xJXxhuq2JFWlh1wUm8gTGTPwI=;
 b=m5xCpI99JYSLf/2BS6sWhZdHfoP5XrSlt2tJ6/kquwAZZELnt4y/qMWjlzR8pD8GNU
 +cwcaOQIEeLQ1I4o0bjNBnoYUNoMgVm+yv2pjjWjJyaSxIhgl6xpa2hq/veS6AFwrQpc
 EUpYbgC/2UWEn6jnL8ysHW7e2ZuFtX9vgK01BwNfESKkSvOY3PbGSNQxZUnIVC90jx/x
 bS6TCKLX6dUK9a5LEowxJSxe76VoNu9NX2RCZw12Z20vYKRzVAlt2hCLB0m4eXtD0zV6
 6/f4ImMhKn186EPYfKCMV42OdI+3ndFZZ6jqN16kTffpt/gqctSqIOVU/YEgBLAYDYF+
 9a+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o18JuL2rmKbDeTint5xJXxhuq2JFWlh1wUm8gTGTPwI=;
 b=pQagRfxK8g/oN0dMFbeThhlJwXs5B3FXHeKAA2CRERDxNWLRDGCtSel2e+h5PsEyte
 zLPFHDZz7wCSKMXlpI4vbRi4YTu+McP8zsxfJdfEJLZqR5gy3DLy30ajgDpcfcop9F8r
 B4pbbRJXZIDGd49GZFw5jm3CS3t6+UAmor/ZLJ/twCrscrgizu6usuxzufNW72fo9VPX
 xQhX/5qgnESgYOgMSC4cTgoysVlo092qPSfDBd2zGDaaIgepanh6pZhbo3iKGieJvbjx
 SLRNV1yhNFQVgGB/Rr2DLkjze/8ukZrNSKIWQ9crffK0zw7/DJnHMoqdSXBV7imQz8MW
 6Wog==
X-Gm-Message-State: AOAM532hH24KYXy43J2pkDm340Mt40kZhBaMfcvjxsIjL2N8WkCacScy
 aa2pyyYcyMp0IfIR1jsffBSeCpMP5ZC1FnGMpeI=
X-Google-Smtp-Source: ABdhPJxEE3rLKyC4Wlsgmlo2dmfJE3HZDrZ3osv3VdFWFmBnqBNOemyjrtIJv8iVSk/e9uT6t5IEqeicRYMEeXuCzrE=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr23419000ybc.152.1612756379528; 
 Sun, 07 Feb 2021 19:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20210128064312.16085-1-bmeng.cn@gmail.com>
In-Reply-To: <20210128064312.16085-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 11:52:48 +0800
Message-ID: <CAEUhbmVDXv_2tKgOU-RBuaMpWkV4gr144onFRbiQbVRmXhk=yg@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/sd: sd: erase operation fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu-block <qemu-block@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 2:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This includes several fixes related to erase operation of a SD card.
>
> Based-on:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226785
>
>
> Bin Meng (3):
>   hw/sd: sd: Fix address check in sd_erase()
>   hw/sd: sd: Move the sd_block_{read,write} and macros ahead
>   hw/sd: sd: Actually perform the erase operation
>
>  hw/sd/sd.c | 53 +++++++++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 22 deletions(-)

Ping?

