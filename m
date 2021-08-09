Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3713E4292
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:25:45 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1XU-0004nO-4N
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD1Wd-0003tK-Ri
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:24:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD1Wc-0001D8-2d
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:24:51 -0400
Received: by mail-ej1-x62a.google.com with SMTP id e19so27738484ejs.9
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zc9LsCX3eHrN5oT51AgJ576zFqbHehbvKRXwn5MJQs4=;
 b=y1B/rG5pN2hmtC0mUGFn2ckXQZ722GXVFvW4vvOVxusZ1aqEfeyQdPuhJjZhq1hipT
 2OqN6GRbrUWrb8R+UIvduJY1BIFzwwYPxlTPHWOqgb6CNmcEKG0PdJKYZOOUI2TQ1YFR
 HmnzHFm3jyNMqsXIB5PM/pV11llC3cw+biKhyNlZIzb8k0BeXz7oM9PTwFYNWdurCRwA
 a99IB0k6SOJ0e+x8czJj9AZ0lIwV0ly4xOyhupiW/TZ5fiyoRJcuHIRWmTzNvjUiC3Dn
 4A50k6ucfIaEGUXn74WaudSygtZ4NAlA2MOWQRJcTXXaKF8e57jOnhVR0C6vpDX3xmWN
 rDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zc9LsCX3eHrN5oT51AgJ576zFqbHehbvKRXwn5MJQs4=;
 b=OB+YHlOGG+sMvQawL+5cBQ3p0MXLpBPkciNjLvaLCSZ76hiBLWg2eVyPa/JuS/J+Xc
 lOTJ038SJjBoeXFd8NCWIYgC9k+VRz9Ou9R9VABsGFA6hcgX6sLTWtpGe6Jcn0hukxBX
 UxouCDJMjtJGQ/Zmwx1U6b9IcikmCWq7t9FOOier4gICoghcccQgGgrA4QIRho22DEZG
 assxSHgTHNiIsVtOYnyVYr6q6wHJ1Vzm4ldlcyo34Pe/XmOTaivHL+VTqANc3N5MaHWc
 MUQiPZMrzyebU31NSRcYlIyYiE53dXKHHNOfhonDjeAg2ctHcJ7021B2NAjvq9KnNIe1
 KqsQ==
X-Gm-Message-State: AOAM533OTcARNI1Ksu4Dol7lUoMIm3OjuZxU7nfxe2IpkKBtEZtprUaY
 enfDLRhyzTS4HWErc105Lcq9Xtq9l4rLGFBY/vk2/w==
X-Google-Smtp-Source: ABdhPJzKVOuPu7Xq36icFu4buP7pMrKZ2ZmXKDG0lnW41Qz/D9xiT9zza2wk7lBk+oZ1fxPuliG9hFe6KqcuXx20Lic=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr22229847ejz.250.1628501087931; 
 Mon, 09 Aug 2021 02:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
In-Reply-To: <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 10:24:03 +0100
Message-ID: <CAFEAcA9Qn+PMGWRLtBdPXWpzz=JzoNc+XiaEpPXGv4Wb+YX3=A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Aug 2021 at 15:43, Alexander Bulekov <alxndr@bu.edu> wrote:
> As a side note(not strictly related to this fix) should we continue
> joining reproducer patches with the fixes? In order to test the
> reproducer, you need to cleave the fix off the patch. At the same time
> we don't want to mess up bisection, so does it make sense to have the
> reproducer patch be separate but come last in the series?

My preference is for the test case as a separate patch, last
in the series. For this kind of minor easy-to-review fix it
matters less, but sometimes the right fix for a problem might
be larger or more complicated, and then having the test case
in the same patch makes that patch awkwardly large.

Also the person able to review the code change and the person
able to review the test case might not be the same...

thanks
-- PMM

