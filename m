Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820532D4B53
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:12:54 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5pV-0002jd-G3
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn5lj-0000lW-VU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:09:04 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn5lf-0004zl-Qo
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:08:58 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ga15so3989464ejb.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 12:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4IO7aNvIrSFA89hCBGkKbqTbj1TL7GWA2aZ2tVDFLw=;
 b=HSBk1UTiH/O6n/FCi3qF3o7/ZiMNwrAgZTd4+g1qDNYhvqCtLIFCTHxtImmT4cepM9
 Gv0Js9ebiVi3hVYFmwT/NIFhIW3eEiOZbwhlb1ZrBKxhpvj1PJ92EsSgk9i30Q8REF4t
 zcOZzI7Drz7N7VYk0Kazhea2t8PVczSV/Z2VqLCZpFUjW8/PuCU7AayDXZuBhr0aZCgS
 iOYjwTJIp/jlELPg7sMgVoa9AIfCL31xOUM/5mbnMYLAXT1TAIZXe3/9cK27PI9KQPd7
 VhTRLvkW4LPp/GOrV9+V3InPHrNQdxOgTb2GSA549IOKO05saRbbIol7zDcbCfVC2dvb
 alKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4IO7aNvIrSFA89hCBGkKbqTbj1TL7GWA2aZ2tVDFLw=;
 b=cmrVtzHmVwNUr7RVl7Fs5GJZdSJ2Kj1oAue4iRhiC5kQ//5BL/QErZiHmJRKsKVFk/
 IMDDIVEgJZx06/uR2fuIFNcD1YAaihjwbCYmuul15QzcZ8UTSxI3uYiX+XxpojfF0UQq
 rdEZq8rVQv0TyVarQ/gaglmA1JAu34q+Q8WRtdRfUmvvSCfASjIM9aiE2CwOkRSfm5HJ
 0GrTeur8K8dJUeKVQZDvK79TeaJjAzZ6EyVKIn3xpbOug+9tS/iOzRiaA8cywj0zEKsh
 L/7lHT/shOttuvwKIqJzRD0HFfkf8oFhg88S4O6ekTawoNpkM5d8yvMTwDnGqThS9ikD
 NNLQ==
X-Gm-Message-State: AOAM531YXL7yoQVAVA6qc5fdbBV0TTkrp024CIGIcCOPDkBp23XhgYQc
 hlV77JVAFwcOOoRHDkDiIMLlCZ1sqncfwE1+mt8xlA==
X-Google-Smtp-Source: ABdhPJyLFA43x/rspNk62k3ylwviv23FcK/eMPn1fRPIkjH9HWItgffFq03ypV7mfk4i4/8xKmmrYzz5huhriHFtMUk=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr3513016ejc.85.1607544533618; 
 Wed, 09 Dec 2020 12:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20201209094856.17788-1-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 20:08:42 +0000
Message-ID: <CAFEAcA_aP-9TA7NoA9=UnAX4duxUoyoz_9raYz0zXoaq1-nO6g@mail.gmail.com>
Subject: Re: [PULL 00/13] Gitlab-CI and test patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Wed, 9 Dec 2020 at 09:49, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
>
>   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-09
>
> for you to fetch changes up to b0bed2c916286326b248da05b2ca5f6d152aba44:
>
>   hw/m68k/mcf5206: Don't leak IRQs in mcf5206_mbar_realize() (2020-12-09 08:04:34 +0100)
>
> ----------------------------------------------------------------
> * Gitlab-CI improvement patches by Philippe
> * Some small fixes for tests
> * Fix coverity warning in the mcf5206 code
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

