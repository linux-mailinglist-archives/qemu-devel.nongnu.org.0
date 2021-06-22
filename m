Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B43B0842
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:08:52 +0200 (CEST)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvi1D-0000wW-JH
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvi0M-00008y-Jd
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:07:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvi0I-0005BD-Pp
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:07:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ji1so28982107ejc.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rOykonGL9jSeNoR/k6R/8dEC3m6L4rDUD7u50fNJmr0=;
 b=H0nkV+YMicGWltZvdvf4aQceHH7whUHHmW6tMcVhu25mhpe4o3SH40oDuE1I9IYpua
 Im+f61Q21/YDvk/478YvKMYA3m/OIUleqHzALWhTxNKksoLEC+rOPYMdUfv/ACppiPgc
 znKp7TQb5fEM++ymQl2f02h7qtjvOShz/aWX0EaxCQNo+Sgkt1+LSrtvEHMF8d+jkSwW
 FG8Gq6STdfNqgKpJElAXQBDPEQfj2IMBZICAbz09JcIIPeAut+GsHxixG75FN+rQVlMD
 meweADghT4o/zprpEqJAxFZZkQwYPYAlwXKrF3mwZkTfx+XxL2pZmHR+DWQBUtpaCPdM
 W3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOykonGL9jSeNoR/k6R/8dEC3m6L4rDUD7u50fNJmr0=;
 b=DLpDL4T3hrZHtXdcrT1SX9oWXvU2mcWYDcFHEMbIUfK3Z/RuamlTn1UVimYwzWhzB/
 BSIo/kYnRRKzrL6/d0ARbiJ5SKlCOec2FpRZ+ONdUXMZi/paGlkg73/1aPmz/JdGCIxN
 3AQzaxCbGdmnXLQMTDLevi7dedWlCbxmGGNxeiw4mxkdVh2gzJ6S3S8f39HMq4KcxoYr
 watBzx6MfxRt3OYhHlVxA1np+zMD9iIXI0lN36xGhonN1/pienAjp/laP+Gp7kmrdak0
 Mf1tim4GDV8tf4uMvOpBwOslRpybvjt0fSZV7jI2xEOA773/vN65WXfRuSTWq0Yz+ZVg
 Bdaw==
X-Gm-Message-State: AOAM533EA/RSos5Mpy/7Ly4LGGlDZ8IPpKiajcWXSFVdDR7aP727MpLr
 ozMEEf28qht4Ul+VlujjODXZSJG329j0gS2qgsUOqA==
X-Google-Smtp-Source: ABdhPJyJQhJ6PfAN4GFaW9gog5OLgO4PWz00XniWi77lG8YLgvDgu0O4yrTCtANmY5O0vLFPllMuNEI+M6qnC5mq3Y4=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr4342135ejw.382.1624374471307; 
 Tue, 22 Jun 2021 08:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621095842.335162-1-cohuck@redhat.com>
In-Reply-To: <20210621095842.335162-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jun 2021 16:07:15 +0100
Message-ID: <CAFEAcA8saQGgfq7UhAY6TCqoyyNpZFGuCkCgcuD1nFb9w9orcA@mail.gmail.com>
Subject: Re: [PULL 00/37] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 at 10:58, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 8f521741e1280f0957ac1b873292c19219e1fb9a:
>
>   Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20210618.0' into staging (2021-06-18 16:42:25 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210621
>
> for you to fetch changes up to c626710fc755628d0d6b88aab0514c9238a84522:
>
>   s390x/css: Add passthrough IRB (2021-06-21 08:48:21 +0200)
>
> ----------------------------------------------------------------
> s390x update:
> - tcg: implement the vector enhancements facility and bump the
>   'qemu' cpu model to a stripped-down z14 GA2
> - fix psw.mask handling in signals
> - fix vfio-ccw sense data handling
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

