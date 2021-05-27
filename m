Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAF6393020
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:50:55 +0200 (CEST)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGPV-0003lM-Bo
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmG13-0003OK-O6
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:25:37 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmG0v-0004H1-Vy
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:25:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o127so195822wmo.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7CquySGT9oqwkeY76J1aNN2ZN7aRlwuXzLgXzXhMGng=;
 b=vFmh3V9ScCriYFqCVVAHLGvKTCLms9TR0O0Y97kFutGbsHZM9ivY+Tt3v7W/byqcx8
 1zNzG4xxq+5ZfSh2ABeKz8xiJxoStcXMU0j1Uwt6eGtKfG2/6iBa74JKxvtocob2tm16
 dqD4c5oZLr7Q58aVnXgaCZwcF0esQhGXHAUmsS3gYVmjiPqroXUi7Wjdbm3n1ij2PW4M
 6m3tPRHHRWMXLocfbZpeorqOmXx4rxRdXCnbZzs0cXeJSG42H4Irjzg0r1PPrM51w7tg
 ruh2kwhMZ48eaeKFOxz8fwEF63boErcMVU4S8tIpCroY+GIqZZIbGKx2pnX/vkHyR5BT
 fI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7CquySGT9oqwkeY76J1aNN2ZN7aRlwuXzLgXzXhMGng=;
 b=GFs6pI9OtSj7Zrw4EaHqwtncuReW9Xm5wv4mY/G7HprUlZodSwyB8zxVKQ/lmJvAuz
 CzEeAE1Zt1IJo0MbswUXuH5IPyQv+SiAJ4VeVYb/8UWBkT2OGtPxkPUTNtRDKXxZyPj6
 5kwIAUuSBoNwGfXiK7MQ+8zTR06g+GJX/lbH6gB0nIczP6GQgeFpsbdL1KMhmBuX3IgB
 bQ/DjTGZav9Y67GYYZXvPSL4TD4O0Vhq4Zwo78CgKI/ELLfnPJnm/sQ6VArdzuky0Pjv
 dMH6kAI0nUtWC9k8jjCzAg5YPUXyJ8DjIhtrP32N7B4EzlGnf2UgBLsaBwvk49oo7O2c
 qyCw==
X-Gm-Message-State: AOAM53245YPEj0940A8gbgcu7NwGnv14/ftvn2XJLv+20SIV8RY9dIdR
 3VVcIBuOyGoJSUGx5/GMKWqr9g==
X-Google-Smtp-Source: ABdhPJz/0G8Kj6I+t253htu2WqyUOPlIyoz2WsWqMTVPyvFmuuExo05PHQJFQvqXlrbnqXFX9xe4nA==
X-Received: by 2002:a1c:e243:: with SMTP id z64mr3437842wmg.25.1622121922109; 
 Thu, 27 May 2021 06:25:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y189sm1914550wmy.25.2021.05.27.06.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 06:25:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80BCE1FF7E;
 Thu, 27 May 2021 14:25:20 +0100 (BST)
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <87cztg3tv0.fsf@linaro.org>
 <CAH=wFzQjYJHN3xH1QhyxzZNDXGjQDw5UxhwH2NEiQoYjWcqh-g@mail.gmail.com>
 <CAH=wFzR3=Q1ukE-5Wp1jQ47n0p2Y6wwv8vFVtycTJZYdajtctA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Takashi Yamamoto <yamamoto@midokura.com>
Subject: Re: [PATCH 0/5] linux-user changes to run docker
Date: Thu, 27 May 2021 14:08:29 +0100
In-reply-to: <CAH=wFzR3=Q1ukE-5Wp1jQ47n0p2Y6wwv8vFVtycTJZYdajtctA@mail.gmail.com>
Message-ID: <87y2c01f7j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Takashi Yamamoto <yamamoto@midokura.com> writes:

> On Tue, May 25, 2021 at 8:22 AM Takashi Yamamoto <yamamoto@midokura.com> =
wrote:
>>
>> On Tue, May 25, 2021 at 2:49 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >
>> >
>> > YAMAMOTO Takashi <yamamoto@midokura.com> writes:
>> >
>> > > These patches, along with a few more hacks [1] I didn't include
>> > > in this patchset, allowed me to run arm64 and armv7 version of
>> > > dind image on amd64.
>> > >
>> > > [1] https://github.com/yamt/qemu/tree/linux-user-for-docker
>> >
>> > Might be worth posting those patches next time (even if they have a RFC
>> > or !MERGE in the title for now).
>>
>> ok.
>
> while RFC is mentioned in eg. git format-patch --help,
> i couldn't find what !MERGE is.
> can you provide a reference?

It's usually just an annotation to the subject line of the commit, e.g:

  foo/bar: hacky fix to frobulator (!MERGE)

  rest of commit message

or something like:

  baz/quack: invert the tachyon beam (WIP)

  reason for the fix.

  [AJB: still WIP as this breaks foo]

AFAIK the only subject lines supported by the tooling are the squash:
and fixup: prefixes.

> is there a nice way to express that some patches in a post are meant
> for application and the others are RFC?

Aside from a description in the cover letter not really. The main reason
to include patches that aren't ready for merging is to show where your
work is going so the full context of earlier changes can be seen. Having
an ALL CAPS tag in the subject line is just handy for the maintainer
when scanning what might get cherry picked. Obviously if a patch totally
breaks the build it's not worth including as it just makes review harder
when giving the patches a spin so you should exercise your judgement.

--=20
Alex Benn=C3=A9e

