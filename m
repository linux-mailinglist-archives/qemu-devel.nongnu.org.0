Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F61355BFBE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:18:55 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67N0-00026F-6Z
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o677b-0007rZ-Hy; Tue, 28 Jun 2022 05:03:00 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:44789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o677Y-0001bw-Vg; Tue, 28 Jun 2022 05:02:58 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3176b6ed923so109603517b3.11; 
 Tue, 28 Jun 2022 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QZKRP8fRM5H1mA8CCL/ZxJHIed3fGBeVqEZz8uWIwgw=;
 b=lFgdc+wdfn6PM+k5gQeNK5379zuuxttrYT1P1FasuSVKeg35u/TLbAnNRdH4jq0lIx
 5hxnO/5zrnxriO5/52+OWI8EutCKI8L4N7jmmENTP+i9gm2hkur7E/6LN9c6nnncVZAG
 K0T44XkEvORAsYHXz3ahtEk6HqAu10J+JII+ZLvDgSI0CsgDDY0NP7UX7NgrnKSIGLCZ
 SAHj2a3w3ZYpkEfta8gsOFYByCjpMBhy1d3ZJ1BL7U6zq0z6WNsOaNQ+JCXbN3F85v3a
 4amKhso4yb1PhAgG2PoCvCKKpEV+ksgvyYSLxBa861/0NxuiCwZKC3Vn+eY28XYZ6sRp
 0fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QZKRP8fRM5H1mA8CCL/ZxJHIed3fGBeVqEZz8uWIwgw=;
 b=gJ/bG3rpqMlP/0ycmcHlNH8Ba0nV9OBD+u0xtOqQprNLtUwLh2X7V8ZJKF9eSUrHKx
 ZT+IdZ8ORE+GpEHqBBZ4LFn1tVmYTjm6JVA77Cx2RaZOKthVvIU6w8mB+c+v8donEPKU
 JcA1wEb64gzczAmQLTUIyL2MV8yF6VGc0qYEYk/mFj6PbIsI9DySoXoSndQ/VAZpdsdZ
 hrhUi2EQ8XMHd+RRdWiVyzUCO/66SMDr+5QqKpA5ABf8Uy/vCxCgvXX8S4QNI2JYMY8l
 eMDFKz9hrJvIrsVmwGFTYzgDF/CG7GF+qSqePhEVV0eEuuZa9hTSlmNYNTVHmwHQJE5T
 F5ew==
X-Gm-Message-State: AJIora9/mjyroPoaqv1Z1Zzbkq6Kkqs6p/TesZz0i9qee5LoTAMzrL1A
 OkCFeeyS6F6cG7yvv7lHglOQE+qEXvCfWlEH2m0=
X-Google-Smtp-Source: AGRyM1stzNaOWrRViPKNyEARTINrrvydUtXDsy9I2tXIzvkjXWy7r3HDFP2egx6Xzm8ZoiDO2wsJIANbTaJj2HerLYQ=
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr12786605ywd.283.1656406975374; Tue, 28
 Jun 2022 02:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-3-faithilikerun@gmail.com>
 <Yrq0QwRahF9wJh1S@stefanha-x1.localdomain>
In-Reply-To: <Yrq0QwRahF9wJh1S@stefanha-x1.localdomain>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Jun 2022 17:02:44 +0800
Message-ID: <CAAAx-8J6huKwTMmfQskZq5GG3ekyGk1Pj=0KHbiWSWOHWxGPeg@mail.gmail.com>
Subject: Re: [RFC v3 2/5] qemu-io: add zoned block device operations.
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1135.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 16:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jun 27, 2022 at 08:19:14AM +0800, Sam Li wrote:
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index 2f0d8ac25a..3f2592b9f5 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
> > @@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd =3D {
> >      .oneline    =3D "flush all in-core file state to disk",
> >  };
> >
> > +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset, len, nr_zones;
> > +    int i =3D 0;
> > +
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    nr_zones =3D cvtnum(argv[optind]);
> > +
> > +    g_autofree BlockZoneDescriptor *zones =3D g_new(BlockZoneDescripto=
r, nr_zones);
> > +    ret =3D blk_zone_report(blk, offset, len, &nr_zones, zones);
> > +    while (i < nr_zones) {
>
> Does blk_zone_report() set nr_zones to 0 on failure or do we need to
> check if (ret < 0) here?

I'll check if (ret<0) in zone_report and other commands in this patch as we=
ll.

>
> > +        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%l=
x, "
>
> The rest of the source file uses printf() instead of fprintf(stdout,
> ...). That's usually preferred because it's shorter.
>
> > +                        "zcond:%u, [type: %u]\n",
>
> Please use PRIx64 instead of lx format specifiers for portability. On
> 32-bit hosts lx is 32-bit, not 64-bit. You can grep QEMU's code for
> examples of PRIx64.

Noted. It is necessary.

>
> > +                zones[i].start, zones[i].length, zones[i].cap, zones[i=
].wp,
> > +                zones[i].cond, zones[i].type);
> > +        ++i;
> > +    }
>
> A for loop is more idiomatic:
>
>   for (int i =3D 0; i < nr_zones; i++) {
>       ...
>   }
>
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_report_cmd =3D {
> > +        .name =3D "zone_report",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_report_f,
> > +        .argmin =3D 3,
> > +        .argmax =3D 3,
> > +        .args =3D "offset [offset..] len [len..] number [num..]",
>
> The arguments are "offset len number". This command does not accept
> optional offset/len/num arguments.
>
> > +        .oneline =3D "report a number of zones",
>
> Maybe "report zone information".
>
> > +};
> > +
> > +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    return blk_zone_mgmt(blk, zone_open, offset, len);
>
> Where is the error reported? When I look at read_f() I see:
>
>     if (ret < 0) {
>         printf("read failed: %s\n", strerror(-ret));
>
> I think something similar is needed because qemu-io.c does not print an
> error message for us. The same is true for the other commands defined in
> this patch.
>
> > +}
> > +
> > +static const cmdinfo_t zone_open_cmd =3D {
> > +        .name =3D "zone_open",
> > +        .altname =3D "f",
> > +        .cfunc =3D zone_open_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset [offset..] len [len..]",
>
> There are no optional offset/len args. The same is true for the other
> commands below.

Thanks for reviewing!

Sam

