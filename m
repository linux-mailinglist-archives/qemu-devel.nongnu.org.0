Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B96F1751
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:14:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psMzV-0007ay-MM; Fri, 28 Apr 2023 08:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1psMzS-0007al-GF
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:14:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1psMzQ-0004Mt-K6
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:14:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-246f856d751so6754546a91.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682684055; x=1685276055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ai+UwAN65EsxZiuRLjz/hDFKGQ1yJzyW0PHWezmSi5I=;
 b=3EDBuC35i2RYfPOwAaX+x66vai4CsBnJD2yYgcGtSqERXYbSLSbupJViLG6VTwxGF8
 lWo/+bD8znbBE/Y0Ul2kAfk2OnPt8pl5PC/A62mTSCAJsOV9Ut7z+RbJwjOZETazgnX5
 QwDLKdBo0wBHEOKFSpJqDOsHLItfHHjWc1umiVmC1nfJw3DNb8Hx91Xr25o5AVgSB5SY
 8p7Qvl7TuhGuCH4a3MYpn8DemtMpInPmGPriuABgQQUF4sUPE2UQ3XkxLJ5BqBN9R9dC
 QHSj8tFxzdrkJYczMGXmrUVzgo4EhaMBjaZyuKd8Z6yOdrdkRUvYqDJfc3wh0vroUEWf
 1erA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682684055; x=1685276055;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ai+UwAN65EsxZiuRLjz/hDFKGQ1yJzyW0PHWezmSi5I=;
 b=jEjrhjZG5zYcHWoecqRFAJPlftKMI3igdWTz+hZv31CwxhGdOoO9m5ATZivQI7izzH
 TEqcDC+1USNvQgifnXGNO3pVjg4UU1WoYH6rA78BcwcOTdcmf74Wfc7SznOmjKgJ+Xy8
 DzbG2kNRix272uzF2+VQlmlQWJLBlPEHLG6lsxtBEKhWq4k4TtBQK7s3MpY37zhlHg6i
 ofC1+/KmZGNVp3oVV39Z6jHczdEzbbJ7BT+6DHvAJ3y/hq30CHRDiru1lQF4TELHuZEm
 x0Ci0/vBWQxG5tuduXQJLtozMahVX9eRLr8sgKYfNVk5OZyuZ9HiYPH/sBBXLgrBf5cN
 dY/g==
X-Gm-Message-State: AC+VfDxAMNzFq09mB5tV9XLK+X3ix6R5eAk1Z+xvyaITf7Hczrflg+F4
 +sRJ9nJGcv0StUyp5SEyDFTvFNgrEuNKyoefBaG1Wg==
X-Google-Smtp-Source: ACHHUZ4rr5j2CjvpXh58fbLEkTzJp/9ZmYNGGXpz8nvuBIGBhpGz+TGz6lXBiXep67s6KsQk0OZZ99NQTfdgbus1EUc=
X-Received: by 2002:a17:90a:17a2:b0:249:8963:c6b with SMTP id
 q31-20020a17090a17a200b0024989630c6bmr5167724pja.18.1682684055184; Fri, 28
 Apr 2023 05:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230421082028.53579-1-lwp_1994@163.com>
 <CAGoVJZx2T6C37UTiaO5xL78vMKweJYyEVZse72t0LNv3-kV3_Q@mail.gmail.com>
 <CABcq3pEtn7yvJNg1AB1_L7V0H_9_xTFDVtNHA4fC8GtxNtEO+w@mail.gmail.com>
In-Reply-To: <CABcq3pEtn7yvJNg1AB1_L7V0H_9_xTFDVtNHA4fC8GtxNtEO+w@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 28 Apr 2023 14:55:47 +0300
Message-ID: <CABcq3pHBFPEWO19vyNcqBfwboSJBLLgD_V3VBPRzOCkmb=brEA@mail.gmail.com>
Subject: Re: [PATCH] tools/ebpf: Fix IPv4 fragmentation identify
To: Yan Vugenfirer <yvugenfi@redhat.com>, lwp_1994@163.com
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 "Benditovich, Yuri" <ybendito@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=andrew@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,
Also, for those changes to have an effect, a new eBPF skeleton must be
generated.

On Fri, Apr 28, 2023 at 1:58=E2=80=AFPM Andrew Melnichenko <andrew@daynix.c=
om> wrote:
>
> Hi all,
> I don't think that checking DF flag is a case for figuring out that
> the packet is a fragment of some big datagram.
> For nonfragmented packets, DF may not be set.
> We need to check that the fragment offset is 0.
> Actually, it's a good idea to check that MF flag is not set too. So we
> can find the first fragment that doesn't require steering.
> So the code may look something like this:
> ```
> info->is_fragmented =3D !!(bpf_ntohs(ip.frag_off) & (0x2000 | 0x1fff));
> // checking MF and frag offset.
>  OR
> info->is_fragmented =3D !!(bpf_ntohs(ip.frag_off) & ~0x4000); // if we
> consider that CE always 0(which is always should be)
> ```
>
> On Sun, Apr 23, 2023 at 9:12=E2=80=AFAM Yan Vugenfirer <yvugenfi@redhat.c=
om> wrote:
> >
> > FYI
> >
> > ---------- Forwarded message ---------
> > From: luwenpeng <lwp_1994@163.com>
> > Date: Fri, Apr 21, 2023 at 3:21=E2=80=AFPM
> > Subject: [PATCH] tools/ebpf: Fix IPv4 fragmentation identify
> > To: <qemu-devel@nongnu.org>
> > Cc: <jasowang@redhat.com>, luwenpeng <lwp_1994@163.com>
> >
> >
> > The meaning of the bit flag in ip.frag_off is Don`t fragmented
> > When judging IPv4 is_fragmented according to ip.frag_off,
> > should use !(bpf_ntohs(ip.frag_off) & 0x4000) instead of !!ip.frag_off
> >
> > Signed-off-by: WenPeng Lu <lwp_1994@163.com>
> > ---
> >  tools/ebpf/rss.bpf.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
> > index 20f227e2ac..e77b764f3d 100644
> > --- a/tools/ebpf/rss.bpf.c
> > +++ b/tools/ebpf/rss.bpf.c
> > @@ -317,7 +317,7 @@ static inline int parse_packet(struct __sk_buff *sk=
b,
> >
> >          info->in_src =3D ip.saddr;
> >          info->in_dst =3D ip.daddr;
> > -        info->is_fragmented =3D !!ip.frag_off;
> > +        info->is_fragmented =3D !(bpf_ntohs(ip.frag_off) & 0x4000);
> >
> >          l4_protocol =3D ip.protocol;
> >          l4_offset =3D ip.ihl * 4;
> > --
> > 2.30.1 (Apple Git-130)
> >
> >

