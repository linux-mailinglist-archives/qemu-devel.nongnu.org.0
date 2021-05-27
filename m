Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE4393284
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:35:18 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmI2X-0003RU-LG
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmI0I-0001ux-FH
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:32:58 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmI0G-0002IX-LS
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:32:58 -0400
Received: by mail-ej1-x629.google.com with SMTP id f18so719954ejq.10
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 08:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yABwgmhREESXuWm1G9YeuIiPeJP4224uVbqj6Bec+8A=;
 b=F0TgH4jY8Xrf0L8hwR7NOXj6uklYiLXf3lG+XbLZpu6198Ir5jp6lYqgqLHELmGoBe
 y6JI8mLsn4IrxSnycdbYCnZXPzgxTPSXEape4elbPT3FhZ+QbWLsdOkrsZmA87sAyYQz
 hW3et41fAxs3MjSBdMcLjWPklCFg4AX11mJqJaFJ/6nM1rlqKjkWl0nj+s214IJkMGT1
 rScxjEM1nEQYlg9cz1GVzMooXi0K9jVCkzalJmROMW40l8cg8TZmVYVFld5XANPiCjJy
 N9xWE9O2C8A8nqujAR8t4VvBHYWoUaDiPpu5gHIRVH1HXWqiIguILfBAeQTgsAutcS6L
 gsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yABwgmhREESXuWm1G9YeuIiPeJP4224uVbqj6Bec+8A=;
 b=X7qKseRVkMdAIJZGTFv8PdVDoWHBv9e7xVPjoGLmofCoF1cfZhU+UH0eSFitLnRXsG
 8kgbkW6k5j8Obww0hr3v5OfwgpfQrCt9wuM6p6ej1g3Y/JbCEM6uNtUAeO+G+p4sUblF
 bMHprZUCy5AhPAM+mCm3iyJFJ2xAkKJa7EN5po1MuwwlEB0PThJQCCuwEghu/wXPuMdi
 jBQ8s4WRL28/CRVU69EQ9Qvr2kB6u5lXwFFTGQbkxVerbppVaZ8CatJfVA6aVagLNy8F
 ppMKn7PN7X0f/YIT7TyB8dl7mxkj3FEM7ja4QOxJUFwSRJWi+iJRCET0XQ089FICGmt+
 hjDQ==
X-Gm-Message-State: AOAM531HvI6Crm+T78zSNhwcQOiGHTpVaaxZ9b2i9pN+XDKzGxIxLU8M
 OeOgSUPQ6Mx3PD1AOcqYA7QP7wMNfrYeZii7JT1+/Q==
X-Google-Smtp-Source: ABdhPJw0QxkEYkyVhB/50Vt23Y1f4duakX7+9BI+hH013QXDtJiNpgnb5OvWDkwSsppZ2TCE4aHJ/2C3SZ6Ij6ND1sU=
X-Received: by 2002:a17:906:3950:: with SMTP id
 g16mr561481eje.382.1622129573814; 
 Thu, 27 May 2021 08:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210526174540.290588-1-dgilbert@redhat.com>
In-Reply-To: <20210526174540.290588-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 16:32:27 +0100
Message-ID: <CAFEAcA_1PowbwzvDrY3t3949HYOfVU0Th889LmpyGUMaXxKPMA@mail.gmail.com>
Subject: Re: [PULL 00/15] migration/virtiofs/hmp queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 19:06, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 0319ad22bd5789e1eaa8a2dd5773db2d2c372f20:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-misc-updates-250521-2' into staging (2021-05-25 17:31:04 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210526a
>
> for you to fetch changes up to e49e49dd73b8b17f5f341b3e11c8b6878c43d3e1:
>
>   migration/rdma: source: poll cm_event from return path (2021-05-26 18:39:32 +0100)
>
> ----------------------------------------------------------------
> Virtiofs, migration and hmp pull 2021-05-26
>
> Fixes for a loadvm regression from Kevin,
> some virtiofsd cleanups from Vivek and Mahmoud, and
> some RDMA migration fixups from Li.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

