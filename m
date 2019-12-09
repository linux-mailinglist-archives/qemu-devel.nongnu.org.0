Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB20E116677
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 06:37:54 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieBk1-0003RE-TF
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 00:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1ieBj8-0002bn-85
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 00:36:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1ieBj7-0003ae-0P
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 00:36:57 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:32792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1ieBj6-0003aG-Pe
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 00:36:56 -0500
Received: by mail-lf1-x143.google.com with SMTP id n25so9689321lfl.0
 for <qemu-devel@nongnu.org>; Sun, 08 Dec 2019 21:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XriFjRd1UOAdfl2F2ThGn2PA+BbEQHnG14aedFzAgH4=;
 b=guRmO5/CsM+zwSISSLXU78aW2mUvvJ6DTdsFXGBUHD2ozX5BewQ4fPIO5ozLK0ryh9
 VkJjBngds/j53W/zCJn69E8RBNTRiFEx6t1KO6lCr27lt+GakNwDg+ld+3i5gsUldZCu
 FzhL+82pnFlzJ3RzXWdF8Q86XPK0mzHZgMVb1ZcZ2JxXOkwiGx+wcE8ZVjqYg0CrzF9f
 xhpsa4lCLQFnV+ULyBf9WDFz+SMnbXxETfXXiY2hvY6fkewsI/o6xhJhMRJy1zRNW3OQ
 3pjKw8F3lu/9JvR8dEIGsl8vfN+IH80W+Ov6yP0y159xDkEE0pDzC6DZE6p5GbNwNtAn
 07Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XriFjRd1UOAdfl2F2ThGn2PA+BbEQHnG14aedFzAgH4=;
 b=KkUAHMet7YUfFepN6FuxXrjLfpp0okxkDCPcPiuvZLwo05Ug0vIYr+HF+r59tqYS0I
 uSlr5IeOPogw72+1tbAu63uSjFzKmTKmPPmYJAPSj+ZCUdp2Kf+IV+eKdKw6sPyn3pFq
 TPcufWj4S78dycMClOr3Y8Oc7Rauixx1vt7Twp2ClCkFOG2cKXmBi/ThHk3iOBbfaiN0
 FyF9SQDfKhfoxJFOiP+R3jHTW1KVzl0fsiOiOMQyCr5oH9+vW1zTzbYXxtPNC1QmY1Hl
 zGuDLHk3hS4lPu9oy+YyRmX0M9df2co6/sTsxZywXfNDmJnAJdwx3zQKQdcoLY5Sujcg
 1rzg==
X-Gm-Message-State: APjAAAUGFsgwDCyBu08bHFK+SB+ohoLYON7DGTKKl9zE8ccx5KPIv2Xk
 s+2tPSLoszg43ImHe76PF1J1Y/KQgCtmymCQ2H4=
X-Google-Smtp-Source: APXvYqytmjkDo5w3VTAtOzayWnRIYZ2Pq9qWNPgjnhIP03PB3PEwXeORoKrAlHgOfY5vfkNRjwfBOtbPAELso9pV1Ss=
X-Received: by 2002:a19:2389:: with SMTP id j131mr12886446lfj.86.1575869815621; 
 Sun, 08 Dec 2019 21:36:55 -0800 (PST)
MIME-Version: 1.0
References: <157565782864.3897844.627720481210693346.stgit@bahia.lan>
 <157565784026.3897844.6515055734977835356.stgit@bahia.lan>
In-Reply-To: <157565784026.3897844.6515055734977835356.stgit@bahia.lan>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 8 Dec 2019 21:36:28 -0800
Message-ID: <CAKmqyKMMyT2howr6BXJcjbXbUmzGH_z8xtKWVSoYoF5b4DUbLQ@mail.gmail.com>
Subject: Re: [for-5.0 PATCH 2/3] cpu: Introduce cpu_class_set_parent_reset()
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 6, 2019 at 10:44 AM Greg Kurz <groug@kaod.org> wrote:
>
> Similarly to what we already do with qdev, use a helper to overload the
> reset QOM methods of the parent in children classes, for clarity.
>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/cpu.c         |    8 ++++++++
>  include/hw/core/cpu.h |    4 ++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index db1a03c6bbb3..6dad2c8488a9 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -239,6 +239,14 @@ void cpu_dump_statistics(CPUState *cpu, int flags)
>      }
>  }
>
> +void cpu_class_set_parent_reset(CPUClass *cc,
> +                                CPUReset child_reset,
> +                                CPUReset *parent_reset)
> +{
> +    *parent_reset = cc->reset;
> +    cc->reset = child_reset;
> +}
> +
>  void cpu_reset(CPUState *cpu)
>  {
>      CPUClass *klass = CPU_GET_CLASS(cpu);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 047e3972ecaf..6680f4b047f4 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1137,6 +1137,10 @@ void cpu_exec_unrealizefn(CPUState *cpu);
>   */
>  bool target_words_bigendian(void);
>
> +void cpu_class_set_parent_reset(CPUClass *cc,
> +                                CPUReset child_reset,
> +                                CPUReset *parent_reset);
> +
>  #ifdef NEED_CPU_H
>
>  #ifdef CONFIG_SOFTMMU
>
>

