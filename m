Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0A58527E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:26:19 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRsX-0000l0-LS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHRpS-0005Ys-3o
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:23:06 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHRpN-0003Nq-8a
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:23:05 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r3so8726019ybr.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=3XsB1qvUfqzuXK9Y1LqAX9rjEkxgM+ysMswGqfv/b3M=;
 b=HCELTCcIGgLC+19mk1MfdaZ24yRHPY5t1qMLc7bAexNqpnhfEYvxPbolsPhnw3vuDC
 DYZNYT+trQmwZXvnn/eZV7uPa9Rn5Ri8/dF5CkGNbLZcLlrIAYC2N8qoV6KDoWqCtpRr
 DjsIV44WGmuVUwAfuoRT05z0A1/F2oaBcHApiRGdyN6tV3KhG4uZ4U64vyI2OKM9cD7f
 3zozpDsN8Sw1+yh1YkGbYKFExSSFMvcM+laQ5gWAG5hbvi5KyU19j0CDDFFL5Ym1r1BE
 SF2kdm+Zl443ink5xXLlPKzKxNop1g+BOfabTSJU+smOz0jQbSDvAnmO0nu0yYm7pEKU
 eWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3XsB1qvUfqzuXK9Y1LqAX9rjEkxgM+ysMswGqfv/b3M=;
 b=lxbLoAHx7EhoRGG+MGuTnLKiYhHpabRuOUL6qiheWBJw0wqSdo20U44q2bQ9ca7qTE
 tJcDoyRP9GQrk5t7vbFiU1vPV4yQY1Jm9D+Bui9HhGqB78HwiQ0HGP64F++UlfLNKpo9
 RJ+osJYuRXEWvjXuMb+HnxTgJhY580oOR8eel4A4DLODuEzVI3XUaJiUzKP7H1E4rjAz
 QsH405E6IXz4FOKrlTzc5eIEzDN+IrWuwWPCYnrqU4J7rRdgSbDmWlxFygUL8sDLydJ/
 dDTpumRw4rKrxL+nYLYGE3V8vTz41y95nhEBPQJ+Av9HNiafy6qWO0FcsotHAiiOuLTF
 qcyg==
X-Gm-Message-State: ACgBeo3CzK2S4+hHvSe+gy03SFndaHOKSIH46687AoFBJ88wOm923sCR
 WboeA0ZBJMPUWNY83nxKGKewtVcN/XksLcobWIz86w==
X-Google-Smtp-Source: AA6agR68tcyW7Ql9E70+0LbOfznz0tpbGEWWIvuYeTYFYE6/USM6ux3jsw1qCrjkKybtKCOd2OSJzLtgR2ZVg/ie+GQ=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr2925611ybq.140.1659108178160; Fri, 29
 Jul 2022 08:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220706095624.328-1-xieyongji@bytedance.com>
In-Reply-To: <20220706095624.328-1-xieyongji@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 16:22:18 +0100
Message-ID: <CAFEAcA8wKgCFTeDWo5drvwW82HbmQPmiJatBNzb5p6wUq0=FGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Fix some coverity issues on VDUSE
To: Xie Yongji <xieyongji@bytedance.com>
Cc: kwolf@redhat.com, stefanha@redhat.com, armbru@redhat.com, 
 richard.henderson@linaro.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jul 2022 at 11:18, Xie Yongji <xieyongji@bytedance.com> wrote:
>
> This series fixes some issues reported by coverity.
>
> Patch 1 fixes a incorrect function name.
>
> Patch 2 fixes Coverity CID 1490224.
>
> Patch 3 fixes Coverity CID 1490226, 1490223.
>
> V1 to V2:
> - Drop the patch to fix Coverity CID 1490222, 1490227 [Markus]
> - Add some commit log to explain why we don't use g_strlcpy() [Markus]
>
> Xie Yongji (3):
>   libvduse: Fix the incorrect function name
>   libvduse: Replace strcpy() with strncpy()
>   libvduse: Pass positive value to strerror()
>
>  subprojects/libvduse/libvduse.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Hi -- these patches still don't seem to be in git. What
is the plan for getting them in ?

thanks
-- PMM

