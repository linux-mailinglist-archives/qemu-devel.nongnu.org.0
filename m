Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753FA69B4A8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 22:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8C4-0007t6-W0; Fri, 17 Feb 2023 16:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pT8By-0007sl-Q9; Fri, 17 Feb 2023 16:22:56 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pT8Bw-0005XB-2R; Fri, 17 Feb 2023 16:22:54 -0500
Received: by mail-yb1-xb36.google.com with SMTP id j10so2361288ybg.7;
 Fri, 17 Feb 2023 13:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQXh+doPQH0yhW5nVCGTAZ2ujMs8SDeBoLumQ4yfA3Q=;
 b=Md1yE2yD8VfNoyh1QM4zCv2ak9FGgFvs7U3B9spJDtW1+jjuiMmVArmWjcdE4Tv+M5
 GE/qo6P10Rytk42oShphfqdm+Sj/NCy39kkFGjJyOWIIsFygrvwEVyejNSCTy5/T4pFV
 pdw0ZDMfOC1Q4iOBOQa4Jtfz6l+xvOJ9kAPOLIJdEQoazGJbgJ/tidzvzwB6m1T5Falc
 7GWq6nHYKDx+9Vd41ISDmw+rNnt4IvpO9AG9sPZKlVbB8ZYFIVFvp+QmXjEJDDPH1P/t
 wS+q5PSAuRKncUhQ0tjoUozI8/Q9qxVXphxpWM0Il1y+nJipmlAMwcaEgN3SCMLhBOEN
 cFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BQXh+doPQH0yhW5nVCGTAZ2ujMs8SDeBoLumQ4yfA3Q=;
 b=A1WaYkZW+tSXTUhSD508FTzNKIs53eibkcNHqZQeALxc87ulSkZ5VxW6btwOBBITie
 heYIDUP2yyZJMqtLD0r9iOUbRn1jhi7wj87oT8ENi/383hHcS3YvgoC7nCLo4cshsNZo
 8rJLdrOk3b0aodWZ6reVWEXexxWmF1qAMmDAXHYOdo5eeKYjfQQOni+AQtP11Yp28/WZ
 Tq1ieqZsAv+Q7xbEzDUorSEUgXHnnyfnTyrK+JWOoZcg6JSwQyxhgL+/uDPEWIe0LxBg
 wenP2wa6FZd1pj3gi7v2Bfrfxyeg7iN2mJyNuthLhP15nU3mocRYguVRtXg+RLYOHMG2
 Htfg==
X-Gm-Message-State: AO0yUKXaTOoIkDNoMiAmOHTzIH5h7WGek8mJAQIH8c8uVj8dBh6Dxoep
 2+uOAZEef64ZJ0mYy46AGLk5zALiQX9fCo/Dabc=
X-Google-Smtp-Source: AK7set+gjGSBPE5VxxVBh96e1jtU5BE6gH53cAT6kp+aHv32I1xdM15uzABZSvZw2OsW2vyE67OAkDA41c8ZFli3Z3Y=
X-Received: by 2002:a25:830c:0:b0:966:7de5:b458 with SMTP id
 s12-20020a25830c000000b009667de5b458mr701401ybk.299.1676668968211; Fri, 17
 Feb 2023 13:22:48 -0800 (PST)
MIME-Version: 1.0
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
 <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
 <d07bdbc1-065e-f8ec-2a44-ab141ffedd41@proxmox.com>
 <CAL77WPAdDyKFWP_Dqsz_xr7OCzHLTkw6VbYDMGobi8kek4e_8A@mail.gmail.com>
 <85488658-80df-f6ac-8a1d-51172148a436@proxmox.com>
In-Reply-To: <85488658-80df-f6ac-8a1d-51172148a436@proxmox.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Sat, 18 Feb 2023 00:22:12 +0300
Message-ID: <CAL77WPDJaRBgCeBtVx6tZ6yxKTG6Z2SEk_oif4RCSSnUgOuURA@mail.gmail.com>
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, 
 Aaron Lauterer <a.lauterer@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I think it's guest memory again. IMHO It's a part of a memory pool and
not real IO data (unless this was pagefile data).
The first 16 bytes look like POOL_HEADER structure.
The first dump contained signature from FilterManager and the latest
contains two structures from Ntfs.
It's not clear to me what exact data after header structure, but in
case of Ntfs it looks like doubly linked list  element
with Flink/Blink pointers: 60 a5 a6 d4 0c a8 ff ff,  - is a
0xffffa80cd4a6a560, and 30 15 d9 e6 0c a8 ff ff =3D 0xffffa80ce6d91530.
The first Ntfs, looks like a final element of something, while the
second is a middle part of something else.
That is why I think it is not real IO (i.e disk data sent by guest
NTFS driver). IMHO.

I can not tell anything about dma-reentracy issues, but yes, i would
start to look at check_cmd() function call sequence.
The most interesting is why Sector Count =3D 1. I thought about race
with IDE reset where registers initialized with
value SATA_SIGNATURE_DISK =3D 0x00000101, but this means LBA=3D1 as well...

Regards,
Mike

On Fri, Feb 17, 2023 at 4:40 PM Fiona Ebner <f.ebner@proxmox.com> wrote:
>
> Am 16.02.23 um 15:17 schrieb Mike Maslenkin:
> > Does additional comparison make a sense here: check for LBA =3D=3D 0 an=
d
> > then check MBR signature bytes.
> > Additionally it=E2=80=99s easy to check buffer_is_zero() result or even=
 print
