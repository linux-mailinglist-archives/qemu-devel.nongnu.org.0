Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDE402B98
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:18:06 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcrN-0007m2-I0
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcil-0001nj-CN
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:09:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcii-0006xb-9T
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:09:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id x6so14912614wrv.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+mM+AmoSqTRtw664LpKJFj7jVrwPHC1BNvEl2DcqXuU=;
 b=maWYSowVT0Jtp0SfQOPKZno4ILxsRrGpcsyZwsbld8HX70ECiTch3kODOWfGPT4lgo
 JY/VBr5QQ94lQgYKMZLayq2v111qSfaWlEu1Xt9x6ih4M4lpDDZ+RqTcCVlqCTDQ9j8t
 FE/6/5Bich8c1mbNvWL8r1VfKMoIhIwmRJP9O6a5svt3e0cX7wmsjlNzVAC8s5v9YIpt
 hlTYskwhBgs/pvmFhhRoXr5Zkyac+71/6sn+hrBzthrA36EFJ5eKxaNb0shF7iYrMdi7
 OnwrnXT/Kxv2/YbKwAiK/ePrHet0WvLOFQWX0lSUOa1VNrSf8mRXRs9ga84hrH5wCGWM
 R1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+mM+AmoSqTRtw664LpKJFj7jVrwPHC1BNvEl2DcqXuU=;
 b=j8WvCXi9x7EscL/i2E/C3HTnnf8obiwk7IfDsABnzaz05XkEJs5czVCOr36kcyGPa/
 /8sW2nZWTBJBa8uj05haYE8RkGJjckb064fboR2GrgdueYMYwjmuVeSox10zBOivii4T
 F1sRqA8LeJkgdZyHE4j4dzudM3+/KC9ygreqsjKmv+sCPzKQSbJw+hDWRSBSv1hDf48y
 9RfnOK76sro68aB1HeIiILfOVA5Un8+i9WjYK8S4PnS+DidT90K9KQ9WsY73LP4Ib5bb
 WhJ850yeUAnoloCMOFymWa7xAzikLgKkma3rRiAvwCW+mPvHRZu+oAnpuiV7Rksniydp
 dG/Q==
X-Gm-Message-State: AOAM533hN8F8i36uDD9Qy9Ge8nBHQK09o0YtXb3rB1WRibCecdOKxYJK
 AIVtVWdifAZCBqRX6vc2e/wKi9CVdGPeSKesTF0BTA==
X-Google-Smtp-Source: ABdhPJxpwe8AdOcefp4Vw+PmpoieH6pzHv0bIfEWq4vVHS+aHjRO/Z+7oEVdA5kpUmphm3gRx/neE0/Dzt6ik9dqe1c=
X-Received: by 2002:adf:c18a:: with SMTP id x10mr19879017wre.302.1631027345879; 
 Tue, 07 Sep 2021 08:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210907081403.816404-1-stefanha@redhat.com>
In-Reply-To: <20210907081403.816404-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 16:08:16 +0100
Message-ID: <CAFEAcA8BLGfEXH7Mqt2JyCBf0=wY6Ae=9jzJvCO6x0tufjbW9A@mail.gmail.com>
Subject: Re: [PULL 00/11] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 09:14, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 88afdc92b644120e0182c8567e1b1d236e471b12:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-09-05 15:48:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 9bd2788f49c331b02372cc257b11e4c984d39708:
>
>   block/nvme: Only report VFIO error on failed retry (2021-09-07 09:08:24 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> Userspace NVMe driver patches.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

