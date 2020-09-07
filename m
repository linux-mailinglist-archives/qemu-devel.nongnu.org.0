Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEE25FADF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 15:00:01 +0200 (CEST)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFGka-0002kP-Uj
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 09:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFGjC-0001h6-MO
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:58:34 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFGjB-0004qQ-5m
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:58:34 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i22so18102222eja.5
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YaCwAYYT2e/73tFoxibB0ArPIru8r8j4VxjT7Dah278=;
 b=nMNhKQ/oqKEASobUoMO7KPQCe3jqE8lxMvqwO7foLQ9AqdJ5CPivODqsc+rnKhVmov
 z4KCi6EeeCRrs1nefRjoOSX/JS0/3T3pmWE6MuLSgVhGFpLZtIfhTrXhOpDQclMLxtLs
 nA+TfW6zUKEDQjAJzEZJ3HtlsTEeuiHBHwJ2kfb2IKJ44GGST5x63PPr/iefKe4Zzjc1
 B8pNlcickWZIDCiZofeJnfAz+XC2Sm7xwziVGp4nAE86NVyoTHlF+N5E8UK1yQRI+Z+8
 /aDe4p0Js29DpzUFtJa7aMSTiZ1mibRg1bTTznZVgch0LuoK6GZkgx7at7OocKFonIAW
 rghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YaCwAYYT2e/73tFoxibB0ArPIru8r8j4VxjT7Dah278=;
 b=OFgNnWF0WlQHioYAYYgTGiw/GkSq707tKl5MBShdfvEcKc0D8FAS1AuTBXumDQv3MB
 aUDzXq62hJcjIqpqVNybILW+YePmIwbc8i0w3DZmE6gBHNiJLSSWEa3a9MzOZTeLYLrA
 ehrBYD7jip0XOk+RtAbn0xrQH1/n4MR+wieRo1Bv/q4KLx7foIBYpfuJ2bIWNUrksi2i
 IgkY39/frMjDLhhq92wqOh3ljpdxOp4F4PehJGyCkFqEglRD6u9/qcXljUGa2mcQnNZb
 a7QwOjKg6WeRkHHwCDVjpJPmAlR3P7wIujSXgdLDJ5PQh2MSIpSrtrq4+VDZUjYkvB8R
 OJ2g==
X-Gm-Message-State: AOAM530J1Bqhx2wfmXHGpime7yUJPsVczdoiQtswLlWiwrFGDSSFF6uT
 HFQtMtk0FvI29KcJxH8fCBS56Imqhz7cKEKhCjvC9A==
X-Google-Smtp-Source: ABdhPJzrEeE0NNkDfU3otV88mNIORkXwJnHo2kXzsDCoSy0/yt1NqFNbUW7qOqO24B4fNx/+aOwxvoN0rkWket2+fzU=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr20471076ejr.482.1599483511780; 
 Mon, 07 Sep 2020 05:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200907125212.GH810755@redhat.com>
In-Reply-To: <20200907125212.GH810755@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2020 13:58:20 +0100
Message-ID: <CAFEAcA_O8huQnONrVKwYdUgHQaZEqf1FudZaNscwRcbYWuWaaA@mail.gmail.com>
Subject: Re: Plans to refreshing iPXE roms ?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Sep 2020 at 13:53, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The current iPXE ROMs in QEMU date from Janary 2019, so feels like
> they are overdue for a refresh.

Sounds good. My impression has been that ROM refreshes
seem to tend to arrive comparatively late in the QEMU
release cycle -- I think it would be ideal if we did
them earlier, given that they amount often to a big
infusion of code changes all at once.

thanks
-- PMM

