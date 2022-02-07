Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494DD4AB379
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 05:09:17 +0100 (CET)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGvL1-0003yM-TE
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 23:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nGvJ8-00028e-GT
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 23:07:18 -0500
Received: from [2607:f8b0:4864:20::b30] (port=36614
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nGvJ6-0006UY-G2
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 23:07:18 -0500
Received: by mail-yb1-xb30.google.com with SMTP id c6so36341025ybk.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 20:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P5VOFxS8voPIrzpGc4edZk/Vssowoe+uy9Uq1uN4oXA=;
 b=KJUQV95M4+ax4CjKuTxTQoKh2Vb+FHAClgbt7Q4kwCRpHHXSKk+4MIAAbhfLqEO1cQ
 rd2PeOkiQgjiZ7uTSy50mslPtfWIwY8DNcRwEOXwn4aEAuUwLWiJm+7zT2U1j5cat531
 3BysxIG8X2XJk8hWCvuDvTBBliWq0t64hK6rh09VJymrmjbseNNA0FzHHkLG51Tm2NDR
 h+1jl07sicGDT53jJC2oNKySk5LZ05/0xcM8+OXbyvgUbhlSd0Cr/+NS+BPbIExImAa+
 ZnKzpmP94CYvMbeeYtWGJU4zM22dHvt90ElYHFlDDzzACKlk//Uev5cmi+mqVAZMf7BT
 5F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P5VOFxS8voPIrzpGc4edZk/Vssowoe+uy9Uq1uN4oXA=;
 b=UF9bk+DPnLrI/CFSVNyeNgotStJmFfr+xYxa07Kqy21aAOcE4ES7m+d3ooT4HSbC7p
 xnJ5FiBObNpHP0+/X+L4BmPwOixWVzyaJnH5yWdRoZpFHR6+kd81OLTnT3gHhR5/OUcQ
 a88wyk7taiW6dk1Nn5gXidKAd9drPCb0ohPbGkK6AQhahv3Y8j3NFEuFfNB9wC+iNeEV
 N2wOiTNI3fLTlLM5rNpRBWYmQfoeQxcv953Fqua+k+9j50v7EiZkr67hYVKpIFXEE6sf
 ISCbql0ArdObAQ+MAbgSCNawFkg3yX4KbXBWjzc9YUKxJxG3kedcX4TvDyWtm7bgGrz0
 RIag==
X-Gm-Message-State: AOAM532cR23oAfhofWpaY5neqXmavrG9Toq+Np+9nU6Zlxml46Tus5/l
 Cu52RRI3hFL2/AYo4eFFTF09KaWUWY7pMWjSpeg=
X-Google-Smtp-Source: ABdhPJwjTLd1fuHJBz4pnYBNA+XOg3ovkvX8E0zW7UcmZUB77iQtm4/p0Sf89TNXo2Emm/Gsj3Cg9bxqBZ9LUw0da3w=
X-Received: by 2002:a81:af5d:: with SMTP id x29mr1206734ywj.147.1644206823425; 
 Sun, 06 Feb 2022 20:07:03 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
 <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
 <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
 <20210419131050.bltknubbkd4du6ti@sirius.home.kraxel.org>
 <CAAQ-SiMf=BV-HUudRayZkRPJjmkYWuiBuKqYHHLzYjcFnPOgLQ@mail.gmail.com>
 <20210419135627.dlerwnswhfxt6ciz@sirius.home.kraxel.org>
 <CAAQ-SiM6uWUgHTS5PQ-hSkuXNOoKC7fw6Y1ZHhJ0MCUE3oaBqg@mail.gmail.com>
 <20210420071304.gmndase3r6mwp5yt@sirius.home.kraxel.org>
 <CAAQ-SiPPNK0xqnPPSjNZgwQCs+Vj0_A5koq5xK8HzhZKDgqVJw@mail.gmail.com>
 <CAAQ-SiO6-Ay9415XsLe2Xd-KXog7i2Xvh0kX0h1uBgtj-L+=Ag@mail.gmail.com>
 <64abb96f-6c84-8dfb-f645-93d450d0909e@vivier.eu>
In-Reply-To: <64abb96f-6c84-8dfb-f645-93d450d0909e@vivier.eu>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Mon, 7 Feb 2022 09:36:52 +0530
Message-ID: <CAAQ-SiP9VmykC1vaHzur2ERo8U8GpUVGT8AoguK_68qxhCgnRQ@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 at 16:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 29/12/2021 =C3=A0 06:52, Shreyansh Chouhan a =C3=A9crit :
> > Hi,
> >
> > I am sorry for the absence of activity on this. A couple of people very=
 close to me died, and I also
> > got busy
> > with the linux kernel mentorship program for a while. It was a weird ye=
ar. But I am back on this now.
> >
> > I have the basic functionality of the sound card working. I tested it o=
n an ubuntu vm and it plays
> > audio just fine. I'd like to test
> > other things like changing stream parameters and channel maps. Also the=
 VIRTIO_SND_PCM_F_MSG_POLLING,
> > VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS, VIRTIO_SND_PCM_F_EVT_XRUNS features=
 aren't implemented yet.
> > Implementing VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS hopefully shouldn't be =
much of a challenge. We can
> > send a notification
> > when we have processed period bytes (if I correctly understand this).
> >
> > I will send another rfc patch series once I have channel maps and jacks=
 ready. And one more when I
> > have these PCM features
> > ready.
>
Hi,
>
> Hi,
>
> I'm trying to test your RFC series but I have a core dump (using alsa-uti=
ls speaker-test), do you
> have an updated branch I could pull?

Yes, I will send the updated RFC by tomorrow (Tuesday).

Thanks,
Shreyansh Chouhan

>
>
> Thanks,
> Laurent

