Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43B9662D0C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:43:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEw93-0005yH-15; Mon, 09 Jan 2023 12:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEw91-0005vw-1v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:41:11 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEw8y-0006q4-P2
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:41:10 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a30so6708578pfr.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O9hiz/woQBILSjVmI4/k7j5ZfBCjdOZa50ThVXyjkJc=;
 b=LCoZLMG/j8XNJty3X/8fYCiGrSZOrIFic+YXcy+6VYiMIc4KdTxwNqdSwosLZpjh9m
 peAl70Gr1OOXM/OiJTo0PsFy4BhqPKHSgiZAu12HWJDLppR7yNH/koakT/0G0tHRlZ4Q
 PtQNAWOpbemu6pd4bewr5AFPr/onhpZYuv/rVpWi6ttYp+dexma5WYBSbiY5XDTf0Jol
 HzcsUqEF+cdjQhlX3tJZJLCNP0jhVrYsI6ho4PgOeUbp/vB6KHqM+eH5iDpMOdG3brGk
 W6VL4pFRxTka55SI2b89xC24I+kjAdAVCQM3NGJTlPtGW8uV2xuFuk9g615oCjlo2XZf
 zrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9hiz/woQBILSjVmI4/k7j5ZfBCjdOZa50ThVXyjkJc=;
 b=b+h10WypNFp4EldM705B8vLnInTJ9GIKQ5ZjtLCZ7wpEBby4oIKDGtODTneA7BzE4P
 k1oe9NqWExGzbsuk/tGr+08BkxH1ROo5por0gHW/i/MBhvK89h2Zp4zWIz3QTdBJ26OO
 MSi04MqRt6cXzqqLeSkKSuc0OydpboM5BMA7stGVEs7wwWH0WourzxbzUaw+gzeQ4WkY
 ELq3tsfvp3Eml9NIGu1F1fY0+GZEuWRwHH40VSTdiE9qt604kCaeIi/VT42r2WwGIoSW
 GIXVQfipdDp+C1YF7VXBEEua6n2CSCROgSJvnc4HAQkdagGRt8TGALqsQVuXaBJiZqlI
 1ffA==
X-Gm-Message-State: AFqh2kopEOWab6ZWkHObgP1nyTkUAPQHMZeRQ31blxiCIYCCsVorn/vu
 M9xBoHd0zhTPwvc2Tm96l2T7uUIqN9Q4eIpQw0Lv9A==
X-Google-Smtp-Source: AMrXdXuFzyumMrLIsBEzF4nAixc+SEDY/web0ExTmFV6wV4omAjpuF8zO4d7SPYOxmbNmlURndCG1LDTGjT5SxXWK+8=
X-Received: by 2002:a62:3245:0:b0:582:a212:d922 with SMTP id
 y66-20020a623245000000b00582a212d922mr1749022pfy.3.1673286067290; Mon, 09 Jan
 2023 09:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20230109142604.506940-1-thuth@redhat.com>
In-Reply-To: <20230109142604.506940-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 17:40:56 +0000
Message-ID: <CAFEAcA_qfMrS4J4Kprbaq5w9AYe0Jy5bPxvWaMz5CD7fM6n=NQ@mail.gmail.com>
Subject: Re: [PULL v2 00/15] First batch of s390x,
 qtests and misc fixes in 2023
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Nikita Ivanov <nivanov@cloudlinux.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 9 Jan 2023 at 14:26, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d5143:
>
>   Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into staging (2023-01-08 11:23:17 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-09
>
> for you to fetch changes up to 6f997b8964188c155240380efdf3b1d7ec41c882:
>
>   .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job (2023-01-09 13:50:47 +0100)
>
> ----------------------------------------------------------------
> * s390x header clean-ups from Philippe
> * Rework and improvements of the EINTR handling by Nikita
> * Deprecate the -no-hpet command line option
> * Disable the qtests in the 32-bit Windows CI job again
> * Some other misc fixes here and there
>
> v2: Added patch to use "hpet=off" instead of "-no-hpet" in qtests
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

