Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AF64FE96F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 22:27:15 +0200 (CEST)
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neN6Y-0001jp-65
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 16:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1neN5N-0000wo-OB
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:26:01 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1neN5L-0007QK-9F
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:26:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so4211039pjk.4
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVv1Hoer+8utf70hGTcGvQoTwEkq5XxhsEIO0y6J2Q8=;
 b=K86GHBGHBQjayar+GxHkFkNmZgxcA88+pvRZJGFxxqh+CtLgn/xV2lI+YYdoLoO/pM
 EeRJLXPsiK8VNJpk8glGzc79Rb1dx2qvw3rKb9q41g7/ohbHizfScFwqq3FiUpU2xJYv
 4cb8ucAbswmRSLmGC1S10Dgc1JN/v7tFJ/ZvKmGN/4Mb06nlo29Ldc7rkHesu/YUpEBN
 9fiXVn29p/WlNDV1aQsStxvro/NSZmlSmNs+F/HjVZ4tFa4C2OUwanGpGeJtJqzuQHAi
 xJWZX3QmTpvtwAERCH8jcuwcGQydONo3rvWzGvgAbtla4hPtViIODRKFndTO8+zEkasU
 tiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVv1Hoer+8utf70hGTcGvQoTwEkq5XxhsEIO0y6J2Q8=;
 b=F9CCAv3xCIUJoiphj5c6LViREjkedkNBDo6IQHJs48PtLj0TJmVnC9ntLkUHU10tnW
 4oackzN9q/sY+kyHiR1vvixqBEBqlkfrkIwJXiH1jJKRnKuGdFMunok9+Oa90nF4y9BG
 0YLiFdLqxAUDVqEbLdQNTOZbXbGD2M6HnmMJ1AMN2faAOEAm9BH0cRRIVbQNfxHUJHF8
 mV221TowZmukgzQa2rs0+Hd2pusr3TW7QztBwTOQzVhGAngVhzgvhFYGyTbXyj6Vu85v
 WEYQ3PQa+JqmspuKIf7+pKje628FTOljqZvMxNF2g8k1itnWa6pAbqhcyOL+ptyaJBBx
 kBww==
X-Gm-Message-State: AOAM531raG5IHumgB5r14WFukrOvsAgfIRV7Jy24LVsQdkACOn+lFhin
 yNrrT/lHjtkOsHjLTfHH0Rd6MtL+D9cXqWGj94w=
X-Google-Smtp-Source: ABdhPJwLP1XtXLlWEZVQ7VtMoK0PIi97OUrt3f3BD0idNmoIbxUvkXdY55fB2rY7VH12f2v2xyejjCWnLrhYBt1i9FI=
X-Received: by 2002:a17:902:d5cd:b0:156:6263:bbc7 with SMTP id
 g13-20020a170902d5cd00b001566263bbc7mr40529108plh.160.1649795157218; Tue, 12
 Apr 2022 13:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220408104519.32931-1-gautamnagrawal@gmail.com>
 <f3adc652-6a89-a063-313a-4d87c11fc474@redhat.com>
In-Reply-To: <f3adc652-6a89-a063-313a-4d87c11fc474@redhat.com>
From: Gautam Agrawal <gautamnagrawal@gmail.com>
Date: Wed, 13 Apr 2022 01:55:45 +0530
Message-ID: <CAG-ETXuh2-bJBO4298uyc166ptiTauimChBE=TwoYpxYx4npUA@mail.gmail.com>
Subject: Re: [PATCH] Warn user if the vga flag is passed but no vga device is
 created
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hi,

> thanks for your patch, looks pretty good already, but there is a small
> issue: Try for example:
>
>   ./qemu-system-s390x -vga none
>
> ... and it will print the warning "qemu-system-s390x: warning: No vga device
> is created", though the user only asked for no VGA device. This seems to
> happen if a machine does not have any VGA device by default, but still
> requests "-vga none" on the command line.

This can be solved by adding this condition : (vga_interface_type != VGA_NONE)


> On 08/04/2022 12.45, Gautam Agrawal wrote:
> > This patch is in regards to this issue:https://gitlab.com/qemu-project/qemu/-/issues/581#.
>
> Better write this right in front of your Signed-off-by line:
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
>
> ... then the ticket will be automatically be closed once your patch gets merged.
>
I apologize for this mistake

> vga_interface_type is also used in hw/mips/fuloong2e.c and
> hw/xenpv/xen_machine_pv.c ... do they need a change, too?

I can definitely make similar changes in them too since they also
specify the vga_interface_type, shall I proceed with this?

> This will trigger a warning from the scripts/checkpatch.pl script:
>
> ERROR: do not initialise globals to 0 or NULL
> #238: FILE: softmmu/globals.c:43:
> +bool vga_interface_created = false;

Could you kindly suggest a better approach to this than creating a
global variable.


> I'm not a native speaker, and maybe it's just a matter of taste, but I'd
> rather say it in past tense: "No VGA device has been created"

I will correct the warning message, as suggested by Peter Maydell.

Regards,
Gautam Agrawal

