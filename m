Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D5E4C43F6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:52:40 +0100 (CET)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZ9K-0005TW-Qp
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:52:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNZ1r-0007iV-IH
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:44:55 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=37541
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNZ1o-0001hj-UP
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:44:55 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id y189so5324747ybe.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mkA48NEHsTS3XwhMmolHKwYWcY1y3aiy4Kj6wYIdAxg=;
 b=w81NVLrRftQkSTgMl5OpShl/1MvCl842f153mlJPy7llDv/G63OWiO9rjucN1CH9Jo
 bMvu6/ibK4Gp/h672SCw/OS9GXlVeZwzP4AM8cHuyRjVXQRvYn9qzwgdWPuLAU1lyIjt
 rqjJmaH76x9rPiXm/gEUM1I42OOtG5Xn95yVjZRJ38Ai4cRBJda5V6Pyv8mm++SFaUgO
 2Lafv1gxEVL9QRMKrWCKOZlOGojGba6/nsfWA5lKo4cL22CDIkDRXFGjv+eiMhNUQe8k
 Xg8rRccB1ardQ6zb1m2/LnQUDq5CE0BgqUe8CKhrDWtEMeF9zcNyNDaJ2Ch4aG06JJdm
 FR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mkA48NEHsTS3XwhMmolHKwYWcY1y3aiy4Kj6wYIdAxg=;
 b=nje4TeLViMTNjFbNHpZDKVvdJmZB92q066DRBnmvGvnqqM2JPBQp+LsaPf8wEeTk1Y
 dvT/gLslp78L7YMK6qnTBGkb4VmfjauYZBN/kLx75HM1FkjgPoD8Sbuh1xmA36SZxUXR
 fkC4aVY/VdIxn7am0NQBh3E/sHvaa/Hn8JWEB7KYiU7A77RLDDwxzxTAVZjeKzaukha3
 3yMT0Ui66V4CpIF1tGrDei5abFXdunjUbNNyWmki1KXgGqjm2zZjYiVIFwA7z24iN+KH
 HG3mGjjci+sPdZsV4oLxRuL45jeFcoo2WMWxv+IYe8aSBROj76atPUprY3ECv9rQYH7S
 +Ghg==
X-Gm-Message-State: AOAM533KDac8bvQ9hTur6cvuoorNEcspHYx2ll3G3iLezjb+ZYDQkqi5
 8T7dKw3wSB8P84wbOYtdxIeiVZLHq8to1l0zH7C4pQ==
X-Google-Smtp-Source: ABdhPJzL2kDuV+Buec0XCGAYhNnthyyIq2b0YaxFuwYMSnTXkPynd1MRqCngcfLrO1+IKMA/kk1qQs9u44/5uWTGc68=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr6786414ybk.193.1645789491842; Fri, 25
 Feb 2022 03:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20220224190325.2990336-1-wuhaotsh@google.com>
In-Reply-To: <20220224190325.2990336-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 11:44:40 +0000
Message-ID: <CAFEAcA_hzOkgLaYv=Zy338zfv3WsvSyKVEgzS6bn03o0=ed1VA@mail.gmail.com>
Subject: Re: [PATCH v4] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 venture@google.com, Shengtan Mao <stmao@google.com>, bin.meng@windriver.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 pbonzini@redhat.com, maoshengtan2011@gmail.com,
 Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 19:03, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
> v4:
>  * use strncmp to compare fixed length strings
> v3:
>  * fixup compilation from missing macro value
> v2:
>  * update copyright year
>  * check result of open
>  * use g_free instead of free
>  * move declarations to the top
>  * use g_file_open_tmp
> ---

> +static void write_sdread(QTestState *qts, const char *msg)
> +{
> +    int fd, ret;
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    fd = open(sd_path, O_WRONLY);
> +    g_assert(fd >= 0);
> +    ret = write(fd, msg, len);
> +    close(fd);
> +    g_assert(ret == len);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!strncmp(rmsg, msg, len));

We always know we want to compare exactly 'len' bytes here, and we know
the buffers in each case are at least that large. The right function
for that is memcmp(), I think.

thanks
-- PMM

