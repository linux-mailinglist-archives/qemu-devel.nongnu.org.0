Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93E3CA129
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 17:07:05 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42x6-00087G-OQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 11:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m42wH-0007Mq-N4
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:06:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m42wC-0004oC-5X
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 11:06:12 -0400
Received: by mail-ed1-x52c.google.com with SMTP id ee25so8592574edb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AsTsN5Hu3Mi9qi9UwhS2W59cnLCgXq4EBPrHtDwOJL8=;
 b=GJXN6hTBN3RH9GxnU4+FOeXnbHtaCDdH8TkpL52fEB9A8P5WCjra40ckvT1w5L3iXv
 M8Df30GjAsJ8Ayt3xoRsib7SNRXve98jhSqo40Z+Rmvxu1iQ51JW5oqCKQlYX8gQ9Ec0
 uNl02gQ0xAFYioLEmZtxVCwEf+XV/H7KzdkGzEwb9h6SvZszhOQn3MBNU5Y6V7qiBqy6
 /LSIbyTcZ1VmWcCclzxeMTgUIB+NcMa99CTLifh6GYr3y94C0gad9/ufdCYYi9UcOtgJ
 rN+o+haulq4lNMqaB2YwqzoVqoBv45vMkJk8vwRu2cCnzOSTzH5rCXbkQ/nQxg/+wvgP
 0CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AsTsN5Hu3Mi9qi9UwhS2W59cnLCgXq4EBPrHtDwOJL8=;
 b=ULVn6ZlIU4NfqxhlCBGhC9NR7KRCIcQs2Mh73n1VWJjSiu3IwWO9mM5ZAMYfp+tZ0G
 b1mj/9lzuCYY4x9/X70uBSEHgnxT7kYqsxAY/J9YJVOQoSqMDwQkhrtlnnz2sMB2Kyod
 EwjXDdTBodEsJp51EtJhOkjj69uwmL2e72Jqts/yv+aviN6wCpVosb5j6CuxuzqsRqJ1
 DqyxJlW5rFm5CrfMTSZWqz9pYxgVyvxrQjaLkMoDGhEs1G82yA8rq/HP+Ja9zUlX17LD
 rMVzmgZ6QCC7kUCIfAU8/tsd0l54K+vhnwUrfTtE8cGghOIzXuLjr+u1QpO49VltfRIL
 WsEg==
X-Gm-Message-State: AOAM531psaPOp7ymK+84Q8v4JvwIu59S7ciDf/btrUNJvYnMhdUe7mUR
 lgmwAmx8tE9pTTUVKgdJOhPtBwHachywzWrE7ASRFQ==
X-Google-Smtp-Source: ABdhPJwdfZgOuX9Uyb/PytEgVRvAUw9e+9lrCSyWTj36rZTjPfuoua/Tl2tknTMfS6cI8Z5hwtNoQUIoBDlyE93ewJE=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr7639776edy.44.1626361565995; 
 Thu, 15 Jul 2021 08:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210714204238.3145092-1-philmd@redhat.com>
In-Reply-To: <20210714204238.3145092-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 16:05:25 +0100
Message-ID: <CAFEAcA9B6+Bnpq3JuWYqv0WMbeh8qyW+E8cPv7JJs_URjAYLfA@mail.gmail.com>
Subject: Re: [PULL 0/5] OVMF patches for 2021-07-14
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 21:45, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684ac=
ef:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pu=
ll-request' into staging (2021-07-14 18:09:09 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/fw-edk2-20210714
>
> for you to fetch changes up to 2669350db2c3df33f4e68c518e9f31f91502a83d:
>
>   MAINTAINERS: remove Laszlo Ersek's entries (2021-07-14 22:28:59 +0200)
>
> ----------------------------------------------------------------
> Patches related to EDK2/OVMF
>
> - MAINTAINERS: remove Laszlo Ersek's entries
> - Introduce X86_FW_OVMF Kconfig symbol
> - pc_system_ovmf_table_find: Assert that flash was parsed, document
> - gitlab-ci: Fix the jobs building EDK2 blobs
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

