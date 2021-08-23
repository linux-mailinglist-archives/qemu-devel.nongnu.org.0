Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098293F48CF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:41:36 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI7OO-00037V-Sn
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI7Na-0002TL-LT
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:40:34 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mI7NY-0001dn-Qk
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 06:40:34 -0400
Received: by mail-ed1-x536.google.com with SMTP id cq23so25444724edb.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NG431BZ8CtzsBtxla/OKf4BXRtVBmn3aTSfaAxU60Zg=;
 b=rK8O5Kse3EaTdv/9pZ2B5dcMfz9LzNAqEeVEmAzgFWrwalGlY99auyjOihPEe/81me
 CH3QTyhR12xAj7WChdzJWwzbJ6gLRyL0krLmcgMBswxH1r8ty9Zp0qS3lVFbRsyWSmgi
 7VATiSxPz7Q/xZqNuYzn95+LD/QkJzSvVt7mGmEw5+nNO/mowL3rJHscIg/2yBuZeOMd
 R6nR8bBTHq/PfNyTI1HnxgaF1fiEAlBBFZ9NilqkX0brggxfZIy5pV5MAwMIGRmFVtZH
 wTkALVTwWbvvnBTYigv2XVUA6anFDvfZM5Hl0zpQB4gMXWbKslRRoTIgJ4kcjHkhowxA
 KdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NG431BZ8CtzsBtxla/OKf4BXRtVBmn3aTSfaAxU60Zg=;
 b=Bhnzr0tcGMpCEa1s+lDslPIGXQalEGYRpzhRL+TO/ILmLBCH32p+NWBJVu58d2ZFur
 08cGPHK1k2WY/gnalwx61fb8pMFkG12nH22uDc+QYth7ie1TH+yjcOc1jfQdK0HCXHll
 2It7N0ONGxZQgWLMaplRCjS4perEtOYYjTN6TY8Wo/dm1swciGMelhNC6as55wZoXbqj
 CPeF2aJfOr5PfC1DsxYeEFtwfuNPSb0ckEsCkLctG+A8o3bdzJopi/sCR3yPnLbijo19
 kpEzG8W/d60vdh6w1JehA0uYgwdduYISXOzDlxIAO4pPIUtWvnnI3winAM0teokDcGYZ
 XiAg==
X-Gm-Message-State: AOAM532D+L2TE3McDGOKVTRHt+YHixCqG3C8xtlpEBnP5dbZWExR3KnO
 sAUrFNc9mq25B2SFCw+hK6zXGGhHDlf073fQ8B7TCg==
X-Google-Smtp-Source: ABdhPJxLlQcduyyazA5dX3SeUWwYfLvyX+PofGH1DwfQ+Gj/YyHF7WPlyQTHOecILHoN56xzRum+8r6WnJJehoeQbsg=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr36478678edc.204.1629715230882; 
 Mon, 23 Aug 2021 03:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <162867284829.27377.4784930719350564918-0@git.sr.ht>
In-Reply-To: <162867284829.27377.4784930719350564918-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 11:39:44 +0100
Message-ID: <CAFEAcA-GOO6H4DgneNOuOQKxTO7=RahUzhrubjU9sBFLxPQ+nA@mail.gmail.com>
Subject: Re: [PATCH qemu v2] docs: how to use gdb with unix sockets (v2)
To: "~archi42" <sourcehut@mailhell.seb7.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Aug 2021 at 10:10, ~archi42 <archi42@git.sr.ht> wrote:
>
> From: Sebastian Meyer <meyer@absint.com>
>
> This includes the changes suggested by Philippe.
> I kept the `-S` in the command line. The user shall
> use that instead of `wait=on`.
>
> Signed-off-by: Sebastian Meyer <meyer@absint.com>

Thanks; I've applied this to target-arm.next for 6.2.

I made a few minor tweaks to the commit message and the wording
of the docs, and fixed a rST format error (a stray double-colon
meant that the text ".. parsed-literal::" was put in the output
verbatim). You can look at the fixed-up version of the commit
here if you like:

https://git.linaro.org/people/peter.maydell/qemu-arm.git/commit/?h=target-arm.next&id=80acb580a7c98300248794d59bd98a31fb1b1bd9

-- PMM

