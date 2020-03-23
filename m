Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F918F5E0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 14:39:09 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGNIK-0006wS-W5
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 09:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60775)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGNHM-0006Nt-6g
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 09:38:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGNHL-0006LH-8z
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 09:38:08 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:44765)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGNHK-0006L3-Vp
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 09:38:07 -0400
Received: by mail-ot1-x330.google.com with SMTP id a49so13327956otc.11
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xLovUn17+NyywV5MntGL4YugD8f0YBvWkMdBJZZg/3o=;
 b=bSvFM7FW8aNIGnTYEF8uOsSMJotkocm8bHYPBKSxJCop831x9D6seSmM3/XS79om6r
 jO9v3lK+QNN+Z9AfoX1xp5HIPNEJkgIRPsJi6EtExUjK1/A7hVy3qTu+UXxx+iZwNuLs
 5xMR187ZxlLkTF4K3zyyUa+pA7O1XBLTG8ArpcOevOCbv59o9vi6I4LjiJoJUlKUwEnC
 ikWdaMmmOsz/TGKeCXSu4VvhmLDOkrStOP4Rpw8TEvYqyYLksYv+9gLHhhLvnr5hAJ3j
 OE1S3Tp/UePWKBC/cezQaIvUHrDOLTjHTxUWIMZxXdf32+Q38gVKPzO6rJ7Gd7qguxBZ
 0dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xLovUn17+NyywV5MntGL4YugD8f0YBvWkMdBJZZg/3o=;
 b=l4jvBTw8dzm4pKdOPj0B03RzmHmmuZdxJRdKYa5JMLiwyQXMvHL2+iZJDDRzPlnilC
 frbQgEOgPo0soGs2xOwY0LDMMA9gHIExPXwPL23x5QoMbub6W3w3qxR1W1l5DvNTZbH6
 XG1XqK80ZXxBnfWCuwRBm5o8VYzhQv04DN9/vBz4soUKjgn0Qs7mIRxSSOYRbPS0Mz5S
 v8TawOKy//oXvv/G2uZp8CWh+jriFNzNVcVw3/gR7B3im+THdOHU12jnBeZh5lfgvwoa
 GQmJoMAtohYIjTO+/FT7c925MrFQQWQ0BicB3ZVn2aUZjxvF4j3v4IYgVEDdFS6DSCUW
 EDFg==
X-Gm-Message-State: ANhLgQ1hfMqbeP2vYsRkdrq0J9FjgAD31Y8yHtGEAU64wFFVe0eiciYC
 6wJHIBjlJAuC5WDwHis9fcNK8OXlVHvxCWmejx9Ocg==
X-Google-Smtp-Source: ADFU+vtdi5HpEJlve0tM5gSt9xKB0Z4XnMeIyiuudWpx37a+YcUknoUtX/sm+xVRWl7LD9AjZYTTK7LZpZPG5v+dJoY=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr18060050otm.91.1584970686085; 
 Mon, 23 Mar 2020 06:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <CADUS3onjS+T-SSYC6ocKNm3oXsCpiQbDa0eJobhOnts3gZ_gEw@mail.gmail.com>
In-Reply-To: <CADUS3onjS+T-SSYC6ocKNm3oXsCpiQbDa0eJobhOnts3gZ_gEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 13:37:55 +0000
Message-ID: <CAFEAcA8tU58_Bdpp7tmpF+X4D5zyxpV4pA-wz97EpP41SQ7sqA@mail.gmail.com>
Subject: Re: qemu-system-aarch64 windows binary run Arm64 defconfig kernel not
 working
To: yoma sophian <sophian.yoma@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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

On Mon, 23 Mar 2020 at 13:34, yoma sophian <sophian.yoma@gmail.com> wrote:
> My environment are:
> 1. the versionof qemu-system-aarch64 windows binary is 4.0.92

Is it possible for you to try with a newer version of QEMU? That one
is a release candidate snapshot from before a release that we made
a year ago.

thanks
-- PMM

