Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDC601B3F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:26:56 +0200 (CEST)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXdO-0005ed-GJ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1okXa9-00024Y-P6
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:23:33 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1okXa8-00049M-2I
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:23:33 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id k3so14771038ybk.9
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPnUyRLE3vjfwLUDIidhnA41rkMghvqXiILH7G4sx5A=;
 b=UT0mHgVsS/cFb/kPhDK2gVvj8OGpLHNNWPQXYL2/XGgiS7ktDb3zlkoIVsfAvZYyaI
 fdMrpAo9vVWa5iLsXG8w2eT5Sa5xAOJA7APn+jSu8KU4RbhKOdRTl+iNaEhB00Y1NVCP
 4YgM8ZC6eyV0eNrGHikBdivhZLDT1949GMHIp+tEhJc3rV6tOgg/t4OS0/NqznzLuLq/
 cfnSKY0nFu0yYRBdxUKk+X+Jw3PEASEq4KYSgb1pVx9U1z/KsYSoqEgnFsobJHp52tut
 mXChwDR7NlruX8EmxHzG58XXcQs6Jap/BWIDNRDTNwGZBd3pWGb6uXaCeW/Eg9h/Mv/u
 vEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPnUyRLE3vjfwLUDIidhnA41rkMghvqXiILH7G4sx5A=;
 b=Aa41RuDt2JOWPVYUinEOobM6CUURJQqVFHbwpIPDMfwp3NQS+bw8RZIG/3GcdMEqBP
 ggF5eIiiH/NBHV1bfXWQLJAetkMWZn7s9mF0c2/ZutwbefRK2sXZDl+T3Vu2FOCj4TAo
 vHOEbI980yz36Y6NLAc7XhTpUyTOUi8JHR2+N7dUQZjovak3yorjWsLyFRvKxE9gNRm+
 i1fSWnHzvZpusEYblJP13+jwMiVpfbZF6SHPqUIT1dSDd67Mks4rWPOlSSHayl0IyUXv
 +jX5Zxq0cPcC628mfFTtrz/atLFioPCpM7PifJixJ1J57Ps5mKvUfrjM2TFhFh+J4wWo
 fXjw==
X-Gm-Message-State: ACrzQf3/7Cy4DYY7RPVZ3MdSAmogNdTpNDmcoZxN4JursnNyXc0jazSD
 wyIuLvVEoppbnjrrSBD8OP3qWPpkq3ldPCgmKUs=
X-Google-Smtp-Source: AMsMyM55THyZ2etzZ68cN0YqtZQCuB/AsRVj9aiug0+fIBgTLHQCNJDWFbO7gfEqlyiMJRPO/OI/f5D4/AV2fai5RNc=
X-Received: by 2002:a25:2495:0:b0:6be:22d:deef with SMTP id
 k143-20020a252495000000b006be022ddeefmr10995137ybk.209.1666041808804; Mon, 17
 Oct 2022 14:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221017182005.43015-1-philmd@linaro.org>
In-Reply-To: <20221017182005.43015-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 17 Oct 2022 17:23:17 -0400
Message-ID: <CAJSP0QUDOo=4Q9OWsM28OcC8wUz7YgvhzSQJZ5hWAv9ycxuqyw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace my amsat.org email address
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <huth@tuxfamily.org>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Oct 2022 at 16:16, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The amsat.org domain is having issues with DMARC / SPF / DKIM:
> https://lore.kernel.org/qemu-devel/CAMVc7JUy5NeEN0q=3D4zfZvn_rppgqn9wicV1=
z=3DTsLuHKS3RY3Sw@mail.gmail.com/
>
> Consolidate all of my MAINTAINERS entries on my work address.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  .mailmap    |  4 +++-
>  MAINTAINERS | 62 ++++++++++++++++++++++++++---------------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)

Thanks, applied to qemu.git/master.

Stefan

