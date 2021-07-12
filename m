Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772F3C6652
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:21:36 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34Iw-0005xR-GI
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m34HZ-0005Bn-MK
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:20:09 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m34HX-0007rg-Q8
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:20:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id t5so13864865wrw.12
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 15:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BZlzn5NBjrIkyjsREryY/7efRs+cAObpuEzcKu3DYUU=;
 b=WsmO9PeogP5nuZ8G5UFkFi4KGvMFBJTm1MOND/hOqxEizxoYOLU5Cj4NZdIdlhGl5v
 Tp1oh2Z0Cy1XLdkUO1Wy6nV6dvv9G/WQiU9y9TPyE8Qwv4PQbLh0SxaWthzZJ1YMv1OC
 TC8F7rbOT6SHXvfOqMLiCEh74SyIUEfvSRLkZownDivZVrrXeso4znfz52vhHL5rEkXr
 OpozL8Xeeh9KQgMzfs5O1I7ZYgM89SvkswaOQDfweVE4xiW8C/IKD+ueU9GUFSKr5/LR
 KhrBOv14cfnId7sylw8PhK/y0dfZb0XcmyYk1ZqfOgKk+xMl+PnHF2w1ZZWZnrHUx/wz
 OkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BZlzn5NBjrIkyjsREryY/7efRs+cAObpuEzcKu3DYUU=;
 b=HnbXvfyL4KLbHhmzod4+5gjNWa1U0UumRZksdI4boMQvVAhuwx/JHGyyBlabOyo5WD
 xXRAQK08mwL8sEyEa7981BEcVDadQ1FK9rWIc4cQ6tLfeC0gCt90JTEKUcDz/W235biC
 Fiulp4/8v6musts9bFH3B7xyZV7teaUcJplb72Sn9Biu23dXizzJmELB2twqjdawjOOm
 gMZ2SDC4K4SszTP4Nn1Y6TCXyL81QII//gLjtbgs1PeA6nfbdqhIVoXbxieNmbmpITkt
 Z/v0jKUZQLt1TcUQ59dzD2x60wMAdgv0DQqbmZlr7+oQ8mWEJWP0O7qndbMp60bbeWmz
 DvLw==
X-Gm-Message-State: AOAM532nE+HagGDJTFmWE7Jv43eZ5JYqZY3pz4dFSrKVFwM+UDQmCeZv
 8DhrUNlhODm0DdR7/XU96leSTQ==
X-Google-Smtp-Source: ABdhPJyA2qkyH4KUCDzErYV16O6p1UVt9OZBPY1WBl93h0gf2rcQP0UIiMlsQZpy350iJ9EFHBb1AA==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr1468736wrs.134.1626128405999; 
 Mon, 12 Jul 2021 15:20:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r18sm8958116wrt.96.2021.07.12.15.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 15:20:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB81A1FF7E;
 Mon, 12 Jul 2021 23:20:03 +0100 (BST)
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <87im1fvgak.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL for 6.1 00/40] testing and plugin updates
Date: Mon, 12 Jul 2021 23:19:03 +0100
In-reply-to: <87im1fvgak.fsf@linaro.org>
Message-ID: <87czrnuqcs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> The following changes since commit 86108e23d798bcd3fce35ad271b198f8a8611=
746:
>>
>>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-=
6.1-pull-request' into staging (2021-07-11 18:49:25 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugins-1207=
21-1
>>
>> for you to fetch changes up to 88e5a469c820b6242e280d0a7e8128371f535bcc:
>>
>>   MAINTAINERS: Added myself as a reviewer for TCG Plugins (2021-07-12
>>   11:10:14 +0100)
>
> I'm sending a v2 (pull-testing-and-plugins-120721-2) of the PR which is
> re-based and applies to fixes from Paolo. Just running it through CI now
> but if you want to take the v2 tag now you can.

OK 4th time is the charm:

  Subject: [PULL v4 00/42] testing, build and plugin updates
  Date: Mon, 12 Jul 2021 22:05:54 +0100
  Message-Id: <20210712210554.1951-1-alex.bennee@linaro.org>

or the tag: pull-testing-and-plugins-120721-4

--=20
Alex Benn=C3=A9e

