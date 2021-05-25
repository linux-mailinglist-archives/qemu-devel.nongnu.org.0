Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886D638FFB7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:07:27 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUuE-0007Jw-77
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUtK-0005vn-Cj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:06:30 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUtH-0007yO-S9
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:06:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id p7so28031155wru.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1t5/I8QqkWpZCaw/dTSagNscKSRnvXoU16TET7enf3Q=;
 b=qne5cFKbNFoHrE4+Ip7tJhcFUxtiLHN2pN4d3wEUITxxJnorZKTVtICmu7kOGkJ0Nx
 TkyrHCe/aANf+UH+FcLAdzcD5dph1wUQsUuGC7Ge8AH2W8C0cJikWrIFdDaCCBECOZis
 PhuVBJ1biNt5HKSls2oS4O2mLatQYQJdNWsUTpnfhDdvX+y9mL4UV9WrTdr5/g1b1rf0
 dYUCq41opCwK2OxzlvQC2drikE6hBIiZZEtEkAuSZSArDKQIkVtHCjC03ARFysmQQVTm
 G3ayMllwTosKLqiuUI6R3HmalyE3JVfEjIfzBaGPXh2SkOq+L/44AzfADMfx1uogK/Mb
 YfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1t5/I8QqkWpZCaw/dTSagNscKSRnvXoU16TET7enf3Q=;
 b=kzXQftf+U8TNbJ/3Iw/QhmRbcB2WF0ByaNplhTsSM60+MTLD4s2WLzrKFXbDdI6bRL
 DOJRq8Gtqc6JLasv9fFkaw85sskAyopRDXPZ/2WjhuHj71PzU4+VPsoGl1DIel7jpOFt
 EC5ZQAYVjbNRDrZiU2lpQiJHeWUiagWdFB1IgrPub6uOrxJcR/8amhScwSvpanXq53xC
 tV249AWz0U0dcQAUj14/ZDukhmyDPXQBsn+TMhWgqjoEKue9Hh/QPaRIdoDKhzAllAYs
 S2imMFvTALVVQD9RZKVmLBe3WUUDQmgjdXiW5Bb2DcEQbcJWnOeLwfsRx0xrhpApAHDa
 Dq9A==
X-Gm-Message-State: AOAM531XRfMIt9Ae+Iil2jgkmWYWENHT8qOB4wAjO8ogfmU8MiMmdF+4
 lpHlTfCzONGeig5TWNZMwVaAHQ==
X-Google-Smtp-Source: ABdhPJyeG7wOUd1ThMZr2b1JfpeI8SUXw3mupwer9Xnp9E1rhkSUqKAikT9rIggGsvJ+aiaUy0fuBw==
X-Received: by 2002:adf:d20a:: with SMTP id j10mr25914615wrh.188.1621940785501; 
 Tue, 25 May 2021 04:06:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g6sm2119426wmg.10.2021.05.25.04.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:06:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DD021FF7E;
 Tue, 25 May 2021 12:06:24 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-4-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/9] gitlab-ci: Document how forks can use different set
 of jobs
Date: Tue, 25 May 2021 12:06:19 +0100
In-reply-to: <20210525082556.4011380-4-f4bug@amsat.org>
Message-ID: <871r9v3wen.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Document how forks can use different set of jobs and add
> a big warning so no new configuration is added to this
> file.
>
> Suggested-by: Daniel Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

