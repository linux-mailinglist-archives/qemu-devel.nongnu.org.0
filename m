Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AED1944C7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 17:59:27 +0100 (CET)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHVqo-0004wL-1T
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 12:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHVma-0000T8-I5
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 12:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHVmZ-0007PC-4S
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 12:55:04 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:44912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHVmY-0007Op-Qe
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 12:55:03 -0400
Received: by mail-oi1-x236.google.com with SMTP id v134so6070097oie.11
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jvtEJOUKM3lxcPzLPF663Q+sNZSICDtPdRib/yJMR9k=;
 b=ZQbHnIUlOEaqVV89EdPmRahruXhCyT4K++qPESbT0vjeCXjLbqQyqhTQ0NMHckxFCo
 RYX+MrUR/LYDznqBkUYSE4tigIafR6nqMJARWifBeaM3X6h8xM53fWQoO/xedx+cz2Fr
 PhxDKxNNSHW80EwmYlfrtMV+wehPXeRoOKSefImPH9czAbJG945kUXVCAfLPaVYxxR/w
 1Qby7cDyARe0J9FZ72AahDoZ0F9O6s0f+r7Hhc82XHiG/Pb1/3o3NgvUHsAFWnqeokDa
 SqGKeeodYLLcEBgNBR2UwL955Qq8WVCr/gOXdVY70CBr4akTymZ87CVzyFdVzDuBZxhA
 bM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jvtEJOUKM3lxcPzLPF663Q+sNZSICDtPdRib/yJMR9k=;
 b=EZAkU6CrxkljNU4epL11f/2BsI4lu19zo1Gt18sGetqedzRQJP90NdvpO/DTg8EawV
 BQ6nCV2E7Y2dVF5LBI0G2AErAnso6CNRL9rraWyzQufe7y2V+n6gaYaRZDylkrDESL1p
 Cd1KXDXYUS0ny0v2bIWhFIWmOVbJCDoRpoljGP3cYCmQP/TrEYORkbIz7pl5iR78IxnC
 f8QDiv6mKpDKkl9G1u/idx77XRDgCajciD87FRfEWbWHHzLOvZ/CnBDZvTX3YMpqqlcp
 XHtEGEaNfjgakrkkNZN3kxGhu9VQHJdGP7BlEWTNuK+oqqR7cd/O42KTs/pfOCHjWvyM
 vNQw==
X-Gm-Message-State: ANhLgQ3TfyzhvUkejoAiJh+PAOu/cQwg9F1k8TlFvCb5hNKux0um96yI
 zgRgnK5jXIGmGMFyXVgEaYF8reapBVg/9P/mHSXeCQ==
X-Google-Smtp-Source: ADFU+vv3tDnuCIgHTVGpfdPrcMsYO6lFnqY7rbKS0peBfgB7ylbyn/rsM+ABYmv6XsJGlt2v4RQGXTyYVbigqBOXqI8=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr766384oij.48.1585241702076; 
 Thu, 26 Mar 2020 09:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200326142933.625037-1-mreitz@redhat.com>
In-Reply-To: <20200326142933.625037-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 16:54:50 +0000
Message-ID: <CAFEAcA_nsWqdMjUo_dAATTR+P2273X37ONMUoEb760thK=o2qQ@mail.gmail.com>
Subject: Re: [PULL 00/10] Block patches for 5.0-rc1
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::236
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Mar 2020 at 14:29, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 01e38186ecb1fc6275720c5425332eed280ea93d:
>
>   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20200325b' into staging (2020-03-26 09:28:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2020-03-26
>
> for you to fetch changes up to a507c51790fa955c1fccd4deca3c50476a862b83:
>
>   iotests/138: Test leaks/corruptions fixed report (2020-03-26 14:52:43 +0100)
>
> ----------------------------------------------------------------
> Block patches for 5.0-rc1:
> - Fix qemu-img convert with a host device or iscsi target
> - Use-after-free fix in mirror
> - Some minor qcow2 fixes
> - Minor sheepdog fix
> - Minor qemu-img check report fix
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

