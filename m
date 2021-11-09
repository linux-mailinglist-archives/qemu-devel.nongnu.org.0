Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4D44AC69
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:18:01 +0100 (CET)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkP8a-0006fg-8w
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkP7S-0004nj-CS
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:16:50 -0500
Received: from [2a00:1450:4864:20::130] (port=33783
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkP7Q-00046T-9a
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 06:16:50 -0500
Received: by mail-lf1-x130.google.com with SMTP id bu18so43684748lfb.0
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 03:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bRc60V5xlGWHc8wqvLrk7t41rhDwyo/5NyDJL+/PBeg=;
 b=r98Id+6F1AUmBZ8yY4JJiXhPvgpD9YvRbkureDCA74Nq9bIdRlnA2UzLAV6T7Z3huD
 0pu8oMROaKiXCwX0z4VLhJAXXCNqbcOpvfh9pd4Kqw/4bTcoZTIY4aauPWux/oTLBEru
 HEjyBU3G8SlyQbzqmlsXmlP6ti/1UqItyiGPCDk6TBZJeoUYiHettxECVnwKWl7VERNv
 ZW2qlmAH8PQg/7Oj6KkHVlLkU2W0sSwsh1BH3pWAGyu6gg7njOpUQNsAxzS3mvKMxfsM
 LOWJDRnvh9RxMFAXQrJd1BDMLP+C9u0mcL661DU5sifI9UzmS7+4VJPRli9jHseyqgNQ
 Ioew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bRc60V5xlGWHc8wqvLrk7t41rhDwyo/5NyDJL+/PBeg=;
 b=wUl+xHg+S5vvCdzRZpIIR7onWQUNBSbxNF6CiGg6shAbnmEXtKDpbfhI4rk962qdRx
 9AOyB84+ykYUvr9x8MYxjre8QS3QVgLqNPHiMDySHdKpib1XraNQgSVn86CB+LYmeWoz
 I1YElzlcgDCWX8aFtS09Kc/iMMSNZ0r1NvgUUOkvzdDxJyCiKAVBfbfu4ki0Wohin//E
 j15L1oOGPTRSCx7dyPo5UUU1BjxUBCGrBaVmlcn6yf+I+XSjR9LcxVJyk/042Sb68yby
 tSNI1lpZ8XFgVk3shG2Jk6vJrkuAX98Nm+Wtkd/qZUH/u2bvd+l60uEh3QY6WRtmbqnw
 kZiQ==
X-Gm-Message-State: AOAM533Nrz9mvcT5McQJZgs1EG6A3dsYDp+Xa6NS5tVzCWqDbEFa4DXO
 DFfvkA0QsE5TLoLm4GwqXrfVNxR3T/1t4qgII3Jw4qLGBSi31ZDM
X-Google-Smtp-Source: ABdhPJyHNUmodZmzAkIm/4yga1BxAiGagksfLx2ylhE86ayR2d6WtJ+18dF0XRRB4LRiitIoj15cWC2wI1plZfZEid4=
X-Received: by 2002:aa7:c158:: with SMTP id r24mr9084753edp.65.1636456221583; 
 Tue, 09 Nov 2021 03:10:21 -0800 (PST)
MIME-Version: 1.0
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
 <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
 <YYpE8zhRR2WWFl+j@redhat.com>
In-Reply-To: <YYpE8zhRR2WWFl+j@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 9 Nov 2021 16:40:10 +0530
Message-ID: <CAARzgww63RpHB+40q5=qzy+V2ZoJs-FF1C2WAz8TL58r2dwJ7g@mail.gmail.com>
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=ani@anisinha.ca; helo=mail-lf1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "imammedo@redhat.com" <imammedo@redhat.com>,
 "Annie.li" <annie.li@oracle.com>, jusual@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 9, 2021 at 3:23 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Nov 09, 2021 at 12:41:39PM +0530, Ani Sinha wrote:
> >
> > +gerd
> >
> > On Mon, 8 Nov 2021, Annie.li wrote:
> >
> > > Update:
> > >
> > > I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well =
in q35
> > > guest. Seems this issue only happens in q35 guest w/ OVMF.
> > >
> > > Looks that there is already a bug filed against this hotplug issue in=
 q35
> > > guest w/ OVMF,
> > >
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D2004829
> > >
> > > In this bug, it is recommended to add "-global
> > > ICH9-LPC.acpi-pci-hotplug-with-bridge-support=3Doff \" on qemu comman=
d for 6.1.
> > > However, with this option for 6.1(PCIe native hotplug), there still a=
re kinds
> > > of issues. For example, one of them is the deleted virtio_blk device =
still
> > > shows in the Device Manager in Windows q35 guest, the operation of re=
-scanning
> > > new hardware takes forever there. This means both PCIe native hotplug=
 and ACPI
> > > hotplug all have issues in q35 guests.
> >
> > This is sad.
> >
> > >
> > > Per comments in this bug, changes in both OVMF and QEMU are necessary=
 to
> > > support ACPI hot plug in q35 guest. The fixes may likely be available=
 in QEMU
> > > 6.2.0.
> >
> > So we are in soft code freeze for 6.2:
> > https://wiki.qemu.org/Planning/6.2
> >
> > I am curious about Gerd's comment #10:
> > "The 6.2 rebase should make hotplug work
> > again with the default configuration."
> >
> > Sadly I have not seen any public discussion on what we want to do
> > for the issues with acpi hotplug for bridges in q35.
>
> I've raised one of the problems a week ago and there's a promised
> fix
>
>  https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00558.html

So https://gitlab.com/qemu-project/qemu/-/issues/641 is the same as
https://bugzilla.redhat.com/show_bug.cgi?id=3D2006409

isn't it?

>
> but we're now a week after freeze and still no patch has been posted
> AFAIK.
>
> IMHO it is pretty much time to revert to native hotplug, otherwise
> we're going to risk getting too late into freeze to do anything, and
> end up shipping with broken PCI hotplug again in 6.2
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

