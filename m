Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2DD29CCB4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 00:37:14 +0100 (CET)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXYWf-0003uM-7U
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 19:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXYVv-0003Ta-Mq
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 19:36:27 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXYVt-0005aD-RR
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 19:36:27 -0400
Received: by mail-ed1-x52a.google.com with SMTP id w25so3254748edx.2
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 16:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xPMVz+q1e5vxoZ3+ssDeKFQl6Dt1tfMddMg0/h5c+Jw=;
 b=TkGios9nU+zN+ixtVuNSagh9QlFiXwrWLGw369+BjuX5A6CPzWWk10EkAawRoUlij8
 ttnt0i/F2zFyhb0AoiWZ6ojGhVV0l/UchLR/C97K7DIA3zVHEJFGbakMGxN4kuhspSYp
 5gU9QDrIo4Rip57LkFkU3VKtofD38XCI6K0l7YHF+RGoxZh6DTmeGj/BxJ6pdcoqzvCB
 bhsCPI9gv3m22MRdL8Ic7Q5LNxwx0T2iOnpeK/8/0gZqx+0kTBUzK+PAHjFOqXZVdXmU
 tb+fHSXfljfPF4fybUJqcTlFiSoaTIRVkuTGl/EqnDEECV7csOgkdBPO+WcJHCNDRNrd
 G0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xPMVz+q1e5vxoZ3+ssDeKFQl6Dt1tfMddMg0/h5c+Jw=;
 b=gdKLpDIUK5sQj70sDVAiMLw5XsO+8K16OYc/2hSN3O67TurK6TH4OHhFnyD2W5KpWD
 QNnLI/ZnAtP5Jf2km13w7ALoH+bkCEWhTXdWtCJjpGA4t183fIInDDVtey9uExlgtFXM
 O7/uAnp/IdunW6UMfJiz/okkfmtdGJSTn6VZi+JGwHDGFeCsG6ZA06VytuXXPfIM8mmW
 T1tJz4sfrXFjA/CHArkqyRpHCizOqudeJLYie0zkEdFt46bFV/Rw6QVUvs5FkLvXRbvi
 TG2AY5pHOMFCl75Ni0IX5pPPAXwcVq0/9YzHWTWyMXCDobw1T7OcaDtZ8uk6lsIvMOBb
 QS1g==
X-Gm-Message-State: AOAM533PVXRfLYkGwV72iY6qVCqhjnmA4YRr7KD3lCdmY5kHboiklBOV
 Cjap9rAaWE88X/XFwk34XR5gEnUpIeiEx8E9wA8VbQ==
X-Google-Smtp-Source: ABdhPJwnFV6oKhBWC0VUqoW65bVPeeJVXbOhvks/GPQz6imde2yUx9Z98fkvl0mKIQYL5kF7kSMbay20GUIdWb6pXLU=
X-Received: by 2002:a05:6402:1482:: with SMTP id
 e2mr5028295edv.36.1603841783919; 
 Tue, 27 Oct 2020 16:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201026190726.19515-1-philmd@redhat.com>
In-Reply-To: <20201026190726.19515-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 23:36:12 +0000
Message-ID: <CAFEAcA96_PaYnwO2qc-ONQZB6=JTUPzwkWKWU6UYg1uUk1ePoQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Acceptance testing patches for 2020-10-26
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 at 19:09, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit a46e72710566eea0f90f9c673a0f02da0064ac=
ce:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201026' into =
stag=3D
> ing (2020-10-26 14:50:03 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/acceptance-testing-20201026
>
> for you to fetch changes up to 4c9ac67230d2d8c12bfc0f3447ae353e67b43f7f:
>
>   docs/devel/testing.rst: Update outdated Avocado URLs (2020-10-26 18:20:=
51 +=3D
> 0100)
>
> ----------------------------------------------------------------
> Acceptance testing patches
>
> - More ARM tests
> - Documentation update
>
> CI jobs results:
> . https://cirrus-ci.com/build/5754555684093952
> . https://gitlab.com/philmd/qemu/-/pipelines/207807648
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

