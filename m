Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B054960603A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:32:24 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUii-0000S6-WC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:32:22 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTfA-0004eM-AI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olT9X-0006aH-RO
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:52:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olT9S-0007FM-SB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:51:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so1891378wmq.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kx59UVPAULjeAAseVQxdwqCgiZc8XQPqJR/5US80n2w=;
 b=r6jwLlnGhDo+vhcJlOH+MpNPeQQWgH39BaWgwyhRAqtnjakuhqmYSRguO/bbIXGtrl
 +4WAQkimcbYpF4sW+Ha7w3SbmTtlmmKwPf1jklPBKNlT9afnKHEUTUDG0ZX7Zv9Jykww
 XBqyNvXDl1qgR58V8w6+sLxT60l8DjM1fS6825mLPYy9X6zTYcsGLCyP+kmiGLOlBsdN
 DwgTPI/7zdIpBN3+bekqLmQLWTIX6H0yhb70INYhJ0TQpF3opeeNfVGvA0YhxPmjAOiW
 wCT03d+oD8x1FFIEQ2wRGaAithKYll6nwHRcB9EqNEpuS5n8W09SCAYYDDtPFfC9WBmB
 yZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kx59UVPAULjeAAseVQxdwqCgiZc8XQPqJR/5US80n2w=;
 b=IMVkT+EtQPAI5einpXfQu9oAu++ajw7LaauLE/wWK9+HipqW6bICOP+A0id/5xadFv
 2S1yVlI7TX/PIPrsl/skrnLvk1YRvPIxxWKAEGbNrqFW4bcoZSs8ZjVlKXT43TQbxLqs
 zMiX9lwtwGNdGLAZSnSj2s/1zCsd4bN2riZmpqWB8gTDX7HAonk7v7qra/aQf7v9eEea
 OEtQfhAcAlduKTcZu1uaceGNo7u5RfveySbNYhsvQAM01ETz94MeXmusvsyvpYIA9sRG
 RtVs7ap3LHD6s7vPwk+JwXALzc733AQysiiP0e2bVNl6refz2Mx80yGr7yoKQiWmxxB4
 Ag3g==
X-Gm-Message-State: ACrzQf24BUVlt5dJy7t8Gow/SdPwQryByJyp1DzxhGWnu7KkN2+FXeaA
 zFDW5Q1mtcaMO/PSIgTsA5DY1g==
X-Google-Smtp-Source: AMsMyM7AXyHV9PZ5Y0o5dDFZQ4MNbOCUUiTjCWFqL5oNwQjlRRyuI8YghWM6juQQDheHekpSPv8eXg==
X-Received: by 2002:a05:600c:5011:b0:3c6:cd93:cf24 with SMTP id
 n17-20020a05600c501100b003c6cd93cf24mr8675788wmr.16.1666263108057; 
 Thu, 20 Oct 2022 03:51:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16294167wrs.53.2022.10.20.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 03:51:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 070E01FFB7;
 Thu, 20 Oct 2022 11:51:47 +0100 (BST)
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, John Snow
 <jsnow@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
Date: Thu, 20 Oct 2022 11:51:41 +0100
In-reply-to: <20221020102012.3015662-1-peter.maydell@linaro.org>
Message-ID: <878rlaahtp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The avocado test
>  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_ini=
trd
> finishes wiith
>
>     exec_command(self, 'halt')
>     # Wait for VM to shut down gracefully
>     self.vm.wait()
>
> In theory this should be fine. In practice it runs into two bugs:
>
>  * when the test calls self.vm.wait() Avocado closes the socket
>    connection to the guest serial console immediately, so the
>    avocado logs don't have the last part of the guest output:
>    https://gitlab.com/qemu-project/qemu/-/issues/1265
>  * when the socket is closed, a bug in the QEMU socket chardev
>    means that it loses any data that the guest UART has not
>    yet consumed. This means that the guest doesn't always read
>    the full 'halt' command string, so the test intermittently
>    fails with a timeout:
>    https://gitlab.com/qemu-project/qemu/-/issues/1264
>
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