> > FIS contents under these conditions.
> > Data looks like a part of guest memory of 64bit Windows.
>
> Just today we got a new dump [0], and it's very similar. Again only 512
> bytes and again guest memory?
>
> > febner@enia ~/Downloads % hexdump -C dump.raw
> > 00000000  00 03 22 00 4e 74 46 73  da 4c a3 1c 3b f5 7d 19  |..".NtFs.L=
..;.}.|
> > 00000010  60 a5 a6 d4 0c a8 ff ff  30 15 d9 e6 0c a8 ff ff  |`.......0.=
......|
> > 00000020  5c 00 53 00 6f 00 66 00  74 00 77 00 61 00 72 00  |\.S.o.f.t.=
w.a.r.|
> > 00000030  65 00 44 00 69 00 73 00  74 00 72 00 69 00 62 00  |e.D.i.s.t.=
r.i.b.|
> > 00000040  75 00 74 00 69 00 6f 00  6e 00 5c 00 44 00 6f 00  |u.t.i.o.n.=
\.D.o.|
> > 00000050  77 00 6e 00 6c 00 6f 00  61 00 64 00 5c 00 37 00  |w.n.l.o.a.=
d.\.7.|
> > 00000060  33 00 63 00 36 00 33 00  65 00 32 00 64 00 37 00  |3.c.6.3.e.=
2.d.7.|
> > 00000070  66 00 66 00 38 00 66 00  36 00 35 00 31 00 31 00  |f.f.8.f.6.=
5.1.1.|
> > 00000080  39 00 36 00 63 00 65 00  61 00 31 00 65 00 30 00  |9.6.c.e.a.=
1.e.0.|
> > 00000090  39 00 66 00 66 00 36 00  32 00 30 00 65 00 5c 00  |9.f.f.6.2.=
0.e.\.|
> > 000000a0  69 00 6e 00 73 00 74 00  5c 00 70 00 61 00 63 00  |i.n.s.t.\.=
p.a.c.|
> > 000000b0  6b 00 61 00 67 00 65 00  5f 00 39 00 31 00 37 00  |k.a.g.e._.=
9.1.7.|
> > 000000c0  31 00 5f 00 66 00 6f 00  72 00 5f 00 6b 00 62 00  |1._.f.o.r.=
_.k.b.|
> > 000000d0  35 00 30 00 32 00 32 00  38 00 33 00 38 00 7e 00  |5.0.2.2.8.=
3.8.~.|
> > 000000e0  33 00 31 00 62 00 66 00  33 00 38 00 35 00 36 00  |3.1.b.f.3.=
8.5.6.|
> > 000000f0  61 00 64 00 33 00 36 00  34 00 65 00 33 00 35 00  |a.d.3.6.4.=
e.3.5.|
> > 00000100  7e 00 61 00 6d 00 64 00  36 00 34 00 7e 00 7e 00  |~.a.m.d.6.=
4.~.~.|
> > 00000110  31 00 30 00 2e 00 30 00  2e 00 31 00 2e 00 31 00  |1.0...0...=
1...1.|
> > 00000120  33 00 2e 00 63 00 61 00  74 00 1d 08 0d a8 ff ff  |3...c.a.t.=
......|
> > 00000130  13 03 0f 00 4e 74 46 73  ea 4d a3 1c 3b f5 7d 19  |....NtFs.M=
..;.}.|
> > 00000140  90 05 4d 0f 0d a8 ff ff  a0 0c 55 0d 0d a8 ff ff  |..M.......=
U.....|
> > 00000150  43 52 4f 53 4f 46 54 2d  57 49 4e 44 4f 57 53 2d  |CROSOFT-WI=
NDOWS-|
> > 00000160  44 2e 2e 2d 57 49 4e 50  52 4f 56 49 44 45 52 53  |D..-WINPRO=
VIDERS|
> > 00000170  2d 41 53 53 4f 43 5f 33  31 42 46 33 38 35 36 41  |-ASSOC_31B=
F3856A|
> > 00000180  0c 03 67 00 70 00 73 00  63 00 72 00 69 00 70 00  |..g.p.s.c.=
r.i.p.|
> > 00000190  74 00 2e 00 65 00 78 00  65 00 37 00 36 00 34 00  |t...e.x.e.=
7.6.4.|
> > 000001a0  37 00 62 00 33 00 36 00  30 00 30 00 63 00 64 00  |7.b.3.6.0.=
0.c.d.|
> > 000001b0  65 00 30 00 34 00 31 00  35 00 39 00 35 00 32 00  |e.0.4.1.5.=
9.5.2.|
> > 000001c0  31 00 2e 00 74 00 6d 00  70 00 47 00 50 00 53 00  |1...t.m.p.=
G.P.S.|
> > 000001d0  43 00 52 00 49 00 50 00  54 00 2e 00 45 00 58 00  |C.R.I.P.T.=
..E.X.|
> > 000001e0  45 00 37 00 36 00 34 00  37 00 42 00 33 00 36 00  |E.7.6.4.7.=
B.3.6.|
> > 000001f0  30 00 30 00 43 00 44 00  45 00 30 00 34 00 31 00  |0.0.C.D.E.=
0.4.1.|
> > 00000200  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > *
> > 00100000
>
> [0]:
> https://forum.proxmox.com/threads/not-a-bootable-disk-vm-ms-server-2016.1=
22849/post-534473
>

