Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C433E8F47
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 13:09:52 +0200 (CEST)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDm7M-000188-03
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 07:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDm6d-0000JP-Bq
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:09:07 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDm6b-0003Cs-P9
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:09:07 -0400
Received: by mail-ej1-x632.google.com with SMTP id e19so3467640ejs.9
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 04:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKwq1LNQ5xEA6FuXHNTjnJGElG0O21uSt8lg/DvSXKU=;
 b=QouedPhetDiTwRMRmV0v2fvXx7qE5EoHVsiEa0kAGClSVUR2mR/YiRhDgS1aXsQi5J
 qMC6/XSSRXx6WKRUZa3ya1TXoBnZIhPirzhxrWSYh6j08HUTCxhN2F1HBmRCOqAPPZIK
 WS2kKDNIySrLb5/C/v/CuVqvHBukF1k0fy287PET/UGBsJJOUJE1tE0+Iv4lmVJWpoG0
 BxqfRWG2P4dPOMYH9noFqkqvRcIEfPkdLIJWjjWYQ3prESoH5hR0EfTXz+/OKTOpnCp1
 TzHGkvm3aXAyTikZ55RLMtWhWFsaw4NjRegJo09zme9345MWXUSko+UDuJ+tZoSuYW7h
 4SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKwq1LNQ5xEA6FuXHNTjnJGElG0O21uSt8lg/DvSXKU=;
 b=Y32zIu+bzZgSFni3D6n6D6VkhYYWN3Q/VrLguAFlMqCBvWaWthOEcmlhquRZQKskie
 yWgwOc+U2XjrPKiLObiVf5NhHxIPtZooLq00nn8W8HEnN/qjxlxoPSK2hMRfSL0JyUEY
 qMx4zs5xdlJp140RonxsEZWK34HwAUXQBL47ozdP7ddYIrUGhLTipuifYKC47BHWgo8A
 sa5DxhnMPS54tkkIfKTkIWCUBnpuR6z6luBg3SomoAuF+g6dvly0hnaBH1Jw+rjkViNh
 3BHPYnVByhGd14WPnZNgropTAMYeiGXSOqdgBvDO8OUzjNbbzkSXYRJIET9m/JUljSUF
 dXDg==
X-Gm-Message-State: AOAM533VF/AWFGc1KBftYISZ/CEr0qQ9GwuWHydpSc1VDsXa38ugMkgJ
 XXwSWhIbE21k3r4iL8V6YOdBjOLV1N+su/EfMx460g==
X-Google-Smtp-Source: ABdhPJxhY+d5D60G6E89FjG7lZGhdU8uA+vvMYoVGKw0Mu3/5+1fzduL1Vm5h6WPy1tSq6smUlHU+s1AXWhQEIEKKq4=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3034663ejy.407.1628680143537; 
 Wed, 11 Aug 2021 04:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210811095949.133462-1-thuth@redhat.com>
In-Reply-To: <20210811095949.133462-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Aug 2021 12:08:18 +0100
Message-ID: <CAFEAcA_t48rMSX7SKnJNNMPXPmKpy12iXc2N41EywTBYfapKtg@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/vhost-user-blk-test: Check whether
 qemu-storage-daemon is available
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Aug 2021 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>
> The vhost-user-blk-test currently hangs if QTEST_QEMU_STORAGE_DAEMON_BINARY
> points to a non-existing binary. Let's improve this situation by checking
> for the availability of the binary first, so we can fail gracefully if
> it is not accessible.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/vhost-user-blk-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 8796c74ca4..6f108a1b62 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -789,6 +789,14 @@ static const char *qtest_qemu_storage_daemon_binary(void)
>          exit(0);
>      }
>
> +    /* If we've got a path to the binary, check whether we can access it */
> +    if (strchr(qemu_storage_daemon_bin, '/') &&
> +        access(qemu_storage_daemon_bin, X_OK) != 0) {
> +        fprintf(stderr, "ERROR: '%s' is not accessible\n",
> +                qemu_storage_daemon_bin);
> +        exit(1);
> +    }

It makes sense not to bother starting the test if the binary isn't
even present, but why does the test hang? Shouldn't QEMU cleanly
exit rather than hanging if it turns out that it can't contact
the daemon ?

-- PMM

