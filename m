Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E855E602F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:50:34 +0200 (CEST)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJmq-0001OC-NH
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obIeK-0002Rn-Ee
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:37:43 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obIeH-0001cs-Rd
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:37:39 -0400
Received: by mail-ej1-x62d.google.com with SMTP id z13so509060ejp.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9EJgjTjQHr9gJd2Z559ii+KOyNn0xMGlqYrv4wqFgos=;
 b=Qt//F2z3uJZ0vvdToJykTlo1hNfABQ+cdD8OKaUa0e0MirUNQdjZE+qAEmUQbV0otS
 pKFVUlSW7f+F5qxacHv/OJ/9J0wMuYlj+JKpUk5Xkie6eEngaokoTTwXFYEj1qHNBU8i
 zdqiJ1nDAMOSMsnBbQVcWZsChXNbdB6hseA5nIxPdmvzFzT4wbQ6oC4s3WWgSLMVhBHA
 7dMYGwpx8SBOyACOKExydbCiSf4PZ5l4myLLIbridibyZK2MMUqghV/YnK6LGQNJUWi/
 4DtWGmZ/RSUJ84m0OhfAsH1mX/+/U0mgEsTYk057XTRQ5rh2dhIGhRROZRQoKaDXXXHC
 KxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9EJgjTjQHr9gJd2Z559ii+KOyNn0xMGlqYrv4wqFgos=;
 b=Q6gK1WLb8Hw1ucKOqDLZ6BGmTfHvTwmupsIDtu1qCqLgb+u9YNOfdd5H8n/9PlqYxu
 NsBZFjVjthxE/l8K2o3wHO+peWzgPapMIK6lryBDjRqWTwTIOhETMR+hgcLQ+D8mJG8H
 //66TLIi65FoGvPkbJn/FLSBSWSpxanqrT785ZbXK7I25kmjl/Opb7roXUrvx1vVRbE6
 Rj4V8SQMRdtyHhDOfoCOVg5tcN8NBYVPuoJrt8d/uFk3VHnbE+M1ibypz4vRZ1S+Ft60
 vMj/2k4Mj2pfM4svvuoYluEdNEtVqtuf0n5YCny7UG59ku3w71Kw4o7XbpbtJCX2o9KY
 r9oA==
X-Gm-Message-State: ACrzQf3brpE5QNg9n6Qtz27CgRLGSHhp2sr6NWWmhc5y2fllWD0ISGjm
 mupOVjnqcWbSotd5c0JMoYfJrm+jnvWevEwyxl/GOg==
X-Google-Smtp-Source: AMsMyM4BnzMSQF//PhtXLa9VfvsKJ/AY3D51inbCN1hO6EJ+iPTqfuFCpyii6M7VyVv+wMUfcqavrQAEQyfHXvflWtc=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr1933616ejb.609.1663839455510; Thu, 22
 Sep 2022 02:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220920173152.199359-1-deller@gmx.de>
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 10:37:24 +0100
Message-ID: <CAFEAcA8cwqSeYooqFSE4Xa1_4XCC8+gTSU9oLfNXHKE+YkDZKA@mail.gmail.com>
Subject: Re: [PULL 00/12] Publish1 patches
To: Helge Deller <deller@gmx.de>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 21 Sept 2022 at 00:00, Helge Deller <deller@gmx.de> wrote:
>
> The following changes since commit 621da7789083b80d6f1ff1c0fb499334007b4f51:
>
>   Update version for v7.1.0 release (2022-08-30 09:40:11 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/hdeller/qemu-hppa.git tags/publish1-pull-request
>
> for you to fetch changes up to 7f8674a61a908592bb4e8e698f5bef84d0eeb8cc:
>
>   linux-user: Add parameters of getrandom() syscall for strace (2022-09-18 21:35:27 +0200)
>
> ----------------------------------------------------------------
> linux-user: Add more syscalls, enhance tracing & logging enhancements
>
> Here is a bunch of patches for linux-user.
>
> Most of them add missing syscalls and enhance the tracing/logging.
> Some of the patches are target-hppa specific.
> I've tested those on productive hppa debian buildd servers (running qemu-user).

Maybe I've missed some context in previous mailing list threads,
but I think overall it would be better for linux-user patches to
go through the linux-user tree; most of these don't seem hppa
specific.

thanks
-- PMM

