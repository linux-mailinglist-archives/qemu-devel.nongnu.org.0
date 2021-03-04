Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C9232DAB4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:59:47 +0100 (CET)
Received: from localhost ([::1]:59172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHu8Q-00017W-Oo
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHu5y-0008QS-IW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:57:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHu5s-0005ZZ-FO
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:57:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u14so29019178wri.3
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tE4OlBm0guNeSE4zHtY1zogUrePDPOrdZIhVJ0XF4Qc=;
 b=X5OkdYcaeQqis9mJmqYQkW6II5gw+sbs19T4r/+vEFYJyugIsfFQEDXVA5UhRpgycs
 jjS6zsPaXkCa3qoSoELF51O91hmlwQrkcz9q8vTTs6zP7MBpr67Vj0Jw1N3PF5JRlPTM
 DhnQ/UnJBHOUmN3q/jEPR8eexfsJVJ208ANv59AAPPdO4fEFXDGci/yx6otzM2GS6X34
 M7ZNEwaEQnsCddNiE9F1ty/18wW/1UY0teTKydxgewkUKjOFGlSf4LnIWzXMOrSbrkg5
 IoyWJbzHiDn08s/ZW6XQ2P+s0UB/sYo4GCQz4/VULeN8VAmwwjwgcN7aNpxpupEpaOo0
 iQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tE4OlBm0guNeSE4zHtY1zogUrePDPOrdZIhVJ0XF4Qc=;
 b=SvWzJs99ekTtKKuLrk4ywuPrswXVd41eQ4wRMsFpwYqZ6V3FD1g5Wo0i+xX2H4GO9C
 Vf/Ls4llJ6veBS/8uNCT5zVCEz0ZloFsTq7lPPD1W6TyO7AzUuKlYuvxZmJ/T0WvV4GS
 7CLbxq3IQ9AG4EPOdVUOSOcFQLyx5X5sb34eqd3ZB1k6Oy595EWA0ghoQs6/JlbKzvRW
 Yn5Ay2KkaDmSDNlomdC7JkknT2Vv0twiV7dbWA46f8qu6iheApA2oqT9h4Nwk8VlLdFH
 Cd496cv12WUFVD1bYnhzkKG8UocV5kqV+862A/DBgntAKJzhuFdaJxvWLHsXHWXbEAeJ
 cLaQ==
X-Gm-Message-State: AOAM530zSnRE3r7HN+tMowWci/EtEfaNYWSK9IoPTtGWzYyEBOAqTCnK
 VFuQlUOueayzaQ9+EdIZLWweMw==
X-Google-Smtp-Source: ABdhPJzrZy5gWAZ6ub2d+vThHQvzECVFD+Zd2aHLVA3kI77MldlFYlrUWNQhCHER4fCxHzHM5HX2Ow==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr5694369wry.301.1614887825920; 
 Thu, 04 Mar 2021 11:57:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm480953wro.52.2021.03.04.11.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 11:57:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 182281FF7E;
 Thu,  4 Mar 2021 19:57:04 +0000 (GMT)
References: <20210304030948.9367-1-dbuono@linux.vnet.ibm.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 0/2] gitlab-ci.yml: Add jobs to test CFI
Date: Thu, 04 Mar 2021 19:56:57 +0000
In-reply-to: <20210304030948.9367-1-dbuono@linux.vnet.ibm.com>
Message-ID: <87r1kug0a7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniele Buono <dbuono@linux.vnet.ibm.com> writes:

> For a few months now QEMU has had options to enable compiler-based
> control-flow integrity if built with clang.
>
> While this feature has a low maintenance, It's probably still better to
> add tests to the CI environment to check that an update doesn't break it.
>
> The patchset allow gitlab testing of:
> * --enable-cfi: forward-edge cfi (function pointers)
> * --enable-safe-stack: backward-edge cfi (return pointers)
> As an added benefit, this also inherently tests LTO.=20
>
> The first patch allows a custom selection for linker parallelism.
> Currently, make parallelism at build time is based on the number
> of cpus available.
> This doesn't work well with LTO at linking, because the linker has to
> load in memory all the intermediate object files for optimization.
> If the gitlab runner happens to run two linking processes at the same
> time, the job will fail with an out-of-memory error,
> The patch leverages the ability to maintain high parallelism at
> compile time, but limit the number of linkers executed in parallel.
>
> The second patch introduces the ci/cd jobs in the gitlab pipeline.
> To maintain a limited number of short jobs, Daniel suggested to only
> test targets where KVM is available. This restricted the jobs to
> x86_64, ppc64, aarch64 and s390x. To keep the jobs under 1 hour, I
> created three chains of build -> check -> acceptance jobs, divided by
> architecture vendor (Intel, ARM, IBM).
>
> For build, we have to select --enable-slirp=3Dgit, because CFI needs a
> statically linked version of slirp, with CFI information. More info on
> this can be found in a comment in .gitlab-ci.yml, or on a patch for
> mason currently in ML:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg787636.html
>
> Test runs of the full pipeline are here (cfi-ci-v3 branch):
> https://gitlab.com/dbuono/qemu/-/pipelines/264484574

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

