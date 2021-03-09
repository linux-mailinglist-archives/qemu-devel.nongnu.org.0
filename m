Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56D331E17
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 05:53:56 +0100 (CET)
Received: from localhost ([::1]:47008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJUNX-0000LB-49
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 23:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJUMj-0008GU-Fh; Mon, 08 Mar 2021 23:53:05 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJUMh-00047k-S6; Mon, 08 Mar 2021 23:53:05 -0500
Received: by mail-ej1-x62e.google.com with SMTP id jt13so24985670ejb.0;
 Mon, 08 Mar 2021 20:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0VqzM52fTIk48MRMVO1WQuULzAZITRSg6ykEmEClUNE=;
 b=kjR8Ilz+gh+Wxi64Cl0zh/hnK/q/68XKsCi0XZByTzZoX/OeNykS/avpGyBprB66WD
 vsT7T5ezeyDqahNytfze2VDT7Y0pBciYtckV9EUFigUitPkZyu021m2qV1uZybDteSN6
 mA1kOn3+lA7nBNqz9GgsBsfZYMnSA0DknK1odhk8pBHMqEL/6NSAaANHBqQ8W/Qn/YIe
 9gfMLTIRbLVmofepom6dvmwK6MDS/mOHhyTeqxYDGvWls3ClVvSbBUubhs6LlwiRa32R
 4SePcd2USn33syNDg63RxJg+8LgZvJ7BOIy9RA2kCEy10uXAXhK8zC++TzQ1WdGFjG9b
 V9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0VqzM52fTIk48MRMVO1WQuULzAZITRSg6ykEmEClUNE=;
 b=D7xDTd8cwgwkzHs3X26IEHjIWG1zvwRPidpvizMdwypXYx+VclajibUUI0rqnHHu8s
 fOEGrfhJpzNmp33iA6wKIotlnvkOWL5Z55bbII0tjzqt6HqTjwHqzePSpNL0IbfnnUf4
 BJAfmJgRPjy7NoZ8X6OqoptfXsr1Ek2spc8CvvQsc+Zb7rzT5cwVttti0q8IWQcCnxkK
 +B9G4thQjMkIW7shhh4wkJ6vaaBWxVlfLNLoLU4Ff0kzfDPxl48/vQ41dBl8IxJ7yJAJ
 QI/b3VzxSmiaOdNsvGJf3RQeL1eWJolOWQOZgjG7ej53Z2CLsDxMO3mn1jTvURrj3KN6
 AIJQ==
X-Gm-Message-State: AOAM530Y5CRyn49/TKpUZv6oEcwAOUWOeAPL/BZuGR24wy/8BAiDzzoN
 YTqumw5pYZOpUNA7nTVdLsQOiKKPl//8vLrK0hA=
X-Google-Smtp-Source: ABdhPJzspSl8mt46LREd13FOzo0hx+D3t6UbjtlhtLZzCZlWtc4MtB8lkCFv0Qu3b9xfJttsXJTyTYOd3sIC22Lgcdo=
X-Received: by 2002:a17:906:3856:: with SMTP id
 w22mr18290924ejc.77.1615265581517; 
 Mon, 08 Mar 2021 20:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
 <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
In-Reply-To: <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 9 Mar 2021 13:52:50 +0900
Message-ID: <CAMVc7JXpP7twOzPWkFnSCgFtGBSNKG=iS95KNW8p7C_WCmEt6w@mail.gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 0:37 Akihiko Odaki <akihiko.od=
aki@gmail.com>:
>
> 2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 0:17 Stefan Hajnoczi <stefan=
ha@redhat.com>:
> >
> > The live migration compatibility issue is still present. Migrating to
> > another host might not work if the block limits are different.
> >
> > Here is an idea for solving it:
> >
> > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > support a new value called "host". The default behavior remains
> > unchanged for live migration compatibility but now you can use "host" i=
f
> > you know it's okay but don't care about migration compatibility.
> >
> > The downside to this approach is that users must explicitly say
> > something like --drive ...,opt_io_size=3Dhost. But it's still better th=
an
> > the situation we have today where user must manually enter values for
> > their disk.
> >
> > Does this sound okay to everyone?
> >
> > Stefan
>
> I wonder how that change affects other block drivers implementing
> bdrv_probe_blocksizes. As far as I know, the values they report are
> already used by default, which is contrary to the default not being
> "host".
>
> Regards,
> Akihiko Odaki

Let me suggest a variant of Stefan's approach:

Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
support a new value called "host". The default values for block size
properties may be "host" or not, but they should be consistent. If
they are "host" by default, add global properties which sets
discard_granularity and opt_io_size to the old default to
hw_compat_5_2 in hw/core/machine.c. Otherwise, add global properties
which sets logical_block_size and physical_block_size to "host".

Does it sound good? I'd also like to know others opinions for the
default value ("host" or something else). I prefer "host" as the
default a little because those who need live migration should be
careful enough to set proper configurations for each device. We may
also assist users who need live migration by adding a property which
defaults all block size properties to something else "host".

Regards,
Akihiko Odaki

