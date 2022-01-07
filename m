Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58753487726
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:56:26 +0100 (CET)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nr7-0005nX-FX
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1n5ng9-0002KK-4y
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1n5ng6-0002BJ-Be
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641555901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMIUwK5i6AIv9W6T+MR9FN0b969IFfmEYBE6RxI08FY=;
 b=Zvl6NwwPeIPXJdxW47wbFMBETQvaupkAww2kObuQQeWYnzL4FShYQ7KXyonZ8cXq+3+yyI
 lOZM6Z6B+ru+nO16GIwmb5JZictBMgiUCmhOEp+9D5Lbx9w0j9KD9F9nYQN/QX03HJXMxg
 2iDMQKqwsXP127g/oPpeOPgu1FN2lfs=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-qYCGG5fXOkGA5HnvVQ7E8Q-1; Fri, 07 Jan 2022 06:43:45 -0500
X-MC-Unique: qYCGG5fXOkGA5HnvVQ7E8Q-1
Received: by mail-yb1-f198.google.com with SMTP id
 g4-20020a256b04000000b00610898ff989so1477044ybc.19
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QMIUwK5i6AIv9W6T+MR9FN0b969IFfmEYBE6RxI08FY=;
 b=Nfwt7NZsfeU3pdEeJMOvwOgTGxvUoAmPPUgE2emoHgAysuC6i0pYnd2PgyLSymQmwC
 FSEbjviNHr2mhFV2VNdCJFFTVfqZoE5etYTYkwOU5JRzT66eSufFxl7agSCM2dRkHOAQ
 1TSSa0Wz4GWcbg5QR8XR0Fz8Hw1Dn1DiFfgSromvwFzDlzEPXvxye9Ak/Zy3/7/PDnnY
 VYgCx1cKeGRoPhJnbaNev6CjRlUkEblObtb4Xd/r8IJaQLgqHuqtd70OlTVsVrn72pHf
 etJa91Bq2NmeloUpC5wT81wFZwwFTZwRnaUO+ah8Gu0q6RihxVyrj5zb6HBH0IhoKDgP
 /aJQ==
X-Gm-Message-State: AOAM531H+MmbEu1HvDwLUJC2nwV7nCGKBS3654aYMOa0vhYmBJmHooF1
 /iYdfUZX6m0oWabyk7BdGrKlboMebCVafFFrlhy2/37BvxV6sHjWg6dMraMRIfIRESuL6Wao1PS
 XezydduXivuM2+TLKv+90OSKT1wc+l9U=
X-Received: by 2002:a25:2cd0:: with SMTP id
 s199mr67568905ybs.234.1641555825256; 
 Fri, 07 Jan 2022 03:43:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAagxOk8eel0oVH6v7Q6+ZJBzuWs841000Pap7lkPlYXRYMMpB4f2JJ9X17rMLxoZBYjScwTJTkYO1h3LXJRY=
X-Received: by 2002:a25:2cd0:: with SMTP id
 s199mr67568896ybs.234.1641555825066; 
 Fri, 07 Jan 2022 03:43:45 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Jan 2022 03:43:44 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <1567068782-371028-1-git-send-email-zhe.he@windriver.com>
 <20190829091505.GB17141@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190829091505.GB17141@redhat.com>
Date: Fri, 7 Jan 2022 03:43:44 -0800
Message-ID: <CABJz62M1o7Vof3LSG0BNY506jEdB1S110mMOVbu-ZpQfPJCWfQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Add pkg-config handling for
 libgcrypt
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, zhe.he@windriver.com, laurent@vivier.eu,
 qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 29, 2019 at 10:15:05AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Aug 29, 2019 at 04:53:02PM +0800, zhe.he@windriver.com wrote:
> > libgcrypt may also be controlled by pkg-config, this patch adds pkg-con=
fig
> > handling for libgcrypt.
>
> Where are you seeing pkg-config files for libgcrypt ?
>
> The upstream project has (frustratingly) been hostile to any proposal to
> add pkg-config support saying people should stick with their custom
> libgcrypt-config tool
>
>    https://dev.gnupg.org/T2037
>
> Even if this is something added by some distro downstream, what is the
> benefit in using it, compared with libgcrypt-confg which should already
> work & is portable.

Resurrecting an old thread to point out that the upstream stance
seems to have changed since that discussion:

  https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibgcrypt.git;a=3Dcommit;h=
=3D97194b422bc89a6137f4e218d4cdee118c63e96e

libgcrypt 1.9.0, released almost exactly a year ago, comes with a
pkg-config file out of the box. With that in mind, I think it would
make sense to re-evaluate this patch for inclusion.

--=20
Andrea Bolognani / Red Hat / Virtualization


