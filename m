Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47F34CF48
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:46:01 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqLI-0000e6-Nb
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQqJO-0000CK-5B
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:44:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQqJM-0002zY-Cd
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:44:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id k8so12536982wrc.3
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kSY82Rf3izD8R4RT2zvZGAqmKfCrvtabDOkFx5UvO18=;
 b=USKGVODjmpHcL6PGOTNWYT9QXXDHMdXYIhd7oMpQ5tvx4rBNNcK7obkooiJenbYgNn
 qVd0JbAv5YO2Cgy6ByZhUeFSwA7DHgjsK1m53A9Dlbg0RbB7mZOsNfWP5P6OuMkuQR57
 wUCSRCQ5iOEkjtWsGn05FNOSLRzTD227oByMPtgG2eRcsVCjyxGUlk3zjD4Jw1+Rdlm8
 cUgC+KKy3dhjjht05LdcDrdz/8bkIpzmYftBslQaBSQSJO+vGcXIY/sMXz1ZGYaBPFhw
 rRjB0LTcww6VqSOAggEJxX7OvrQq9hDyoLSIwpI5grd+Abh8DDs+IjklUcKkQW8vgWhQ
 Q1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kSY82Rf3izD8R4RT2zvZGAqmKfCrvtabDOkFx5UvO18=;
 b=i05iykvb9mNCQMgyb5SbH19CRFm36O1EYY7ndrY89ywX7Do2T1giLdt1Jss/6gU2EO
 z+aUniU0NXVkpoBvKfmoHyy6P/Mf7BFcVCmBtKXTFBMYebj8vm1kYdk/uTrcjkrydAgy
 N3ipe1D0Dm3jrWIirPn4pFB6zBJkv/HWT0lYsqshaZp7wZmXNCgEr4A/g1tnD5yli9UZ
 nsJcul00DD1ktus8vr7iKdc7L3mi28qQafJVGEAmKPN/BqlH1EDs9ftGocji6+deX7a0
 WTh6JgW1kV7P3P2kp/9KyKPI7g6uxobKzRBVy2cNLXk5juW4fz0vlbPhosnIkt8CFeW7
 NnbA==
X-Gm-Message-State: AOAM5301YJ9hZZDlB1SZqT/Tx8OLE8aPbbtT5jxdkq5kUtiaQ/A385a/
 1zesqtO3wD++hFVK8eNIqsWkEw==
X-Google-Smtp-Source: ABdhPJz/xChlhO35gS4Nz+/6ADjUcnMDN/OmrgiIdDZ42TI3R5C3eEnNzKFti935MC6+8+9bZ1IFlg==
X-Received: by 2002:adf:bc01:: with SMTP id s1mr28136239wrg.240.1617018237898; 
 Mon, 29 Mar 2021 04:43:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c131sm25663391wma.37.2021.03.29.04.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:43:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0D631FF7E;
 Mon, 29 Mar 2021 12:43:55 +0100 (BST)
References: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] replay: fix recursive checkpoints
Date: Mon, 29 Mar 2021 12:25:12 +0100
In-reply-to: <161700476500.1140362.10108444973730452257.stgit@pasha-ThinkPad-X280>
Message-ID: <87o8f2xk04.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> Record/replay uses checkpoints to synchronize the execution
> of the threads and timers. Hardware events such as BH are
> processed at the checkpoints too.
> Event processing can cause refreshing the virtual timers
> and calling the icount-related functions, that also use checkpoints.
> This patch prevents recursive processing of such checkpoints,
> because they have their own records in the log and should be
> processed later.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  replay/replay.c |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/replay/replay.c b/replay/replay.c
> index c806fec69a..6df2abc18c 100644
> --- a/replay/replay.c
> +++ b/replay/replay.c
> @@ -180,12 +180,13 @@ bool replay_checkpoint(ReplayCheckpoint checkpoint)
>      }
>=20=20
>      if (in_checkpoint) {
> -        /* If we are already in checkpoint, then there is no need
> -           for additional synchronization.
> +        /*
>             Recursion occurs when HW event modifies timers.
> -           Timer modification may invoke the checkpoint and
> -           proceed to recursion. */
> -        return true;
> +           Prevent performing icount warp in this case and
> +           wait for another invocation of the checkpoint.
> +        */

nit: as you are updating the comment you might as well fix the style. It
would probably help with the diff as well.

> +        g_assert(replay_mode =3D=3D REPLAY_MODE_PLAY);
> +        return false;
>      }
>      in_checkpoint =3D true;

The accompanying comments in replay.h are also confusing=20

    Returns 0 in PLAY mode if checkpoint was not found.
    Returns 1 in all other cases.

Which translated to actual bool results:

    Returns false in PLAY mode if checkpoint was not found
    Returns true in all other cases

Which implies the checkpoint is always found (or created?) which I'm not
even sure of while following the rest of the replay_checkpoint code
which has exit cases of:

    bool res =3D false; (default)
    replay_state.data_kind !=3D EVENT_ASYNC;
    res =3D true; (when recording)

So is the following more correct?

/**
 * replay_checkpoint(checkpoint): save (in RECORD) or consume (in PLAY) che=
ckpoint
 * @checkpoint: the checkpoint event
 *
 * In SAVE mode stores the checkpoint in the record and potentially
 * saves a number of events.
 *
 * In PLAY mode consumes checkpoint and any following EVENT_ASYNC events.
 *
 * Results: in SAVE mode always True
 *          in PLAY mode True unless checkpoint not found or recursively ca=
lled.
 */

--=20
Alex Benn=C3=A9e

