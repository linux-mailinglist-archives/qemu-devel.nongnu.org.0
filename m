Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119AF173556
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 11:28:20 +0100 (CET)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7csV-0004Iz-52
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 05:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7crc-0003gO-7N
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 05:27:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7crb-0002tJ-5Z
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 05:27:24 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:41111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7cra-0002ro-W0
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 05:27:23 -0500
Received: by mail-oi1-x22d.google.com with SMTP id i1so2359825oie.8
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 02:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHpuAIDk4tG9ywGbLakmHAg6EB31CnpJyYV1XD/X9go=;
 b=LQFeNesJ7PNT95ev4mxruNWexj8sfUhsg6gtRjgrLH19RoQLeDVJ1PM4t13FaTVDsg
 pe4985HChlGQfKiu8GqAwYTFRbNTaBlPlfSCJDfERAuVQM1HcYupVZf38TcyvMmyravn
 wBCblpuVsaIaBkWVXA4kwp9pE2VRxcq7i8ePcVLFeVNhhviyoO8RpEcJkIhJe2lfL7dZ
 2Fv71IghhPtQI6dd9y+jC8JfQJ1WOvAIjD6WBkyeSc67PKPOQ2tOR0lN3f4DLq8b4Nha
 lA7FtfSjFMpFHtYczPuZlL+AECpENuLzwGONSQe9q1G4ygUIrJDXZbgYzpeO9o3JMZAq
 uPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHpuAIDk4tG9ywGbLakmHAg6EB31CnpJyYV1XD/X9go=;
 b=DKxjeWhTuWcO/8VpF/gRrZDhoVvq7wfdwoxa1wt0FyZZLszR6uVjgaAAvpUr766DCk
 C+y2dhNEB7SJOstroTuB/kUAaszc1dBqGTYfOG/1fWI41pFK5KXLmhuPJ7TZ0/on546h
 ar2YhFIA2wEAI4zBdH9JFRCi3D64KhJX6os6NCUiaeHqHJYuI+KQFMyHe0RAQoDNsb02
 Ji7+2gB2GBpFxOqB/XU7ZQmWcgo98jBhcdOkwBk7373c+nNyR7ucUjQLMbah/ijHZCjF
 k71Iad8ESNyDRX/wa1/GdXorhFwdxIBLfc5utahTxZ1NAnZK7TlGDSVVtSNYVyX5rH+g
 LiKw==
X-Gm-Message-State: APjAAAVKyYjWiyKB5ochxxmTFkvzYc7iM+Vxl4QWKaF8+tJ7r0db6fJc
 igttI2Jt7c3YY27Yc3DVX0rMdlq33E6wXUG9u+rnoHdf
X-Google-Smtp-Source: APXvYqz84B27T2TP+FeDKVXpa4zLzTaanIvNSFHesi0cqBbVUv7tQ9xc7lDuQZw5A2mqZC0tj9P2iwKcHaFmebk1IXs=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2495734oie.146.1582885642267; 
 Fri, 28 Feb 2020 02:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20200227115431.32364-1-cohuck@redhat.com>
In-Reply-To: <20200227115431.32364-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 10:27:11 +0000
Message-ID: <CAFEAcA-fK6Mu1Dt_8hPEjsEURqaVcAH5djBiNuxsg95tyUqPQQ@mail.gmail.com>
Subject: Re: [PULL 0/7] s390x updates
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22d
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Feb 2020 at 11:54, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit db736e0437aa6fd7c1b7e4599c17f9619ab6b837:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2020-02-25 13:31:16 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20200227
>
> for you to fetch changes up to b6c2dbd7214b0b2396e1dcf9668c8b48ab571115:
>
>   s390x: Rename and use constants for short PSW address and mask (2020-02-27 11:10:29 +0100)
>
> ----------------------------------------------------------------
> Includes a headers update against 5.6-current.
> - add missing vcpu reset functionality
> - rstfy some s390 documentation
> - fixes and enhancements
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

