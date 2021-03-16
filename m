Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4973833DE3E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:53:30 +0100 (CET)
Received: from localhost ([::1]:54562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFkv-0001HP-Ba
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lMFj6-0007u9-SF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:51:36 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly@cyberhaven.com>)
 id 1lMFj5-0006Ct-6J
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 15:51:36 -0400
Received: by mail-lf1-x12c.google.com with SMTP id q25so64290519lfc.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cyberhaven.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7BV/+tLSyoyQW05lkrlVHVKeE1nkmsxBFFZfmf0zW0=;
 b=I0LRqY3ToU1GEmHInsSKYwcEilk9VRxFTUnCaZt5I8NIR7+aKxH7FMvc02gUI3xsjA
 j93xC6c1lhm8126kXXkfg7Jhz0pHnpDTtsGJSPrgFgxwNzSV3icLCFC7COHbjJRO0CMX
 +yvmlL8FsgL/rJfSXrEVRcAgZnZGKieQFJ9GZ8KPBKDbk7jo1zzMdYyQvpfcp85kIOi9
 UQ8/iC2VP7psy5XNfjIOyZL8c5nTM5/wH+u6Lgqn6ln4YrFp8ixY3Z5c2JCbrQ3nIVw5
 7yI6JlpAM4eLK7VUI/j1rUBiFn7JCUoZVhhYlaSRan1nF0rKR21pFnEel5Ek4r9nxu1u
 ZzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7BV/+tLSyoyQW05lkrlVHVKeE1nkmsxBFFZfmf0zW0=;
 b=HTijgqztyiOyk52H0vifzgWdt7xOVTkN0tODTa6XZhLtdL3Z4H+2HYYd00Myxsb+XI
 nLwLyGTfu0qBmkm97EaxE4DaCI1RmyWFxvFFUQF1aZ2t2RoXANwYHu3sIT6TDP3vXbbR
 ix4WgeVGbUy+IDERIzQQm15F9KxH5NbuMkRTGjqYEH0wEhyv5NEoB8Aj6KlFDKjTqIrc
 j9emJ6LJWGw664e+KmS4JN/B6sXEZomC79XTX4z+Ewh68i+McJBLMXmKrEzKKJca2ist
 q2n8lr6bnyC7ab96eq/Y/RD4Xbi2JuwOYP2jVZWaszg4QLFJCsolp1hHqfOCWRFKhTGy
 IjgQ==
X-Gm-Message-State: AOAM530zslCV3BYS8N6UA8DElcP/dQnJCSx6GjV1McYAGgfqYCEQ9qX+
 sSs1dtqJfZuv+9w77nTOCNw0t2s0x9BrY1MvbMJyYw==
X-Google-Smtp-Source: ABdhPJy0FBCMNLelGZazZ0RBwp9wTuXGe6SCcYhcc9j1DNmMvXA+Nqe/mMa/rbGe4IRWOvjSmj4Y9opOSOfqc9R+uj0=
X-Received: by 2002:ac2:5f0c:: with SMTP id 12mr239341lfq.116.1615924292350;
 Tue, 16 Mar 2021 12:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210314122314.3201195-1-vitaly@cyberhaven.com>
 <20210315072150.rst46y4l23box7jq@sirius.home.kraxel.org>
 <CACjSjcvDNZccKCAeQ5d_E+EiB+5pkHByi7wJJYA+NKhreqqHBg@mail.gmail.com>
 <20210315152438.crifvkfhvmmxnxut@sirius.home.kraxel.org>
In-Reply-To: <20210315152438.crifvkfhvmmxnxut@sirius.home.kraxel.org>
From: Vitaly Chipounov <vitaly@cyberhaven.com>
Date: Tue, 16 Mar 2021 20:51:21 +0100
Message-ID: <CACjSjctXNbdX=Kiu6oQ+R6c2nee4mYm0oO0HWS207AWz864ouw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/virtio-vga: made vga memory size configurable
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=vitaly@cyberhaven.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 4:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Mar 15, 2021 at 12:29:16PM +0100, Vitaly Chipounov wrote:
> > On Mon, Mar 15, 2021 at 8:21 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > If your guest has no virtio driver use stdvga instead of running
> > > virtio-vga permanently in vga compatibility mode.
> >
> > I tried -device VGA,vgamem_mb=32. I did not see any resolution above
> > 1080p on a Windows 10 guest.
>
> Try "-device VGA,vgamem_mb=32,edid=off".  Windows seems to not like our
> edid block for some reason.
>

This worked, thanks for the tip. Regarding the patch, I can resubmit
it with an amended commit message if people think it's still better to
have a configurable memory size here.

Vitaly

