Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF154B275
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 15:45:38 +0200 (CEST)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o16rR-0003KN-1A
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 09:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o16pB-0002OP-OA
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 09:43:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o16p8-0007dT-Gz
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 09:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655214189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRiB1WFjTqRDMK/XVmyqWDVZTTmE25EbijrnVk3ZCDk=;
 b=J8ja5LV1JgAo2HveWAxATVDH4Xe4lLyVJvqEKTpSxnAxWcvHbq+IZBsp15kOt2cdkJuE6Z
 YghsqsozhE68Cnava2YApF8WyT6XM/x+11edvoQR1MA1Exq7x1y+abznSDASgAfeHR1F6t
 u5qZ3tFFFePnZ5eTSQyoxhMriFrvciA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-2KBIxT9yNVSmr7g-foSkEg-1; Tue, 14 Jun 2022 09:43:00 -0400
X-MC-Unique: 2KBIxT9yNVSmr7g-foSkEg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2fed274f3fbso25375957b3.17
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 06:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GRiB1WFjTqRDMK/XVmyqWDVZTTmE25EbijrnVk3ZCDk=;
 b=QHoDe7GY8DKkkIP568QwSP6d8Kf6/3cviiABTtGeuMGa/d6RhghI1nFTUg3S0yVfAy
 hRNU5jq+P85NTF1jgaoE5kSwmQLwAC/yAbgYeyoFVoHAc2J1klzhnB5rbAP8Ed2c/deZ
 kUzZ3A/OjBdb/i5RZsxYdjJfaiXFrD+UtW2+FTBRz2gVMpwN4D5SyWoMZl7pNyQPdYgn
 /GXd3NvwIT1i5KNlIwnE5SuqW3BNplL6ppPLxkz6m7fUCyPtxm7uSCWmflm73qzTSXj6
 vg5EdNKFbNmnd3p2Ngth2SOxq6L604914Zm6jypCbHdH1jQlTIPxM7PLQiyWaCFzOuYp
 F6rw==
X-Gm-Message-State: AJIora++VRSwPeImKov/LLWKV3Ul7axF4eHRIKDW8NV3DrfUXcTfgJIs
 eXpJ99c4kStN+aazz7T5aa+Al6N/eONXWBKkUSXKmpQPrmdAHxonHbh7x7KaYE4KqKy8ujyegBu
 337vb8WM6bRVHX4fa3mlKDpue4fod/sU=
X-Received: by 2002:a81:f41:0:b0:313:4d6c:49db with SMTP id
 62-20020a810f41000000b003134d6c49dbmr5678567ywp.384.1655214179846; 
 Tue, 14 Jun 2022 06:42:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5f7YIRGyDdKDDlA3TD7FFxabwVvpB3EyCfkr4bkJLWmtqFROUN75VMTqPQnLQaN+UMZZVA4gsoglZeWgsftc=
X-Received: by 2002:a81:f41:0:b0:313:4d6c:49db with SMTP id
 62-20020a810f41000000b003134d6c49dbmr5678531ywp.384.1655214179429; Tue, 14
 Jun 2022 06:42:59 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jun 2022 06:42:58 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
 <20220420160311.248079-3-abologna@redhat.com>
 <YmAxjNgNWT2FNh8r@redhat.com>
 <CABJz62PnnGYV=6qiFYL2Y0+dg61P+nv0VvRUnP1cJkU6THcMEg@mail.gmail.com>
 <CABJz62NTwytWbStj172jOxe_1_f9=K4iv82Zh78twgQ5jNoAfw@mail.gmail.com>
 <YnI4AEYrkUvjuA4g@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YnI4AEYrkUvjuA4g@redhat.com>
Date: Tue, 14 Jun 2022 06:42:58 -0700
Message-ID: <CABJz62MaG0Bg+gf5_cGwAVQ3XLa_ZZ7B2tV2_J=1KpJmokedfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: build-platforms: Clarify stance on minor
 releases and backports
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 04, 2022 at 09:23:28AM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, May 04, 2022 at 01:01:03AM -0700, Andrea Bolognani wrote:
> > On Wed, Apr 20, 2022 at 09:18:47AM -0700, Andrea Bolognani wrote:
> > > On Wed, Apr 20, 2022 at 05:15:08PM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> > > > On Wed, Apr 20, 2022 at 06:03:11PM +0200, Andrea Bolognani wrote:
> > > > > These changes match those made in the following libvirt commits:
> > > > >
> > > > >   2ac78307af docs: Clarify our stance on backported packages
> > > > >   78cffd450a docs: Spell out our policy concerning minor releases
> > > > >
> > > > > Since QEMU's platform support policy is based on libvirt's, it
> > > > > makes sense to mirror these recent changes made to the latter.
> > > > >
> > > > > The policy is not altered significantly - we're simply spelling
> > > > > out some rules that were likely already being implicitly
> > > > > enforced.
> > > >
> > > > Indeed, I think that's basically defacto the case already.
> > > >
> > > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > >
> > > Thanks! Are you going to bring these in through one of your trees, or
> > > do I need to bug someone else so that they will pick them up? :)
> >
> > I see these haven't gone in yet. Anything I can/should do to make
> > that happen?
>
> The tragedy of QEMU not having a central docs maintainer. I'll queue
> this one for my next pull request.

Still doesn't seem to have been merged. Not pressuring you or
anything, just making sure it doesn't slip through the cracks :)

--=20
Andrea Bolognani / Red Hat / Virtualization


