Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFF3164FE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:19:32 +0100 (CET)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nWt-0002IX-BD
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9nV8-0000n9-Ik; Wed, 10 Feb 2021 06:17:42 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9nV7-0006C3-1s; Wed, 10 Feb 2021 06:17:42 -0500
Received: by mail-yb1-xb35.google.com with SMTP id k4so1613494ybp.6;
 Wed, 10 Feb 2021 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5jtPwVBo2chsjfP5ZJtqmC8Me4uPu4eCBX5F4YMR3zM=;
 b=ZCYOVZY6g0agc3kL5UZy3Z0ltAbIbgfKwGglcAasHriGyTpvKafnTAtYoL2dri1Zlq
 SxSI6yPgujKLDstX12PYZBklqgNm5R/tlDzyABBxqr+ujEwlADBvRouKhh7LsdvZVBYq
 rIS5Tq+m1MLETlc24EajBRsffFnRZw+n/mcRo5nk637WBStrzMnMZREwLpUVjfHgtbT+
 LIxUYPmnTjvEAUEmh8q094HtMe/bcCeN3AhcKELVTRktKqplN9B48k2soFbwMukdPWnn
 qNv11HGmjezXQ/J8KaQkwjzl0mI+ra7pA1DUg+QFBn8I3S1xMjCX/0MHZm5MdVRTacJq
 kEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5jtPwVBo2chsjfP5ZJtqmC8Me4uPu4eCBX5F4YMR3zM=;
 b=RUAEArr6ieRnpu+8PNNpbtbKA0hJjL2Y+Bp0AEw1mbE/3EEK1jS7LHW3DGLOtYIgdS
 BUOCFa0QgqTWoCZrsL+AdCnqJR6+nm6YATxjrU0eV2ex9ymVvVfCI/tXgoXyyrDKg1YD
 rtb3MyQRbWQiJgWpcztn903uh+U2eOgo3YAMDoC48xMKuJxkiDXOo2GBbjTmzkgMGWue
 uY7XR1SDSPMHH0rA082SRUH+L6gOzcV3oCcjNxF/8QuiVT7FuuSlgHQVjrh2DLoukOU0
 viP5J8eKaNwZm7UejbeAQcTENfR40TNGa7Ah7bGnH7SUjEtKMPHOI5ss6aVi0QhHvyEP
 /T+Q==
X-Gm-Message-State: AOAM531sv2E6nnUaOLfTo3hYAW5oo2RmpltNs3qoyzhzCHtpmhMj8/6c
 +iPMqiDdhL5c0qSwwVUq3RaAW44I7w+/yb4G6sE=
X-Google-Smtp-Source: ABdhPJzQ+2PeyEKWx+H7Gt0z3wx5uh78gzD+M5unl7r3uueYYOJTs0b3YPjffGDOhxdhzo1D1RVr5+HeSG/Rg5Wovx0=
X-Received: by 2002:a25:8712:: with SMTP id a18mr3498020ybl.306.1612955859750; 
 Wed, 10 Feb 2021 03:17:39 -0800 (PST)
MIME-Version: 1.0
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
 <299d3bdc-268c-eccc-66be-6605b23a2c92@redhat.com>
 <efffe227-472d-698d-d8f7-cc0bbd1800c0@redhat.com>
In-Reply-To: <efffe227-472d-698d-d8f7-cc0bbd1800c0@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 19:17:28 +0800
Message-ID: <CAEUhbmVKr_dwhc=Gd-6YjGgLh+cV=dkCR4qWZc=O7ge5g1RKtw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Wed, Feb 10, 2021 at 7:15 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 2/10/21 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Bin,
> >
> > On 2/10/21 11:23 AM, Bin Meng wrote:
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> >> Current QEMU HEAD nvme.c does not compile:
> >>
> >>   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used =
uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled=
");
> >>          ^
> >>   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared=
 here
> >>      uint32_t result;
> >>               ^
> >
> > Why isn't this catched by our CI? What is your host OS? Fedora 33?
>
> Just noticed v1 and Peter's explanation:
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg03528.html
>
> Can you amend "default GCC 5.4 on a Ubuntu 16.04 host" information
> please?
>

Sure.

Regards,
Bin

