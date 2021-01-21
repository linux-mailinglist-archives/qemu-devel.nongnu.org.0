Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5802FE9AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:12:12 +0100 (CET)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2You-0006fv-02
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l2Yna-00069h-Hv
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:10:51 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l2YnW-0002ib-6V
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:10:50 -0500
Received: by mail-wr1-x430.google.com with SMTP id c12so1492595wrc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 04:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OjyntYtvx7WG+HQzTwC9vGv1aQGwNRasQo2WwVlCdf4=;
 b=MpzINbexMQYQVSRHJczZWCSl5yM8YOB/6ACC1+q+gYOeEjgPIKu7aD83N2PKRrPXlq
 oBQr1v55+aFdxrsqWEMQtDGxdrfIXgtN9uqOl++ed6uhvC+8AbGa2SuJPg+YE5Mn0WQi
 wiIZ99yX3kYOgfeKIgQ4bwmNTQUNh2zvFvo9ev5dKFSyjch099rHtUaNL6dvTDYrusDk
 AuTmVChmcW5dqtzfRKvdC28p0J/9O9LTx84PPrsQlcT4PwrZvGkbwJEf3cHe+pWLclsG
 yrKIJfqBtOt71ARMF34V+e0frvTMCncXco4y/9cg022tgMj1VHZRjhxbfPkPblzHindk
 eAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OjyntYtvx7WG+HQzTwC9vGv1aQGwNRasQo2WwVlCdf4=;
 b=p+VIVrFNbVaT4/KT2xy5lCz5ouQLQKn9H69b9sIxYNGW2/vI1gIKdRfeoY3kA5wZMO
 asCIS0JmY+n/1GURu/LWO0zGTMsgPD0gFh4hjRerwTrjkzaHC04oY9Wp9gV4fZ9yviWP
 KgEUM5r901Mxy3svxm+JFsSg4h/mgSaSJbzG9n2vvtPRk27+Gw56OlO/+zs5Ss5cz3cU
 30UtFS/6RrOVwI2gzpNkV8mdPRlMzdak2NJWprOL9z2jO46ka9A+mP8BuYlla3iq1l3g
 6RP/aZbeYdvZCkIUwVDKhwEuq/KlM5S3CJS1B9RUGTDpHt9fRUniGWkYS35CeAmn/0UL
 cMNw==
X-Gm-Message-State: AOAM533+bT0qfeBvHjhysNPMNBYaeSTk4PA9y/BOkvCOXvfG222Zzf+t
 a+96U+hfK5fFEsR0zRIXzQqZGA==
X-Google-Smtp-Source: ABdhPJw2ANhGd6x+R+U1f86NvjSyUxpZdYPxDFkNxy87kFfIW5RWUiPRGiG4XR59POe5QNdcCMVg9A==
X-Received: by 2002:a5d:5544:: with SMTP id g4mr647575wrw.59.1611231041466;
 Thu, 21 Jan 2021 04:10:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q16sm31258688wme.1.2021.01.21.04.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 04:10:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09C5C1FF7E;
 Thu, 21 Jan 2021 12:10:38 +0000 (GMT)
References: <20210121025439.1120405-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg: Increase the static number of temporaries
Date: Thu, 21 Jan 2021 12:10:32 +0000
In-reply-to: <20210121025439.1120405-1-richard.henderson@linaro.org>
Message-ID: <87czxytrr5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: lvivier@redhat.com, alistair23@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This isn't a total or permanent solution to the problem of running
> out of temporaries, but it puts off the issue for a bit.
>
> Make the assert in tcg_temp_alloc unconditional.  If we do run out
> of temps, this can fail much later as a weird SIGSEGV, due to the
> buffer overrun of the temp array.
>
> Remove the inlines from tcg_temp_alloc and tcg_global_alloc.
>
> Buglink: https://bugs.launchpad.net/bugs/1912065
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

