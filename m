Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F322E2AF752
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 18:24:24 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctr5-0007D7-IA
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 12:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kctpm-0006OI-Jr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 12:23:02 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kctpj-0005io-Ci
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 12:23:02 -0500
Received: by mail-wm1-x343.google.com with SMTP id 19so2981535wmf.1
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=I3FNkO+B0OMd5VOmjRoxA34vtk6UjpP6UADmMOsze5E=;
 b=ThzXz89iZKXbTtsVZqFYzQ8Ujx1Y+wTcGTtdAkgnbIvcM+J6ix5xqZaChvJzq5xmzp
 aO/j523n9Ou+JT3JfgRxSC1xVBCusC/v4AWpvLAwG78+yUzcGra1c6bGQhhr+nCp+ehQ
 yoNUi5Qp57Za8EzYQfif2+WiRmIVJJhCU3b8bqgmE/wKXYmWJgg49QS77XXrNlZVL3po
 Yn2XNGgo7SM1J5zG3qD/B0uYWBcK+ar2wViXNoYsONB/cEcspxcDMHsKyh8HeBAvkv5j
 nrFh+kh4b8/3YFPdekXPU4XU6RrOjoQtwi9wvNXFj/hSlybZ2lvu7APN3tdHYQN/LShX
 cSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=I3FNkO+B0OMd5VOmjRoxA34vtk6UjpP6UADmMOsze5E=;
 b=dNfpiwWichci/vDSJoW3azD1sl8dFm49qVfvAYJ++SmAqVo9BLNqbu74st9ptC7jeo
 LxZHgYnl6dk3sLJ7pKp+LQYm0kOq3+cOIOniIhRdKTFIbhWq8FGU6GLnOsE3R8iCDXR/
 4taXbKnZnyxFVfpBVVicq1KzpzG3D1h+t6d0qKFqp1uwoS06lXNZlS2UmTiKUUBLV73L
 rk6vDl4a6+pSsxpY/63FWOnFhVWhXPy3aj3WnFlFVCQlS0tF877b5UthhN7TwU5wMve4
 pjS+cP5Ll/8EvggAauXyFRgIWeJHu3VL53FJmEKyMLKQOkQ2IcUAZh8Q9pk9s/jAZ8Xm
 pgow==
X-Gm-Message-State: AOAM533bV4pdQDoXGKelaSjgaJP3XJ1qBl+ECfKBbh4iAVe2FgyttPOf
 XsnV8zy2fcnUxv0oH+t31pZ77w==
X-Google-Smtp-Source: ABdhPJzk579dkd4Cdv+etVRSNGzuqCjMXz7oRy002tHsWLhjeiGA55KQ37YmkkPqjdsDlcxMj6z+gg==
X-Received: by 2002:a1c:5f83:: with SMTP id t125mr4128538wmb.82.1605115375583; 
 Wed, 11 Nov 2020 09:22:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm3276511wrn.75.2020.11.11.09.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 09:22:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 534E41FF7E;
 Wed, 11 Nov 2020 17:22:53 +0000 (GMT)
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
 <20201111142203.2359370-5-kuhn.chenqun@huawei.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v2 4/5] plugins/loader: fix uninitialized variable
 warning in plugin_reset_uninstall()
In-reply-to: <20201111142203.2359370-5-kuhn.chenqun@huawei.com>
Date: Wed, 11 Nov 2020 17:22:53 +0000
Message-ID: <87d00j7qqa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Chen Qun <kuhn.chenqun@huawei.com> writes:

> After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identi=
fy
>  that the statements in the macro must be executed. As a result, some var=
iables
>  assignment statements in the macro may be considered as unexecuted by th=
e compiler.
>
> When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler=
 showed warning:
> plugins/loader.c: In function =E2=80=98plugin_reset_uninstall=E2=80=99:
> plugins/loader.c:382:15: warning: =E2=80=98ctx=E2=80=99 may be used unini=
tialized in this function [-Wmaybe-uninitialized]
>  382 |     data->ctx =3D ctx;
>      |     ~~~~~~~~~~^~~~~
>
> Add a default value for 'expire_time' to prevented the warning.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> ---
>  plugins/loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 8ac5dbc20f..88593fe138 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -367,7 +367,7 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
>                              bool reset)
>  {
>      struct qemu_plugin_reset_data *data;
> -    struct qemu_plugin_ctx *ctx;
> +    struct qemu_plugin_ctx *ctx =3D NULL;

This doesn't really fix anything because you would end up faulting if
you attempted to de-ref a NULL ctx. However...

>=20=20
>      WITH_QEMU_LOCK_GUARD(&plugin.lock) {
>          ctx =3D plugin_id_to_ctx_locked(id);

...this can't fail. If the lookup failed and returned a NULL plugin then
we would abort(). So why can't the Euler Robot see that?

--=20
Alex Benn=C3=A9e

