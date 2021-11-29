Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3834616E5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:44:26 +0100 (CET)
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgxF-0006Mn-Qa
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:44:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgme-0001O3-MW
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:33:28 -0500
Received: from [2a00:1450:4864:20::32c] (port=45825
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgmW-00007s-KL
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:33:22 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so12416730wme.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjFvd4PRtMeEst/8p0jgmWnyJYpIOYiwhm85iFy1lVk=;
 b=mDCvlahfIjiJU/hILqbPH5j15+59ADwgYafDXAmp8Udy1RH59QU2dZ8hD5F5uBxo+W
 oHzNQ1lSM1zBPMFXRjZNIOvo15ssrHjq54tNL1J0oN/3BYZ7hW9Pa66/BaBpIz9gKCjf
 Yhifk9fJoqznD1MflIb5LP5JjSUd7xulI+gu9U+zJQKmPvNSCj6PggsnJE+HWuVDu9gi
 yKFWnt7HCVenUVnjKsJkt9MeIqrNN7oJIyig1ebPhEnDSSbiOeP+L2rrwybbIvMDEG1G
 sciw78kPOHzOUeYio0t6WT6D2/1rIxqd9M73Kz3p21nTa4h4zCDmBUTHla8BIdYFI4rN
 tA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjFvd4PRtMeEst/8p0jgmWnyJYpIOYiwhm85iFy1lVk=;
 b=C8XtahUU+dmp0yM0KpRnxElYQ8XKqyWJTLQTmwXNWWzBo68y4nLlfxWivHMaljmsyW
 JZ7+8zESf0GzkQSvvReFUm/vanx+Jqo3gPnmrLxY+FrtqLoCFCCSGVVNmm9MTgggH3kq
 //hojLQs8mzuFd+xCk2KmEH2KPDKuNH28x/+0peXEDI9i/7cgKuaY+2S5+zynlvVmMRR
 Lbe1Tp6qIrMMBEL/PI3LlvRbXHdzc8Vg/OX89jj4AhfTeJe5nMA731mIusU+dAc9dHI4
 Y0I+ZMJXH0azVw8qrxrC+AT4OKco5ZkLx+PWbIS2aYkjaBSazXW2iAHbBRZsOuvPVidN
 7FVQ==
X-Gm-Message-State: AOAM5336TFu7Xzn2/PxmtqCJ5bX4263GXwSbfo64ET+MRfOqH5tsBmTq
 HHXbE0L3M7gjhMvGkVHHP82osZgqYjkmGaJ59I8huA==
X-Google-Smtp-Source: ABdhPJxQBfjRIKZAh6BfLLeIZBVAZsIEzn4F4qyCvogV8frlnlDpm2dY4qpxwKGgo74d8rvCSihrtgsEXhLWqukUULA=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr36821934wmq.32.1638192799201; 
 Mon, 29 Nov 2021 05:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20211124142728.1221817-1-kchamart@redhat.com>
 <20211124142728.1221817-2-kchamart@redhat.com>
In-Reply-To: <20211124142728.1221817-2-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:33:07 +0000
Message-ID: <CAFEAcA_OKtUzQPU=-dqmB4vFgnx=b47Oh5RwFbms_QUXwxzDBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: rSTify "security-process" page;
 move it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021 at 14:27, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> This is based on Paolo's suggestion[1] that the 'security-process'[2]
> page being a candidate for docs/devel.
>
> Converted from Markdown to rST using:
>
>     $> pandoc -f markdown -t rst security-process.md \
>         -o security-process.rst
>
> It's a 1-1 conversion (I double-checked to the best I could).  I've also
> checked that the hyperlinks work correctly post-conversion.
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
> [2] https://www.qemu.org/contribute/security-process
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

