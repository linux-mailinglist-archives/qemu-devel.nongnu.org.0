Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D01E187037
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:39:07 +0100 (CET)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDsle-0007CR-8F
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDr9i-0001n2-Jk
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:55:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDr9h-00088P-9E
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:55:50 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:33168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDr9h-000847-44
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:55:49 -0400
Received: by mail-ot1-x32c.google.com with SMTP id x26so1082401otk.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QPe523lZS9svgzUUFlwEJ+J5PNFdfPSruVpJVH9Hasw=;
 b=XVBC6GooN9JWRYEJiNgTp+dexS75d3bFLvbE0IE7wGmMPaIavvjdrEXyji952I0mgu
 SbZN3TK4kukGTGmIBid3FpYgVIEZu+YIjLMhz4tQ9gNdaO6q48RQKV6GiKDpPB8j9mA+
 C2yqnohSFkDfkPEHNHbHsOAe5bzFyHoqV4oE24k62eZH3nPCSriPnp+DgDWSYObCNRAR
 xrf3kFuTk/7YsgoeA2X42sybi152RSz/SqXygQxuSvEgT5hDR7ecDEvRoqj3KeV3fH4F
 AUP7ZrW7GxDLv7vH4YPOnO9oxIsnHCEnCzC/UVaD9bg0VWt4jtOgp5TsNq5bOE6nC+Iw
 IHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPe523lZS9svgzUUFlwEJ+J5PNFdfPSruVpJVH9Hasw=;
 b=UUcPBb475o7L/kf/bUl2rktlf4cl2CfCquASb8m8j1TGVwzWZPeV8RTkGyzVt+b/uI
 Mx351rdYg4I0UR5d+4adgu4rUW30B1AwcwYs4WBMfI3cG3bRDE1QAqN+WlHOwEV+i4w9
 FcpQDsahY38sJ6BYUehKMTUfM82mmHw78xRb3uGZ/RSNKxFT8tBnrPso+9Pcih+NNvde
 uyU1Yc9gDius0Hgv1PQh5Y2fiShhxuy0Xo5gnM+9mRU44xUnO1rWA/82UajebVIqoJSZ
 RqswwLTdmFo7lTeNTXAHwCYVTLQrEwaMu/iZzs3iVEiRtjJqjHiHiYEIbRgeZ9WtmpDD
 q1wQ==
X-Gm-Message-State: ANhLgQ25ygapYKBDkzZEhica/oj2vlY/1IiIc8ZbhaFBlQJFM4goWjdI
 Eo4srtTsNv/U9JJH2btRnTDEol0FM7w7ki360Ye4BQ==
X-Google-Smtp-Source: ADFU+vtHSmvZWMD1LjtVGBEBp2PD3+uM4IZC+aav5afP0t+RpASzWpx6K7k9Fr5XQjzDHtdUswWwcSMGhpwphvGha5k=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr21676503ota.221.1584370548211; 
 Mon, 16 Mar 2020 07:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200316113015.28013-1-kraxel@redhat.com>
In-Reply-To: <20200316113015.28013-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 14:55:36 +0000
Message-ID: <CAFEAcA8mv1WoL-Jr1Kkc0yPm83ooSVX=e_0uS0K-Gce9oEy3Ww@mail.gmail.com>
Subject: Re: [PULL 0/6] Audio 20200316 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Mar 2020 at 11:39, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 61c265f0660ee476985808c8aa7915617c44fd53:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20200313a' into staging (2020-03-13 10:33:04 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20200316-pull-request
>
> for you to fetch changes up to 49f77e6faf36cddd84417f9080462413acdbcc27:
>
>   audio: add audiodev format=f32 option documentation (2020-03-16 10:18:07 +0100)
>
> ----------------------------------------------------------------
> audio: float fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

