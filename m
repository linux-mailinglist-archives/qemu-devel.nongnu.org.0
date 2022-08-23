Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9F59D017
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 06:34:21 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQLcK-0005Uj-4x
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 00:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oQLZ7-0003r9-GF; Tue, 23 Aug 2022 00:31:16 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:35520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oQLZ3-0001TL-Ke; Tue, 23 Aug 2022 00:31:00 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-33365a01f29so349225457b3.2; 
 Mon, 22 Aug 2022 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=JopWW3k6LORjTuqQM+MmUTHGo7Rvc2pL4ngbhRrohIg=;
 b=JbtCoCcBPWH07dLSgWJw2spEO7Sn9UzkeRhgGJ2HBAPB2nLGGlXIObm+4BqdgI31Dv
 /KKOEcpD8EhMgJiAqoxJMCloU3TUKJ9Zqx60Vd/p5ADY++ezWlLgZ34M9a/pzw8Dj1I8
 7BPmGeF0w/YmRaG5M4SeKRumzDtzOSPnKWsVSpmPHsjUcnp9e/XYTCMKrljiR78kt0Hl
 H1MZOZ/EuvuflVjRYDL2xA15j4lQBo3LH8YXUZkO3Dsr9Uh8FMYyhh37Nxdlmi9cF9mj
 wOOet64q1pp1ehROa9utZ5i15Q9MeWVLt4wFR+JntbB6Q98M0nb8sTw+684esQqJSPp4
 dX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=JopWW3k6LORjTuqQM+MmUTHGo7Rvc2pL4ngbhRrohIg=;
 b=ObUs91ylfzZVomc90sPy6q1xg5BgTqZzJBp0Ro+N/J14E7sxUllap0NyMagN+4Fgwe
 IMAnE6GJWURHV/RM8tcJQwEFYQEElFgUPXQpdutBUM1J/5VzqH+4PpY4g22gbS2/ujaI
 3opHPSavWVomlNzSgV+0wyifEFDntC0VpUAtee/qNIBkXnSB7G8XW6PQT27kmTA4R/Yu
 pQmBoSq0GaZgqd9GQAXgEwHNCy8t5k5W4SEgUboT+NBFB8khrhS3fBWj3P5kPeoYfzoj
 nH1f0xwSPX7V/KtDhSQbeFe6C6/lj8yosmkvSnSLF0TwrvnQkXHPfoKGSn+p7m+7IoIz
 lNAw==
X-Gm-Message-State: ACgBeo1ExxP2muhmzoJ2GjAYF3L/Pil5UKxmx6n//xHwhUymc049i+3E
 RGytRuX7wDxba+Tm9dBOdSeotX16rz5Vu8dIMLY=
X-Google-Smtp-Source: AA6agR7cJn+bmgeR+QTz3HoDHhx3qHciQDPCY+YQv117XxJeiZrN4YxBVBfhpB5YWZmfZ218hpuDDdD9jKtMuopmFsI=
X-Received: by 2002:a05:6902:2cb:b0:684:aebe:49ab with SMTP id
 w11-20020a05690202cb00b00684aebe49abmr22635943ybh.242.1661229054543; Mon, 22
 Aug 2022 21:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-3-faithilikerun@gmail.com> <YwQLsL01jP89Dp5k@fedora>
In-Reply-To: <YwQLsL01jP89Dp5k@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 23 Aug 2022 12:31:05 +0800
Message-ID: <CAAAx-8LuqHmug-MknxRGubcXFqbHKFeEwNAq=4jsraz1ngji0A@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] file-posix: introduce get_sysfs_str_val for device
 zoned model
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, 
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, qemu block <qemu-block@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1136.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=BA=8C 07:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Aug 16, 2022 at 02:25:16PM +0800, Sam Li wrote:
> > +static int hdev_get_max_segments(int fd, struct stat *st) {
> > +    int ret;
> > +    if (S_ISCHR(st->st_mode)) {
> > +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) =3D=3D 0) {
>
> The ioctl must be within #ifdef CONFIG_LINUX since SG_GET_SG_TABLESIZE
> will be undefined on other operating systems and a compiler error will
> be encountered. Maybe keep the #ifdef around the entire body of this
> hdev_get_max_segments().
>
> > +            return ret;
> > +        }
> > +        return -ENOTSUP;
> >      }
> > -    g_free(sysfspath);
> > -    return ret;
> > -#else
> > -    return -ENOTSUP;
> > -#endif
> > +    return get_sysfs_long_val(st, "max_segments");
>
> Where is get_sysfs_long_val() defined? Maybe in a later patch? The code
> must compile after each patch. You can test this with "git rebase -i
> origin/master" and then adding "x make" lines after each commit in the
> interactive rebase file. When rebase runs it will execute make after
> each commit and will stop if make fails.

Explained in the next patch. I will make sure the patches compile in future=
.

