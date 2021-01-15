Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15682F80EE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:38:11 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0S70-000408-LT
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0S4G-0002AG-QO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:35:22 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0S4E-0006H9-Jt
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:35:20 -0500
Received: by mail-ej1-x631.google.com with SMTP id g12so14148963ejf.8
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 08:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Om8zohPl0eN7IdROq8ZGHo3onOw4Jc40ThRVPXM8pv4=;
 b=Eu4ctV7XW0cegrUhzU0cTXtJvAw/Yu+1QlwzG3TQI2vne4jexVMgUYcKnHaK7zebWw
 nvYLrdU6BBSf3mUnmwUWnLmVV5RGnUv/sQ/0Yyyj8h4qScqtelht2mNyvmm1+GetXwX4
 dbL5eO8cYnHtx/H46kjB1/c1otYk/18yoInRQ3reekH3nKckxTxKGDJQbyrELNOMY38+
 us8mHevPtgLWuNPm2eJ8xyAfBosPkbqetWEOV4EO2ds3JCNzHOkns63P25XBN5SYvpt8
 n24koTmPsdvfzUd/l6iAbpgdSKYu6fXT0eO8rxOSMlG8jiqnKhSG9n9BcirL+02Shddr
 6AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Om8zohPl0eN7IdROq8ZGHo3onOw4Jc40ThRVPXM8pv4=;
 b=K601dSBoGV6LZrDF/qFDq1SdNV0uwnOdEWlowuIOn3x69ILDqRth0H+zplhfqOpYSB
 C6cMXpXzjEXAYmiGP5pnGs3JcOtV6us7YovoepKqnv4opwBWfv9PQCPqrBpCjHqnZUKn
 zedMZRK7vPUf2PoO5W0cRiscHxUWmF6jByDyn7EOWjI77b4eQliCX3cbsCqseHZasEkw
 6ERuUg7i7PY+j6ODDIsm14VbqTN57mi21d2bHMyC/shoNsf6CVGi3xznkF25nIKUl+L5
 PwqIKXam4ZzZpuey0Gp8bAGl4srCzB+aXAu9MBSm2dcCTXxKezuBLiEiBdkLyFuuS64Y
 XXxw==
X-Gm-Message-State: AOAM533a859CNswG5toOwEoeuOhhAKMSex8Q59bVclOmlLSj54Fi8A/L
 +XM0NT2ovep0oy2iefMW+NeKaNavGJXB0vUTustZcQ==
X-Google-Smtp-Source: ABdhPJwn27Gx9yYb2cZMvdvgw8lI3oTCKMi4ItebcImVViJx5l6j1LyNNS5WQjNVe8yZlwQq4s7jAKb59uWk+29WY44=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr9165102ejb.382.1610728516675; 
 Fri, 15 Jan 2021 08:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20210115090507.108064-1-groug@kaod.org>
In-Reply-To: <20210115090507.108064-1-groug@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 16:35:05 +0000
Message-ID: <CAFEAcA_STVoi=jjn-UracWa0e8G_yD40fwMki6gKxvhGxwsjpA@mail.gmail.com>
Subject: Re: [PULL 0/1] 9p security fix 2021-01-15
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 09:05, Greg Kurz <groug@kaod.org> wrote:
>
> The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef6867d:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210113' into staging (2021-01-14 09:54:29 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gkurz/qemu.git tags/9p-next-2021-01-15
>
> for you to fetch changes up to 89fbea8737e8f7b954745a1ffc4238d377055305:
>
>   9pfs: Fully restart unreclaim loop (CVE-2021-20181) (2021-01-15 08:44:28 +0100)
>
> ----------------------------------------------------------------
> Fix for CVE-2021-20181

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

