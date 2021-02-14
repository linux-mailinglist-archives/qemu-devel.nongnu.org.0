Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5B31B231
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 20:19:15 +0100 (CET)
Received: from localhost ([::1]:40112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMvJ-0008N9-RO
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 14:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBMPD-0004KL-68
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:46:04 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBMP9-0004yC-EV
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:46:02 -0500
Received: by mail-ej1-x62a.google.com with SMTP id b14so1823158eju.7
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kXFRx3DGIcGntIKw4Cw69/3SMK1eEG10h9or+H+QgSo=;
 b=zwPJJ9tmqQy9qP8DO3KvLGbG85H5HuOz2U5siqU3Y2fWj+55qyyBPObD1UW1EV6qiN
 YpzSxSj/YtBci8LXWrkRLOF7lDkUzGL0bJ+oMwKhiccObSn/SKpzlRqeITjjUaKoAouV
 EMW+eI57l9+TFLlUl84tiLNKYq0wvl8CqS1vo/3XFnHB7+bk8q/TTIko/SjARLB+hhCE
 1bEctZs/BCRufudeRQJQwsEDtvLaw0/gZwDgH2WW0AwoQg0cYRn5grNpyp7mAnkno3MK
 Ic6eY6Q88y4zMr8N7UTP4aFWknJqhls/oH57iPkJdjCBvacs+OrmLpWvfQ96068Ngrfg
 de/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kXFRx3DGIcGntIKw4Cw69/3SMK1eEG10h9or+H+QgSo=;
 b=XIr7Xb81H0TAFOvXyp41FrmgMM9hdxVLDK9VjmZ1yGmKp026WZLm+P1n27+VjCCgqT
 LdiYrO6RFGo8CYfjz8X+nFjRr+wZVwxhS670udcsLXYbNwUDJyk5NXjSSdF9HY/rOLPa
 sffpfgE5fwrCgaN2GpHPP6XWt667PNp0CLC0hfPcWSLxl5YEbR3zlT/Zd9dnpz+zQ8p8
 PRmBxdKx3bcK5kKim49zURhwCJ4t+/FJyzBcvIQlUwHspQJ3THxz6TLStrIP4ECX2pBY
 Xo2nbiM25JRGJcdRJJMrOAhGZtJD8JvBCVL6PncM6Vozx1pb7t6qYmMK9yyAZhseQN9Y
 RvQQ==
X-Gm-Message-State: AOAM530f9aRhmwe+dcgRyAgwXL3EwWUlfe5WPxDRSSmxtHU137zaUSY8
 m1mRoyN+SAsDbrgP2ldimIg2CV/ZJLljCHDSNcNFlg==
X-Google-Smtp-Source: ABdhPJyImNYTYDhjUFLhbq6xXbWHRRLZfL7wsVSn9qFxQUz+R5LguCHNA0aM559UyZVpH5WCVT8mVzUY6wX2MHh8L6U=
X-Received: by 2002:a17:906:4a8a:: with SMTP id
 x10mr2530976eju.407.1613328356490; 
 Sun, 14 Feb 2021 10:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20210212232134.1462756-1-eblake@redhat.com>
In-Reply-To: <20210212232134.1462756-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Feb 2021 18:45:45 +0000
Message-ID: <CAFEAcA8HfNKJhYCksKE736xo4vtXgU6DK6VL+NJhFf7ca1vzuQ@mail.gmail.com>
Subject: Re: [PULL 0/5] bitmaps patches through 2021-02-12
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Fri, 12 Feb 2021 at 23:24, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit eac92d316351b855ba79eb374dd21cc367f1f9c1:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210211-1' into staging (2021-02-11 19:57:50 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-bitmaps-2021-02-12
>
> for you to fetch changes up to 934aee14d36e67468260635af61c387227cdaf78:
>
>   block: use return status of bdrv_append() (2021-02-12 15:39:44 -0600)
>
> ----------------------------------------------------------------
> bitmaps patches for 2021-02-12
>
> - add 'transform' member to manipulate bitmaps across migration
> - work towards better error handling during bdrv_open
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

