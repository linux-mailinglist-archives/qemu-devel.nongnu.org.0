Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F252F8002
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:51:52 +0100 (CET)
Received: from localhost ([::1]:48528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0ROB-0003oQ-K2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0RNH-0003J4-G4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:50:55 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0RNF-0001NN-Ox
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:50:55 -0500
Received: by mail-ed1-x533.google.com with SMTP id s11so2721615edd.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZtN5NVEkv0cS5Crsp41zZvi1HcmhvvgtP0A5xaylwI=;
 b=PT/+yBRgLXZor7bbWnd58pXnncCSgiBaE0X6vEbxGie+9Un4iUZLYtQKdhqSO+ofKP
 ioJJkG5akCTwnlINTPun1CKtWDRkPglOyV7Rss00GcsEwCSD8ihylL3noh0wrCqSjOiP
 NuPoZvaJsX8sR9Y5/IdriB6zscl60LA6DBL+Uc0wcCkMMMo6Jm9bN4Nb3iYEooBThOb6
 e+YtcnYCifvac8WzX7zyESnOw2gD2Mxu2V+c0+CQMzN41D2W9itWoWdz78eSZd6x83eB
 r77rH4SFH/LIQ9bdE1PEFveLgJ4/PYuue3SWLtjIv3JvMVsxE9ThIaN7qwlWb+G4//xv
 94/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZtN5NVEkv0cS5Crsp41zZvi1HcmhvvgtP0A5xaylwI=;
 b=fEYIBr2jDFjdjg2ovZNOOtkP2eQKgKXDyNZdJm9vPkH+FS9JGi+Qdux/wqkzgR004s
 ht78v8pnKYyW3E6MWkH9bylg1trv2CcUDAiMiMFOXrTzZ5RfRAO419AGIAR4wFmX1kXV
 HhRdijjdhvoMJHhVPmImEEEn4ShKl6nTsJvoTYhW+z8A+i8QuENBgcVMN2WU0TU8/ucd
 h9rtgai0jxijJBekfZzqkPNt6zQD/laOkJIuCMj8BOiYuKFSIiisUACbLvAeCO1Qlq4Z
 ia98GDj5+fFA5rqWzZtlrzuHRsgSb0ukbSmCMQ1EpWKGcAXhBaMAfRcSeFpnPbpLW8w7
 kPeQ==
X-Gm-Message-State: AOAM530swYtLEjgffuV44SPQlwhlEIx70pkNWdywpxAYfejqDc5ZUjGK
 Ia4CNNb5fCXuuUvyyfEUWODI9bh2iURSlVhgDsTUCQ==
X-Google-Smtp-Source: ABdhPJxqkrc+3vW0XyeeXHbyVjEEZnupj62yxyg8yq3FT6cdwiMe0qS7zipNV26WU/LT6KahaR6Q5XWA+ZNdibNrIlI=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr8273103eds.204.1610725851950; 
 Fri, 15 Jan 2021 07:50:51 -0800 (PST)
MIME-Version: 1.0
References: <87im7yi519.fsf@dusky.pond.sub.org>
In-Reply-To: <87im7yi519.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 15:50:40 +0000
Message-ID: <CAFEAcA_MT6z4ey79o+WhX=og57HWR32rnzajFYLGvLnQtS1BRQ@mail.gmail.com>
Subject: Re: Realize methods realizing "sideways" in the composition tree
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 15:45, Markus Armbruster <armbru@redhat.com> wrote:
>
> The .realize() method realizes the child at (1).  It should use
> qdev_realize() like we do everywhere else, since commit ce189ab230
> "qdev: Convert bus-less devices to qdev_realize() with Coccinelle".
>
> It sets a link property from the child back to the parent at (2).  Why
> do we need a link?  Each QOM Object contains a pointer to its parent,
> doesn't it?

It does, but what should parent object pointers be used for?
My assumption is that you'd only use those where you really
wanted to traverse the QOM tree. Generally I would use a link
property when I wanted one object to have a pointer to the
other regardless of what the QOM-tree relationship happens to
be. Today all the users of XHCIState happen to create it in a
way that means they're parents of it, but that doesn't seem
like it should be an inherent requirement that we bake into
its API.

thanks
-- PMM

