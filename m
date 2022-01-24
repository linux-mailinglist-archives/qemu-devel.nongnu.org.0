Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74C1497B01
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:06:50 +0100 (CET)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBvJJ-00061r-Gj
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nBvHh-00055C-Pq
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:05:09 -0500
Received: from [2607:f8b0:4864:20::331] (port=33670
 helo=mail-ot1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nBvHe-0003L1-US
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:05:09 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 y11-20020a0568302a0b00b0059a54d66106so21389163otu.0
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 01:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PX2+CBMnBO9K6NBfRL4k8Jd4vPd9DnNTdCjOO3A4b34=;
 b=TYaMpmu5CZcaUFsMgYMZTAFrct+nW13tVLdWcTMYAPJbY0nmwn7eWG4e2X2UZkr1OE
 eS+J20myjsIwnku1AjCYj97qF5q+dm9PlCmrD2yUFHRQCbG4eYZvUsTSkacx9x6mA9P2
 76RCO6piMQ+TN6MuQBfKTRnA5oKiYQZ0mIQoO3lA8Xm44MvadLZCgtCc3Ibv4UapblaQ
 5RJ0oNoPNI6DfihHFU6potJ09f+WFJHy+zL+/7u5FZhUKLC0v1C5VqUy9JphPkekhpjw
 e7TSTskWNfW3iT+Cvqfy/I1NhEylLsWo94I4mFM1hX8zg8LSVGznt4xvqefCE8wLAI2c
 2emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PX2+CBMnBO9K6NBfRL4k8Jd4vPd9DnNTdCjOO3A4b34=;
 b=AsJAJw7TgkpTZ/GiCGRdb1nwVY604Q/VBK5ZdZzmXf2R+9vyz/fJTazm8LYb8/jSDz
 STV7T91ni0ipe7UMfhl1TM2Xdrby++0mY+S42Jg+oyKXmKZpb83e4lDjmX1N46C0j/1B
 RxW6foHTQjkHh1lbt8ES3Z36YUAi9sm8XM0ArpiRf0DDhfrrHEOh7iyntv9MQ4mjEZzm
 ypn7F01WK7pUQB6vCHFuWBJHixr4AEdPiwoPwXkpzo+Iu5yofk+LGYGAx7dfgFQ9mwEK
 wmQZayflKvYOXsVGKRm2sgpZ2TITd3nzYe7EJQYyEmo4j3m5kKMosDahdtD/Yc9RCoUj
 hgIg==
X-Gm-Message-State: AOAM530tcguWJdnue3a+xzuA58SkmaUE1SppyW8B6B67rcKUAOUBaWvt
 pNurCtuzEpqPjsG1VBTSbOKTHQ8B4dCxbdoWmhA=
X-Google-Smtp-Source: ABdhPJzm8uf0JlfdX0NUyw8njAnc//sif6llXjGWqS2buwNwfRnr0X59pajYUI2W1pucxj3vYjToWvD+W6Ziep9ZsfU=
X-Received: by 2002:a9d:5908:: with SMTP id t8mr10756958oth.186.1643015105371; 
 Mon, 24 Jan 2022 01:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20220122002052.83745-1-f4bug@amsat.org>
 <b7c904ac-5246-79b8-bcc7-5b7a377e0d52@linaro.org>
In-Reply-To: <b7c904ac-5246-79b8-bcc7-5b7a377e0d52@linaro.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 24 Jan 2022 18:04:54 +0900
Message-ID: <CAMVc7JXYAPLpiCO1CCKAcsSi7p9tj8nQJOB=usaMOvELUX31AA@mail.gmail.com>
Subject: Re: [PATCH] meson: Use find_program() to resolve the entitlement.sh
 script
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::331
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 5:16 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/22/22 11:20 AM, Philippe Mathieu-Daud=C3=A9 via wrote:
> > Using ../configure without any particular option generates 31 targets
> > on Darwin, and meson search for the entitlement.sh script 31 times:
> >
> >    Program nm found: YES
> >    Program scripts/undefsym.py found: YES (/opt/homebrew/opt/python@3.9=
/bin/python3.9 /Code/qemu/scripts/undefsym.py)
> >    Program scripts/feature_to_c.sh found: YES (/bin/sh /Code/qemu/scrip=
ts/feature_to_c.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitl=
ement.sh)
> >    Configuring 50-edk2-i386-secure.json using configuration
> >    Configuring 50-edk2-x86_64-secure.json using configuration
> >
> > Use find_program() which seems to cache the script path once found.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
> > ---
> >   meson.build | 9 +++------
> >   1 file changed, 3 insertions(+), 6 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

