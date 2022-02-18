Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443D4BBA0E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 14:23:44 +0100 (CET)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL3Ec-0005Rk-8u
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 08:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL39g-0002uU-Gb
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:18:42 -0500
Received: from [2607:f8b0:4864:20::b33] (port=40733
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL39e-0007v0-Bo
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:18:36 -0500
Received: by mail-yb1-xb33.google.com with SMTP id u12so5536782ybd.7
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 05:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnPhWRrd8tHd0rXLkpQqtnMMmhR3pdVwj/ZkWoo6Hic=;
 b=mtdoG3yCyJarjwkbwTzg3xpJMISLs3BOwDQgmo/uXvFk2ZStMn7wbRHhXxUmEMA3Cl
 LOpOwEewRju1UFV3nXxwpJlpsb6QdqlaZsBU1ZU+/fDGypnyqXmZj/zLMIqoTneK8FDM
 wGWXedCbvqz3+adDIoXGqZJEzLEVKd/w8OOU+LsJzDqNEhGsIHRS2gX1wxkrF9fXUrW5
 IIOXWUGkunT9iuJNhVzp2+vmS1RCqi3voaNlB1dWwCsv8sRvyoKUToFD9Sd/okNIf4/X
 ZyAFAzu6oWQ+sM/9UjRNBdovSfd3STGLv0suPBLek/5QH+qt0ZRXpQeS2RgGmG+zQZKS
 YXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnPhWRrd8tHd0rXLkpQqtnMMmhR3pdVwj/ZkWoo6Hic=;
 b=qdHiQeuYTrg+cB5gbb/vHztlw5T+h3kA/UnEEtu+YQ1VjQ+sIzeTyuDoxESdkMk2Xp
 pw3puBmGj1s0PHWhW68zhOQZffs8BuRaifIFHHTya109UkbBxl2RyZgvP72f5VYn+uXH
 uhDslirEFIRxQInMLYq0YkfMHW6/NH2ShWinJ9/zmXZpfvt3V1SltinG/JheUO31HWLx
 xmigkyXcX5qQerqyPgX/CP8BVxHa+A6WFtCVBtj6s/IFjj2SPO50Ha7EKBYl+ctSsKl6
 LOeIjo6AMeTz6uKiDby7UcJ9iu+Zkobi4O63075r4n5cSUbzP2fR257Vt51jAgkNI1jp
 a/PA==
X-Gm-Message-State: AOAM530hnoPjBq3VKa7lRQEd1SKItAjQ+Rj6L9A7axgsXcBKshiC8pUs
 Y1jIS2sctS7bEnv8ryNiSHCYydSHz5rMOQIs2599tnUG7zPtrw==
X-Google-Smtp-Source: ABdhPJwkS4MEEykyAi6FHVhk8AWSHxC09Vl37QHKNBiO+ln0+RVonPBa1vxSplwx0v+OvDx4vbG53MabXiM2cfx1714=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr4075212ybe.67.1645190313506; Fri, 18
 Feb 2022 05:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20220213021215.1974-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220213021215.1974-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 13:18:22 +0000
Message-ID: <CAFEAcA92vVH=Bj4Ch10HQjB6-sBsS=Ms-5_FFr=PgxFtT=YB5A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 13 Feb 2022 at 02:12, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)

Thanks for volunteering to review cocoa-related patches!
Would you mind having a look at these couple of patches
from early January?
https://patchew.org/QEMU/20220102174153.70043-1-carwynellis@gmail.com/
("ui/cocoa: Add option to disable left command and hide cursor on click")
https://patchew.org/QEMU/20220103114515.24020-1-carwynellis@gmail.com/
("Show/hide the menu bar in fullscreen on mouse")

They need review both from the pov of "is this a sensible UI change
for the cococa frontend" and also the usual code-level review.
They've been on my "I should look at this" list for weeks now
but I don't really feel very confident to review on either front...

I'll take this patch via target-arm.next, since I'm making a pullreq
anyway.

thanks
-- PMM

