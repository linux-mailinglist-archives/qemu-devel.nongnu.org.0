Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870AF2B0CB6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:35:32 +0100 (CET)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHRT-0006tk-AO
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHPq-0005Vu-HP
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:33:50 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHPn-0004hq-H9
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:33:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id r17so7110756wrw.1
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=nEwzLhUiz6sjYDejCxqXXemMeV0WhtLieEA4kzCwpjc=;
 b=Rt38Ku658/zdYoIDg0Y6FD0b0UB4i6vhzkGqwqenpDM1QvjBUHFlawpKhHgNlHPSzm
 JMS84vE4+bWeZLfSSowAfkP91DUjXZ4QVB4KgNjvFhWmftwN1xceoCbr+nme53WHluNj
 nRMXmje0yhy5pQ+ByymkDCV6cTLa9972lM2elt/g4TTY1bllrfB+qSD7c507HClz8Fd2
 mxH7xo1ZB/32TMnXarcg/2Z6CG3TyuXJKrpQ6t1gxdkDslfB8laEqs4HW8l7lVaDL0N8
 4Rdm8sV/VF6fBogoCbzlLkTJ8qs9DnmC5VyxrsPYle03W+El6ocFgCOVfTAq7QuxAPDZ
 aH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=nEwzLhUiz6sjYDejCxqXXemMeV0WhtLieEA4kzCwpjc=;
 b=DUlp0XxH100zOd5jGp0Hs2QyT00z4rcRv9t7x8A3tb7BOjdOvMQjpekkm8bXrqUFXe
 L/+1eE8Jd6wIsFFWo5hNDi4dDWy+ryIlccpK8p8FURaUpS678IrDVrFzN79PtwL+JwTK
 xKraxKtTV2z33Wh4CS+zjwM4wPrw5QOGRTbnPH7E0oGn3xxN1r+Qo57ARuvK47kcrXe3
 PC8w0nOKdmAJ95njEfB8u0/Fa+pNTBSKsqBV0t5OvfJS4AmeJc++m/M+MKkD2wIyRRcp
 MB9xuZxUchhfRgF/htg9SKc/LuSCtbiTo2c72/EtvA3HMksMyeh59BG6jeodbS0tSWiC
 f7OQ==
X-Gm-Message-State: AOAM533mfPA6GGYNbkWoigl9YimRvzPMyqB23UAfT74nEYMhTuPOCQLE
 ZOcs3QIFkhzYZDLTmdWiqcG+3g==
X-Google-Smtp-Source: ABdhPJxLrCDrPTOGhvxeqwXG4x22hbjklV9SXQx3IcFQBiMbc79jOxt6hYmK7XF5gMjtcr6s9G9LXw==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr963848wrt.135.1605206025417;
 Thu, 12 Nov 2020 10:33:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k84sm7409283wmf.42.2020.11.12.10.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:33:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 427FC1FF7E;
 Thu, 12 Nov 2020 18:33:43 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 0/9] docs: Move orphan top-level .rst files into manuals
In-reply-to: <20201112144041.32278-1-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:33:43 +0000
Message-ID: <87h7pu5ss8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently we have a handful of rST documents that are sat in the top
> level docs/ directory and do not get built into the manuals.  These
> are a legacy from the period after we'd decided we wanted rST format
> documentation but before we'd set up the manual structure.  This
> patchset moves them all into at least plausibly suitable places in
> the manual set:
>
>  * virtio-net-failover, cpu-hotplug, virtio-pmem all go into the
>    system manual
>  * microvm goes into the system manual, but first we have to create a
>    structure in target-i386.rst that lets us have a list of multiple
>    machine types (along the pattern that target-arm.rst does)
>  * pr-manager.rst goes into the system manual, but the part of it
>    documenting the qemu-pr-helper executable needs to go into the
>    tools manual
>
> If anybody who cares about the x86 machine models would like to
> create some documentation of the others ("q35", "isapc", "xenpv",
> "xenfv") you now have a place for it to live :-)

I should have read the cover letter ;-)

Anyway I also ran a build through rtd:

  https://qemu-stsquad.readthedocs.io/en/docs-review/index.html

--=20
Alex Benn=C3=A9e

