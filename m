Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2865C326
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjN3-0004WS-3D; Tue, 03 Jan 2023 10:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCjMz-0004Vx-3I
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:38:29 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pCjMx-00037v-CG
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=URx43fIOG4Tjln4KjAnq3MJm5qTRVDOMPTv7O8g2uoY=; b=hsOWpWrAxm/v7nTkfyYdUXPyuo
 LHhTSZ+onJe0Q/Uhw4bfhVyX2Nd99vqt5K3kOJZvSy2Wn7CtKV5PmU3Hf1xaaTwbzTggwbVG6kEOg
 8bF51ljw/WdCHyc4bYE4DrARDywdj+G88XBpk8tkHCdPGdYEVGnHUzuJtDexdaOQEpWs=;
Date: Tue, 3 Jan 2023 16:35:42 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>
Subject: Re: [RFC PATCH] docs: add some details about compilation units to
 coding style
Message-ID: <20230103163542.3c3e57e4@orange>
In-Reply-To: <20230103104758.767266-1-alex.bennee@linaro.org>
References: <20230103104758.767266-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Makes sense to me.

Reviewed-by: Alessandro Di Federico <ale@rev.ng>

On Tue,  3 Jan 2023 10:47:58 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> +"Templates" and generated code
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +We make heavy use of C's macro facilities combined with multiple
> +inclusion to generate code. This tends to use header files (usually
> +with the .inc suffix) with different #define'd constants. While the
> +use of C11's _Generic keyword has improved things a bit this
> technique +is still best suited to repetitive boiler plate code. If
> more complex +code generation is required consider using a script to
> generate it, +see for example the decodetree and qapi header scripts.

Consider adding reference to an example to make the situation more
explicit and less scary.

Here's an example that hopefully won't become outdated within yesterday:

    $ git grep -B10 '#include.*\.inc'
    fpu/softfloat.c-#define N 64
    fpu/softfloat.c-#define W 128
    fpu/softfloat.c-
    fpu/softfloat.c:#include "softfloat-parts-addsub.c.inc"
    fpu/softfloat.c:#include "softfloat-parts.c.inc"
    fpu/softfloat.c-
    fpu/softfloat.c-#undef  N
    fpu/softfloat.c-#undef  W
    fpu/softfloat.c-#define N 128
    fpu/softfloat.c-#define W 256
    fpu/softfloat.c-
    fpu/softfloat.c:#include "softfloat-parts-addsub.c.inc"
    fpu/softfloat.c:#include "softfloat-parts.c.inc"

--=20
Alessandro Di Federico
rev.ng Labs

