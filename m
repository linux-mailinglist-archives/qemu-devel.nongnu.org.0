Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87BE30762D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:32:06 +0100 (CET)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56Sz-0002ac-LB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56RW-00022K-VZ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:30:35 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56RR-0005LZ-Ky
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:30:34 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d22so6400078edy.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwS3h6pPg0PBFTfPnJl2rA505qJ/r0XCuWZos80dRA8=;
 b=YE27HjGqFic2mh2ePvLyVH4BrDtkyKoSKwd2qpYFIhCgTlFTbxc/7K/LJ50yNR/UBi
 nfTLCpbYPjpg7RAUb5NtW8gA5APIQpHn8BAMYxdM5l529gSv5FIZUcePc7yl5eUiPqfJ
 EjekPx8lbaNwzpU38ngofObYxQu+AMzA1cDP1mCmKMjx7+XZL9N35/LaNrrJ9iD7PRVR
 hPEVQrEpx4C0BrsbvFTcuCtLyuvR8Cg4Od7rxePocOWs/+dXY4mWNtYRAaOeAbNw5QWe
 Za74T3yyLymaRS3KH3HDUtmXGxWZ1a3JA8FY/19UFv9V9+COOT4g3P2DHVM4zL4FOwHB
 msUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwS3h6pPg0PBFTfPnJl2rA505qJ/r0XCuWZos80dRA8=;
 b=rzAD3pGKC/zkuasl3O1hYM9i7y60dkuURc+6xqApAo0/qgywNu08p7IEY09BpHcDLb
 fNaV0fpj0yiNrRJMEanRWy2tRD8qhx6lvalxAp6OTgwnQe2gzKeba/QD6FzyUbVfiDkD
 BUfs5fwdiWAVxLzp+NBnuDjNwVulJ7HREnqoGid420dfGWKJ07nigO2rpg5FPTMh0q0H
 9HOPqjJMeUY5BeRAIZEmXsh7ez1McOU63a9ljoiRreURQIbkapUNFM41oTzq+d0ugAVX
 WZphJeZ1H1uG4odWgR9ArYfXJdLrtIx/yYWuxywPBKRBN/JjC+CfX8hkp6g5EszSEBbx
 Qu6g==
X-Gm-Message-State: AOAM530YufIT3NFB+xtYHEXAVxErcnU7a7P4jw1fBeph0JiKhexaisWE
 lRuybP74GpQh24HOKf1+iAZ7cMOwOptaHdq4+RcxPg==
X-Google-Smtp-Source: ABdhPJxSshSzNxxID6qYlKekGvLdivN9JsPNPeOjLFMrMpCw6cqEPSd0rCcF0KsrcFrof12b8ZHn7/3Bi/Qj/YoS6as=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr13644381edv.36.1611837028102; 
 Thu, 28 Jan 2021 04:30:28 -0800 (PST)
MIME-Version: 1.0
References: <20210127110113.2111855-1-kraxel@redhat.com>
In-Reply-To: <20210127110113.2111855-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:30:17 +0000
Message-ID: <CAFEAcA-9SSpNQ=39m-mfDT1BzxT8u+ACMZjmEV_LDbdZQ8ApQw@mail.gmail.com>
Subject: Re: [PULL 0/3] Ui 20210127 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Wed, 27 Jan 2021 at 11:06, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25=
> -1' into staging (2021-01-26 09:51:02 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210127-pull-request
>
> for you to fetch changes up to 15b08119add1e49ccbc7f7d6b3a04932d2430d7e:
>
>   hw/display/vmware_vga: Remove dependency on VNC header (2021-01-27 09:48:04=
>  +0100)
>
> ----------------------------------------------------------------
> vnc: fix gtk-vnc compatibility issues.
> vnc: vmware svga cleanup
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

