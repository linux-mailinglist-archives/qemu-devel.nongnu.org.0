Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679E4BC0F7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 21:07:51 +0100 (CET)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL9Xh-00037g-Qp
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 15:07:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL9VO-0000ug-Uo
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 15:05:26 -0500
Received: from [2607:f8b0:4864:20::b31] (port=44572
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL9VM-000310-Bn
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 15:05:26 -0500
Received: by mail-yb1-xb31.google.com with SMTP id g201so807643ybf.11
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 12:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lzwy72mBMcex0UKXfJSi9iD954YiKFJKQf+VJA/zw9Q=;
 b=T8lKgTb0vnmWZN2DqQL8A5QoQCB6prt349e4HdFxkXoc++WAkFoLjdn0sp30c7TwSa
 JLH6K2dRCZoezR3hVGFn9P+HUd86zcm1Cbe6W8+AbJ7Bet3i3vrlCpEdGjJIo8Ea2Ap7
 LIkYscymnPIWSMmNyvFF+aFh0iNa0g5l8go1YaETeTm3MPxCRud/RzLP3lmC3t2bVn25
 LjxSgnS1OYVUFr887e59kihaGjoj4SlOXTMUE0yCZwJaIoFj1cbNqB++0avzAJdCajYA
 ay9WBnj965bi3d8oHsFbCIFi+zBPh//ZLfFfXargBd++gXEf600WFIeXFS6FtpVQCG4G
 BkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lzwy72mBMcex0UKXfJSi9iD954YiKFJKQf+VJA/zw9Q=;
 b=GqAyKLiJLTdb6bFse+pEbDSE3x0AN7cB4guOQLJewYDHlZKmdCrj2OXqbC5mXSjluS
 qFd7UhzD1ztXQjsJBUTzAj1FIRxuFTSmYvOcPz7iL/N5FExfOQ2gTuIec6eviidaSh1L
 cuwqzwWYkbktmorkvjSJRsdhXgzk+TiHzLSpxNaNFJiwWSf0lFhmgSPkL2ecWzEXxIxc
 O9eeBTRdaCGoFGAg1tq2Y29XsaONPtLTzgN/aWIiH5LrjZk/iOqGmKzXoIjdYTURLkuv
 2al0qTDjEDAmLzsxyhLd35HJTBscyhMSbcdwfgkvYqLVZ229V3zXQrwMfArv23Ce6QdB
 0h1A==
X-Gm-Message-State: AOAM532e8Y8mc6av1Wi3UNMLUvValSB2i6ddEkFb4FI/NoecM0QRAVbN
 rzxzVj2s9PoHQGdxJE9tpICl7Wu/EwbNYiI+0WOAcw==
X-Google-Smtp-Source: ABdhPJwuX+2R/kql9IUBYGrP8u/+cD3UtdgPCG+KcnPEGH9BsThZ5bPrDKP5GoJVfLIP58GgJLvBBsDNFkhdOKMlvh4=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr9022153ybk.193.1645214723279; Fri, 18
 Feb 2022 12:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20220217115723.1782616-1-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 20:05:12 +0000
Message-ID: <CAFEAcA9vQUAYPHU6KOwVJRxY=SOa2iipPR-5s0JU79MPEmvQBA@mail.gmail.com>
Subject: Re: [PULL 00/10] Misc next patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 12:01, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c8=
8d:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2022-02-15 19:30:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-next-pull-request
>
> for you to fetch changes up to 2720ceda0521bc43139cfdf45e3e470559e11ce3:
>
>   docs: expand firmware descriptor to allow flash without NVRAM (2022-02-=
16 18:53:26 +0000)
>
> ----------------------------------------------------------------
> This misc series of changes:
>
>  - Improves documentation of SSH fingerprint checking
>  - Fixes SHA256 fingerprints with non-blockdev usage
>  - Blocks the clone3, setns, unshare & execveat syscalls
>    with seccomp
>  - Blocks process spawning via clone syscall, but allows
>    threads, with seccomp
>  - Takes over seccomp maintainer role
>  - Expands firmware descriptor spec to allow flash
>    without NVRAM

Hi; this series seems to cause the x64-freebsd-13-build to fail:
https://gitlab.com/qemu-project/qemu/-/jobs/2112237501

1/1 qemu:block / qemu-iotests qcow2 ERROR 155.99s exit status 1
=E2=96=B6 469/707 /or1k/qmp/x-query-opcount OK
=E2=96=B6 493/707 /ppc64/pnv-xscom/cfam_id/POWER8NVL OK
Summary of Failures:
1/1 qemu:block / qemu-iotests qcow2 ERROR 155.99s exit status 1
Ok: 0
Expected Fail: 0
Fail: 1
Unexpected Pass: 0
Skipped: 0
Timeout: 0
Full log written to /tmp/cirrus-ci-build/build/meson-logs/iotestslog.txt

This is an allowed-to-fail job, so I could in theory allow the
merge, but OTOH the job was passing previously and the failure
is block-related and this is a block-related pullreq...

thanks
-- PMM

