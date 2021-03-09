Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21580332EFD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:27:55 +0100 (CET)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJi1K-0003L4-5I
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg6E-0006sJ-CJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:24:50 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg6C-0004SA-Ij
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:24:50 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso7228145wmq.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I64+POeFEnuEBcXTxNjaveHnBiq6jn2R4MYgf1HQjZU=;
 b=UP1YjdQdiE55Lpq9Fdi2lUTvi1yTlKRhxG3lloT16ntrq/QqoIVMUYyHGzXcH8G5In
 sfwQUW29tKkF/5CtVvRgzmgP3GglwFo2NejQq7vm0LYL3WTHT1Se6CvQbgVucrgL8r3S
 mjWpnZUzsu+aDOobnLwW8SMbO75ldxqr6t8jDgb9gflhuIsLm7nxkPEGYqhJaYc2xBy2
 6yChr8tQP9bsJLHkchv0InkHd3lDL0XIlHyAe5uJ+f/YazAbQsAj2rgiw45RsO1atnrL
 PWEggtdYK1Oem0ZaPKInT1tHuDkDD+vH653t6aVazl8sdoamOAc47KFy9GionhtKu5br
 2wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I64+POeFEnuEBcXTxNjaveHnBiq6jn2R4MYgf1HQjZU=;
 b=NA4XVkVOjBe67yWSYAC6COoyqZ7jyg3ZWtidcEp1/9dsidtNS1ISCwFxSzymITvbSr
 oTzdRstYqpTPdUWlnV47/4dGCxmTbIK2XOU3DByXT1LsdEO3en95eI7nWZUQcejZAh2a
 v8xDSP+szMoE50pgyl9HDwRUEz0Dzg5EiHSPeMOTTh09+ITy4Xp9u3l5oM1W9lXpQA/E
 jdbyMP8fzxWvSkl8U/3Norv5zcwO66gFADMk/qDSqMQkTHULBrn9gil25MTs8V0JmtKk
 3fnkC7D+dVrlIm/PmrTItB7IDoUNLvOU2xpypBc/PM8R+2RR7b4qBuWESAhO52xXvlDQ
 Ze5w==
X-Gm-Message-State: AOAM532LNESOqc5F5hi7CRXi84px+pLxtPbQGTP7Urwsw9PtSa7+PGEI
 jgB4ZqYit61Ed+u6eDTnAjlSLedWuwVTYQ==
X-Google-Smtp-Source: ABdhPJxhBsEwxW+57a9jQx4osDtCnrab98XMnBBPScmDE4V4M7AKmoNo0Mn8KTbWmVbEY2+HpUeOKw==
X-Received: by 2002:a1c:bac2:: with SMTP id k185mr5346803wmf.148.1615310686416; 
 Tue, 09 Mar 2021 09:24:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d13sm25450263wro.23.2021.03.09.09.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:24:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2C6D1FF7E;
 Tue,  9 Mar 2021 17:24:43 +0000 (GMT)
References: <20210309141727.12522-1-alex.bennee@linaro.org>
 <20210309141727.12522-3-alex.bennee@linaro.org>
 <87y2ewdzuk.fsf@keithp.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Keith Packard <keithp@keithp.com>
Subject: Re: [PATCH  v2 2/4] semihosting/arm-compat-semi: unify GET/SET_ARG
 helpers
Date: Tue, 09 Mar 2021 17:24:12 +0000
In-reply-to: <87y2ewdzuk.fsf@keithp.com>
Message-ID: <87o8fs8ckk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Keith Packard <keithp@keithp.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Note: we aren't currently testing riscv32 due to missing toolchain for
>> check-tcg tests.
>
> That's surprising -- the usual risc-v toolchain supports both 64- and
> 32- bit targets.

If you can give me the runes for it I can tweak check-tcg to generate
the 32 bit binaries.

>
> Othewise, this patch is
>
> Reviewed-by: Keith Packard <keithp@keithp.com>


--=20
Alex Benn=C3=A9e

