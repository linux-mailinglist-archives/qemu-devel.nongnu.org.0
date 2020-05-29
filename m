Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C3F1E8046
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 16:33:26 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeg4b-00067t-J1
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 10:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jeg3Q-0005J2-CR
 for qemu-devel@nongnu.org; Fri, 29 May 2020 10:32:12 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jeg3O-0006QT-PS
 for qemu-devel@nongnu.org; Fri, 29 May 2020 10:32:12 -0400
Received: by mail-qt1-x831.google.com with SMTP id x29so2064488qtv.4
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnpTxrfSXNIJkmdzmpimZ464OMn2JbsIujGl0aMEKes=;
 b=hloUZfpT9OVJb8JLjnRYXHtdYX/ndGJVIeYyZc355XHT399ZSPLdAKt2/7d4XaSg3Y
 bEMqa12fxLM1qr1edYwJM2LLRWZe4VHK81WTVFkxnqdNwvPh9MlQVSP0AfqKG7gFhJw0
 RgrDlhgvA2hc60VRGnZBwegFuLw5sWDUt0gzabh3FtB7QG6WZ1BWL26H4o4ON0VXVvvs
 49xAOZLhvPR1VqesjS00dVpO2cAsd8SSk64+6TN78yCghcmJ+UEZfehJVLkXjzMagqxr
 lFZbPGnw+oxX4cF1l30FMGBIb4/LMa8t9o5rb+Vlubsu2jrzWTPdixEKPvWVahSZcL4F
 KC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnpTxrfSXNIJkmdzmpimZ464OMn2JbsIujGl0aMEKes=;
 b=Vf3SrTBdDBpEUat+QwzpK1iPZNAzn0aS46W8AvVo3zgoNNyQzJ/My+yb//mc69nhri
 wNU9Bvgup4J/K5JeTJcvyzQZcP4+LOczAlO2M5fHJDyV4r/5Qm0lKP7Nz+9Ot4IvQpoJ
 +xVjYxFfg05ueQL2wLHXzo44pHpU+Znz+C02y10jFTRfARrWnYA9uCMqYTit0LU75F2X
 9BN19KFmCSuiwxeyGJuEQmCbFnQnWvdgxJddFmMnqNT6KReBxz04Hf4n+b0NZPZa0Zyq
 WIRxghffPaK218Ahy+V7wIYTT0aEY03ZIron/Emgv6gqIL1N++mP0fOS92wREfUomGMW
 DtPw==
X-Gm-Message-State: AOAM532JRVw25AtU/ko7h8bNQHWdbqRbBhs/mg/IHMkOHcOB/II/w/zj
 hAP10P0j/AgYV3S26br5BfhiGM9lpOYCgX0/YBc=
X-Google-Smtp-Source: ABdhPJwp1gWiTuUNHfBvNFQKPPi7YfeqKQx9gOOUJi37+CY0O3CFm4zAtzUZp3hgUrI4JUi07HTjxlGVyquEmZkRTyI=
X-Received: by 2002:ac8:5148:: with SMTP id h8mr8752565qtn.316.1590762729552; 
 Fri, 29 May 2020 07:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_Lr8ySUK_PUNVB+RRQhFhEQL2wFeJtdYAxZhhT1xEFNw@mail.gmail.com>
In-Reply-To: <CAFEAcA_Lr8ySUK_PUNVB+RRQhFhEQL2wFeJtdYAxZhhT1xEFNw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 29 May 2020 15:31:57 +0100
Message-ID: <CAJSP0QVBKWrSMx9t2Z=nhJcuqD+nuGgins=r-+hOp7T2zkrhrQ@mail.gmail.com>
Subject: Re: 5.1 proposed schedule
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=stefanha@gmail.com; helo=mail-qt1-x831.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Tue, May 26, 2020 at 11:07 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> Here's a draft schedule for 5.1:
>
> 2019-07-06: softfreeze
> 2019-07-14: hardfreeze, rc0
> 2019-07-21: rc1
> 2019-07-28: rc2
> 2019-08-04: rc3
> 2019-08-11: release, or rc4 if we need it
> 2019-08-18: release if we needed an rc4
>
> Does that work for people? I don't think there's anything we
> particularly need to try to shift the schedule to avoid but
> we can easily move it back or forwards by a week or so.

Sounds good, thanks!

Stefan

