Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222773B6FBD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 10:53:20 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9Ud-0006wL-6R
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 04:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9TF-0005NY-1b
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 04:51:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9TC-0004Ah-Vx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 04:51:52 -0400
Received: by mail-ed1-x52c.google.com with SMTP id df12so30235811edb.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mFiqsyeWTJTrhMGg5FDsybFmVudJp8dJPyTQMLDq9ds=;
 b=UVSqnyYESEk4ju8aSGgBeDU3siNUj40GkNKbXyGcY+j//Kk0DY8XTDa58Ymmb3tXkO
 3gyWnSJl8l35oRGyRF0mXNt49hTCpkkdUyJkA+0hqTU7JZSr6EEvvH/xI/X5ne2dyBMK
 JmkaquJUob1cHt3rwZ/W948GGOgLBxOus1Nf4e9TUtPomKrKSZql/48kJV9n0SJJ+607
 SFmrWZ+VzCSE3EjfFqwnHrE+hVGlEa9yQ3Rp5+IeR8oel8DAgKIW07qR1TdVC1vueEQU
 UOkQ4h6gGMea/bufY1mamYGtLeCySmlUhJ1si3DItxK6rM60FCxqqUQoLfH0h76BnjFh
 Hcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mFiqsyeWTJTrhMGg5FDsybFmVudJp8dJPyTQMLDq9ds=;
 b=nxBjPDilfvgeSFOMeljbxaorIKgD15bbesjnU6BmoI2pC9NrnxJt5r8YCYB1UhkUr7
 LNfhQZXXwBgZfdL9YKth7zoJxm8et1+tm6eRA/bqU+YT+Hjj/rj1y5m2VXXgwsoIts5Y
 +T21V6NOaU8dAUG4Mnr4eJpKCKhYmWNb6vaDI72ndhJOAnycW/WOHGQrhU5oI7s1F7Iy
 vFmtOjcUyCvNIHUI1/myh60DpgrxnXvFL7pnNd0s3k7i8+sAjnxPwAKMzQ3CGQUxN6oX
 /0lxjnseS9YLjJJBK3gFz14HdaGdsaa1oZi+wRRd05UY8ilIA8bo38JIsmYCSi8tA9/I
 3Wpg==
X-Gm-Message-State: AOAM531R+SW/SuePBXabWnlIXAkh1l+kD5V4pjdJpa4LMtJ329jhixK5
 u1YBJhjf/9TAz2fCM2O+TIrCzzvcfpPfkFoTKYZkdg==
X-Google-Smtp-Source: ABdhPJyfjni9zcusKxH1LB5weNceKjHDT4pYxZ3Plct7uymVQlzqM+j6Arj20exCm2Gzg8+G7bn0E5x2c75Dd9IFxFY=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr38592958eds.251.1624956709096; 
 Tue, 29 Jun 2021 01:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 09:51:12 +0100
Message-ID: <CAFEAcA824Y_ggQ2DNP0btPCT5iS5p=u1gaSZG=r5nMLijkTFow@mail.gmail.com>
Subject: Re: [PULL 0/4] Hexagon (target/hexagon) bug fixes
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:08, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210618
>
> for you to fetch changes up to 13ce2ae03000137e1de8d40ff7ceae46fcb34cd5:
>
>   Hexagon (target/hexagon) remove unused TCG variables (2021-06-18 13:26:07 -0500)
>
> ----------------------------------------------------------------
> Fixes for bugs found by inspection and internal testing
> Tests added to tests/tcg/hexagon/misc.c
>

Could you upload the key you used to sign this to
keyserver.ubuntu.com, please ? (The gpg keyserver
infra seems to be having a problem currently since
keys.gnupg.net has been taken down, but the Ubuntu
keyserver works...)

thanks
-- PMM

