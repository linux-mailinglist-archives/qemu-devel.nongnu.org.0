Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955B5F19A8
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 05:42:51 +0200 (CEST)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeTOr-0002Q8-Hk
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 23:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTNT-0000y3-8G
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:41:23 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:45820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeTNR-0000ON-OJ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 23:41:22 -0400
Received: by mail-yb1-xb31.google.com with SMTP id f189so7345240yba.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 20:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=VfA8IAAo81rmMyGjQuypewia1eI22FmyjLjAgjfE8Gw=;
 b=a3Bflfp+2x3Fqm0m10j0bScf5sWGE/69tE1W/jGJrrlOUjIuTaJZJq2UhId3I2IDOZ
 d39czWMkSviEDvmDHSTPzLdJ9r2yLXKc/tnH3FNLxxUzamNNyvVOWwbpnt7rVxSx+mKr
 2N5RcsxPHvSkOWuJNnM1zgErHJLaGjKRJ+lti8tNvz9DQO1dHD7nIXWMzrdvDXiRZKsQ
 zLrNNwPOLyY0S3XguYFKAqoHnwFkoYtCFzCPpe9U6VC7tlKmqKiwuSjCsv7Y+AlKb64o
 m+1u+38m46IToMozyzEkEW8reBH+bw9k5iOs+VT6mDzvzJ2jK9bbeQGVsZdAmTCJpa9X
 csag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VfA8IAAo81rmMyGjQuypewia1eI22FmyjLjAgjfE8Gw=;
 b=SlnDu365V5TZbD7b8JU8TqydEm6LrLSPHZ4EHRbLIBU1cxphc86LQdtwbn8b/g7aeh
 FUdUoClblJUYU2+Y7TuDNye8GWCpujZdAzcu+h00zpw9PzWAqVrMsC/J968uY/V5veFt
 uFfTv9JvEeXq1f1DygovHuQwmZxVYY42/r4cwoS7TL2ks54sL0h94YzFLZkOlt0zxBNh
 ZaLCwfdtBE75+qouWYfDBX5K2DOEWcSAYE1boLrefN2RO49Bj51A2OjwvbCQTeeZGN7o
 yzQPuR845EjwdW5Jwwk32Cp7cCgL012RfjCwzTeXO0sUV9DjJAOSteBq6ZHa7Jot9+vz
 h0kw==
X-Gm-Message-State: ACrzQf0DuJY0z9qDIQ6ULP6n9mG15HNvwqGgtx6Er/qRwC/R/9HGSR4B
 eka16eCgMyb5TNpAUnl/TeZsy3z2oV5EAj2dFEbmzlKf
X-Google-Smtp-Source: AMsMyM7BKBNG+hg9SU880IiyJitcu9sy9D0SCicyQ72HZ+XD4ZRpXkb9bdl9B7Kii3M8IuHxz3w8+pn/DK8uM6TnVaI=
X-Received: by 2002:a05:6902:105:b0:6bc:fb54:f4da with SMTP id
 o5-20020a056902010500b006bcfb54f4damr4622734ybh.284.1664595680524; Fri, 30
 Sep 2022 20:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-3-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-3-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 Oct 2022 11:41:09 +0800
Message-ID: <CAEUhbmWAM45nRRSF+p8PPLbUOqeuz0g2W=Ytke_K+xk8Bpaokw@mail.gmail.com>
Subject: Re: [PATCH v4 02/54] semihosting/arm-compat-semi: Avoid using
 hardcoded /tmp
To: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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

Hi Alex,

On Tue, Sep 27, 2022 at 7:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Use g_get_tmp_dir() to get the directory to use for temporary files.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>
> (no changes since v1)
>

Would you pick up this patch in your queue?

Regards,
Bin

