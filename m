Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED6220BA0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jul 2020 13:17:08 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvfPP-0006xH-EQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Jul 2020 07:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvfNz-00063i-GB
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 07:15:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvfNx-0003Tt-Qz
 for qemu-devel@nongnu.org; Wed, 15 Jul 2020 07:15:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id 17so5376801wmo.1
 for <qemu-devel@nongnu.org>; Wed, 15 Jul 2020 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=YL18sbQaPsXZZ77+m9PEXztauEuRKeQmOj6/CVJU0lo=;
 b=ghCO0HQp3Jg/azWOc0GdPHLpv96SeZfFOia67GPfHZxJY+FEznaV0iYOfxoJvsY08Z
 bXn+XOaKtQ+FCpGoT3xMdly5oCePMbxyYYyUi6gCjscp+xQ1PROtJx87M2ZLur5uOTth
 x7stls69CudvQlCOnq4ZZ6x4v68B3jstDIW66gvjGggusQVJn+UEmK1NohMh0iAlxYjE
 1Vktl6IjEvuLZQn1rrllsCzKnD8ZHcKsM1IDa4dw326tz/uI27g87Lt+E6MG65j9kI9e
 UMtn6LCZc8hbgjWJFCRjj0xrfnxDjqhR1LRTe9lTqTnyAqjdCB0pp4cJnk6072ZKfKbX
 mJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=YL18sbQaPsXZZ77+m9PEXztauEuRKeQmOj6/CVJU0lo=;
 b=VCNYZCWI5EQuAbfEdyroV5cPT9sfHwHchDLx1axZttyVRz5hvZv2a6LhPgmBqdsBXv
 TS/M5ttimJYsBEERbqn4Le1424kPn8iaM2S4SZ6q+eCXZP+sIwAvABJg/qyBn69R4wiz
 tV6dH0gnPSfmfro0F7u1lH1n5mB8QEc0CIQjt4kP/m4ezn7PuPQEkWF/fQNjSqdvOkx8
 lu3YwqK/E4RqkoA0kE5ryv7M64AE7qY/obEWGfAA44vHVu00ZmCpWd/sFTuGJlG3lD/p
 ECAFOfAubtBNKr98XiHgZZkSTULX6jaASDS7xDSMuvVrYIsZBY8v2C4KEeKPEUO6C5Fn
 tzww==
X-Gm-Message-State: AOAM532MYfM+6lxWWwmXYkSQ+3/1Y/1tOoxiGCg7cczfOSCpax7TONcJ
 7GloY6fxVuXKAli81uGLQTEjekr4xjE=
X-Google-Smtp-Source: ABdhPJyFTs6N8QDss37AlokvxXWsZV9n6PrebpY6pQC2OVtdZCZzW0Uffs0CMRMaiTEQo1Go1MiqDQ==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr8726285wmj.117.1594811735838; 
 Wed, 15 Jul 2020 04:15:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w16sm3656165wrg.95.2020.07.15.04.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 04:15:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAA701FF7E;
 Wed, 15 Jul 2020 12:15:32 +0100 (BST)
References: <20200715105542.14428-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL v2 0/8] final misc fixes for 5.1-rc0
In-reply-to: <20200715105542.14428-1-alex.bennee@linaro.org>
Date: Wed, 15 Jul 2020 12:15:32 +0100
Message-ID: <87imepxc4r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Dropped configure patch
>
> ---
> The following changes since commit c920fdba39480989cb5f1af3cc63acccef021b=
54:
>
>   Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-07-13-t=
ag' into staging (2020-07-14 21:21:58 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-misc-for-rc0-150720-2

Just sent v3 to add the Travis patch we tested yesterday. Sorry for the noi=
se.

--=20
Alex Benn=C3=A9e

