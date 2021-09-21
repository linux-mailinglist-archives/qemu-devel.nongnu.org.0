Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E188E41358B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 16:45:23 +0200 (CEST)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSh1O-0003yI-IW
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 10:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgzj-0002kc-8t
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:43:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgzh-0000Uh-Ia
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:43:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so38171476wrg.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=04ptVJz7VNZ1Xf+1i9Hwhf0Q+E6XQyPE/UXpj2UKZBk=;
 b=Yn8dvWSqONpuZoWW7Yqv+J2wekxAR3arHvSguehqGFcKcEBWorZNNgedu2XPLHB5Gk
 xmcv0P7zHeG9v/v6+xeLnv3pV6vLBNDdlHDaf3bdUK0gmwWr5XXAHqjuJAKPSzMmEeW4
 NyD7Rl0+yiv4owzt94+NmFK3s8jNurXRYWQZwfZ+wzU+JYwwRTSlH134cCbGtTAV5+ys
 psA62zH+E4srHfXXm5R8e/Q17qTKahg2vKmWAJ/ylmiAGn+ia59tlJaUH96jLbiEUQJw
 5IhCYHzCirkiqvsgt1SOfObVdsf4dQky1LUoa0nKWXISwZtvPQVRfiNlqtNr7sId6eug
 kXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=04ptVJz7VNZ1Xf+1i9Hwhf0Q+E6XQyPE/UXpj2UKZBk=;
 b=yfp5f8+sQHciO3dbtV7d4EOQ43U9IsFGmqp/TJFJMPYXAAGMwzDFnyCvOWrGYSp5DS
 s5G3fHfn8vJCiQqUDK8I6xnuv1XnDOoZne761KRYXC+rXUkhdhPl8iOptFsMq7vNqqaA
 eBt0XwBVTwg79MkNIjdhuyv31TVi5YGCGmPXJIDPQ3BP6jHjIU3AoL5p47OhO43775w8
 RyKAFlW+T7zpSVJbCYOn/cJ+ohl7yS7/9j/PQ6ie7mJWI1p5MHqhMqFH31AogV+bh/ZI
 wbKiOV9tljG4YVL0WOvh5zHNZGYhErwXtPqlS/PWGqmv3gyBEWfwz5nH6G9JSnKYCOLH
 EBzg==
X-Gm-Message-State: AOAM530oZSdybp1G53+92hIRYBK9e5C3Kt9uPNIRiiH/qvUB19vRJvLO
 woozFjonf1lOohBmQbXjyUlRQZCX4bS3kyyab1TGPg==
X-Google-Smtp-Source: ABdhPJwImOgJW8yWrjJ0DiemJWNb2FJhDZfz6g05/ziFTZCLXSs2CYyIQKZcHeJG32qdFkxEXHGU/cs8gWvYtERuSGc=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr5112590wmm.133.1632235414761; 
 Tue, 21 Sep 2021 07:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
In-Reply-To: <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 15:42:42 +0100
Message-ID: <CAFEAcA9QPxceBR4hn8FpNbX44y3d28rRmyzrkEABU8dChdBqtw@mail.gmail.com>
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: WANG Xuerui <git@xen0n.name>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 18:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
> > Signed-off-by: WANG Xuerui <git@xen0n.name>

> Be consistent with loongarch or loongarch64 everywhere.
>
> If there's no loongarch32, and never will be, then there's probably no point in keeping
> the '64' suffix.

What does Linux 'uname -m' call the architecture, and what is the
name in the gcc triplet? Generally I think we should prefer to follow
those precedents (which hopefully don't point in different directions)
rather than making up our own architecture names.

thanks
-- PMM

