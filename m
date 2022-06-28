Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407F155C03F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:35:22 +0200 (CEST)
Received: from localhost ([::1]:54698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Yz-0004SW-AR
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o68RI-0002QA-DM; Tue, 28 Jun 2022 06:27:24 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o68RG-0001To-KH; Tue, 28 Jun 2022 06:27:24 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r3so21450190ybr.6;
 Tue, 28 Jun 2022 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6Oc3tFdHQFarHmMmcLhydp1UJB56lXdxaeG3yGIMFEw=;
 b=TTj2Ms1mS+vEWcv8xqlgVJY0Aou9sDEsIuuHTuc4r7cFmkNzTkTtknDYwBmmt8Braw
 9a19+Prrd8QuDr/iVakJ8Mvhdy0R40JLoy+eaQ1ZX8RxC6MJcxpKL3spsPBJVIkGRgIP
 BtE4jxOB2c1g9egsn7MRhxmHSoyGxTtZQpVHDazB9n0P4W6EjtLEurMS6USqZRmKEzEB
 vwFn3zKICjtqwOywG/xZ1uaoDItSf/ZkyT0N7HOCo5lLfImv9yWV5cwG5hXqV//EjPtj
 wFXYF/C+z3Q37+JcVu4Mtf2amtih2Eb569jWLr2XD8FfS71JbzDPcgBaDcXVtIxE//k2
 SI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Oc3tFdHQFarHmMmcLhydp1UJB56lXdxaeG3yGIMFEw=;
 b=2tOQyn/Xa6nfMN8lbhdNJcGPDXYYmAgHsY/5vynFQZQLRrW1UR0zlIGKk/x+azztTp
 kFiFHAHPva2lFMffPaKhYDfKoq1U6jFNnr/A192y3x7jr9w5zy+lDIMGQz/obu6ljsdd
 CFWKHrchH+P9z/IBzteUtbRo+SmEXW5soSj5L2m99xaFUM2DUZ88VxLL67p3r6cwLVTR
 5PPB6hfhIb8gey6rtDRRDHxEzLKMHykkw7dxBNWbYwHJnM0Vzh6NOO5XkMq7b4bxVKRG
 95rIN+SPpDdBQ/ABDzlUNNELyOcGuBI+LVynjC3lfk6AaKA6mhqEzQquHiKz6Q8+1XfR
 b7DQ==
X-Gm-Message-State: AJIora+T40uwJ27iZ6bOZghpECikiXzgkVFpW0U6FmGbokoTCTX7IPOY
 9I3fnpeC5Z2RWlgbKBjhaJT0omaPumiLYgsdj3wywh2hHIk=
X-Google-Smtp-Source: AGRyM1utKc1apAJ8ET8e6tGwJykIaQQO2XhyHuTS1irs2urVOPk+YxeD8Mww9XSzjCVZqi48OlAO6llk5bNArVobW+c=
X-Received: by 2002:a25:9e82:0:b0:669:b38d:e93e with SMTP id
 p2-20020a259e82000000b00669b38de93emr18463705ybq.242.1656412041248; Tue, 28
 Jun 2022 03:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-3-faithilikerun@gmail.com>
 <Yrq0QwRahF9wJh1S@stefanha-x1.localdomain>
 <d6f0ca3e-2463-5a42-f284-c54b4877cf15@opensource.wdc.com>
In-Reply-To: <d6f0ca3e-2463-5a42-f284-c54b4877cf15@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 28 Jun 2022 18:27:10 +0800
Message-ID: <CAAAx-8+Z+AFxV9hSyYrx6V6fhvy1a9er6rzKAEsUO2OZ7K7E0g@mail.gmail.com>
Subject: Re: [RFC v3 2/5] qemu-io: add zoned block device operations.
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb35.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 17:11=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/28/22 16:56, Stefan Hajnoczi wrote:
> > On Mon, Jun 27, 2022 at 08:19:14AM +0800, Sam Li wrote:
> >> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> >> index 2f0d8ac25a..3f2592b9f5 100644
> >> --- a/qemu-io-cmds.c
> >> +++ b/qemu-io-cmds.c
> >> @@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd =3D {
> >>      .oneline    =3D "flush all in-core file state to disk",
> >>  };
> >>
> >> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +    int64_t offset, len, nr_zones;
> >> +    int i =3D 0;
> >> +
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    len =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    nr_zones =3D cvtnum(argv[optind]);
> >> +
> >> +    g_autofree BlockZoneDescriptor *zones =3D g_new(BlockZoneDescript=
or, nr_zones);
> >> +    ret =3D blk_zone_report(blk, offset, len, &nr_zones, zones);
> >> +    while (i < nr_zones) {
> >
> > Does blk_zone_report() set nr_zones to 0 on failure or do we need to
> > check if (ret < 0) here?
>
> ret =3D 0 means "no zone reported" which happen only if nr_zones is 0 or =
the
> start offset is past the end of the disk capacity. ret < 0 would mean tha=
t
> a report zone operation was actually attempted and failed (EIO, ENOMEM et=
c).
>
> >
> >> +        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%=
lx, "
> >
> > The rest of the source file uses printf() instead of fprintf(stdout,
> > ...). That's usually preferred because it's shorter.
> >
> >> +                        "zcond:%u, [type: %u]\n",
> >
> > Please use PRIx64 instead of lx format specifiers for portability. On
> > 32-bit hosts lx is 32-bit, not 64-bit. You can grep QEMU's code for
> > examples of PRIx64.
> >
> >> +                zones[i].start, zones[i].length, zones[i].cap, zones[=
i].wp,
> >> +                zones[i].cond, zones[i].type);
> >> +        ++i;
> >> +    }
> >
> > A for loop is more idiomatic:
> >
> >   for (int i =3D 0; i < nr_zones; i++) {
> >       ...
> >   }
> >
> >> +    return ret;
> >> +}
> >> +
> >> +static const cmdinfo_t zone_report_cmd =3D {
> >> +        .name =3D "zone_report",
> >> +        .altname =3D "f",
> >> +        .cfunc =3D zone_report_f,
> >> +        .argmin =3D 3,
> >> +        .argmax =3D 3,
> >> +        .args =3D "offset [offset..] len [len..] number [num..]",
> >
> > The arguments are "offset len number". This command does not accept
> > optional offset/len/num arguments.
>
> The arguments should be offset + len OR offset + number of zones. Having
> the 3 of them does not make sense to me. The interface would then be:
>
> (1) offset + len -> report all zones in the block range [offset .. offset
> + len - 1]
>
> (2) offset + number of zones -> report at most "number of zones" from the
> zone containing the block at "offset".
>
> (2) matches the semantic used at the device command level. So I prefer to
> approach (1).
Yes, I'll remove the len argument then.

>
> >
> >> +        .oneline =3D "report a number of zones",
> >
> > Maybe "report zone information".
> >
> >> +};
> >> +
> >> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> >> +{
> >> +    int64_t offset, len;
> >> +    ++optind;
> >> +    offset =3D cvtnum(argv[optind]);
> >> +    ++optind;
> >> +    len =3D cvtnum(argv[optind]);
> >> +    return blk_zone_mgmt(blk, zone_open, offset, len);
> >
> > Where is the error reported? When I look at read_f() I see:
> >
> >     if (ret < 0) {
> >         printf("read failed: %s\n", strerror(-ret));
> >
> > I think something similar is needed because qemu-io.c does not print an
> > error message for us. The same is true for the other commands defined i=
n
> > this patch.
> >
> >> +}
> >> +
> >> +static const cmdinfo_t zone_open_cmd =3D {
> >> +        .name =3D "zone_open",
> >> +        .altname =3D "f",
> >> +        .cfunc =3D zone_open_f,
> >> +        .argmin =3D 2,
> >> +        .argmax =3D 2,
> >> +        .args =3D "offset [offset..] len [len..]",
> >
> > There are no optional offset/len args. The same is true for the other
> > commands below.
>
>
> --
> Damien Le Moal
> Western Digital Research

