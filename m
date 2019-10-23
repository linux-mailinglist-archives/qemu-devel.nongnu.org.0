Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF0E2155
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 19:03:47 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNK2z-0000cA-Jb
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 13:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53847)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNJxx-0005ss-Q1
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 12:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNJxw-0005TJ-Hs
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 12:58:33 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36366)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNJxv-0005SN-RQ
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 12:58:31 -0400
Received: by mail-ot1-x343.google.com with SMTP id c7so7277743otm.3
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 09:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PyRVgurUS8HqVE4A/x8kYiZvg84IiaRSvtOIhlZ8FVk=;
 b=cnh+aeuc37TtyrbGmTnwX+5cLFyCCV5Ht9aUPUOZU3qyfD37HnvEbg940vAnYv8yPw
 h4UMAstXGnTN2o1ITvStCwsQrbctu4kaNQi0MjWlsKeo1NGW6yGHBF3ZR/0yxxO0K9az
 3CjsB0CWPaBMe1iVpTQgmNspA6EVD2gveDKlBKsDbS5MFUxBmSeX4ARPjTkybA1ajpj/
 yefK+Y9djXVRqdg9ohjApxajV89NzpAy7QqR2j/CN2p1E3iw/ybklLt1FQ1ZSKmHwXEo
 ZOtZO2gmFRPq7kHC0fZnT3qeKUeQChjVrPGlOzNms3MA9QQx9u82blU+QyVAugH0ShHc
 VZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PyRVgurUS8HqVE4A/x8kYiZvg84IiaRSvtOIhlZ8FVk=;
 b=otrSuWYRq/oIBsEd0NbtWCgUi/ttXtv8zIVLPs5oZMtep1Iok8+6Tmxseh3rxLCPn5
 jB+qPH/S9bsJ7hzElYuGaqrGYTnf38h+rTXdSoLY1bk6QxtZEMr7cXsAjwce6lemYEEW
 BVnLto3VZiN5ikZGwIQYBGTS8gzl/Skm4bBe82nmwMAV6HxF6ertYbwUJxKXdpVhKEj3
 qo0fx3XCz1Tsj6W7KW7vuWiU/hvAL6lt3EwdzZ7kldhN5/Wxef58heW6yaeyiIHnK86X
 7wwpKQavCVGPuLawwTJ+WVRIgF9Hy+TlyM8slGlCHNwYznBfd5qLRZNFxu6KY52Viaac
 syrQ==
X-Gm-Message-State: APjAAAXb/Q7SEBJtPE+1y71v2hRtAStjukdMhU2hdiGkKNOX8PQ98ibn
 1QqZVG+RZKa4d4ob53TseQsWUc6C0OmL7MfbjSk74w==
X-Google-Smtp-Source: APXvYqwYPnuyon/PUZG4CMvOnhK+QVG/okcHwlmmyWVr9YEDcmdYOZ7C4fQrjzyk++gr5HPuSLL1LSZH5XV/Zn5z+js=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr8150247otj.135.1571849910809; 
 Wed, 23 Oct 2019 09:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191023020126.24991-1-eblake@redhat.com>
In-Reply-To: <20191023020126.24991-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Oct 2019 17:58:19 +0100
Message-ID: <CAFEAcA_O94Lr+HwapYPfgJ6oLpJ8y-H6E=3NMA4Qr04ZVTOCjw@mail.gmail.com>
Subject: Re: [PULL 0/3] NBD patches for 2019-10-22
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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

On Wed, 23 Oct 2019 at 03:04, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit f9bec781379dd7ccf9d01b4b6a79a9ec82c192e5:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20191022' into staging (2019-10-22 13:45:09 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2019-10-22
>
> for you to fetch changes up to 23ee0ec2360b51619cae452c4faa8590dea74a6e:
>
>   iotests: test nbd reconnect (2019-10-22 20:51:31 -0500)
>
> Several other NBD patches have appeared on list, but need respins based
> on review comments, and may still be okay after soft freeze. But this one
> is a feature addition, so I'm sending the PR now, rather than waiting to
> bundle in a few more.
>
> ----------------------------------------------------------------
> nbd patches for 2019-10-22
>
> - add ability for NBD client reconnect


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

