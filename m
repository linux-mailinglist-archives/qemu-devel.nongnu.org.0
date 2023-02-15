Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14949697DFD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIQ7-0004wK-L7; Wed, 15 Feb 2023 09:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSIQ3-0004pc-OD
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:05:59 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSIQ1-0000iP-Rv
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:05:59 -0500
Received: by mail-pf1-x432.google.com with SMTP id g9so12747747pfo.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EBmySpaqfc+eWsoIe0hXYY1gav0+DlAKS226VuK5JCg=;
 b=f+HWWk6DSeD+/ugZ87XHDjaonQkeTmurneoGDp4EgMkKttigp2/FnXOGd0wd0buS4C
 aj4aVB0wMLATWYRMK97afK8uAnPLINwdAEFNfgXandtz3GC/EJBd4bn5W4wRfAZ8I/NA
 uZ0ulrz1ffIHpQ5/vf2jhf8a5yLlK9kqeZ1Vlfteg8uNtnBckLvSybSXH4oXUPSx31qD
 gFey9p9wdLVEK9QYSg8aCIdmmSYTdlVMou+MVNWYY7wi/R6QSlcQClndMmhKhBSFQGul
 mMcTQ/AyDiYV+3MDJrd3kpO7apwxjHDYrRdi1JI/NxF6x9qioqQ+QuT0Wh0rg/ZE/asR
 0EGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EBmySpaqfc+eWsoIe0hXYY1gav0+DlAKS226VuK5JCg=;
 b=A1Inj3tt+lJr2qwQskj7E52N4V6oUEnp2j4FNW5ydPycTdneZbenA4bdqBwc1WGqfO
 6jUXqmq2IF6/oT/J30EeC3gBkfruusYFNGZ7NVGep3eMpPRDC6RCd5vuVguHmff/GQtD
 5WsRFSNzxNeEYZaSd4FBDxppf0jPUZCuWg+CF3esbGu/cXZxbd14tSxNuZpt9jGrqeOI
 X7wAqHQzVov2e8okuKiEoe/1BM5oVp9vI2mA3Dd5nML/IVmg7rYc6piSunH0iqu33zfv
 XYCub++hKxZIjGw0aI0XVttTClRkyCmGxTfulxcH0/v2bGFmIhSxktU6DpSvDV/jZP3W
 7PLw==
X-Gm-Message-State: AO0yUKXI3jh92lIS9qLC8UXQSNJrvDfZP1rruiNWT7Ob+XIjPzqaxlr/
 ACR7l8yMLY2I8AhXvPsASkOSC/ykdz8Yd40DNkiJMg==
X-Google-Smtp-Source: AK7set99Uv8+VbPV6iYoNJxIa+2RloFzCGYa0nVCzMOd+eshoUNcbYwgFSznOZfe5ZPkXkXa77DtYFCaxYTRQ/kPR5Y=
X-Received: by 2002:a63:d809:0:b0:4fb:952d:5164 with SMTP id
 b9-20020a63d809000000b004fb952d5164mr421834pgh.1.1676469953957; Wed, 15 Feb
 2023 06:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20230214112148.646077-1-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Feb 2023 14:05:42 +0000
Message-ID: <CAFEAcA-3kGyYcQtbQMp5Xh5NiNo5Cm-a3pj_QtrJvmy=P6BHow@mail.gmail.com>
Subject: Re: [PULL 00/22] qtest, s390x and misc patches
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Tue, 14 Feb 2023 at 11:21, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:
>
>   Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-02-14
>
> for you to fetch changes up to b1d1d468cabfa800950e1ecb6006df619687c269:
>
>   hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT() (2023-02-14 09:11:27 +0100)
>
> ----------------------------------------------------------------
> * Bump minimum Clang version to 10.0
> * Improve the handling of the libdw library
> * Deprecate --enable-gprof builds and remove them from CI
> * Remove the deprecated "sga" device
> * Some header #include clean-ups
> * Make qtests more flexible with regards to missing devices
> * Some small s390x-related fixes/improvements
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

