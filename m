Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C45834C5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 23:18:45 +0200 (CEST)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGoQW-0002qo-31
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 17:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGoNM-0000ie-1f
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 17:15:28 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGoNJ-0007eL-Vx
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 17:15:27 -0400
Received: by mail-vs1-f53.google.com with SMTP id d187so17685559vsd.10
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 14:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/nHJki5cIM5T2FJVwWVBRal1FUfl3vf8/GP4Ra6YEPs=;
 b=7ZzSe09WDOqLK8mWieBhIRasxcAns+h+e0w2c4DSICbMFHG11XVflCJkb7nOGgLQbk
 To6IW/23uaFi0GF+7iEAK8WXvkPAQNvLk9O8wfwOdSra6FwQWuh5w/QKqDNs9p5Q/3VN
 +9d1VNwo3NzKPgL0FyqZxdWhjkQWg7RecALa5W3RHPk7P3oHPIKmVUUIciZQlv0AUFKH
 CAWju8iAEZdFI0tKU+XcyOipMpRwT1x5vBG39ERYNpvJS61YqC05vYs9agvleRDZRrmE
 tHNivCZM8IoFOBvdm84SCuWOJ43O6s1AcpkEMWrNOL6intNinbf5Y8D9D4LchIQTCECi
 y5RQ==
X-Gm-Message-State: AJIora8j9MLV4F1JDdiuJv9AH87eh4xFl+Fhg1xsUSWEIuxU1NkdIHW7
 ybwx/evmCX1WkJX/uqJ+4U60tFc1iRi+1C9BvVpOmtudklc=
X-Google-Smtp-Source: AGRyM1tkY8kNXqQdf+Ur157V7kD+tGxbQhl5QVvi/rju3kDFRyvQftCzV7umzomRHb9ZxbGfPWH5DlzVeNOBlZYObyk=
X-Received: by 2002:a67:e08c:0:b0:358:3c69:6dd0 with SMTP id
 f12-20020a67e08c000000b003583c696dd0mr7688628vsl.45.1658956524353; Wed, 27
 Jul 2022 14:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2XoE_Ki5QJSH9LNkFOzOwMFJdS=y6=bb2g=9ODawuFymADdA@mail.gmail.com>
In-Reply-To: <CAE2XoE_Ki5QJSH9LNkFOzOwMFJdS=y6=bb2g=9ODawuFymADdA@mail.gmail.com>
Date: Wed, 27 Jul 2022 23:15:13 +0200
Message-ID: <CAAdtpL778EC-8sWyXxFpSUzP55LP4tRWC4a2agNXjFJ4u73E6w@mail.gmail.com>
Subject: Re: When create a new qemu fork, can not run pipeline,
 what I need to do?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-level <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.53;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Cc'ing build and test automation maintainers.

On Wed, Jul 27, 2022 at 1:22 PM =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <=
luoyonggang@gmail.com> wrote:
>
> =C2=B7=C2=B7=C2=B7
> Pipeline cannot be run.
>
> No stages / jobs for this pipeline.
>
> The form contains the following warning:
>
> 121 warnings found: showing first 25
>
> jobs:amd64-centos8-container may allow multiple pipelines to run for a si=
ngle action due to `rules:when` clause with no `workflow:rules` - read more=
: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:amd64-fedora-container may allow multiple pipelines to run for a sin=
gle action due to `rules:when` clause with no `workflow:rules` - read more:=
 https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:amd64-debian10-container may allow multiple pipelines to run for a s=
ingle action due to `rules:when` clause with no `workflow:rules` - read mor=
e: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:alpha-debian-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:amd64-debian-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:amd64-debian-user-cross-container may allow multiple pipelines to ru=
n for a single action due to `rules:when` clause with no `workflow:rules` -=
 read more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-war=
nings
>
> jobs:arm64-debian-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:armel-debian-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:armhf-debian-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:hexagon-cross-container may allow multiple pipelines to run for a si=
ngle action due to `rules:when` clause with no `workflow:rules` - read more=
: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:hppa-debian-cross-container may allow multiple pipelines to run for =
a single action due to `rules:when` clause with no `workflow:rules` - read =
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:m68k-debian-cross-container may allow multiple pipelines to run for =
a single action due to `rules:when` clause with no `workflow:rules` - read =
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:mips64-debian-cross-container may allow multiple pipelines to run fo=
r a single action due to `rules:when` clause with no `workflow:rules` - rea=
d more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warning=
s
>
> jobs:mips64el-debian-cross-container may allow multiple pipelines to run =
for a single action due to `rules:when` clause with no `workflow:rules` - r=
ead more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warni=
ngs
>
> jobs:mips-debian-cross-container may allow multiple pipelines to run for =
a single action due to `rules:when` clause with no `workflow:rules` - read =
more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:mipsel-debian-cross-container may allow multiple pipelines to run fo=
r a single action due to `rules:when` clause with no `workflow:rules` - rea=
d more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warning=
s
>
> jobs:powerpc-test-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:ppc64el-debian-cross-container may allow multiple pipelines to run f=
or a single action due to `rules:when` clause with no `workflow:rules` - re=
ad more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnin=
gs
>
> jobs:riscv64-debian-cross-container may allow multiple pipelines to run f=
or a single action due to `rules:when` clause with no `workflow:rules` - re=
ad more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnin=
gs
>
> jobs:riscv64-debian-test-cross-container may allow multiple pipelines to =
run for a single action due to `rules:when` clause with no `workflow:rules`=
 - read more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-w=
arnings
>
> jobs:s390x-debian-cross-container may allow multiple pipelines to run for=
 a single action due to `rules:when` clause with no `workflow:rules` - read=
 more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:sh4-debian-cross-container may allow multiple pipelines to run for a=
 single action due to `rules:when` clause with no `workflow:rules` - read m=
ore: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnings
>
> jobs:sparc64-debian-cross-container may allow multiple pipelines to run f=
or a single action due to `rules:when` clause with no `workflow:rules` - re=
ad more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnin=
gs
>
> jobs:tricore-debian-cross-container may allow multiple pipelines to run f=
or a single action due to `rules:when` clause with no `workflow:rules` - re=
ad more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warnin=
gs
>
> jobs:xtensa-debian-cross-container may allow multiple pipelines to run fo=
r a single action due to `rules:when` clause with no `workflow:rules` - rea=
d more: https://docs.gitlab.com/ee/ci/troubleshooting.html#pipeline-warning=
s
>
> Run for branch name or tag
> master
> Variables
> Specify variable values to be used in this run. The values specified in C=
I/CD settings will be used by default.
> Run pipelineCancel
> =C2=B7=C2=B7=C2=B7
> --
>          =E6=AD=A4=E8=87=B4
> =E7=A4=BC
> =E7=BD=97=E5=8B=87=E5=88=9A
> Yours
>     sincerely,
> Yonggang Luo

