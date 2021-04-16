Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001BD361CE0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 11:54:07 +0200 (CEST)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXLAs-0006QC-KL
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 05:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lXL9D-0005uc-4x
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:52:23 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1lXL9A-0001RX-Tt
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 05:52:22 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id r18so7737687vso.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hX8EXsNF2qrRQCqZyoWi9S8IFc6cCC7TLO4ay8lK7RM=;
 b=Mnp8vu93AmTvppCGkDchuP87aNGMHiwHhjhzM3VB54e7WBPvORv3wOkKfYIJi8ZODl
 yp5mk5W+4t/vp5cyTeHtrwmaqPP9T7QKYzTKsTcB3GBxNLNbu6RpQyG+GeOc+rhrDeSP
 mABpibXhWlQEDxrfUNsTjbt7i0/6vUKykZFwDIjtKvDWwIk3wT8qyrjVQ9IPUYnWCP3p
 0IjEJYhUL4JrjzeoB5yuPFZHxN2Dx6GT57WmqQEa6sLN/q/5Z4mzqCyi8DaIAc7h1e6y
 raVPIRFOqv6YBtAOY/z257bPn7ZWV7CSHELx8EGPb6amEBqdHNRCiFbW11lnhRhoLp7g
 sC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hX8EXsNF2qrRQCqZyoWi9S8IFc6cCC7TLO4ay8lK7RM=;
 b=dgLjzN50ZwxfWfaeuH/OjnD2T51iK48kgf/jKg3ktZFOotabRbigkc9VavBYqwiTJw
 OrnlreKYSOGWPnrK4orN5SjefLTq35sILYFDpMQ4Qfm0OpaFJ4FS9anniWwry0dlbdJi
 AKbTpB88xI1LMNfiJ2EFKanlR006ruuYi8J7kRGPPdK78ATBS8j/5JbyVc1vS+vsSnYG
 cgQTCnJz0a254MTnejk6QBHH2IYVwYRYzH2WaToqEe7ZLGAdmskYPxnsnIbxlSXZ6F0T
 vBfATh5URMNv0i2mQ3MDtvNglUcfGmKQoQcomJbqhTtnHh7waLBtaR+pzMZ0owN85Bbp
 sstA==
X-Gm-Message-State: AOAM530fVx3Xf7UYHqPgsDUBMA6BLY/20PW2+/w2bu4Rli1irokipdqV
 M7Nfpyhtno9myPeqPKpkhFS2MSmQ+NcUrAb0NPM=
X-Google-Smtp-Source: ABdhPJwaQZS4QdTr06OoylDdpgz9k7VNce4MLBEttr5UQKkEykyHtQifiKdLlkAzEvEsVh0ledZtQDDmIttu/9gLK0o=
X-Received: by 2002:a05:6102:ed0:: with SMTP id
 m16mr5923650vst.4.1618566739939; 
 Fri, 16 Apr 2021 02:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <8735vu1ybo.fsf@dusky.pond.sub.org>
 <CAD8of+oJM6+5Q05WRrbj=dd0fmcR2C80YvWK4F=T1A_HK4nKBQ@mail.gmail.com>
 <87a6py7evm.fsf@dusky.pond.sub.org>
In-Reply-To: <87a6py7evm.fsf@dusky.pond.sub.org>
From: Li Zhang <zhlcindy@gmail.com>
Date: Fri, 16 Apr 2021 11:52:09 +0200
Message-ID: <CAD8of+pzxhQZaZQEY5VjqVYwjnz-rD85fkP7Sf-UcExPaheK6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=zhlcindy@gmail.com; helo=mail-vs1-xe2d.google.com
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
Cc: lukasstraub2@web.de, alexandr.iarygin@profitbricks.com,
 qemu-devel@nongnu.org, Li Zhang <li.zhang@cloud.ionos.com>,
 pankaj.gupta@cloud.ionos.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I tried chardev-change, it reports this error:

{
    "error": {
        "class": "GenericError",
        "desc": "Chardev user does not support chardev hotswap"
    }
}

On Fri, Apr 16, 2021 at 11:33 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Li Zhang <zhlcindy@gmail.com> writes:
>
> > On Tue, Apr 13, 2021 at 8:41 AM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Li Zhang <zhlcindy@gmail.com> writes:
> >>
> >> > From: Li Zhang <li.zhang@cloud.ionos.com>
> >> >
> >> > For some scenarios, it needs to hot-add a monitor device.
> >> > But QEMU doesn't support hotplug yet. It also works by adding
> >> > a monitor with null backend by default and then change its
> >> > backend to socket by QMP command "chardev-change".
> >> >
> >> > So this patch is to support monitor chardev hotswap with QMP.
> >> >
> >> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> >>
> >> I think what what you're trying to say is that chardev-change does not
> >> work when the character device changes is used by a QMP monitor.
> >> Correct?
> >>
> > I mean that when the character device is a monitor device, it doesn't
> > work with a QMP monitor.
> > For example, I add 2 QMP monitors and change one of the monitor's
> > backends from socket to a null device.
> > It doesn't work because it needs the monitor device to support chardev-change.
> >
> >> If yes, how exactly does it misbehave?
> > This command chardev-change needs specific device's change callback function.
>
> Yes, but what happens if you try anyway?  I'm asking, because I'd like
> the answer to be worked into the commit message.
>
> >> Does it work with an HMP monitor?
> > No, it doesn't work.
>


-- 

Best Regards
-Li

