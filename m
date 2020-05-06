Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5D1C7163
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 15:07:14 +0200 (CEST)
Received: from localhost ([::1]:40754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWJlZ-0007Qz-My
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 09:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWJkM-00065e-Ok
 for qemu-devel@nongnu.org; Wed, 06 May 2020 09:05:58 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWJkL-0002C1-IR
 for qemu-devel@nongnu.org; Wed, 06 May 2020 09:05:58 -0400
Received: by mail-oi1-x230.google.com with SMTP id c12so637446oic.1
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MvFkX4zfUT5Q+3Tl9KDheIz8OxBwdLruofW7S0M7Kg=;
 b=n2xaXkPTP0siMOLoa55cri316ULai7yozq95V+GbEKjuoNPIBdlwK0RtfjmSMQ4tBG
 RZl2dXW6vKVj0jH+tD9/3Xove62oCSlL4jhRq6GOFXbgpm1w0QzlrkJCCLvufK6dBZzx
 51GoYlCrwr4KKqXvNiBosZUAQid40jKz5ALxZLh8TlcBJbQb3RiUOpL9DWGvQvty6UY0
 JtAGX/fa7ZAyZHXqqTWah7jvXvhepqVgFHvYCaKoBSHMyFYPVmf5QqIcMMwJdzof68lg
 So8zfVt+xdHtKB7ejprwt9Yx9snJhTsMMXvqDiLd33vkugrUGb6GCw/dIryGSmTQkkbV
 llOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MvFkX4zfUT5Q+3Tl9KDheIz8OxBwdLruofW7S0M7Kg=;
 b=J+FkDP6gzyUnm+l31/1NubyKoU4hHSWBpFdqfxYEitSqFvTGyAtz7M/GZC/wWxoxsw
 swn3Cs6hT0TkiH6LiwrnxjmwivWArUs3t7cqbctpHDGzZt3JB4FsiXmSO0F1YvapPLhE
 hrZm1n09Vrwpsh16MoDWAt/ZBlcJgrCXjvuhiQEqvAK7yRTMJy/C3wOTubzoHNnys/YN
 V7o3sbeXQS4OqG+H3YWIHW183adYYtiGxh/3awjI1REMqLfCs4FQfIL2W7VmRlu1PdCX
 naasHzdQqIcnMAxe79UqSAhXk1Mshj02wM2svvBpuwNaQlyUfV1+2aRVUvzraGqpEYjk
 sD4w==
X-Gm-Message-State: AGi0PuYnACl7bIGmoqkZ/1E1h8+EiyOfNz5GcsklKlmDqx3EHkXRAPA+
 9LaypE44yJWXlmUEnp3kPXw0P+x0xVDPR5e66nV3uQ==
X-Google-Smtp-Source: APiQypJ3V7kySwv6DVDSLpl5zFPKP+XoGKLtDSw3OjGjth+tLApEuWSbTAKGqf4gnaOlojkFpb9dgnUaKm9UJssCqwM=
X-Received: by 2002:aca:4a45:: with SMTP id x66mr2356002oia.48.1588770356297; 
 Wed, 06 May 2020 06:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200505125826.1001451-1-mreitz@redhat.com>
In-Reply-To: <20200505125826.1001451-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 May 2020 14:05:45 +0100
Message-ID: <CAFEAcA8q7csyvrR5UFeF6__R4gAFUP6R5Kz5uEE4dAxpJefBGg@mail.gmail.com>
Subject: Re: [PULL 00/24] Block patches
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x230.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 May 2020 at 13:58, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 5375af3cd7b8adcc10c18d8083b7be63976c9645:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-05-04 15:51:09 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2020-05-05
>
> for you to fetch changes up to 4ce5dd3e9b5ee0fac18625860eb3727399ee965e:
>
>   block/block-copy: use aio-task-pool API (2020-05-05 14:03:28 +0200)
>
> ----------------------------------------------------------------
> Block patches:
> - Asynchronous copying for block-copy (i.e., the backup job)
> - Allow resizing of qcow2 images when they have internal snapshots
> - iotests: Logging improvements for Python tests
> - iotest 153 fix, and block comment cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

