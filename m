Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00438CA0D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:25:54 +0200 (CEST)
Received: from localhost ([::1]:33994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk727-0008JM-Cp
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk70c-0005ff-4O
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:24:18 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk70Y-0006gZ-DU
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:24:17 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h16so23734575edr.6
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KThc5WSLJuNDVHi0w9ltHRGxQCl7atPQ1YcrnBWH3kY=;
 b=VDdJvqaj4fXF1cbqDFFz8bHxBD8K65Db7eNvqRLuQvkbeonCmuHtzIkj2b5rRVDE0t
 GNu8sPAJdTDsz7YkZqxTyuOKhPbCDc/ulbMfijBtfT2JESbR86k/SpNxeBjEIHY98DZ7
 fCyQcdGzShUTsiS1JnmVEGQZOWkXgFQvJ4pdjAusb6a6lFtlFgzucFnKqxKpzOOEA3XU
 BxiZ2I6Yh20NQK0xrF9sxBAF5B2gCLoCCH5LfLQPQPkPDUu4e0/5QuJxzvmS/MLO2iui
 UdfhPHBYnrq0DZBY5avaNTpg/JTmykDoj/w05pecbz3XgVfvoHTc4aTWcasYK189ZApm
 L66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KThc5WSLJuNDVHi0w9ltHRGxQCl7atPQ1YcrnBWH3kY=;
 b=fQhTBApT8dZqMh5tYftI5KqpnPprVPr7m5l9N6wn6I2p0vWQ87HF2m2GGXNvtGqK5b
 eBZt5nhwZO0i8CoqWxW+Bmfh++KrHClOkX3Huf1zRPR7Pl7is5agxsfV6cI16ZfKqQFr
 o7D6tuAIyiuKbUnwASBd3NPt9D1XStarfrXFJzaygPMwdDu54X0FKh2Qxw9crv0Q150j
 N9GNKM7/0xC87eODsFZqKf4ZjAdeq9x44cG7z8AHOtFL9XtqUchK/y8Xz50qta7N+jqz
 2weBkdgLbEhL6ZoWWXBZOPfhssN3FAtaGMbtjD3f/agJ3PqSQVdEp2GR6NW3z/fAMKKI
 yvUA==
X-Gm-Message-State: AOAM533T1k3k4FuG3rHiwP2FqBd5DevKxWYFX5eGYMfBRAy6fYqLBl89
 Gc7sMBHK8cRofwhxAgUiSaWP3DjGHQ3JpARA6f+LdA==
X-Google-Smtp-Source: ABdhPJz9d9HgyNHLyusfrEqpPyeJlpZn/60GH/rOAPfGRC4NQpSW3sA/hGJPXi3T51FtWzambU0VX4FXC1FapxmIRaY=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr11864299edz.146.1621610652913; 
 Fri, 21 May 2021 08:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210521125119.3173309-1-kraxel@redhat.com>
In-Reply-To: <20210521125119.3173309-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 16:23:53 +0100
Message-ID: <CAFEAcA8cpNDC1dgGBUXsga=ZLS=vvVDK9SGsa9E0DZiQEWFqkA@mail.gmail.com>
Subject: Re: [PULL 00/11] Ui 20210521 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 May 2021 at 13:56, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 972e848b53970d12cb2ca64687ef8ff797fb6236:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210520-v2' into staging (2021-05-20 18:42:00 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210521-pull-request
>
> for you to fetch changes up to d11ebe2ca257769337118d3b0ff3f76ea4928018:
>
>   ui/gtk: add clipboard support (2021-05-21 09:42:44 +0200)
>
> ----------------------------------------------------------------
> ui: add cut+paste support.
> ui: bugfixes for spice and vnc.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

