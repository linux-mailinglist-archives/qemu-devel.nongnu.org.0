Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572243B503
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:02:07 +0200 (CEST)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNxm-00051h-Mw
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNvb-0002ve-6I
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:59:51 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:37634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNvY-0001p4-Fd
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:59:50 -0400
Received: by mail-il1-f176.google.com with SMTP id h20so10627539ila.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 07:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=A8PTkVNxs211XxFbVmOVroHfFpknf9lwyW1Rgb7LWy4=;
 b=FlzTBJvFDkdb+j1q+P6lwOZAxZzIlAbp+n1Og/S85ubBjrodXzDAqnrL067AoBlepW
 ptx3/oV0wPeTvgTti1lKpJVsBICrsoyfpFeC+makPz8y6xtIm2JQ04+9x1O68hvhD+z4
 aWWUpWgzesfGqCm1z1tcLBOgeUh6BFmi5O1GEDzMSNdz7bbt9R4Vhxdhrroi90G2CQce
 F4KUUwLGObjdd13SWYStkq9XPi42voFL94/1Timab1NvGg1KHvy1ZhTiST44JGinRWxu
 WsIAm2D9u5mpK66NtZv/0hiUPEo4PRwOYfqwMVgjBuXUnP2OUrw97fTstA1mamjXNufn
 f8Vg==
X-Gm-Message-State: AOAM532wgz3MYo4MfBZn/fjTMqpLgyQyXVqi8oGowl2ByCBlkzvPjQL8
 iV+GeHx+4LQ8O9yxc+D1QNzBzKGjPcS6pJe2r0A=
X-Google-Smtp-Source: ABdhPJzxZ7wB8zFFauym7SCEZS5Lc8XtbPtYXFBsH5W4ecCkLm3iA/+w6Rf+fferbebYhMzO49/u7XX5JNVM6WU+jng=
X-Received: by 2002:a92:c847:: with SMTP id b7mr14925451ilq.312.1635260387433; 
 Tue, 26 Oct 2021 07:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-4-alex.bennee@linaro.org>
 <a7d65f8c-efbf-3001-f840-df6951acc2c3@amsat.org>
In-Reply-To: <a7d65f8c-efbf-3001-f840-df6951acc2c3@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 26 Oct 2021 16:59:36 +0200
Message-ID: <CAAdtpL4uOJcsh-M1nYy_+p+Yo5924y9o5SSChi7egGtouQXo-g@mail.gmail.com>
Subject: Re: [PATCH v1 03/28] tests/docker: Update debian-hexagon-cross to a
 newer toolchain
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Brian Cain <bcain@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-il1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Brian Cain <brian.cain@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Willian Rampazzo <willianr@redhat.com>,
 Mahmoud Abd Al Ghany <mahmoudabdalghany@outlook.com>, minyihh@uci.edu,
 "Emilio G . Cota" <cota@braap.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Chen Qun <kuhn.chenqun@huawei.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 4:58 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 10/26/21 12:22, Alex Benn=C3=A9e wrote:
> > From: Brian Cain <brian.cain@gmail.com>
> >
> > The new dockerfile uses a complete toolchain built by CodeLinaro.
> > Remove the special casing that was necessary when the dockerfile
> > built the toolchain from source.
>
> Can we start using .container_job_template for the
> currently special-cased hexagon-cross-container job then?

Doh whatever this is exactly what the following patch does...

> > Suggested-by: Brian Cain <bcain@quicinc.com>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > [AJB: fix MAINTAINERS]
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Message-Id: <20211014224435.2539547-4-richard.henderson@linaro.org>
> >
> > squash! tests/docker: Update debian-hexagon-cross to a newer toolchain
> > ---
> >  MAINTAINERS                                   |   1 -
> >  tests/docker/Makefile.include                 |  24 +--
> >  .../dockerfiles/debian-hexagon-cross.docker   |  45 +-----
> >  .../build-toolchain.sh                        | 141 ------------------
> >  4 files changed, 9 insertions(+), 202 deletions(-)
> >  delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docke=
r.d/build-toolchain.sh

