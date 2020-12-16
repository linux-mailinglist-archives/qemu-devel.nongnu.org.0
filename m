Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3442DBF13
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:58:21 +0100 (CET)
Received: from localhost ([::1]:44798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUVg-0006jp-7G
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpUT3-0004pi-8u
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:55:37 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpUT1-0007wh-AZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:55:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id dk8so24352973edb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 02:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f8/yuVEzPDOltselTzv0lycYTyT/hSdydb68msLtcvc=;
 b=iPiOAYP8rfvKgr9KY26X39nNK41B2OuZdpvEHkWrTA0Vtj5TnEm32LI/tXWnwn+gZK
 1uyabsDPckaiaaDe616rfWJgh2IOjzGz9QSJxWpNPY3F17wo4j5WHhjfxIsMIfQlOgyI
 zikPnB+MhnPTDlge+aylpRGJ3/RRJ23xo2zRfT+e4+khfjA4zv8E84HrMd/7CwIijCsV
 y0PdvUw9IzFkFJhkxUyBU4BtiCcHhfV6ellx3MWXNbZt3gcp4lofjnB8AOu15PWBOx3l
 OxV7niz6iWPFn6Fb7OxIl+unc3bglqVeLrgaydvHwrJPlIeP1p50AyUU5o5DWYLw4BBy
 5PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f8/yuVEzPDOltselTzv0lycYTyT/hSdydb68msLtcvc=;
 b=ELR86/It+2TQiYuOsjT419unuz5W0QUObIOuGSEFo5tbKM4Do3aQmg7Vbt9UxzvzNo
 CZsBmk+gp8jhOKoDRw2ccBanLzKF8y7lWfO6L9CBpiMyuQYpg4oY579zUomcq8xqKgHY
 kh7hN+n4piq7n6rlyfZMdZYjPwrMTNvQMYR+Y4jdwdWBBwZUPkCOWMI+JddSL7if0GQr
 NSn4672wps2hSmFMpDnp8mZbg9YGO0ximHI1/eO04lswcIrAhBKaPv9S6HQWps7BKKXd
 grPy4gGLgrxSqchnqaczQfr13UgQ7gqof1kz+qg30zIH+rdWUe66pQIEssSwL4DSbQtd
 RTeg==
X-Gm-Message-State: AOAM5325ZmWz/phG76Wv3MH4BFy/2gCPDSpGLnABMufIdT47AT67UJLl
 F+F/DP0IUqzx9wheUxmKeuR89umQe7W8T/4UCoYVBg==
X-Google-Smtp-Source: ABdhPJxiJXsdMxVVJFuY7Mqqm3e374Cu4x2bboOnV8LTIW3HIhvxtYjF0yxEan0+HlHMJIL2otVKOMfDRH+3Jugubvk=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr6052343edw.44.1608116133139; 
 Wed, 16 Dec 2020 02:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20201215175445.1272776-1-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 10:55:22 +0000
Message-ID: <CAFEAcA95L6zjs1FO=bLjgfs8w3DuSinWG=Y6POCypaZTbaRBNw@mail.gmail.com>
Subject: Re: [PULL 00/45] Misc patches for 2020-12-15
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Tue, 15 Dec 2020 at 17:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 69e92bd558d71fdbd0c1989391b20edcc700da=
a9:
>
>   Merge remote-tracking branch 'remotes/ehabkost/tags/machine-next-pull-r=
equest' into staging (2020-12-15 15:35:47 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to bbd2d5a8120771ec59b86a80a1f51884e0a26e53:
>
>   build: -no-pie is no functional linker flag (2020-12-15 12:53:16 -0500)
>
> ----------------------------------------------------------------
> * New -action option and set-action QMP command (Alejandro)
> * More vl.c cleanup (myself with help from Daniel and Igor)
> * Remove deprecated options (Philippe, Thomas)
> * Dirty bitmap fix (Zenghui)
> * icount caching speedup (Pavel)
> * SCSI race fix (Maxim)
> * Remove pre-GCC 4.8 code (Marc-Andr=C3=A9)
>
> ----------------------------------------------------------------


Applied, thanks. (I fixed up a merge conflict in softmmu/vl.c
because the other half of it was a commit that I'd written :-))

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

