Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E4C3AB0FB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:09:38 +0200 (CEST)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoxt-0005bU-A5
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltoY7-0003aJ-Qt
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:43:02 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltoY3-0005yA-F9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:42:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id t3so3088297edc.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6XwofYrB4JDDK8IOCwXucvhcHQx29KNGyaZjlBC8e0s=;
 b=TnEd8gu1tegnt61oST1Uxis51iY16yQkT4XS04FRA1p5Ojq9/R3Rsr4mTy4M8F84CV
 e+fz6VLvCjMq9L0BgeyRMo5KLFeNDUtJRFM2QNziRvTSYBHvkinqSOd2oMnnVAD041jU
 PKYrsbHnxA9R9t2A5tVHHSm4oLvKp/bewENO5vhkx+nGII8ECix5xwHwoMR2M4OdVrQ2
 shhFsaO1SFJIUyttbtkldL71tcInHOmcRE6a/o1QzKlJy7N4N9u7SSg/9L2c5YGJ5dBA
 2oiGEnxaTsY18zAQFZNmECMuT1Yr/ki8x94AanR05dPxo0Kt/W5+1eWfjWwXGgQA+m06
 51Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6XwofYrB4JDDK8IOCwXucvhcHQx29KNGyaZjlBC8e0s=;
 b=kq/fkwsb8Sp0S5ZOPMIwWIYCaBIhBcJnTCcLH13MNiV20F0jvEmBfYjMSe7tOxqcjT
 jy1R8H9J5TQemmhUEQsh8RCy5cXqcXMmfaJ0rwCr3gr4UPYGCG0fs8JE5SeKbrj5ndeu
 CVXLYjHpQbkQ3tKpmTUb/nJIqSWsFt9lxm3lplsLCG/5FwHN0BHsUowwuAEl+MBgEs/7
 d/LlUggmpIYZpL2I5sdU+i27xnS4P2XN44+eLbjS6BsfeZWRKblqoQ7UB7mCa5tD4s7F
 rxt/QlWPBZLrYTpOkpIdxm92SQMmfls6rEcAdZh5SlfrW1gWJEZlos0uFETbvHuLQSxx
 V4BA==
X-Gm-Message-State: AOAM5323UGlsh71URca/ZSDdDauuUirw/sC8dsISOUK4WSjsHFW+a4s1
 2i2+ti4Fy+cFqRKvzoRxzTAY4XVJC2XdpqUVvCvJgw==
X-Google-Smtp-Source: ABdhPJxWESF10D8VNzfp1Z0mUxzwbgXiYdUsFn0x3s5a68lHowd5KWN+MvPS5O4HkGYJNYedgWk66kF9YxW8itByZEY=
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr5302711edw.36.1623922972828; 
 Thu, 17 Jun 2021 02:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210615204756.281505-1-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 10:42:17 +0100
Message-ID: <CAFEAcA8an=yP87_nRCz-scDoJ7ut3zi8hKCfiai1_N8ETSjzkg@mail.gmail.com>
Subject: Re: [PULL 00/34] NBD patches for 2021-06-15
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Tue, 15 Jun 2021 at 21:50, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61=
e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-p=
ull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-06-15
>
> for you to fetch changes up to 788b68b57dea4ddd0038f73b96c147eb406c386d:
>
>   block/nbd: safer transition to receiving request (2021-06-15 15:42:33 -=
0500)
>
> ----------------------------------------------------------------
> nbd patches for 2021-06-15
>
> - bug fixes in coroutine aio context handling
> - rework NBD client connection logic to perform more work in coroutine
> rather than blocking main loop

Fails to compile, all hosts:

../../nbd/client-connection.c: In function =E2=80=98nbd_co_establish_connec=
tion=E2=80=99:
../../nbd/client-connection.c:352:16: error: =E2=80=98ioc=E2=80=99 may be u=
sed uninitialized in
this function [-Werror=3Dmaybe-uninitialized]
  352 |             if (ioc) {
      |                ^


clang is more specific:


../../nbd/client-connection.c:298:21: error: variable 'ioc' is used
uninitialized whenever 'if' condition is false
[-Werror,-Wsometimes-uninitialized]
                if (conn->do_negotiation) {
                    ^~~~~~~~~~~~~~~~~~~~
../../nbd/client-connection.c:302:21: note: uninitialized use occurs here
                if (ioc) {
                    ^~~
../../nbd/client-connection.c:298:17: note: remove the 'if' if its
condition is always true
                if (conn->do_negotiation) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
../../nbd/client-connection.c:281:20: note: initialize the variable
'ioc' to silence this warning
    QIOChannel *ioc;
                   ^
                    =3D NULL
1 error generated.


thanks
-- PMM

