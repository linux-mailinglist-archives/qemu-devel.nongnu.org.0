Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623854E2058
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 06:57:15 +0100 (CET)
Received: from localhost ([::1]:37756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWB2X-0005ed-Ty
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 01:57:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nWApM-0002Yq-Au
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:43:38 -0400
Received: from [2607:f8b0:4864:20::d35] (port=40774
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nWApK-0008Os-NH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:43:35 -0400
Received: by mail-io1-xd35.google.com with SMTP id x4so15582224iop.7
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMobzb4cHg3FW0BJZJfXUnJyZV6nY62g5XQ50oSI6tE=;
 b=nBkh1sqpCxxT6ZOpJcZ9dY2t+0gvmcRNZNj2bHrfQcuot7KY3u20QE8kUPzaFrxfEc
 /lOH/vcLKB0W5U3Jf3ZLP4DZbjz92XMWTFrGR6vPH5zzD2IifOPgZeMnc2J5sP6IsQBe
 6cp4xxmL6Xu66ASfHlSdobK/zJTd0a4bAn6a32yCKUSHHg27h3PsU7lNlBTxD167kp0x
 w1fLBu2uw9M79CFMx+BuhyYtY2UYaI7uFTZV5/d4MftISCV3isA68i7z5MnnudvHT2+j
 IIH0Yo4KIyw4REB8uFeu4xZwEdQnyQFtRUA40QcC3zPSNHD7d7WHR3FbByWl+Pm4w5pS
 vy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMobzb4cHg3FW0BJZJfXUnJyZV6nY62g5XQ50oSI6tE=;
 b=Plry7T8v+/1qAu97aEtZm5DwsI5OlHSVvcBuQC8D1V0fU4wWRGUD80Ft8dHZlZKfgS
 1GLjwOnOjDlImTNzB/B9duf37qoFcPGa6pWEBDpydGFgX6WMxrOFDNakvbXnZP97wUjT
 qEzUnv2GG9tejCddshC6i+xJr+nLQbHSNokkF1/yVYtXnZnuEW0ltqD746A1ciol0tZL
 qJhDqoAqizml82Do7GKqj3mQZebHsf0MEiGJdLmHfceJvzkFC3zFs1+jJyKn95lI7K5g
 zBQs9JwajglEinRDsj5VxyFpSOaXpstIePb1OElBGlqybnWuUE+d2jq0lls2pgJ+fXYN
 Q7VQ==
X-Gm-Message-State: AOAM533JR8WzElXS2SCUj+n0byXZsvcLzcpafEdTSapuj9rp3r4HybYf
 7eccs+pJPNf7meGa1T6WryckabVf++PkowspYKU=
X-Google-Smtp-Source: ABdhPJxQjpTyWf99tLKB1BVtNgvamkQJhGAkOttCgBXc7doH+65Dbk77y/83JJOGHEK21ED0VyvFJ4jGZsQy19CYFMw=
X-Received: by 2002:a05:6638:134c:b0:321:3eb8:f68a with SMTP id
 u12-20020a056638134c00b003213eb8f68amr1893707jad.66.1647841413481; Sun, 20
 Mar 2022 22:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
 <CAFEAcA98VQmM_ETpNuhq31Y7xLkS_AjVRsTeCdnqzMZG-3uxBA@mail.gmail.com>
 <3783dce0-0c5b-824e-2097-bbc3367281a6@oth-regensburg.de>
 <CAKmqyKNf3qL9k83tRD+=Frdue=+WZNAJ8RxK4UivCjz0Adjbqg@mail.gmail.com>
 <CAFEAcA8mqdAf58FkxDPtL_UK2feGTEUE+h--_a8pRpSsGUCHYw@mail.gmail.com>
In-Reply-To: <CAFEAcA8mqdAf58FkxDPtL_UK2feGTEUE+h--_a8pRpSsGUCHYw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Mar 2022 15:43:07 +1000
Message-ID: <CAKmqyKMGJR8M6MkL5Cer81qbCce0XmdcS8pQEkmH6X9h0SutmQ@mail.gmail.com>
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 7:46 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Mar 2022 at 22:23, Alistair Francis <alistair23@gmail.com> wrote:
> > Hmm... This seems like a bug. We shouldn't allow the user to specify a
> > `-bios` option if using KVM. Would you mind preparing a patch to catch
> > this?
>
> You don't want to allow the possibility of a bios blob that expects
> to run in S-mode, the way arm virt can run an EL1 UEFI BIOS ?

Interesting. We could still allow that by using -device loader though.

If we load something in S mode it really is a kernel and not firmware,
so I think the -bios argument is a little misleading. We could make
-bios and -enable-kvm a warning instead, to discourage users from
providing OpenSBI, but still allow them to pass something.

To me not allowing it seems reasonable, and we can always re-allow it
in the future if there is a good use case.

Alistair

>
> thanks
> -- PMM

