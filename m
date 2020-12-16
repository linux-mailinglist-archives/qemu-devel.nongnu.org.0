Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976F2DBF2C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:05:43 +0100 (CET)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUco-00045e-Bt
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpUbQ-0003ef-5x
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:04:16 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpUbO-0002Kx-HR
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:04:15 -0500
Received: by mail-wr1-x431.google.com with SMTP id d26so9530389wrb.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 03:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5+cw+EU0KEIPiYT7mdQLJr+Gu4CRRofr1rW/wxY7C1g=;
 b=AE5v6oxOHKQQvaLLMLXQp1aW2T8fMP9uzBW27BIEoVTRtqdADiWMwzR18fZr9xckum
 98EJYPevoZka2s65Qd3x5x4U/9n2ycCC49JOVl2fB//RY7AHgsQEEsmKu/V6a8pxyHyk
 PFsayJPSJ/2pHKggK6BL3eSLaI4W9wkEDGOtJhYJmSmuQl4BYr4ehFSgKUdnwEyhXiYk
 3DrVTEjC8f88rVRyXsjIvOmmKbI9LBS1HVbZUz+2m4umNZq1qDg0F8eCoY0aJ3O8uhPK
 3RJ4hG6IKHFvqhjxGn68njGhnc1lt+eZDq7j+UANsOxKlC5uGYXsxwKr9CeM4bQ2AYSe
 ADnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5+cw+EU0KEIPiYT7mdQLJr+Gu4CRRofr1rW/wxY7C1g=;
 b=rNIzoHqMD62/Ct1M9wrTaAfBnxKpNuCCi7cB4Qlwg0HZS6NeR4GTyWgtA1KOLA1Ep+
 k74wFy6SxuJ2N57c86tbtQisTCGW/J0d37aG8q/7rQzQrUhgpx978ymlQQt1HOxGudgN
 icKepD7dec1iC4hLLAturx49KJuuXPtAMtut5rn8Ghlf+6MAGw7YyyYzoVETwdW6r6i1
 jgYQkC9Goq+M7q54CzMdb0gRWlFS/dD581r6wQzdYStOA38ovGFD1RJVUq5iPP6wYEtZ
 yFkzOY0WohAOM0h7rxnnpUTQNeJd+hgyVvHFQ38AP63gzK5J+CnmkH3f5ufW+iqfiF2e
 FyYA==
X-Gm-Message-State: AOAM532KRzTQLhpy/GGCh3984e0gTnxf/1+URkezju5SIQOIhoS4+dmv
 +WgBqHS/V4ZojZ7R9S2QSNU+ubYA52h+Yg==
X-Google-Smtp-Source: ABdhPJzYOQKGxibkUpGd5ZUjR8IQVw6E60N//TZPNIdo0a7NI7NLuFI7SWtOhKas6Oowv16FfDDCUg==
X-Received: by 2002:a5d:690d:: with SMTP id t13mr37561187wru.410.1608116652329; 
 Wed, 16 Dec 2020 03:04:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h4sm2640618wrt.65.2020.12.16.03.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 03:04:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EDF231FF7E;
 Wed, 16 Dec 2020 11:04:09 +0000 (GMT)
References: <20201215083451.92322-1-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] gitlab-CI: Test 32-bit builds with the
 fedora-i386-cross container
Date: Wed, 16 Dec 2020 11:04:03 +0000
In-reply-to: <20201215083451.92322-1-thuth@redhat.com>
Message-ID: <878s9yt3km.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> After adding some missing packages, it's possible to check 32-bit
> builds and tests with the fedora-i386-cross container in the gitlab-CI,
> too. Unfortunately, the code in subprojects/ ignores the --extra-cflags
> (on purpose), so the vhost-user part has to be disabled for this.
>
> While we're at it, update the container to Fedora 31. Unfortunately the
> gcc from the later versions emits some very dubious format-truncation
> warnings, so Fedora 32 and 33 are currently unsuitable for this job.

Queued to pr/161220-testing-1, thanks.

--=20
Alex Benn=C3=A9e

