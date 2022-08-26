Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743295A229F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:08:57 +0200 (CEST)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUOe-0003i8-8X
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRUJN-00005K-Bz
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:03:34 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRUJL-0005aZ-IW
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:03:29 -0400
Received: by mail-qk1-x735.google.com with SMTP id f14so607675qkm.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 01:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=oAvaA5xIZth7CjdDhivr9HlnZFT4rOPvLjvU41mzvLk=;
 b=TnRUBEqIgakO8zIO66yVY21UvplpePsAQjaph2kUpwVAnZeURedyyUTQDU76PcBr0J
 PaShdSOc3Wh6Veg1zMbe/9fv0Nq9BxItQrBSxykplgkI6vOcY+vJlKpB0pic6ko5MFBk
 JV1CQTsV1k97ceot5TGLUMGtlyZCjK7FeS5FYUsq28JmE2ukXOoh/VT37xZ8ZKwRxkkp
 J77+DVxujZu8H4sxKLlhjMVOSKkvKTC6YwcK5/6rN5Z7318vNryCbKPOXOxwaFXPHbvc
 ZONOoA7vDVfOmB4aF5FSfphAdP5yDcKXd2W4FoLVChKMT4Hp9kOuGxY1bVUJB9O8UUkp
 LJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oAvaA5xIZth7CjdDhivr9HlnZFT4rOPvLjvU41mzvLk=;
 b=yew+DfrKenLKJRzGbPPhFXH1BYpN7Fxh8XVxkV6STUGgZgOSTvx1VaeO4uoEhB5quQ
 NoIz6jUfMa6KVfFNaqiqnNwc8k87XhAX3QzvQrIqdnFLdcmYcH9lMMsYCjCnrhlO45hk
 HLWp8peVUJWPtLcteX9pNhGzcsMzopxUjR2hjKoMKSBFVmc/10DjcB9J/8oIqkSiiipw
 DhKxCfv7fC5DVhn2WTClN2WlMsC6fQWJaWfewGrCimbdzTjdRuset5I62gP/6y+IpKJt
 ZjbVjqN4UKGdtWDxhnn7pk4MaRXv7798hdBEqfz8nw10LJaTqSO6qxkB6kbr+oQvE/M/
 M8VQ==
X-Gm-Message-State: ACgBeo0bpRmY+uMClMACTtN3Mtm7Yj1LwRrTl1BruI3eGnC3tvvw8YIU
 ufkgRqEJ+M6pyNpqqqCR3PpI1ooq4//UGOaYljo=
X-Google-Smtp-Source: AA6agR5xdkR3r/vaaOENh6LEqIe6n+2LtRC3OHihr3N/4la/LnUO4tTc8AafuD+zmu5k751fawRM70RY0QnNvgbUoMc=
X-Received: by 2002:a05:620a:430f:b0:6a7:9f9d:20cd with SMTP id
 u15-20020a05620a430f00b006a79f9d20cdmr5672456qko.389.1661501006098; Fri, 26
 Aug 2022 01:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220825193323.104768-1-thuth@redhat.com>
In-Reply-To: <20220825193323.104768-1-thuth@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 16:03:15 +0800
Message-ID: <CAEUhbmXJJ9n-OrRjwjVBY7rC1V82f6tV5AtrjoSmNL3srgWJ3A@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Only use one process in Windows jobs for
 compilation
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 3:33 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The Windows jobs are currently aborting at weird places - and
> there's the suspicion that it's due to memory constraints in
> the Windows containers. Let's switch to single-threaded compilation
> to decrease the pressure on the memory load, and to make the
> jobs more deterministic for further investigations.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/windows.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Could it be possibly caused by the windows version of meson? I once
saw the same build failure [1] on one Windows host with 64GiB memory
so I think it is not due to memory constraints on the build host.

[1] https://gitlab.com/stsquad/qemu/-/jobs/2765579267

