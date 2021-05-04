Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2F372D9D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:11:08 +0200 (CEST)
Received: from localhost ([::1]:40412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxdb-0000mr-53
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldxYa-00064t-U3
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:05:56 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldxYY-0001ku-GK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:05:56 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y26so11087672eds.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4Cy2o/KTbeUx7NPoSGsh3qZYmPZv9p2mlbeCn7hXZE=;
 b=MTAn2GrOTAtu3PJJWNxh+waY2QQAY4QMKKwU91xKKQTzMq/iZejCyEPPgi8/wr/59l
 7cVB/vFsCh06mXCKN2TXiC4zoW+P5ykkwWeODyUIO9kI7oqkCxSzXG2Fh+/zEusdTodI
 eoX4t0toxYbKfNkMGLugqmgPpo9MUsFREe77kArswY9lV4Uj3PWwavXhOYMEAOxhKIHa
 Oz/R5sfAtpiIfTbeZnchIcupMDLLWj/Vbp71bm6zoJQjWksMHd0QN7HjlCiKiySGveQW
 coTxatR+raIk7Pr18595565PGtls/G45hqZrtMIx+UrSFxmG9AU/E9FBe6lLrk9F543E
 ujZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4Cy2o/KTbeUx7NPoSGsh3qZYmPZv9p2mlbeCn7hXZE=;
 b=Pt6JEwzdfkoGZtY3lkiZ2O6VL5lg1Lo85EA7648fZhbT+pHoO6gVIr5vaLo9mJ5cvb
 zFpFp89JXO2hleOdocx9xwIEX9zPYiu3+IVMMuDk7u8Q/i7C0VZRLVR+SnqwDM7ML31G
 Xwz+VHAMVUqPBYTLqodhfRKtgKAuV1jXQbRKLcGBeQxhS+JkOdaO12D5A+P7OWAleJmi
 fX6uObn45rAwN9TMhp4PZQ+HqOi9Wszzv8CqiEBc3NDudzYwvzSW7EXVdDfSxohh6JNO
 f1StSJ39i+iBDG1oOsNzB66UXKjEjFvS8d4L2kmzjJbCe2dnww9DAN40FVPyq0DxwHIn
 8Njg==
X-Gm-Message-State: AOAM532Nx2m7qxVOb2lQyWQP4RZfUUa/9UWj9diG0+4tYLm1ZrpXUwU0
 /DaU0Jj6SxhA/2nzRLDQCsxNjSgOiMHHzTh6vGnvngwOkak=
X-Google-Smtp-Source: ABdhPJyP4NQN9Dim2u5JgntgtpT8C1uDBt4aEOTLhSXGa4CdxAWT+3+fHBVt96CqFdWrqlAcvcpaKenshX3jGClxOzQ=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr26269157edv.44.1620144352341; 
 Tue, 04 May 2021 09:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210430172746.99818-1-imp@bsdimp.com>
In-Reply-To: <20210430172746.99818-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 17:04:46 +0100
Message-ID: <CAFEAcA9P-i+gaWLXvxMLouHbC82hWnHU+J4HyG00uTALqb=s-A@mail.gmail.com>
Subject: Re: [PULL 0/5] bsd-user: minor cleanup patches
To: Warner Losh <imp@bsdimp.com>
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 18:46, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit ffa090bc56e73e287a63261e70ac02c0970be61a:
>
>   target/s390x: fix s390_probe_access to check PAGE_WRITE_ORG for writeability (2021-04-23 14:10:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bsdimp/qemu.git tags/pull-bsd-user-20210430
>
> for you to fetch changes up to 58b3beb483d08066548d84eccd007b9d8bd24a2b:
>
>   bsd-user: style tweak: Put {} around all if/else/for statements (2021-04-30 09:14:06 -0600)
>
> ----------------------------------------------------------------
> bsd-user: start to cleanup the mess
>
> A number of small cleanups to get started. All the checkpatch.pl warnings for
> bsdload.c have been fixed, as well as a warning from qemu.h (though more remain
> and this patch series fails the format check still). I've also fixed a
> compile-time warning about a missing break.
>
> ----------------------------------------------------------------
> Warner Losh (5):
>       bsd-user: whitespace changes
>       bsd-user: style tweak: keyword space (
>       bsd-user: style tweak: return is not a function, eliminate ()
>       bsd-user: put back a break; that had gone missing...
>       bsd-user: style tweak: Put {} around all if/else/for statements


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

