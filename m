Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6A331867A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:54:20 +0100 (CET)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7jv-0008Bd-5L
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lA7iF-0007Og-S6
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lA7iB-0004yd-JF
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613033550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s++22/vlYGfzh9+qRV1G3hqnWG7YB/ch3dvucMWLxXc=;
 b=YSaudd0NcYdoY/RdBeL4gPInSMZRzQBADCh3QmAvaKQSvF086C0HVs99P48rWK3NRVd+SW
 Of5UjToFcgK3DtWHWfOlaoweQ5hQDhSyrbQsL7acZczUdeBRmSgtfB4rXp4pEKwUydQSmr
 8RF5tpq92RIkbuPxvZIIC8ICS/jFvH8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-kRmSG2KQOuy9M-yiWAfe0g-1; Thu, 11 Feb 2021 03:52:27 -0500
X-MC-Unique: kRmSG2KQOuy9M-yiWAfe0g-1
Received: by mail-ej1-f71.google.com with SMTP id hx26so4438312ejc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 00:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s++22/vlYGfzh9+qRV1G3hqnWG7YB/ch3dvucMWLxXc=;
 b=mL8deIOiQL88Hp4QUOjqWeCxE6uTM8de9RaAAvmYn0Ibo08IBFBqKcU5WugwmqHlIJ
 kfY+6nw8X7I0M/dVic2DBDvxcWKSIuZS27sMogN9QsMI5vrdE0BXRfngi9IEt/gnAdA/
 xCjBTD3Dn4F+oB4709AYY47XVzC4ABv7al4lfUXwL8cs95i9FkO0JFOcmB4Zr7TfVR1B
 iOkQ/pOmKRGp+g3w3OWTbXTitLHScLb86wIfIu967vyA+pkvvwYA4liYJIIcTSVgRELD
 CZZd2JRNNVxqvYExrrHiKm5QuBmaozAhulaaoCRcVCBBg/UB7RfCzopPrb7M9AkQpcJO
 UHKA==
X-Gm-Message-State: AOAM533UwOVj0sXULl/aiiM78AJZKLzECZciFnoUCG9CJL/GowgJ1Thm
 lv2n7x1TStdx7Cq/nD3PqEKyaln0jJxK+U3weIK04P45lu3Gui3Xa3Kxd4omA+T1ZcSn8wirgMn
 dBlFmv/htdDOUm7eZ0VwvTcMod6oAMmo=
X-Received: by 2002:a17:906:9717:: with SMTP id
 k23mr7127897ejx.207.1613033546146; 
 Thu, 11 Feb 2021 00:52:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSpkItYFOri9uyrNmAAV0RfCd5KoNM20RN4i4Lo8bw/sr8eBVb/Q2q90t3l1cXXq9ay/6DHflZKPIAQYE+8/Y=
X-Received: by 2002:a17:906:9717:: with SMTP id
 k23mr7127879ejx.207.1613033545968; 
 Thu, 11 Feb 2021 00:52:25 -0800 (PST)
MIME-Version: 1.0
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPLD68GXeMyU_LTVYjv8YUXex4wvyAnHkOgu=PK48pP7w@mail.gmail.com>
In-Reply-To: <CAKmqyKPLD68GXeMyU_LTVYjv8YUXex4wvyAnHkOgu=PK48pP7w@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 11 Feb 2021 09:52:15 +0100
Message-ID: <CAA8xKjWojtJgOM-M6NYvWH5cPhEhxSdcWQ55Nz-24MstOr=xYQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
To: Alistair Francis <alistair23@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Li Qiang <liq3ea@163.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Wed, Feb 10, 2021 at 11:27 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Feb 9, 2021 at 2:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > At the end of sdhci_send_command(), it starts a data transfer if
> > the command register indicates a data is associated. However the
> > data transfer should only be initiated when the command execution
> > has succeeded.
> >
> > Cc: qemu-stable@nongnu.org
> > Fixes: CVE-2020-17380
> > Fixes: CVE-2020-25085
> > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> > Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> > Reported-by: Simon Wrner (Ruhr-University Bochum)
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
>
> Isn't this already fixed?
>

It turned out the bug was still reproducible on master. I'm actually
thinking of assigning a new CVE for this, to make it possible for
distros to apply this fix.

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


