Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B41D3186A0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:15:08 +0100 (CET)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA83y-0004DV-9b
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA7xj-0000mW-El
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:08:35 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA7xd-0003Iu-37
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:08:35 -0500
Received: by mail-wm1-x332.google.com with SMTP id i9so4852158wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sCoHBmtgWJaq+hfW0pH8Y2LCInIKenhZfFrnLzfoxX8=;
 b=DNZKiTTqZa0O5r0PzbMBEimXbRJglIJ0GJPbeOw2QLwJiUokbp8K4C3EtY3ePY+IRP
 9pCi1YRyqSRk2ElTbkxDIlhtiHGE5G5LoZ2oHIfWd9Ai5GbSTvogCXg8HABAldzIHp1b
 cYrxrqyPnrhT0swZL6FKuCaxF7HXb08nttxySKN5FLBrRlptNNnh7IIsq+4dZeYpfxy5
 joE8YiFc2q9eIGT5B2U1xe6l42SgXqlYUdhrjqtrukoq5Fo8VsZs89XXtSPpQvlzUgFM
 nx83gHOCms3sIzEWIqHFLL1r4OjKaQnbp0Htd6hNYFaxliA/Ifxm1ZVLTkcyrz4vRBgd
 iQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sCoHBmtgWJaq+hfW0pH8Y2LCInIKenhZfFrnLzfoxX8=;
 b=uW0PDbwZzboBcAitRQ0+wR8EIuX5OfVETahzLLKl8dI6TD8fniw0J5YAc9Mhs6vxuX
 7Rjfo0oF8zCC3Rk3M46bWftVRfMNGVQIM2Bwlk6WnU+kXVjb195YRp7eGvPUdaUTO1QD
 bE98YkFjPBp8IUDvN4poQuz4o5J0tpD9k2SHMGbeGVV2w0Geh6vpbgwP7HXjBqEd+s6y
 D5J2YBvCchUc+iNKXf8HEIU2+7rm8pMn14PGW/Fnca+mhzqYYGGbEs3pAmyJzGBo2Gw2
 aeEWQoCsfRfhtcd+9V03ivXLVVtO4d9fBguEnir0tJhNS2wdcEmGIvAGh4qcCkQ8gVew
 mM2A==
X-Gm-Message-State: AOAM530uV1hCR2KD0nZL3zRGISfnPUYAbaLmn9Au1FYlwcPJCRRSboTx
 WXQkLAqmt2YVJrlTUnucBWLE1gzArW9briF5
X-Google-Smtp-Source: ABdhPJxwE4D35m+m2P+XEN2jlyMFAwWo4q8Czt1WdJ/UWP5n8BEyTA8A1g0PuRUR5lTOQGVUmnU09g==
X-Received: by 2002:a1c:de54:: with SMTP id v81mr4008285wmg.181.1613034506774; 
 Thu, 11 Feb 2021 01:08:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a84sm8884949wme.12.2021.02.11.01.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 01:08:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 673091FF7E;
 Thu, 11 Feb 2021 09:08:24 +0000 (GMT)
References: <20210211045455.456371-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 0/5] Move remaining x86 Travis jobs to the gitlab-CI
Date: Thu, 11 Feb 2021 09:08:18 +0000
In-reply-to: <20210211045455.456371-1-thuth@redhat.com>
Message-ID: <8735y3ug3b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Since Travis changed their policies, travis-ci.org will soon become
> completely useless for the QEMU project. We should now really make sure
> that we move the remaining tests as good as possible to the gitlab-CI
> instead.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

