Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2623BA1C2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:54:25 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJce-0002Rm-EZ
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzJbN-0000mc-HI
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:53:05 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzJbL-0000Wo-Od
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:53:05 -0400
Received: by mail-ej1-x632.google.com with SMTP id hp26so3527337ejc.6
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/dlfIX+wXLltxHKivMKtoVpUduM4H5ZpnE8BHmhj6Y=;
 b=hc0oKlPjQIcaJsrF5mKxGhG0nxVQw1IlV4WCZcMBBG70ZJg0ebXuPYrRuFsPNpKMi+
 ztteXWXZKXH4kO89bm07TyQFVgLYfbKeWBzG9yAygT9+dXjoBov2u0uVuhFOjXu6gMCk
 TZeqjb+RmV+N9pmM/Qyy7+GUDWM7Hp4hQpeP001SOEoSW35QofMt0NRK4Eb34oHpFvM5
 gWNkp5ySAAvL5RwgtsYgv3P8jVmQrcNveR/bUrOyjbBlZ0IpJs+SN4TLcafYtX06LBmb
 iM9MVBvbsjFQo2ZAsSBOr5pBbDS6MxvQQZgu/gU78uuf6HjZbLnHnkZGwEpKkUD5IDMT
 keoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/dlfIX+wXLltxHKivMKtoVpUduM4H5ZpnE8BHmhj6Y=;
 b=i2AxeTPCZ77TK+cw4UndemTgHXRZgoKsaLYwh812kx9ZG/iKIgaPbtlhd3xhwq25O1
 9goSDTJq+Tkc0kkPwBXBzFWcZWNE+4+Kh8z8ElsStKSAEeq+LU8/0rD2j7RSvvsBcwLl
 F2uFnII+B6+g8C+Vch9j5b7a6eCxf3UpkQervKY7nrMDkJS5x8H2/bl2g/kK36IdZa3O
 nyx2UXX0OdvwPnLi5zehl+Oi/QI3fnrNRjyqQigIeDDgOnqOnyClzj868q+eHQeNx6LX
 Y7DsUdVErcJfUdBbpe/pa2I2/m+8lezyzi9ZkuxFJAFw/xsqs+7cFSLFLe4WMcvk5htm
 EEsQ==
X-Gm-Message-State: AOAM5313JzJGCpNKbhb/F7hIuMPnDm6y3cSdq5q3xHjcGWkaOzWinywm
 3JKRdLEywfYSs1x8CZrljkKFdEe3qymVNpOSQ/qnRw==
X-Google-Smtp-Source: ABdhPJz54ZiIcyHJF/1isA3TpXVXc8gM3f68lr55TGtxrkcY8p6CTASwTJjrqFqQ4f6sooWcVlSl/LcvltfAp2V7l+E=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr5498131ejc.85.1625233981998; 
 Fri, 02 Jul 2021 06:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210630160206.276439-1-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jul 2021 14:52:24 +0100
Message-ID: <CAFEAcA8DS-iJf2RUrTzpcrsW5bQT++q26dtG3APbVm4mvsZ7tA@mail.gmail.com>
Subject: Re: [PULL 00/24] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 17:02, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 13d5f87cc3b94bfccc501142df4a7b12fee3a6e7:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-axp-20210628' into staging (2021-06-29 10:02:42 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to a527e312b59ac382cb84af4b91f517a846f50705:
>
>   vhost-user-blk: Implement reconnection during realize (2021-06-30 13:21:22 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Supporting changing 'file' in x-blockdev-reopen
> - ssh: add support for sha256 host key fingerprints
> - vhost-user-blk: Implement reconnection during realize
> - introduce QEMU_AUTO_VFREE
> - Don't require password of encrypted backing file for image creation
> - Code cleanups


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

