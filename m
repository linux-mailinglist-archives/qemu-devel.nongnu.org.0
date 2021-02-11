Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF0318A57
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:22:12 +0100 (CET)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAz5-0007xJ-Jr
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAAxV-0006re-AA
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:20:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAAxR-0000nG-Uf
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:20:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so5538099wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:message-id
 :in-reply-to:mime-version:content-transfer-encoding;
 bh=c/hcsND5EFXgDb824xu68ZlniS9mEfNMbmA3U9eQIEM=;
 b=teq0j9w9fBVTxIHwLQ3SaOxwm2RWp8LU4Ud+olnY/jx+7j76cJA88MYW7kItYdafoI
 k/LUKYD9RS36cycevqbx6A2M5O9M4/qgYUPwmB5VrbYbvb5+KRvsbpenzZw2y5i4GDBk
 z2mQEm2DU9X4IMF2KgTL/QL5kFDPp/TKVCv756Q7W0CtsgoeuON6JrFKhDfozC2B6I7C
 aYXMFTar8DDwnotsVdYgQIi7KUel1kEgcycw46dZHLwdZ/ZxLwL6h3cyza/7Dfc32Zkf
 vBDkSx4FgL25kFCSyQ4Y5AjhJrVkqKPZPSw5OdOVJBJDv1CgcLmThz8Pdf85BjpktT8j
 pzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :message-id:in-reply-to:mime-version:content-transfer-encoding;
 bh=c/hcsND5EFXgDb824xu68ZlniS9mEfNMbmA3U9eQIEM=;
 b=n/neobaSjAgWxm/VzOf+WIsYG+INihi4d80W0vGXM412HY2ZfBF1z9MHOQUjmP3th5
 hvCZNVP4czLiv4DAYC7wpxVvlYbw7eNIvqBZJtBKziVn9XWXEUa4vIHJ8RtM5WkkADUi
 +xl2dzM6W/puK9HLdJBhm69EWFNYfYKUGUjGGG25qSbRRCrPLCFYakFJTuBGOD4NS4p3
 9QjgsbnqT1ZiCS/nWpotU3mUd5+vfjJ7zvPDOwk/VKxcKsWEiJR8irwIg7u7xfS4zFAx
 LO4SpXYTBqs6qjulYTWe+tDUALOEjPLK15+wdIiw30NK7H+FpEF+xvpyd0eY2NUq6e4y
 W0XQ==
X-Gm-Message-State: AOAM533QOpmEe0IjaEcYP3VJiEIU9iXptuaKKHcNLnsn5+pjmljOOp35
 I/qnlT8FQwIToqEUaBeoEUr0Bg==
X-Google-Smtp-Source: ABdhPJyW5lLV0r24LXYIDDGC3OPcfHayDFz7zvN/cIBmqA90F6vhdCGmwV1vHziFzzjI3errkQLn1A==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr5027620wmc.162.1613046028379; 
 Thu, 11 Feb 2021 04:20:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm9091399wmi.10.2021.02.11.04.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:20:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A22411FF7E;
 Thu, 11 Feb 2021 12:20:26 +0000 (GMT)
References: <20210209135011.1224992-1-berrange@redhat.com>
 <20210209135011.1224992-2-berrange@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] tests/docker: remove travis container
Date: Thu, 11 Feb 2021 12:20:07 +0000
Message-ID: <87r1lmssn5.fsf@linaro.org>
In-reply-to: <20210209135011.1224992-2-berrange@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The travis container that we have no longer matches what travis
> currently uses. As all x86 jobs are being moved to GitLab CI too,
> there is no compelling reason to update the travis container. It
> is simpler to just remove it.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

