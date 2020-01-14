Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AB13ABF8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:13:02 +0100 (CET)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irMwH-000070-1E
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1irMuw-0007JV-MN
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:11:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1irMuv-0000vg-9H
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:11:38 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:46994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1irMuv-0000vV-3H
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 09:11:37 -0500
Received: by mail-ot1-x333.google.com with SMTP id r9so12678222otp.13
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 06:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WeRmJkSLn6ch6NVoI2gqiMtyrYx3h7Z024QmWrxDom8=;
 b=RYA0lT1uDnt2HJGdoDkcq2/WlXHnKtWd0NGftnfAcsKw8VJDWz5/pMaiwr3so3A1hu
 BHdtQuygAI8LBTKHrHkKdxqo2R2lncMhBqjh0PRUmFlarP6q/GMWSNrO9kVtbtx5zWJv
 cWINcnokgjfvJMFrQiOUyhZTDNm94ZJsKRx3dbEPZpxcZU1+IGgoBpngB4CMvQ0rHi2M
 YU90WUaY3aKE3lNuCXBc7BcJnJerY//FOXGZ6MwTKIGPCt1CfVy9jQzfZ3WOA8mUJ0a3
 JdLO4YCg2laIQBU4Sxf4BfN33ms7MilS/QYOIbCe5JLhu2rrSJ8PR+TG/WQaRoEuiwIR
 JqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WeRmJkSLn6ch6NVoI2gqiMtyrYx3h7Z024QmWrxDom8=;
 b=ZPKSuOjkG3+BKWN5fSkXT2JKF+ZESR5YrsYDTvJekQtc3hwyvO0NsgdSgI+PaQI9zD
 7WeHO64/oA6Ho/Liwq7PShO/maj0vq5NuqTikJnmA7pxZCITaOWRtcdBvRtgGIUQemN/
 vuoHe37WppQ0q+RK5AIkSwGF4+Kj/WUyJUHPGkT4Uda914KvhJQ/P8FngXNzDJ74/MWb
 2WS64Lzlvm3kT0WPhsb3gu6c5y1azVW9kb6XIPGLxe95DYnph395QaZLZHybza/hzN6j
 MJ5pPWkg2K6h2qFCRR7FAJmcOka5JMdRD+C9RBqoLmOPwNd7WjAHykL0FTPph+d/AtTx
 HYKA==
X-Gm-Message-State: APjAAAVDO3qfGG1XAjcCxilyzgxGFhc+NW2RBgseQZZpuoSBq7Xv9cEo
 yHwIO6kAd7YPVyR2vHDvyIbkGHBKZQ8aDVDcCSnb5A==
X-Google-Smtp-Source: APXvYqzRBFYrOTX8YNbVq159xX+IPSKuli88xDaTOkyc2CLcAm9q+GwgCcIRyfoNQvKQD6QVGB+jkb9yxT1OdCDl/8o=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr17216266otq.135.1579011095955; 
 Tue, 14 Jan 2020 06:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20200114092918.117399-1-stefanha@redhat.com>
In-Reply-To: <20200114092918.117399-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 14:11:25 +0000
Message-ID: <CAFEAcA9V6tfrw4bj6eT=Uv21jFL=bcs9GMTSuF+5oz-gxQDvAw@mail.gmail.com>
Subject: Re: [PULL 0/1] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::333
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

On Tue, 14 Jan 2020 at 09:29, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108' into staging (2020-01-10 16:15:04 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to 3f0097169bb60268cc5dda0c5ea47c31ab57b22f:
>
>   trace: update qemu-trace-stap to Python 3 (2020-01-13 16:42:20 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

