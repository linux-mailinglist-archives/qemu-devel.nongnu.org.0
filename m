Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7915EFC39
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:49:20 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxex-0000A3-8s
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwk4-0001bR-1l
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:50:34 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwk2-0006U5-Js
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:50:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id e18so2786142edj.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=wsqHRfkVqa1L/5qYcdzVNn3iAzP6rNBMGeMxvwg7j1E=;
 b=YZ6nCDzbJrbMPSWQ4hOqw2yI7I0ppY+1A4tdsWk02mToQbsz+pa375MgUzPodD8YD2
 Ac1LkUIw4TbiRl3pNBEqtQhPEZEQZzxP/R3SRUfLRWQZkEo+ZP48GdeTCyLSVicjtxmB
 WaQzlULFFsWe1SbQn5xcZOMwqe8sz9C9BDQR32pzSIIxvi2jTm/Pp+6NrrS3I1HJ/2Jr
 LWdQjaW+wQQZFHmY0gKwD4MbhUgPj3UpGofd0uf+Os72KlOBS3PuGUS/9MCIEQGh5MWf
 +/ypOsnwL2ODZjM3BMZmUu7fAsJxZ0erkJkjaXslGSXvXxvXAxacX8hlAgR0m+6FZzVy
 Wl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=wsqHRfkVqa1L/5qYcdzVNn3iAzP6rNBMGeMxvwg7j1E=;
 b=edd/U03zbsg7CiwMsOsY62GXPD+flsfOsB1YqBQhXAU7NvW2tTIjEsvFHdefQQaOue
 jZGgZ22988SrLq6nAXCpo/zGPvhIAwJjEmsQjObAdtmruL3EYu6VZ4O6Tp3rJwbspOk1
 ev/bI91RmgaaR+VrMbZox0vFkiUQ2Pg2nEfnnapHqT/QIZmZv+FslcEwzhcpS9KeX0ky
 Qnf8Sk1gxIctiYy7SMRF+Nz32Ys887eTRqh1SwYzb59/osmDBSNk/eeQn35eKTWYsbaW
 WitxFgH7xDo/GuAM1XcRUIfb1uGuj1NVuqKfBJXARMkxBYiP8TjZqJNeutLA5pFASK/g
 Ig2g==
X-Gm-Message-State: ACrzQf2VnCzxs0QURE+RK2olNcR4zdbWQjaASZ5LkdOjUWBenwxzhpP1
 KoQ7lZjRmo7mt+Cr6eyKAiZjyEaUtLxc/qOlkxirTA==
X-Google-Smtp-Source: AMsMyM5AVFBYJgnD2jYeFWlcJ0ehg7bQJpYvSYQ6lM5o2Hib8ln+WKz24GMyhA7aEAcrpNELsETP60M48vqa7q/lgAA=
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr4128313edb.241.1664470228365; Thu, 29
 Sep 2022 09:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220920081517.25401-1-frasse.iglesias@gmail.com>
 <CAKmqyKMX-UdspdDkRsF+e3cMHHW5=_79_AEngeniH=M1LxMseA@mail.gmail.com>
In-Reply-To: <CAKmqyKMX-UdspdDkRsF+e3cMHHW5=_79_AEngeniH=M1LxMseA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 17:50:17 +0100
Message-ID: <CAFEAcA83YBVCOjFCp=7DJxWzd3RU8QJd3Z49yEPUpuY5mqgCaw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/arm/xlnx-zynqmp: Connect ZynqMP's USB
 controllers
To: Alistair Francis <alistair23@gmail.com>
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Edgar Iglesias <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, fkonrad@amd.com,
 sai.pavan.boddu@amd.com, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 29 Sept 2022 at 02:28, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Sep 20, 2022 at 6:23 PM Francisco Iglesias
> <frasse.iglesias@gmail.com> wrote:
> >
> > From: Francisco Iglesias <francisco.iglesias@amd.com>
> >
> > Connect ZynqMP's USB controllers.
> >
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>



Applied to target-arm.next, thanks.

-- PMM

