Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585C33378AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:02:40 +0100 (CET)
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNln-00083q-5A
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKNZk-00011q-JZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:50:13 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKNZg-0004QI-OC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:50:09 -0500
Received: by mail-io1-xd36.google.com with SMTP id n14so22428753iog.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bDutI6XlEP3cg3qSipkFBGtAW8knzvxoCM0psYNYfMU=;
 b=HdTUmToQ6XlKtxkq22henrRa4r0rbMQBFg1hQv635PNSZy8J81XysllITSLoel59xC
 K07VSyxWCMbTWDUFEHQ7XkYnwQ4xl2IijYooUt6/Qg8pz3yZVd4EzcFAhxq03+NnEgw+
 OLMIdatMObnHPDfwMaqjLLTxb5VY9RuGviNF+wvfVlAfayxPUhWvrZFJWtyY+tsxv6o3
 B48l50mEscWoYEsrbjXUOq6VlpgNKjI5t/V4BjSHPEzAOEuJvUt/rlfBM5xhQnhePrWC
 qD7XceJnMchSGLTbh/rNI/gvqYwtutZPeZqmwPzwfBSg+lkHU2r7Ei8uklu2OYmvkpCU
 w9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bDutI6XlEP3cg3qSipkFBGtAW8knzvxoCM0psYNYfMU=;
 b=AF9oPfzSPcxbtfFregIM2jVZpDi8NJqZpruS1wLLOG9eCbSXRyotK6bp06qlkaK1YU
 dhXwH7ycDH3DO8lJHpgIIpEafNL3rPizFtchlr+haeJ5kAo39DpabDB+VKL0Tg9iypq4
 AskPKNX9twEPwNn+MZduSq+ivZ6+jHWosCYGBmsHFlH93gZ+soAtHE7Gdsczxua9qxg9
 AVBXM0c/3g2re7bk5paiY2s0VBlhX7WRNvrTSWyT2eTHIjrRYBMP07ZVljLV8cAhLqdv
 7vaIC2oK2bb0kglBTY1cJ9xjnmYFHXIoE+V21gT9njdGrIz/WFep6nnJOc9JhEEOM9dV
 kjEw==
X-Gm-Message-State: AOAM532sZDq3H80AVEAFmgcLJh1kr30xJQz1AdkQCPbt68eC7vikoHyV
 pn6T0VMElIfD14WBLWWGTD4Md3h/ZjySMIiac1E=
X-Google-Smtp-Source: ABdhPJz6SOBVDFGulKlpMYcNAHDOYAZUaVigrCb3pXf0uOxG+3lBBpSZRQQwMAPTcKuZIMk5dMS3lbmI3z/toZTFuK4=
X-Received: by 2002:a02:11c9:: with SMTP id 192mr4251079jaf.135.1615477806254; 
 Thu, 11 Mar 2021 07:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20210304144651.310037-1-alistair.francis@wdc.com>
 <20210304144651.310037-4-alistair.francis@wdc.com>
 <11f66e7f-a02a-42d3-5da9-085cc9e846c5@redhat.com>
In-Reply-To: <11f66e7f-a02a-42d3-5da9-085cc9e846c5@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Mar 2021 10:48:44 -0500
Message-ID: <CAKmqyKNqeUD13JusSxRuxWfkUt95DZkFgk259v_Jg90ncLsrrg@mail.gmail.com>
Subject: Re: [PULL v2 03/19] roms/opensbi: Upgrade from v0.8 to v0.9
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 11:51 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Alistair,
>
> On 3/4/21 3:46 PM, Alistair Francis wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Upgrade OpenSBI from v0.8 to v0.9 and the pre-built bios images.
>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Message-Id: 20210119234438.10132-1-bmeng.cn@gmail.com
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 62144 -> 78680 byt=
es
> >  .../opensbi-riscv32-generic-fw_dynamic.elf    | Bin 558668 -> 727464 b=
ytes
> >  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 70792 -> 75096 byt=
es
> >  .../opensbi-riscv64-generic-fw_dynamic.elf    | Bin 620424 -> 781264 b=
ytes
> >  roms/opensbi                                  |   2 +-
> >  5 files changed, 1 insertion(+), 1 deletion(-)
>
> For pull-request you can use git-format-patch with --no-binary:
>
>    --no-binary
>            Do not output contents of changes in binary files,
>            instead display a notice that those files changed.
>            Patches generated using this option cannot be applied
>            properly, but they are still useful for code review.

Thanks, I have updated my script (which is really Peter's script) to add th=
at.

Alistair

>
> I did the same mistake last year and this broke QEMU patchwork
> instance. No sure it is still in use, so Cc'ing Stefan.
>
> > diff --git a/roms/opensbi b/roms/opensbi
> > index a98258d0b5..234ed8e427 160000
> > --- a/roms/opensbi
> > +++ b/roms/opensbi
> > @@ -1 +1 @@
> > -Subproject commit a98258d0b537a295f517bbc8d813007336731fa9
> > +Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
> >
>

