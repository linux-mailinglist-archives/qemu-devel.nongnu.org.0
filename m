Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22589584F60
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 13:10:53 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHNtI-0007GV-Eg
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 07:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHNpT-00047U-TM
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 07:06:51 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHNpR-0000f7-MA
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 07:06:51 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ef5380669cso47305617b3.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=siChzJOrQ2sTUQXmMKfj4nHklSrpeXrtPBHKF1uAxFY=;
 b=GSFAvdoDTt1SIommI9EfP7wlg9J7LXQ1wyrRyR+K/38jMF+56q7ZKhsLmDa33Hz+ZV
 m35pP9UF8qQEGMG2rw5tY/VjyuBL0xJLf3NxNsLnqSMi4LuiXZLi5xzf+akggglb9hlT
 hWVdiWuqxn1Ydpc3VkP1nGDZbqZHCubnzMhYQMTf2XAtllGBikdk3ljc3ZhT7RlwQH9H
 ZSsuzmbFVrrAaZwtjNNLVdPnVEfjHjtJFmzlffRpMgT/sS1ZP8OFth9qTEvHbg0q+grA
 wRog3ySIVe3Dx2nlW0s/0B9bXaziLSMKO6TMu225qqSkLeEHehLK363caK5/nbHEM6cQ
 EDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=siChzJOrQ2sTUQXmMKfj4nHklSrpeXrtPBHKF1uAxFY=;
 b=ToPgOMLMnrO4H9bZ1FpbrHhsMq5AyqJwJnLcQwycUZVuv/sPW2ihnSVzj84seddj2h
 xkpw6EIO6hYRjGcKCRteSgvkUhzjH8zlc+5Bsp2qtsdwmwMAPUyKKMQBA5jetPuOTiU5
 wIqT1quFydV71vhpXKEo8wWHDlzomDCRDchCzKc0JcbbRxe1SIjZtXqfJ05vOZNVNetB
 Xxa8sdn7EFjwen7sM5lwOi7njDjmBvET9DMZdEIpLDecik6Z69ZqnCRbDwUjTsw+xs52
 AecG/n5zA14adGAZOnKd811yGfIYqBD/spR3oL7E8fwCbioj/lcbBk9IivsnLvS1Ri0w
 ThHg==
X-Gm-Message-State: ACgBeo1myWBLcha5mk2GmCdtuCZ3tVI3MUxUlIh87Mj4hzlcI0s2P81Z
 38IPy/VYf8zpCJj8uF89jJ2RcqR6j3P9M1vC2BxUjQ==
X-Google-Smtp-Source: AA6agR5/hl0OVbWIOiwYiSL/RtbnVhABy+bG/IMprPI5h5bOpk4Yi2tnBSQkcqHDzMy6Wz7RDyekmcnyOkuBk7AUKlU=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr2535074ywd.347.1659092805951; Fri, 29
 Jul 2022 04:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
 <CAFEAcA8d5J-WBp6Z=ECiUtP8wCfjv_XZo5GfYAr+x+mH3GpQww@mail.gmail.com>
 <CAL7npF_fpy2NzBqRZzEYyHQpNfEXgd7OedJDZX4pN48eUF76Pw@mail.gmail.com>
In-Reply-To: <CAL7npF_fpy2NzBqRZzEYyHQpNfEXgd7OedJDZX4pN48eUF76Pw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 12:06:06 +0100
Message-ID: <CAFEAcA9wDDYZrxLxw6PUpC+fys+o+80YwPe1PGProbz3ksOqLQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
To: Jon Alduan <jon.alduan@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 26 Jul 2022 at 23:13, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hello Peter,
>
> I can say so far, your patch solved the issue! Great thanks for that!
>
> Regarding the libc version:
> From my WSL2 Ubuntu 21.04 x86_64:
> $ ls -l /lib32/libc*
> -rwxr-xr-x 1 root root 2042632 Mar 31  2021 /lib32/libc-2.33.so
>
> My gcc version 10 does use the same libc version.
> As already mentioned, I can also reproduce this on a VM with Ubuntu 20.04 and libc-2.31.
> In addition, originally, this issue was first reproduced with an own buildroot RootFS and containing libc-2.28.
>
> As you see, the libcs are not that old.

So, new glibc does have a fallback timer_create() which
can return 0 as a timer_id:
 https://elixir.bootlin.com/glibc/latest/source/sysdeps/unix/sysv/linux/timer_create.c#L150

...but it should only be using that code if the binary was
built against an old libc and then dynamically links with the
new one, which is a bit of an odd setup, and I'm not sure
why you run into it.

-- PMM

