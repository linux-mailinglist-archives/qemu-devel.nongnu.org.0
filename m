Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657053C5AF6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:05:06 +0200 (CEST)
Received: from localhost ([::1]:53626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tkH-0002Rx-GR
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2tj0-0001iU-2M
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 07:03:46 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2tiy-0003NC-1C
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 07:03:45 -0400
Received: by mail-ed1-x532.google.com with SMTP id v1so27373709edt.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JrSBA4M9ZOlqnVX25mdHc7gZpmN4f+ymM5iGj61KSPw=;
 b=NiEs8Lk1SrLois9odYSDSzZXT711Pb6fQvkHdOaiEbf7eSxpQupShpOZMYpzG3pmV8
 fVI7k7+/uzetx3a+3WpOzWvV68ZPLYpFA3vJl8dm+CEHd+aPanqwMhgK0BalKnJKgod2
 GO8JqmKFYXzNQe40Ynb73rUEoBg+aM1whH0dhKBOSCTwPlGubIRyNwRjK1liM8kOo9SO
 SjhBvwY3AublQm7hKVR+3sR+KoorXe7x7QEtxkBPO3oz/hpTwEOC7UFPGInjgnY7HuYA
 zHE94JF6UMGvtQhBJxf/Nb5c52HSRJ+dy23dlMGPAIpdskBsndmswCBW1Wa+aM1o76np
 ptcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JrSBA4M9ZOlqnVX25mdHc7gZpmN4f+ymM5iGj61KSPw=;
 b=XgHSI+9AXQL7pCA8vJH04wTe974gJRnx0q0sSrbWSgWKs2/Yqv1sf4ZeAM8G2loHMa
 cY4PhFaxNhGzC7+wvywOuGj09FJwC/OjsrTlAFewX5pmGkHuV9snEsMPsxndDgo/RC6w
 K/x0VyrULz1wLgPn/AfMN77hV64ibJEv+MGO0gTcq2ou4c6GJNFhlok9eAJrTL7OFyow
 iweSkF50HhiXw01T9QnM6sB6+D8xOdH3oeX9vVumZ2dEX0qjuwk/4a1dfytfwWGizsZF
 DuzCcAu5YMogsW0ANFITyhmlqiD8HQWyylhgVKX6kegvs4jxrTFbSK8BmF1eoJw/Anne
 VN0g==
X-Gm-Message-State: AOAM5304Zt9QUQ5rwie+KgLNvtV8WuROq2rWX9HH9GfLr1rfQele30/B
 oKdqL+7Zp0wfONG/i4h8JaGfskVqYBgjyydTsuduWw==
X-Google-Smtp-Source: ABdhPJw8+RsSX13VxOshQb4u3hWiiDrGAivl1G+w0Uirsn3gtwBUBlB74ZF5gMD8ebScwBiOFWhVXGwMgRTMcrZk8b0=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr32626433edp.251.1626087822368; 
 Mon, 12 Jul 2021 04:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9ykYzTbuUskdCFkYYdYqZcUM5K2ciuFLKKh9_Y2GW7Dg@mail.gmail.com>
 <CAFEAcA8LvPSUw+x9GhPvKFvZqx6zLtUDYOT7Uh2zYef3RZx-7A@mail.gmail.com>
 <YOwJyhZGXUhbF+nH@redhat.com>
In-Reply-To: <YOwJyhZGXUhbF+nH@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 12:03:02 +0100
Message-ID: <CAFEAcA9ragK95AtCz0zCfxpDs0kF6SxXtq10smW44b4abCkTmQ@mail.gmail.com>
Subject: Re: retrying failed gitlab CI external jobs (travis)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 10:22, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> WRT missing job for commit fc32b91a, I see there is a Travis stage
> reported here:
>
>   https://gitlab.com/qemu-project/qemu/-/pipelines/334907106/builds
>
> So I presume there was some delay in running the Travis jobs and
> thus they only got reported after you sent the mail.
>
> The extra stage in the pipeline is not triggered/tracked by GitLab
> itself. Rather it relies on Travis to see the changes, runs its job
> and pushes information back to GitLab. This is completely asynchronous
> to the rest of the normal GitLab pipeline, so unfortunately if Travis
> hasn't even started the job yet, we see nothing :=3D(

Hmm. If nothing shows up in the gitlab pipeline, it doesn't really
work as a gating CI step, because I won't see if it fails...

thanks
-- PMM

