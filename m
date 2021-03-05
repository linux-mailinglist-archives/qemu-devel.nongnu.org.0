Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A432F61F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 23:54:09 +0100 (CET)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIJKh-0004se-HW
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 17:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIJJL-0004EI-W8
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:52:44 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIJJF-0004u8-Jn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 17:52:43 -0500
Received: by mail-ed1-x52e.google.com with SMTP id d13so4873492edp.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh6FM4aEobIwqwltwKCz6GytNw1X/PJPbaJplxnwAXo=;
 b=BQE7fvjgJO1d6mn/QB8eZXJ7u5z9POVC+HVZWGXD1GovWFzZPJ8PUR8ihyEASoNMDn
 cT5CeHUpZyikckfRA9DwmAb0L1O747XSmTLqNrSNwsPoW1EjRiy0OUc0BjT4MmY9lqKn
 6x5gIt9wmJy78AkrT0nGxcv6oWD6TiscIHRDvSXJfmw56gH3v/VMwyL+jyIPL9Vz/LC4
 6Ru2XgToX3uvOB/Cb7Pt9IrkYbLe1dwWpMz4/Tb7MFngpmqpWxM9RT99HEwbjlIBj4+d
 meP9Z4ZpM2p0LgqV9UmXW+ZpBiFw94qB2Fd+r3hMgOX67jtbPMXvFCdSZZO+hfPy7Ds7
 9L5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh6FM4aEobIwqwltwKCz6GytNw1X/PJPbaJplxnwAXo=;
 b=IcP4d1ftHgPE/DotXo6DUzrY/Q/GaqpIhrLXBgYHQEbubZVrLTpOAlOBrmkJoSfjwq
 FvOSd3Nq+7laTVgUCKQ+1yaOQZK8lCHbWX1FBVLh3yYJ/dvH+WqrU/dYH0hIhA2j6Ax0
 S4ubMsxe/RRifQitthx3KIQwmR3Tyovg5dMK1AcQVWP1nzwiiSUSqv272gu47HjMsBsI
 O+9GYC71kdD3neEDe1ldY5ecsvo2h6gW3uLpzCU/4hyJ3gmHN3D87OWDbgOCb2RdC7EZ
 zLn4RrXhXamlx+QQ+48LbXKuTGvaJZF0DctsF/nylflNjnLFfW7N78EMm+E/JTuwbQMR
 y90g==
X-Gm-Message-State: AOAM531Vs7iidYvdJGzIhQfIcuNj65z37tW4y2DbGYobbYu/1o2tgg/K
 oPD7lO+dQ054Or4fm7foHj0NM/qRl7KVKrnYh0+DSw==
X-Google-Smtp-Source: ABdhPJyh+I40sKoYRWlA8feXci4HP83uwRJSqp0WYZE5ARZjZ39CE80ObtZ5SW3H0YC+wvIAflSlcQGuJUN6KisjYAU=
X-Received: by 2002:a05:6402:40b:: with SMTP id
 q11mr11364035edv.36.1614984755525; 
 Fri, 05 Mar 2021 14:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20210305155517.1604547-1-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 22:52:19 +0000
Message-ID: <CAFEAcA8WKNmNLS9yavoPKgqjaJTZGPsA24xNn4LZ7q-XmTRS5w@mail.gmail.com>
Subject: Re: [PULL 0/8] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 15:55, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit c40ae5a3ee387b13116948cbfe7824f03311db7e:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-03-03 16:55:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210305
>
> for you to fetch changes up to 39d5d1404ed695f4a1cd2b117a6cf2d92dd8e8b9:
>
>   target/s390x/kvm: Simplify debug code (2021-03-04 14:19:08 +0100)
>
> ----------------------------------------------------------------
> some accumulated s390x fixes
>
> ----------------------------------------------------------------
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

