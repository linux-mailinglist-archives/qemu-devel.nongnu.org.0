Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2383CFA7E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:25:03 +0200 (CEST)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pk6-0001QV-Ao
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pce-0005cr-6i
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:17:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5pcc-00056v-DQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:17:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id k4so25958841wrc.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tE6xQudcT5NXU8OEcXWiK2TjntIE0/xhg2ghGHn1HRM=;
 b=bJKhgHc6xvdP4wWAbTl6cm9dXWWfljodK15h4hoxsLtV5YyxepE7XPVYiNGDOQlHeS
 Lemh9ws4PORe4g4mBj+JQ+HPkvNQ2cMI+B+r8L0XM/43bHQDiL4iKJjrETea5t/0GzGy
 Y09jS285mv4NjviHPae47oPhB47YSwKiwZhIg7+4P/NUw5NJpHPa/Vl/dJeq2UtdrdSV
 52dXcQuhCCt+/iqLR/y2dFG9IfprDVFO+loIWlIOTJ3EVj3uU3ntNO/dGJ0YXgEo/hM+
 ezw9CQHJD0aj/0JxBhcnGGS0O6zYeBB3a+K+F9qmjK4jJ3ND30vrCng71DmpVBRs0NS1
 zzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tE6xQudcT5NXU8OEcXWiK2TjntIE0/xhg2ghGHn1HRM=;
 b=PrqxAQfpAuRDlOZNurDyTLfat7LbdD5vPjyDpxyEs+Mpu5MBix5SjAb8Ajp8lA/LdN
 RK2+dUseLgTTvCnOH7/zBwQdtZ+IbV4UOSWQQGXjglDCS+0DP4Ng3YfJjMBcsK56E6PM
 6M4S39VkXsQLbzLSUKqLWnLNqc3y9aI9p1r/QYBeZAaHgqN9+jG2CyO+d3nQtMsK0xSK
 O3wXYr2Ne2tMlMQGeiMq0Oy6dgVxn7vAfWSEhyQRHU8jjCuU9QbcbTFhC9rjxDmNNBlk
 k8Q/SU3cUTPMN5AnEnbPa2hctAJPyywxwnqtaInW6J22bPWdwQob9Im40HhmrRDc+DA/
 Nz4w==
X-Gm-Message-State: AOAM532gjmeq84yBmmUeWf2nNWBpxWL2sHd8zFXHA1Cx5uiR5kkxHjuj
 qB4L5BfmmqqFmtHHbrs0z3OEfQ==
X-Google-Smtp-Source: ABdhPJxV3l4IluREUZd51qm1sSlLxv62hz/2D/by20QdZu1fbdsZx5v2oNfbsr8HL03Df0nJQXgN7Q==
X-Received: by 2002:a5d:5103:: with SMTP id s3mr34843686wrt.180.1626787037053; 
 Tue, 20 Jul 2021 06:17:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm10970353wmr.18.2021.07.20.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:17:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FEAA1FF7E;
 Tue, 20 Jul 2021 14:17:15 +0100 (BST)
References: <20210720011800.483966-1-richard.henderson@linaro.org>
 <20210720011800.483966-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v5 12/15] accel/tcg: Move breakpoint recognition
 outside translation
Date: Tue, 20 Jul 2021 14:16:45 +0100
In-reply-to: <20210720011800.483966-13-richard.henderson@linaro.org>
Message-ID: <87a6mhm8f8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Trigger breakpoints before beginning translation of a TB
> that would begin with a BP.  Thus we never generate code
> for the BP at all.
>
> Single-step instructions within a page containing a BP so
> that we are sure to check each insn for the BP as above.
>
> We no longer need to flush any TBs when changing BPs.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/286
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/489
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Nice ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

