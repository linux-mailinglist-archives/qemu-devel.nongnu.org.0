Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F5291858
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 18:26:49 +0200 (CEST)
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUBWC-0003Qq-10
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 12:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUBSz-0002AY-9g
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 12:23:29 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUBSx-0007FX-8o
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 12:23:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id e22so10523531ejr.4
 for <qemu-devel@nongnu.org>; Sun, 18 Oct 2020 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EmhIxDykaZvzA2zbbLEZoJIXtpepZLTJBntSvM/JH4=;
 b=O+/rEIENYCEw2Cjv9XCPXSxMyjyxbrCcz1hobxPVvolO64PgOjSEq/IQ+1+ePNktfk
 kJ9QTfcGsodPUVAo6f9l52INuxPZGA0GrJ2feTbTumRXjEDdLMqRwCWEgn4auasVmdFT
 VTuY2aK+U8/kAZRjMqAk8r0BCsSYcOYLhs1dkHEqRm0TB9yEv+gD6VXS2CxKzCkl/Uef
 ycPgWwPQVMssNkafCuzZC7GkZk0d2+D0ftQuChUz0vXuzR6yR+DyuAO+Al5xAACKCVs9
 eKvp73m76exJ7WFDaguZbLFL/c74MmNGRJPqPjGzI7sfdyGajwvsGlYbJR3BAVTqfbm2
 jHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EmhIxDykaZvzA2zbbLEZoJIXtpepZLTJBntSvM/JH4=;
 b=k5E3iW4v7oWusaplDjWj5MdWfkKwgR8u9y/k4i2/M691roWH0d3rKpyn4gD3mEUKTM
 Uq81hoLXHPNmKTGh8phCMeZE9b9ZzM+TKIvGkudIbt69hg/Iwdp2y8PgIAZ/IsBy95iO
 PWOCOwfTLiYbtCJXz5126dBdywYx+q6ghJUECkkMYHvUob7HY5lt+PXVGHhDU/sUjfiB
 vWRPvvD2Yy+fnSGufRQEPk3LB6kzoPPLpuIGBarVlUMpHKhVeHo08iZAKcX8GAKfPOYN
 3MgANfsVisgFqIdRMxEmaqqVUo7gXTaMhlVInZiusE6dQbiLrWZ3WWeEhDTE14g/iNTK
 98gA==
X-Gm-Message-State: AOAM531UBWKEXztMuKiU9qaqz0Obl8CDd+Xjpa9K0RskurobI1dwPRQn
 vPSAro9ibNEt6npQ1ZxGZ7ORi0zZpQjzaB3lG9LKkg==
X-Google-Smtp-Source: ABdhPJwTnOhWu4TXhi9IQPby8LIkMQ0+i+YssPGebTxJc5Wtg45ddmCL47KzNQ3tsmI03eax8o2LnLDeIRcC1O08gow=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr12885885ejk.382.1603038205209; 
 Sun, 18 Oct 2020 09:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <60400f23.1845.1753c16246c.Coremail.380121850@163.com>
In-Reply-To: <60400f23.1845.1753c16246c.Coremail.380121850@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2020 17:23:14 +0100
Message-ID: <CAFEAcA8SxSHaofKhmk9ueT_PFN+0rev9+Jjr1NP5sdm7-NXcwQ@mail.gmail.com>
Subject: Re: ERROR: glib-2.48 gthread-2.0 is required to compile QEMU
To: Lee <380121850@163.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Sun, 18 Oct 2020 at 15:38, Lee <380121850@163.com> wrote:
> Ubuntu 14.04.6 LTS, X86_64
> I  make source code of version qemu 5.1\5.0\4.2,and foud the error:glib-2.48 gthread-2.0 is required to compile QEMU
> try apt-get install libglib2.0-dev,and it is sucess :
> Reading state information... Done
> libglib2.0-dev is already the newest version.

I believe that Ubuntu 14.04 shipped with libglib2.0-dev
version 2.40.2 -- this is too old, as the QEMU error
message says.

The simplest thing to do would be for you to upgrade your Ubuntu
install -- 14.04 is now very old (it reached "end of standard
support", ie no more security fixes unless you're paying
Canonical for extended security maintenance, in April 2019).

QEMU's distro support policy is documented here:
https://www.qemu.org/docs/master/system/build-platforms.html
For distros like Ubuntu with a 'long-lifetime' type release
(like LTS), we support the most recent major version, and
the previous major version up until 2 years after the next
major version was released. So we support 20.04 LTS (the
most recent) and also will support 18.04 LTS until at least
April 2022 (since 20.04 was released in April 2020), but
anything older than that is not officially supported and
may or may not work.

> i found that version qemu 4.1 is OK,the same environment

QEMU 4.1 did not require the newer version of glib. (As we
develop QEMU we want to be able to use the extra features
in newer versions of our dependent libraries and to be able
to remove backwards-compatibility code that is needed only
when using older versions of those libraries, so sometimes
when all the distros and versions we support ship with a
new enough version of a library we will increase the
minimum required version that QEMU needs to build.)

thanks
-- PMM

