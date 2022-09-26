Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741875EB346
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:39:39 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocvpB-0008Ho-Cc
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ocvlp-00041m-3o
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:36:11 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ocvln-0005OL-Iv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 17:36:08 -0400
Received: by mail-vs1-f46.google.com with SMTP id m66so7863587vsm.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 14:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ow8lMlrsGxY2Sef8yQ8xuF1SyArqNRUVrvb1e1iqLkg=;
 b=h/jdrfLMpfbW/GHpCPqMZLJrNFQNxvtCsYmXhwXhdAl7gOHpZbZmX1ztHOAt0dC0/e
 yZS1g481WnL0AD8+S0YilQA2jDJpMhm0EJ9MED6188DVrTCbZyBODhDaJSaOw4zXWiEz
 i7qr0h2NtYBDaKy98fzJIYIWHKaOfnj1kH+Ob5puGqrsYYyd77Pi6Me115dgFmL+lDLQ
 i3NXOfWD9uVKeeVYjckzQIti12nPHDw5btcEdQujgXZuvqLacrt/yYTmNyYz4HcqKZEH
 IR4rXUyQCHHaCCYBlGVstOtWtAEQh1ahHL29Jlf8aK95GztNMuGuGCMLRp1dPe4cpCv8
 jGnw==
X-Gm-Message-State: ACrzQf2kH3l4pl8Mios2GL5GV7t7gHGjiuTb6LXCLCMs6i/xal7Sgi8B
 LsRoE6KYK/9ayIr61ZxYR5ustEfv9Unhunkt9uzVYMkHPVc=
X-Google-Smtp-Source: AMsMyM6Hh66++R1taOJXCglPocAY7ZNwTl3LOGPmnaVY4iMTUWjnRDWh0pW+Cvn+OuzQzuhI5qm/JPbErKTu5S3hpbo=
X-Received: by 2002:a67:e085:0:b0:398:30a7:3be5 with SMTP id
 f5-20020a67e085000000b0039830a73be5mr9230588vsl.45.1664228165841; Mon, 26 Sep
 2022 14:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
 <E9443B6B-D245-4F31-B3BF-85011CB6B9FD@flygoat.com>
In-Reply-To: <E9443B6B-D245-4F31-B3BF-85011CB6B9FD@flygoat.com>
Date: Mon, 26 Sep 2022 23:35:54 +0200
Message-ID: <CAAdtpL6dnKwDRtXTzDCw9_-+6H0+vgqGqbEdTb+cAmsxO-oOWg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] MIPS decodetree conversion attempt
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.217.46;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

Hi Jiaxun,

On Mon, Sep 26, 2022 at 4:44 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
> > 2022=E5=B9=B49=E6=9C=8821=E6=97=A5 13:41=EF=BC=8CJiaxun Yang <jiaxun.ya=
ng@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > This is my attempt of converting MIPS translation code into decodetree.
> >
> > Currently only MIPS I to MIPS Release 5 arithmatic functions are conver=
ted.
> > Old decoding functions are perserved in codebase for now due to depende=
ncies
> > from microMIPS/nanoMIPS translation code. Will remove them after dealin=
g with
> > release 6.
> >
> > Both instruction encoding and test cases are generated form MIPS's inte=
rnal
> > architecture validation tools so they are gureented to be correct.
>
> A kindly ping :-)
>
> Will send v1 tomorrow if no objection.

Thanks for this work! On a first pass it looks good, but I'd like to
spend more time reviewing in the next few days. What did you change
between RFC->v1?

