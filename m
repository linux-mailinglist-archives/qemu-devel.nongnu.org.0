Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B84B8521
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:05:08 +0100 (CET)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHBL-0004Ys-2f
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:05:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKH3V-000400-Ue
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:57:03 -0500
Received: from [2a00:1450:4864:20::42d] (port=33729
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKH3T-0007MN-OB
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:57:01 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e3so2595833wra.0
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T88iPfNsPfNK5oSpqsi7z5ML+7PQ6/DVGiwrs7CFHco=;
 b=RL2WxYJEHlXKmPoTV/ZIGzyMh/OJF9HzM3YkLv2FxTeOtn8ZTIZKDKGLZyQEaxfAl+
 utx5wCM14YxiQKZgpIAnVHw70mEAZ7WFhbEzMYIEBSUXqlzb87+PUxiwL1vDA/q7Q1Zv
 U322XkHfbkzPnHY16fkLF5TnJWx6ZwUn0eEmAirSMadhtZuTmblSrwValLvBSyhhYFFx
 32evjCni3faDQDACDWwGZejFgnzTraDS/1/ndc1ORr+CN3yZa0vse5slOA87n5SG+ez1
 DMTNaN9GiVohr3H0is/8WBZq2IQ2j4nrAQClL4tyFcgy8NGie+aGxmOrmiCy4eU+GLsI
 TUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T88iPfNsPfNK5oSpqsi7z5ML+7PQ6/DVGiwrs7CFHco=;
 b=3zIv5vEphFWHuBHbhT6rYRkJFMFI3ptyvaSKczac2o7zwFSgvBeO/lxt9O4/zMiZ3Q
 1836qcYx/XOmlwIzuSe/+GD/ZKbpWjZCgZKfVt8O8mafqMX5awp7QpYIwaAv0STeOflN
 1xAuki2+213vtWrTkIwyjpwHRIPMP/S80F0OPAyBhRgz/hx3t4oZiFuqukulUTrlQ6q1
 zzbdLKk2yKbJtZE8eePSIOxnPvnV76GlYlfwO5hAju4WNjMq5P0d8OcSs0MYnoNJSuNw
 6vUIvQ7o+PUJaEAfBO5ZpzBGb2xZVPyzq2jSPd67nAJGwXh5//DEjcSpPX+aqT3tuHru
 3UOw==
X-Gm-Message-State: AOAM5320QBJtjLcZnq6gAh9vzTbmGhLnsYtcMnUCyPsmi3xcGAG8BaIg
 yWArX07JbTNS6FIUlmuA30+NkvBFKmiacW+QaJd2Jw==
X-Google-Smtp-Source: ABdhPJyWLvXFStAWc2mxX4y3lphKtNAl2TMKPSegyiyVAHcK1Ae/HYFavPxIO5ah3mt/bvbZ5w5n6rM/GExShJhl82o=
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr1671882wrm.521.1645005412305; Wed, 16
 Feb 2022 01:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20220215093223.110827-1-pbonzini@redhat.com>
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 09:56:41 +0000
Message-ID: <CAFEAcA_xPeknSFpf0M9vETUXk8fW0gfiKg7eiJszJfagsJubqw@mail.gmail.com>
Subject: Re: [PULL 00/30] Misc mostly build system patches for 2022-02-15
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 09:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 2d88a3a595f1094e3ecc6cd2fd1e804634c84b0f:
>
>   Merge remote-tracking branch 'remotes/kwolf-gitlab/tags/for-upstream' into staging (2022-02-14 19:54:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3dd33fd665e7fb041350849e35408f679dfa7383:
>
>   configure, meson: move CONFIG_IASL to a Meson option (2022-02-15 09:36:13 +0100)
>
> ----------------------------------------------------------------
> * More Meson conversions (0.59.x now required rather than suggested)
> * UMIP support for TCG x86
> * Fix migration crash
> * Restore error output for check-block
>
> ----------------------------------------------------------------

Hi; this fails to build on OpenBSD (on the tests/vm/ setup).

Meson thinks it's found OpenGL:
    OpenGL support (epoxy)       : YES 1.5.4

but either it's wrong or else it's not putting the right
include directory onto the path, because the compiler
fails to find the headers:

In file included from ../src/hw/arm/virt.c:42:
In file included from
/home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-calxeda-xgmac.h:17:
In file included from
/home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-platform.h:20:
In file included from
/home/qemu/qemu-test.sr5128/src/include/hw/vfio/vfio-common.h:27:
/home/qemu/qemu-test.sr5128/src/include/ui/console.h:11:11: fatal
error: 'epoxy/gl.h' file not found
# include <epoxy/gl.h>
          ^~~~~~~~~~~~
1 error generated.

thanks
-- PMM

