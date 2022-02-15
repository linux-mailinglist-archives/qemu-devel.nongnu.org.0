Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92C4B7442
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:06:09 +0100 (CET)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2DI-0002gS-57
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:06:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK28O-0007nO-Md
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:01:08 -0500
Received: from [2a00:1450:4864:20::431] (port=39752
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK28J-0000og-0X
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:01:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id d27so33475537wrc.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 10:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hDgOuShkiI43vYLf1+GhgKiQWBz+TwVIXLFATL2dXRc=;
 b=Rp7U8OO/aqtsyksmBMXNnBzKUm4gEpzgC0yPbC8rSbOZ4oW+FdI83EPypX7c55UliL
 /57ncY6ztHrGcG8OFzTo6L2R1JD7sVvGuy0ZIb0+mt5khQAoDAlaGPvb5tvTKs0ilLYX
 nTTH7Gt0RG54CA5k1usqci6xdKS9WEa07NPzCIdxOXVUMd5L9RnFzERuCuSotJ8UKwZ+
 7nsiGUu9FqNjJB1hApDS/M5iIm1kjykVF6LsNoCg5shaj697fHi4RHwfHlDIhSP5cggc
 FieBL24exF9kk4jgSRlHk0zBoHFBcyWywkubEoqFIIwRdLLJo+PEUJ0JoIDDZcfer4Qe
 cYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDgOuShkiI43vYLf1+GhgKiQWBz+TwVIXLFATL2dXRc=;
 b=5bDrlBRMFNGZZ1PvlGuuSOWDyMVGSs8vErWSb1qcHe9ZSdlZ8E+jYwENe3JtRoOyru
 JiV2PBNLJWequmsHFKhAZjoydM0Rok1+x9HdPHXzRbIG33UPkWcQWQ+QDiD8+D7T+Tof
 gqRqbg9ZiPmgWDY48dqGzhDhRlilBrHu7IFe9hna3dQCJJHHpyIj1qwnzHcurm64OYes
 DmTw1ARuBB1pBqrLABGYafHx7BX8Davlep2+KV7GEsKsf/sxqIElysv/0tJJ5AcfJ7VR
 FmbsVpSZt0BLAgd1UZZ5qUyhJ4jlHtt2efEBLozXCF0jnpPSIUp8mn3IPLuXoSjwaGOJ
 6Ovw==
X-Gm-Message-State: AOAM533vMQ1AMCqzw0hpZwgYOuUTZ0KvFvLL7TOpGVe2/U9RmK7YgmOh
 UCTFyoRNWjUut0sKVW81maTWK5m26he5N3yyaAMpZA==
X-Google-Smtp-Source: ABdhPJz+BXMmDma2Dq9Q4G8StpRxKg5OEU16PtjeJv2UdnGxP6dkqRRbTDijXa891wPxX6EhMMX5GmiOSL/FSFrajoc=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr149800wrq.172.1644948055656; 
 Tue, 15 Feb 2022 10:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
 <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
 <CAFn=p-ZeG2XM_cP3hpKN-Cagk4T1Sr05YEDhtwmR4+_VOjVt7w@mail.gmail.com>
 <CAFEAcA9fJMQizPmd1rUh7wPgPoz4dAXQPP07DzDFQK1ieN72VA@mail.gmail.com>
 <CAFn=p-Zpvf4W1zZtnv5a9sn=38=dgsa7HUMnYM7dk7xW7gRB3g@mail.gmail.com>
 <CAFEAcA-XvLDYRsM0Yf0TCg=7MMDCe7cKz0qcMFcOx5KZfZTyQA@mail.gmail.com>
 <CAFn=p-YnPiexJLCNGikCvJMSZKvuyUoWhb6vmBz966cWcEkObg@mail.gmail.com>
In-Reply-To: <CAFn=p-YnPiexJLCNGikCvJMSZKvuyUoWhb6vmBz966cWcEkObg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 18:00:44 +0000
Message-ID: <CAFEAcA_JbCrWRX=uHtbm=b+DATXRmJNzRe_p_v8Td2pfY4N7oQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 17:46, John Snow <jsnow@redhat.com> wrote:
> Just so I don't leave this thread hanging, I filed a GitLab issue and
> I'm working on it, but this one isn't as quick to solve as the other.
>
> https://gitlab.com/qemu-project/qemu/-/issues/874

Is there anything particular to NetBSD that means it happens
more often there, or is it just random luck that we hit
the race there and haven't seen it elsewhere ?

-- PMM

