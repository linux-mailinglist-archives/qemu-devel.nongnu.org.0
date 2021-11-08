Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767964481A9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:25:24 +0100 (CET)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5aN-0006a5-KV
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:25:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mk5Yv-0005JP-CP
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:23:53 -0500
Received: from [2a00:1450:4864:20::130] (port=35762
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mk5Yt-0002TL-Kw
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:23:53 -0500
Received: by mail-lf1-x130.google.com with SMTP id p16so36590909lfa.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+eC/wvFE7Ow4V+jykW9LjE4Z+AhB2bCqGSQAwIS+nq8=;
 b=Um0iFHbH/I5SmDrB8KIGawOZU7yu3blW+HDfBMyJEXCmsWNI07LqGlummtiWWt3dCM
 LPmg1D10/oLQM2FqFT4YN/73jferRZ4kgYxBUX/qkcov8349zVM0CeT7WB06zLrTprf1
 4HQ4cv+oWRDbJrbKtE2dCWSYBKMlllZXvcLLIZ14tXUVtR3tBQM0VagIXbK+WavCjxoV
 4NyASRuNisSJJV0vXG2wsaPtoTh/1r/GSYKGGKM/gVbhX/GJtxsTbOj5+rYCTR6u4Xme
 3/7+88xbNAGOj1lcIqnUXgIafBm/lYvPHlXzqHhJTWqqB/upCIi0l9uBQK1SXjl4qiLq
 cc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+eC/wvFE7Ow4V+jykW9LjE4Z+AhB2bCqGSQAwIS+nq8=;
 b=U5tbK92r2C0p03QEKfHn0frWRVKqT37Th+hO2vzn9sRq521f/Z5fimRtUVIgF4EmXC
 5DAo/Yt89wJ6RvIOGqHAM2UnGGnX/yaH+EhZAIQdNN8t5rojo5t8CVjNZaa2UE52Gl5d
 Mc8LXxiQgst5qsliQYx8cETMkJJfiC7g1ITANehxTYBURo676sWSwjvBrp6JNwWAF+bv
 bQ5n0lsaZXtKusQPNO+gDqJAYCGeZu1shXz89sIsyW7lZhIR49F7Y91Nnjoh+vC5DckE
 DsGix5eqQwbm1S8+dV8ZUWd+BhncQk1gJvCr7GzjDPMedFp6FLw69jMe+5qT6nw60ec5
 Ps1w==
X-Gm-Message-State: AOAM5311QFip1/4xEsffqTwC+UGViVAUA4btpMhSfoL3R+lqvHN6xB1I
 r+CvVsxYbaWrrBjA0EgZQksyZYuQ3SZixA==
X-Google-Smtp-Source: ABdhPJwiE5dxKrASqVxGeqw2zmBBIWqcSa155XmKZ2Eoao5YXr3q5wsPkpcIJk0f3hDhWLz2vN95Pg==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr49012wrn.349.1636381085748;
 Mon, 08 Nov 2021 06:18:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l4sm16251270wrv.94.2021.11.08.06.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:18:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E83ED1FF96;
 Mon,  8 Nov 2021 14:18:03 +0000 (GMT)
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Subject: Re: Qemu and ARM secure state.
Date: Mon, 08 Nov 2021 14:14:45 +0000
In-reply-to: <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
Message-ID: <87k0hik9yc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jean-Christophe DUBOIS <jcd@tribudubois.net> writes:

> One small question/remark:
>
> According to the the "Arm Power State Coordinate Interface" (DEN0022D.b) =
document (chapter 5) PSCI calls can only be issued by
> "normal world" (EL1 or EL2). Therefore, should we be adding a test for th=
e current secure state in the arm_is_psci_call() function? This
> would prevent calling the built-in Qemu PSCI function if SMC is issued
> from secure state.

All that should be handled in:

  void HELPER(pre_smc)(CPUARMState *env, uint32_t syndrome)

which should cause things to be trapped if the CPU is in an invalid
state to execute the SMC instruction. If the exception is a valid SMC we
end up in arm_cpu_do_interrupt where we may divert to
arm_handle_psci_call.

--=20
Alex Benn=C3=A9e

