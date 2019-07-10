Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E403964846
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 16:25:16 +0200 (CEST)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlDX1-0005gT-Kl
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 10:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hlDW9-0005Eq-Js
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hlDW8-00052W-KQ
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:24:21 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33989)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hlDW8-00050l-Du
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 10:24:20 -0400
Received: by mail-wm1-x344.google.com with SMTP id w9so4776638wmd.1
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uv178HtAGzxPeFVeeh8Kb9GGfIBtM+VyQCrK/US8faY=;
 b=PKixMxA/u5TDJKyEzoIIYdHUnxpXZHjcWWdiwjfZD035Va9u1ymzrwA0YoeO0zvJv9
 5tG0er6J3Y3q4h5XyhQfp0cDXgmwcFfYOCw5ksFJNbKkfObPqjwoQAvro3PjEbRUKnaq
 xzDdbDby3rlinmRyk2VbtBFRhYQ1OHYJ3dy/FVycYrZ8BVr0XK9ZkjRfKIOHoMR8Y58I
 wbU2u/z2BUDJYqcJDYRE2PNIXKEp+pLpoi3TxtTiUgc+mVXvU9aMluTeFZyeAcue6fOj
 dHESC89ohr1sUR5julV8uBV9VrtIqV2OBU+W9+8QVmEej5TDSIwMhlEUJKlv1YfSxv1D
 bp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uv178HtAGzxPeFVeeh8Kb9GGfIBtM+VyQCrK/US8faY=;
 b=VbSTF0y4MgkDVfU/oVpMtUT2K2QYrGjAFiYJYxsi//KWV6lnjyVD1PIk1fUWAxfoRu
 46bfuYjWdorMXEJWPwQAIDpZBah7/+OUorNC0pJLSQmxqqC++CfUgm2llaiURHc2klGz
 8L4RGVoeNfDE79gQ7PYg3w3ehhenNpTq88zUUN5y/xxh1vQFrhwdXjNNNPcpTVmiWPAe
 RA2XzlwRsH498WqcNBST9jEc6qSVzPNquhwCZBw5uL5PJFcQnU7QPzzyralFe4Yr/KPh
 pWxN8ijEcOU8VLB2X6axvMXUyxleI8BcLND8i4lpivC3hNRJ2rb6fLg91wzQcHIjSBFr
 RtVw==
X-Gm-Message-State: APjAAAUQHECl65vKh8sYXCjfn6XvOzMUjvkgwfFnPRsPRCKQgas8W6SB
 9OTShnd7QzGmXKkn5LRnMLupQwiah5UIM55bKLQ=
X-Google-Smtp-Source: APXvYqzkl/idHFx3wpJ8smgJk3gizjWyC8UKvL8g1g+Mea6Kz9575RMO8ZpWnsTNkesFH2vWLUB7Tw5MnVrtt84hax0=
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr5878835wmb.46.1562768659153; 
 Wed, 10 Jul 2019 07:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190627131252.GA14795@olga.proxmox.com>
 <20190702102108.GA29267@olga.proxmox.com>
 <20190709142211.GF2725@work-vm>
In-Reply-To: <20190709142211.GF2725@work-vm>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 10 Jul 2019 16:24:07 +0200
Message-ID: <CAJSP0QWgq-j-w9aPTSsXGB4eToaOoF8w6Y3g=i+mn5D7=52Msg@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] balloon config change seems to break live
 migration from 3.0.1 to 4.0
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 9, 2019 at 4:23 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> * Wolfgang Bumiller (w.bumiller@proxmox.com) wrote:
> > On Thu, Jun 27, 2019 at 03:12:52PM +0200, Wolfgang Bumiller wrote:
> > With this changing compatibility options I'm not sure if this is a
> > desired upstream change since 4.0 is already released?
>
> There's no great answer here - one of them is going to stay broken;
> we can either fix migration earlier 4.0 and break migration to 4.0
> or leave migration from earlier broken.
> Let's add the  property at least - downstream I know I'll need
> it.
>
> As for your actual patch; it's way bigger than I expected - can't you
> just use DEFINE_PROP - like for exmaple the 'disable-modern' in
> virtio/virtio-pci.c ?
>
> Stefan/mst: What do you reckon - should we:
>    a) Fix it so migration with older qemu's works but break 4.0
>    b) Or leave 4.0 working and keep older broken.

I suggest we keep the 4.0 machine type as it is (with the larger
config size) but fix older machine types so they use the smaller
config size.

QEMU 4.1 and newer machine types should use a config size that depends
on the virtio-balloon features enabled.

With this approach 3.1 -> 4.1 and 4.0 -> 4.1 migration works.
However, migrating from QEMU 4.0 to 4.1 with a machine type earlier
than 4.0 will fail.  I think this is okay because 3.1 -> 4.0 already
failed in this case.

Please see the patch I have sent separately and let me know if you like it.

Stefan

