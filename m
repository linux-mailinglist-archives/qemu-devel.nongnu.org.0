Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83F21F249
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 15:17:47 +0200 (CEST)
Received: from localhost ([::1]:38730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvKoc-000169-CO
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 09:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvKno-0000ZD-3Q
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:16:56 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvKnl-0006IY-Iv
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 09:16:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id s10so21478879wrw.12
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=aKr57dpSTmD52Kghf9YpcOpDuIt2rokhlDtI+w/GVls=;
 b=la4IT/jDxDa1uCIjXvguVV1IGZJNAcgGkV8MfWPvaYF3iwP9XPaeGed6LkMAkdmucd
 gggv9Hg1ygXn3aalxhtAbVu0f1IRYi2enwZSNWPoktUm26yJo7z67deJ/p4RvvW0HgFR
 +2/VrvNPQXV4sem8HIVVgCmInOODV/iU6PgoYLTy98OARzWjDi4nOphp2a30xz5U0+ZW
 Lz0dVWZO0b9wOLbHspoZt0bsujMpbfdK8lHlwjgETtKrE9+wXCtaox3FhHqrggF7ug9c
 jd/J8R0nuJadidT3ea7i+TDG1imciSNm5sVvJOnqmjfRpa+ys9iqDygN1why+S1b8JlG
 MB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=aKr57dpSTmD52Kghf9YpcOpDuIt2rokhlDtI+w/GVls=;
 b=gTQy5nTeJ/XPF+WHEPSBnCzVAKmPd25mYGqfwMo3FW7IAunAM08hu/tZPsDMqYQszA
 pQJ9LMjwR71Lkbj5Iec498/bfJZGXNdiokuKzyOpViZEwxrY9iIpxiNqDXL6+HltK9Yd
 CLqibE4oki9sD3cRWKmx4jrUT9jlBMBBI//8l4TDHuVnWuLsDpLEt9fkxq7xygr6+fYa
 hFyzK+AgyzvBf1tYAnYdZJs48VzALamP6z3kzvwiUFpMv5/hV7N5/zX7RxP5uahrxz+9
 3uZpofZ/HY4KBzkH1g5tAMAPHWysdl7QyX9HzyV+bHYbWhXMl9gE7Dh9T/oL5uyCTw4q
 qaFQ==
X-Gm-Message-State: AOAM530mdBU1pGT+k3uGhZPozdsXj7pVx0NgwTJ0ru2/0BIrzz/7VGKI
 PJKnkh1NsoInxDYJsbvDOpK8fw==
X-Google-Smtp-Source: ABdhPJwldwg9mbYjPlhpGk8+0Che5tEzuFPW0K6/w3lM18l0uR/5ehNLCeKDoHO3IHhpKQGUjdIUKQ==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr5281445wrm.31.1594732612306; 
 Tue, 14 Jul 2020 06:16:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p25sm4150834wmg.39.2020.07.14.06.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 06:16:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 572FF1FF7E;
 Tue, 14 Jul 2020 14:16:50 +0100 (BST)
References: <20200713175746.5936-1-peter.maydell@linaro.org>
 <20200713175746.5936-3-peter.maydell@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-5.1 2/4] docs/system: Briefly document collie board
In-reply-to: <20200713175746.5936-3-peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 14:16:50 +0100
Message-ID: <877dv6z16l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Add skeletal documentation of the collie board.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/collie.rst | 16 ++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  MAINTAINERS                |  1 +
>  3 files changed, 18 insertions(+)
>  create mode 100644 docs/system/arm/collie.rst
>
> diff --git a/docs/system/arm/collie.rst b/docs/system/arm/collie.rst
> new file mode 100644
> index 00000000000..9f8dbcad25d
> --- /dev/null
> +++ b/docs/system/arm/collie.rst
> @@ -0,0 +1,16 @@
> +Sharp Zaurus SL-5500 (``collie``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This machine is a model of the Sharp Zaurus SL-5500, which is
> +based on the StrongARM SA1110.

Maybe:

... Sharp Zaurus SL-5500, which was PDA in the 1990's based on the StrongAR=
M SA1110.

just to make the class of hardware clearer.
<snip>

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

