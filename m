Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1D676654
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 14:04:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJDXK-0007We-HT; Sat, 21 Jan 2023 08:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDWd-0007Ur-HF
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:03:17 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDWb-0003qi-Ec
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:03:14 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r18so6009156pgr.12
 for <qemu-devel@nongnu.org>; Sat, 21 Jan 2023 05:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EDT1b7OPtp09KqScvrujGO9Vb2H3nz4eHaP5+61lRcs=;
 b=M8npM2QeOwAoxNhwip4oKX6W4dzROU5whYO4cyrP3Dh94pVZ8XBNdyeE6l9DEF3QHK
 PJU1subU2NIs3xnJcbOdAR+foRYCLhqLLeKTeu9+cwu0VcsjnW0n3AzwCJ+rA7jHuyDz
 hIE7MhTfiNfECz7uoqwCc3o5oQEmbRT51SQAWXzyskstQEteYnQiMhU8Y2pUxOsIsRVv
 EseB311bwhdnr2i1owf8n4QUzQFEeNHWjGRWrYCdmQI+2yMbhRJ+d2iW9/6C3/s6ecVb
 UsvdpCR/lcNBQXYPH4yIHZ/zxS1RAipi/ags0r8oeSLwUqpcwwxDQ1hFiaZsveDlZqh9
 yEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EDT1b7OPtp09KqScvrujGO9Vb2H3nz4eHaP5+61lRcs=;
 b=TT6aG3m/q1PI/fJUtP9mEd1Np6n9843PDhcQmG5J090TPNTAuRjP5nY/vO7EJ2/QwZ
 eeIbMg1A2eoCT7y5B1nt+r7sXxqYgFT0briFm0gJh+29mFMfhaf0jS0IvLYFyVLxzx3j
 t704tc2sBPH+hnvJ6hL3cihURKBsXgE7bL9iPD0mJ7TgSYx5NQe2vJJpejTkIl1e461E
 yyZRMiWcJfEN0zhn/uxCkjlwin4QoK6aaPz+gzxfRcAlqXZenk3Bv+mbB6jyOb+LyI++
 kh9ED+Q1FsoiDvyJyW+JN4zbeoiOn9QIvEnqSKMf6iCJ1FZlCCyMWwrOyDdn5VJBZYZc
 PjOQ==
X-Gm-Message-State: AFqh2kpSDU3tvX6UMwBFmIPN7e0zOYaQttpwQH1UdXThEB+6xjnASXZj
 /o7B+tcRoQjK4YkxKq3WZHsmrc/vMmu4MrmXhrwjtm823QCRow==
X-Google-Smtp-Source: AMrXdXsN2guI/+VIIVeTTaSsfM4gccbrWloCKlIo+4JIZxDG2RqYEmAII3QUfFQKsAT6OpExfwazMHgRZHnw6Q1k32c=
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr1736160pfs.3.1674306191917; Sat, 21 Jan
 2023 05:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20230120122633.84983-1-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Jan 2023 13:03:00 +0000
Message-ID: <CAFEAcA_atQKUuuZm-G1RS+BHF3YOBVUBROm_VETqZY3yyi-8-A@mail.gmail.com>
Subject: Re: [PULL 00/38] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 20 Jan 2023 at 12:26, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 239b8b0699a222fd21da1c5fdeba0a2456085a47:
>
>   Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-01-19 15:05:29 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 4711b0a8490827c332b3f9281f689ce9555b7fab:
>
>   qemu-img: Change info key names for protocol nodes (2023-01-20 13:11:01 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - qemu-img info: Show protocol-level information
> - Move more functions to coroutines
> - Make coroutine annotations ready for static analysis
> - qemu-img: Fix exit code for errors closing the image
> - qcow2 bitmaps: Fix theoretical corruption in error path
> - pflash: Only load non-zero parts of backend image to save memory
> - Code cleanup and test case improvements
>

Hi -- this has a conflict in coroutine.h. Could you rebase and resend,
please?

thanks
-- PMM

