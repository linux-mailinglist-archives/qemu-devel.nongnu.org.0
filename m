Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CF369C76
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:11:15 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la414-0001q2-7c
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3yz-0000Lb-LQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:09:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3yw-0003BQ-B9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:09:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 d200-20020a1c1dd10000b02901384767d4a5so1940493wmd.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dRgssEpOr02nat/UNj+tgOb71u1gr11kY/h8tUkZ7Y0=;
 b=E/kwVa0MVpeUkV8UhpqFBVvXDSc+5+x0ilvmqTXq6R4vNCH9SJ9hlCF8hb/sC5E17y
 +wa6uitPTtSLL2ou6bfpJZQ9eFheuJdJNW131sKSa1aH52KjfYhWr+6v2+AsBJXl7RSe
 fvyfuwNhtHOerrIsiqZuMEt0hFJx2Gi9Bn/iyFZkxG1uQDZiiUlS4nvZ3qlYvh8mAd8E
 UMgtkQMsMswFoXgkrjrcA341Jhn30Qi2EKl4fbqRQ9zFPpQaPsL6Y2WEYTYd1KlzCSm8
 lar0LltDPg7THwG7T/krCZ15I+toBHEy9HZjPGFYyBdwEA0HznrjMrgsTSIp2Tu94Cxq
 HWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dRgssEpOr02nat/UNj+tgOb71u1gr11kY/h8tUkZ7Y0=;
 b=XDBIUJjTj5HjU8Trs4A6lRuNrJnX5hg0mPNm8DJ7cgB0KZ12LgLH7ukCu1DUUbRmcp
 GP3HCBYQsxfW1ytPbmM5MhwRRDomHwR+qc6bTqpJWMmyXyVagJP1ADUd4x22M200isVZ
 XTfS4mR0kIVkY1Xb9O17+icI9wMMmjsb+s1OQnWQFsW0jY6aqA3rK/wMipoDSyzdhhfX
 Nepo+jKGktjvbz/yUxSvUh0L6vYqPtNHi2Jp4ehghJkecZ5JGUi211m3IAI3TbDmB5HI
 8xKnKPCx3aSCWLjZ9mDNHAd4vRIoKg5BwT9sSk+2eI37Spfpv+deeHzXboHK3DWShN1k
 sFMw==
X-Gm-Message-State: AOAM531+BgW13XZGNm/gwdwOTa3zcl74wjSqrBblgXIdzj3mR0jh9WzI
 7qD2+htQmJt3MWA/epxKE98=
X-Google-Smtp-Source: ABdhPJyr6nij+qvUDKG20/QvZ0RBm/p8T9umpxLZ2WIq2fU/+rrwzxfC9Bb6nU+blf0IQJ28Q7OM0Q==
X-Received: by 2002:a7b:cf2e:: with SMTP id m14mr6428716wmg.73.1619215740851; 
 Fri, 23 Apr 2021 15:09:00 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id w7sm10850754wru.87.2021.04.23.15.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:09:00 -0700 (PDT)
Subject: Re: [PULL 11/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
To: Warner Losh <imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-2-imp@bsdimp.com>
 <2e4fb308-07c3-c998-89b2-f49b69e90092@amsat.org>
 <CANCZdfr5z4hASiHWqxJG4A+6V_TTEo6ETanHGNkpm9q_fX3SVg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4332e51b-323d-ad82-4122-686f9929842d@amsat.org>
Date: Sat, 24 Apr 2021 00:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANCZdfr5z4hASiHWqxJG4A+6V_TTEo6ETanHGNkpm9q_fX3SVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alex Richardson <arichardson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 11:38 PM, Warner Losh wrote:
> On Fri, Apr 23, 2021 at 3:23 PM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     On 4/23/21 10:39 PM, imp@bsdimp.com <mailto:imp@bsdimp.com> wrote:
>     > From: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>     >
>     > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>     > ---
>     >  bsd-user/elfload.c | 4 ++--
>     >  1 file changed, 2 insertions(+), 2 deletions(-)
>     >
>     > diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>     > index 87154283ef..07a00ddbd5 100644
>     > --- a/bsd-user/elfload.c
>     > +++ b/bsd-user/elfload.c
>     > @@ -1270,7 +1270,7 @@ int load_elf_binary(struct linux_binprm
>     *bprm, struct target_pt_regs *regs,
>     >                ibcs2_interpreter = 1;
>     >              }
>     > 
>     > -#if 0
>     > +#ifdef notyet
> 
>     Better describe in the cover letter "ignored checkpatch errors" and keep
>     this unmodified rather than trying to bypass them by dubious code style
>     IMO. The checkpatch.pl <http://checkpatch.pl> script is here to help
>     us ;)
> 
> 
> This one I honestly was unsure about. To be honest, it's fear that kept
> me keeping this code....  Maybe it would be even better to just delete
> this code entirely. I have a working final state to pull from, now that I
> think about it to forumlate a reply, so maybe that would be even
> better?

Personally I find it simpler. We use git, so we have the history in
the repository, can look at it and restore it if needed. This code
is dead since years.

Let's see what others think about this.

Regards,

Phil.

