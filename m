Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C759106C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:58:06 +0200 (CEST)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTIj-0006Ja-2c
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMTBW-0003eC-Ka
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:50:39 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMTBV-0003G0-2m
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:50:38 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-32a09b909f6so7764487b3.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=SZyKxP8P2UgSq9IZ5ACKYq+nbiG06pY7wnvsFtJqdRE=;
 b=ybT2y6GqC2Ap6xloJS5sV6ZP9L+jU+PUt4zxEv/3XL29YZW0kYqUqB+dzKvBBjhEdD
 o+byELF4MQvFdT8gqJMHA2FiiJpLJDRY+rkOycC23beQNvF5Z5zxsXNr83m8vJDGt751
 Dt4IIjirQ7nUOogxeWuX8U7TJCyKf6ciapClpJJ8iT0O56103uVMlXoFiM8d2H7Gd/+2
 pJ3ZJ1dVT++in4kE7pVyBvrNqOrE75IOPULDfHmLVNCDQfHvisBmn2zqWey+uc0U+OBc
 IiOj+VGpzj3oypPAMB37/SbpXU1AdaivyJjoSo6ziRN8MxqdzVso73Pledqgkbj3u0WY
 rKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=SZyKxP8P2UgSq9IZ5ACKYq+nbiG06pY7wnvsFtJqdRE=;
 b=iKYvjnIQhHNuGNV6hTgCpLVTAWm9Q2YmJCaKnSB1HB7+PUw6PYAezJ4vMPoC/ruK5/
 3kIaNTBbNAmNe7Rp5Wwian97hgi1wZwyvnjS3uyBBzNz/XaBMxDlI5BTfShUfZYeDPgh
 WAkV4bPBDlCvs/2LPNxE91K3rmvAsFJVonAT++YV6w0U3XuDQa1Z/w8gVY6PHRk/Wnqx
 frfUDZZyTQHIQ218ZfNzZddYRJzENWty9XcdEtjYG3aanZEl3s1ucgFb2YqfKcBArajB
 xhLJCwNO5KwCjqfZhxbMFWzIKOV1lx+b5D3k6lB/ydb3RVLWrG3PTcbdUqEVO/dWYFXI
 +V3g==
X-Gm-Message-State: ACgBeo1gf6jY6yY8xMEMdLao5+lnD4gOz12SUv8DpnnJ4F/q86BCGKY+
 YaEEiKnYue5fR8i72tdI6LvwVHCvmgVI+5EfYlfY5g==
X-Google-Smtp-Source: AA6agR4oiuwaFTETS4wp+3jDWeCGE/LY9gE7y7Mdprekw8ZCPzvw+hksy7P7OefcRCLztdGJ8llpHeSGJLCmS3yfRzI=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr3439428ywb.257.1660305035530; Fri, 12 Aug
 2022 04:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660303075.git.tugy@chinatelecom.cn>
 <3e370aa5326809d63f7eef573be558da987d27f5.1660303075.git.tugy@chinatelecom.cn>
In-Reply-To: <3e370aa5326809d63f7eef573be558da987d27f5.1660303075.git.tugy@chinatelecom.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 12:50:24 +0100
Message-ID: <CAFEAcA_MsAPxaqzgszYP2xSacNFMWZFH-8QQSRvSHCGjN93T3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] vhost-user: Call qemu_socketpair() instead of
 socketpair()
To: tugy@chinatelecom.cn
Cc: f4bug@amsat.org, marcandre.lureau@redhat.com, qemu_oss@crudebyte.com, 
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com, 
 kraxel@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 12 Aug 2022 at 12:44, <tugy@chinatelecom.cn> wrote:
>
> From: Guoyi Tu <tugy@chinatelecom.cn>
>
> set close-on-exec flag on the new opened file descriptors at default

What goes wrong if we don't do this? The commit message
is a good place to explain what bug the commit is fixing,
and its consequences.

thanks
-- PMM

