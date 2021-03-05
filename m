Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD132EF36
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:43:42 +0100 (CET)
Received: from localhost ([::1]:58476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICc9-0000a0-Lt
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lICNe-0007ed-O4
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:28:42 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lICNd-0007lY-13
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:28:42 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d13so3144919edp.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U0dl+186hE06nAv+1dMykXHa7aau242UowlnbHcB+fk=;
 b=uTTD/6An8CaP6YrMPsREjt9eTkAownz2gtvIdJ5RAHf6tldByyLe3tmDKFzwk4IZHo
 7Nuraot4opRo8O2QHrb2W0+pGPsjWuqwuNeZ2EUoMcS7oGZ01JipMDbQd5OMPy+W4/kM
 dsGR9sLYnSVkprGp3nSBiLoG6tcakn9WtGOMjvZhRGI/f0ivYaF4/Zy634uXDOIhLll7
 A6DqtwB0LJVzQWBBoJq5r28Phou7rcqRK8OsLSmSsB1x83jcixYRcIlqhyS/Ok81YKtG
 idcwx7Z03YhfOpGspZWsOh4JgJZwMUraHaWTusWcUv1OSdOzMRqn2LGr/HR1SnX8oR5M
 ErFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U0dl+186hE06nAv+1dMykXHa7aau242UowlnbHcB+fk=;
 b=PuZSzi89oGKI3KhuyvckWZBYmy/db6FpCg7da69kP98Vi4SkYxzYaCVMdnCMTvs0ea
 nDglKwD8nto8z7PQrfayk1AaGfrY9QSt2mKOUGyY7OtvILWn9rutPz+nLd8ulbJjy4Cj
 ImUSKIP14h50Bc7HcEau+1weBuCLUbJT6sMMgXrmrdds1bW2CFdgZd5375tzHdI/EEaN
 1d4mPhVCmIuFE9tdzKAYysFTfXuCEsWrpAHfZNoSCD0s/SUnqEp19XX37iWX3DSmh7MU
 dwP7N4vxE0iP+I2MbeD8dqo22wFroRW4UpHgiFLst9SXZUpq6f2xrRw7WsGpOx4w35Yt
 SpFg==
X-Gm-Message-State: AOAM532oD8GREes7hlzmla+xAZvpn9IRplsYHeXcSUJkA+b+QVSbNZ+U
 tZzraNRWjUViD9yzXq0esbLQyg==
X-Google-Smtp-Source: ABdhPJzjr+DHr+7bsh7CpuiXDehxXT/hH3OCRtRJOS7WZnt3ZUfK+8pGjQ20+mRmmC64De6vomsv/Q==
X-Received: by 2002:aa7:c843:: with SMTP id g3mr9681605edt.228.1614958119361; 
 Fri, 05 Mar 2021 07:28:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lx6sm1668480ejb.64.2021.03.05.07.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:28:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4C021FF7E;
 Fri,  5 Mar 2021 15:28:37 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <20210208023752.270606-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 03/70] tcg: Manage splitwx in tc_ptr_to_region_tree
 by hand
Date: Fri, 05 Mar 2021 15:28:31 +0000
In-reply-to: <20210208023752.270606-4-richard.henderson@linaro.org>
Message-ID: <878s71fwm2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The use in tcg_tb_lookup is given a random pc that comes from the pc
> of a signal handler.  Do not assert that the pointer is already within
> the code gen buffer at all, much less the writable mirror of it.
>
> Fixes: db0c51a3803
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

