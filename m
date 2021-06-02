Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5CC39929F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:34:02 +0200 (CEST)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVgm-0001gV-3R
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loVej-0000hS-SC
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:31:53 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loVei-0000xV-0f
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:31:53 -0400
Received: by mail-ed1-x535.google.com with SMTP id i13so4061391edb.9
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4vB2wtm5TDesRBaY9YZLaqhH4WMOcFdnRdNb+Ep6GM=;
 b=AQ0HOG8dgWMA6etMVUJswxHXyu4sxAHTh19i5I+i3N9WNT1oUdvPP7xq7bs4B5akgu
 TtuIXudoNYIts5W0aFB7MEhj2SwMehhMtrwqEYm9wTn6vNGdO+m+hdx48dokQs6+n9Di
 Avom30ss69yd2ihzWfiw8Ic2M8YgrtvAhsLhNbKo6SzcVNLJt4agk2m61Wl6F4uB8boF
 UQJIQblHwhHHr3A+57EJ8a5gW+SZ3CEnWOkTRUjjYGTHAeNcCiCI03VDefgi76EbrWbz
 5yc13wp916e+9pLPwW5F3rJR2jqWBmXxqZ6uKJF9MMmUmcnvFdnJka3+mEkk8NOwwC7R
 SN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4vB2wtm5TDesRBaY9YZLaqhH4WMOcFdnRdNb+Ep6GM=;
 b=WYtbH03S7cEwBO6LOZsiw/5ippL5i+pn+Q3ULg08qhWFIbUm+AdGviOMTkwSllYes5
 gvSm1o7yyKgy+dw8NtswTamI5dFGRRj77W6C/9lYRg5gytL1g10DZV9H//grJt6iyYuw
 jo2P6SzZ+2mEVTXbbydiRXNxFQ+Hgv5JcPWPj67NlUESAVcZn+iUH2oNl+ZfGF15QJmA
 t072ozcq5amPcLxqMA0/Ea20yxD22rE4xPsjxkWcpJuHbIo4YJ8V++ccBayTOmMsVELG
 Pe54b6mLPKNIRfhc9+2QsRifWa5cV+qr9KZ7mbNApibfhcCyJZe4zAPBi//i3pBHEjOC
 3DAA==
X-Gm-Message-State: AOAM532aZ/O1J5zJInYHE6zMMIptxbMO9PK8S7+UtdzBxzBLC2vikKY3
 ODPA5yexEmKAUqzsuWg6n3DA1HX/KWlgyuCdu7f5VA==
X-Google-Smtp-Source: ABdhPJy/iJVCHT/Z8j2u1kYHLsovz41lsRGTT6SlyPy2NNCMGR6FM+4fKAWdQ7vPb18uQ48I6cDzmNJK2v1xn1WbkjY=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr39738663edu.52.1622658709851; 
 Wed, 02 Jun 2021 11:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210602073606.338994-1-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Jun 2021 19:31:17 +0100
Message-ID: <CAFEAcA9iCM2_0nHqkULCw=4_nKO3AvcbpygN_z_ROyaXvNnukA@mail.gmail.com>
Subject: Re: [PULL 00/17] doc updates and CentOS 7 removal
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 08:36, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba3274:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-request' into staging (2021-05-30 20:10:30 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-06-02
>
> for you to fetch changes up to 2a85a08c998e418a46a308095893f223642f6fc9:
>
>   configure: bump min required CLang to 6.0 / XCode 10.0 (2021-06-02 09:11:32 +0200)
>
> ----------------------------------------------------------------
> * Update the references to some doc files (use *.rst instead of *.txt)
> * Bump minimum versions of some requirements after removing CentOS 7 support
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

