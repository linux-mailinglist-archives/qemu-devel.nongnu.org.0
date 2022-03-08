Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90374D1DE7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:55:29 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRd7R-0006i4-1n
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:55:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRd5b-0005Ln-5a
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:53:36 -0500
Received: from [2a00:1450:4864:20::533] (port=41966
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRd5Z-0004nd-KC
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:53:34 -0500
Received: by mail-ed1-x533.google.com with SMTP id c20so6877131edr.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rHAEi2su4mykfqrT3lYQL3WMwsZ3oLpnzeg3GfiRCY=;
 b=a1ZuCbywKwRCbLAS8aZ3Oa3XQyr/UN1Yktsp+NPmqwkONFtWT6yAX8Q9h6gKZFr76t
 bEpu8sH78+POlB5XGEuKbsgDFXlVrt7p0ltBH5e9VsqdeCz1JdZUozxANxAWu7cY6cek
 FFag3bEqI3YbyLOFbkHixS46x7epFCNODKjFVCcFTdx2YrmHqm4kNk+Kx+LBhoDLLWrk
 l0kUVbMx78Nwnv4itdMkAu7OE8ycCww2qQOobFmyZZSpdijOHkQ2bmH4bVWn/rtFAgss
 L3nV4BYXWVAJC/tGfAUsuIiFAfxWXMvOs0PDoWdsUzG8yQqIBcGRS8B5xqT5xHlZtl11
 /Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rHAEi2su4mykfqrT3lYQL3WMwsZ3oLpnzeg3GfiRCY=;
 b=dGYdO+sJqPcWyLbtwj8HtjxBD8xujfSAWDdV7JLp3E37jECFUkIlsP1H4DTEIjI6Ig
 wZScL3+2UkDtcAxihZy7DkAU26a39SHGNhNYenaHaXND8hE8MWEC61SRyDXnSIBPD1C7
 pn38hCHlvsqvwgXQwX9qHciBYFPOfViEClsy8oIddGKA6mxcQKVLiHuuE4U2Cajx0QJ3
 oMSjpEEO06qjz0SWGJ1T46vfI813fQeV7QJ9SqhWiBYbMm3CXB35y4q6EfmNgEayjRwu
 J5kaDIGOUZ/if61MPHVQwPgfxmR2lc395M0tkhPEgpeyqfT1DvVYc5X5HNP6KXzlOPYi
 OI8A==
X-Gm-Message-State: AOAM530KVAPud5jZFI8L4PBFf/Mblu8Kg7ALL61hbiakIB7zDa/4Wm/K
 PfUUGk2LDvF4BULIholG0lbxYnY2aKS11jZ2u3ZATQ==
X-Google-Smtp-Source: ABdhPJxcoKw/Puo52dQ361JYKviWrI9IKiKDx9RCRM5z2iuC15i8UhTUpYzCCJXzedfj/btuv/poQKQ8k1WHsEX092I=
X-Received: by 2002:a05:6402:35cb:b0:416:465b:7aa2 with SMTP id
 z11-20020a05640235cb00b00416465b7aa2mr10776337edc.343.1646758411285; Tue, 08
 Mar 2022 08:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
 <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
 <20220308114638-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308114638-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 8 Mar 2022 22:23:20 +0530
Message-ID: <CAARzgwwo6weTL8Q_2vbx9s2+r_LerEgDiWRLEJvgyC=YNVOVFw@mail.gmail.com>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x533.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: libvir-list@redhat.com, imammedo@redhat.com, jusual@redhat.com,
 qemu list <qemu-devel@nongnu.org>, Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 10:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 10:15:11PM +0530, Ani Sinha wrote:
> >
> >
> > On Tue, 8 Mar 2022, Laine Stump wrote:
> >
> > > Aha! the domain of qemu-devel@nongnu.org was incorrect in the original send
> > > (it was "nognu.org"), so none of this thread was making it to that list.
> >
> >
> > Not to give any excuses but this happened because on Qemu side I never
> > have to type this manually. My git config is set up so that
> > the cc in send-email is filled up automatically using
> > scripts/get_maintainer.pl. On libvirt side also the domain and mailing
> > list is easy to remember. Its only when I have to manually type stuff that
> > shit happens :-)
>
> Donnu about alpine, but with mutt you can easily set up
> and alias and then it expands for you.

I use alpine to only reply/review patches. I use git send-email to
actually send the patch. There I am not sure the best way to avoid
manually typing in the mailing list address.

