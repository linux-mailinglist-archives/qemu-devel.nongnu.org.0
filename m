Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEFA4C43CC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:43:20 +0100 (CET)
Received: from localhost ([::1]:45620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZ0J-0003rv-57
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:43:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNYv5-0001if-JS
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:37:57 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=44974
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNYv1-0004qT-61
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:37:55 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id d21so5247470yba.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DmhgVvnCMnZIjps3V3WQn53oDpB24LI5SX2Y8agVHZg=;
 b=O2VQ1nikIixdAWpKeTekVPLdCoJSy+B5R5UO1Ti3uV9BMyE2gTVAq7Pft/ZgH7dsjC
 /L+cMPHDp+iYVMju1oS/3ZQObfhDRgi43BRBbQ7KL8IvpwqJx2+IAafaQSL6iDappSLB
 h7zjuhn/rIlX7WCz0jJP9PuY4+ognngTKht5MkQlXOFXNU9y8yjte7XwiLjLkA/K7cCh
 Ecrbh1/a2me7QzBBBBhjMC2h9+ky/55pProuN+1PgPPtqzQ+NqrzhnHqjEyE8ECmQKxD
 XZNhUDijnp9BXoKJ7L9dKBU4N8K6NvEkigHMzVENx4kJsYL1KFYlHV7ZTcCgFSjyRnO3
 psmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DmhgVvnCMnZIjps3V3WQn53oDpB24LI5SX2Y8agVHZg=;
 b=lytuE//mCWYVmrxFrkhNG+I5jhMvqTo5RqhA+i2Biprih43FgZ9Y59oj1O+Xmc10j8
 xfXq1q6BDLvwlBJZX4Jjz94UHTI6YAUL0MZaVP1V44sifWsywALYjIbwerRY/LjmhlMk
 XOuGZ3mtBPs38hXCXzjD9tdviWVQRv6QB/GcNGVVjR0hdUZp/42qy+quQfv/wFwY2CeJ
 IXfTTPoanx9cIJ9eoc3iugFFMB4KJ2XVVd1pZKX0BCoam3t6GQZzDPflqMl22msWUFbI
 OdGfTupdK/uiGtTc+3wSSNKVWHDSQprQw3FRCDoq+wNwRC2zcBdjZrr54Sx4KABKt7cE
 E8oA==
X-Gm-Message-State: AOAM533pBRMNPuCY0+d+MemE0K5iv/4kg9V+HztXpvkZwlPUrjvB2oBL
 3qYb5IXXOBg0R8etoBJaYcKVGVTLfOvEkYhhrN5JfA==
X-Google-Smtp-Source: ABdhPJzzwLKSStQvKMjSgb7PaRePqLNm0iqK0kKWbDxyaDsSm8F8tiGm9r0VUzOFg/v3D3ncaDV3N0BC2Y/vVUt8KXU=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr6866747ybb.288.1645789069789; Fri, 25
 Feb 2022 03:37:49 -0800 (PST)
MIME-Version: 1.0
References: <6e7748f1.25d8.17f2705c420.Coremail.wliang@stu.xidian.edu.cn>
 <c91392a4-f75b-4e5d-9e6c-04777fb7ca79@gmail.com>
 <ae217469-9f0f-5f1e-f01b-4a6f525f1ff2@kaod.org>
 <74d28271.93a.17f2eee79db.Coremail.wliang@stu.xidian.edu.cn>
In-Reply-To: <74d28271.93a.17f2eee79db.Coremail.wliang@stu.xidian.edu.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 11:37:38 +0000
Message-ID: <CAFEAcA_8eRLK0eD9aHg65LeNa24+A9Z2D6cFdtUSSEJguOz_uQ@mail.gmail.com>
Subject: Re: Fix a potential memory leak bug in write_boot_rom() (v6.2.0).
To: wliang@stu.xidian.edu.cn
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 03:33, <wliang@stu.xidian.edu.cn> wrote:
>
>
> >
> > yes. Could you please send a patch using  g_autofree ?
> >
> > Thanks,
> >
> > C.
>
>
> Here is the new patch.

Hi; that patch doesn't seem to be using g_autofree. Did you attach the
wrong version of it?

You've sent a few patches recently, and they're all attachments
to the email. This is a bit awkward as our automatic tooling doesn't
handle attached patches -- it wants them inline in the email. For
a few one-off patches we can handle that at our end, but if you're
planning to send many more patches in future it might be worth trying
to sort out how to send them as non-attachments.

https://www.qemu.org/docs/master/devel/submitting-a-patch.html
has the details, including notes on using either git send-email
or the sourcehut service.

A couple more housekeeping type suggestions:

 * please don't send new versions of patches as followups to
   the email thread of the first patch; start a new thread
 * subject lines should start with a prefix indicating what
   part of the tree they apply to: in this case "hw/arm/aspeed".
   This helps people scanning the email list to pick out patches
   which they care about: from the function name alone it's
   often hard to figure out which part of QEMU is involved

thanks
-- PMM

