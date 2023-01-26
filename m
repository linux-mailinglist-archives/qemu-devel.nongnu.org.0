Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD367CF87
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3wT-0003Xf-J3; Thu, 26 Jan 2023 10:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL3wS-0003XX-12
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:13:32 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL3wQ-00060P-FP
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:13:31 -0500
Received: by mail-yb1-xb35.google.com with SMTP id c124so2294971ybb.13
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=70qff6mZED8Ot/g7ut65nts85KoTdg+GUhUnf1YzgW8=;
 b=TGeRvKaVxpK7WSReu0bsGsxlTyqQ6ZPsL7XyX8d1CrocqpMuQ/c5N3aAXTGTv7tg92
 28BEcVKr9BxE8ydaRguXycEvFbZXpy9Gm+sh8cvGYwTMITGzwVTCyZd3+Md4fCVtw/le
 Hvr7Mcp9qxTXTUg6YOekOyvf7pn6TsR3RYJNgx2uxmI5Cl2XeHqLZSy/0RvRBVaL4Lkj
 A7JaUMKzktsGbsqHxYNsNELqQCrOLS0QVm3QmrahdbUiivVnE3trm2/RyZPQM5zG5Pr5
 Zm1yjWxUiCubIWI/QF71of/Zwl7Vnft6p2bvKCaQ/rroiT/HTvyFPzRBJqzE2YxeBLLj
 pckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=70qff6mZED8Ot/g7ut65nts85KoTdg+GUhUnf1YzgW8=;
 b=yZIP68fzTI4SIo4EpX7fuwoqeVhQ175nudqzxgWdzH51tx14UoAPiuVo34325NlQwJ
 iGzrQJy+BWFJj+YaUqhtaJcUmn+F0EgGxC2W4gyFYj8a8S2dzBv4bsUfYNCb9SZSyR/u
 dFccmBUnM/SAJjuHpNTJsoE2yWrgzyCEH9RV3UJoHvD3ERXgJ/pYAt9EpLykEoCt3ZOi
 elnkv+C0Rbafv+2YNEQRv/8ZPqimzyDlUbZFq7JpKhQtzbccb2tuXcKnPhha3bDz2Aq7
 DbbF6jrOGFnre/wTHdNkaoamO/FSAtB3Ry+K1v5HQ3ELrt0L+yHL02sBXr0USAdbQd+U
 VDUg==
X-Gm-Message-State: AFqh2krYXlexxe1ZTAVZtDanEAq0AEcoZXULqVcvuekOmSgxhOj7//Uy
 nqY9RC3fE0A3gbIUhP5Xi8NckTfRQxwgV6yMZSo=
X-Google-Smtp-Source: AMrXdXuD4tSvPZtNs1e5gnFNuMzT8APeMaehWkBRIYxstIBzE/+YU9/eYTkSR5vcP0jvc5fGGM3mBWgboYVPgZrulpw=
X-Received: by 2002:a25:4085:0:b0:800:c129:f53b with SMTP id
 n127-20020a254085000000b00800c129f53bmr2651700yba.58.1674746008890; Thu, 26
 Jan 2023 07:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <Y9GG+EXX03TAvWDS@fedora>
 <64c249a5-98c2-24a0-d036-c76bb2f0a19a@yandex-team.ru>
In-Reply-To: <64c249a5-98c2-24a0-d036-c76bb2f0a19a@yandex-team.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 26 Jan 2023 10:13:16 -0500
Message-ID: <CAJSP0QUdehnotQD76EBgRq89grbuJoDd1fDbkuDZNdg=wKMuUg@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 26 Jan 2023 at 09:20, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>
> On 25/01/2023 21:46, Stefan Hajnoczi wrote:
> > On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
> >> Now any vhost-user-fs device makes VM unmigratable, that also prevents
> >> qemu update without stopping the VM. In most cases that makes sense
> >> because qemu has no way to transfer FUSE session state.
> >>
> >> But we can give an option to orchestrator to override this if it can
> >> guarantee that state will be preserved (e.g. it uses migration to
> >> update qemu and dst will run on the same host as src and use the same
> >> socket endpoints).
> >>
> >> This patch keeps default behavior that prevents migration with such devices
> >> but adds migration capability 'vhost-user-fs' to explicitly allow migration.
> >>
> >> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> >> ---
> >>   hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
> >>   qapi/migration.json       |  7 ++++++-
> >>   2 files changed, 30 insertions(+), 2 deletions(-)
> > Hi Anton,
> > Sorry for holding up your work with the discussions that we had. I still
> > feel it's important to agree on command-line and/or vhost-user protocol
> > changes that will be able to support non-migratable, stateless
> > migration/reconnect, and stateful migration vhost-user-fs back-ends. All
> > three will exist.
> >
> > As a next step, could you share your code that implements the QEMU side
> > of stateless migration?
> >
> > I think that will make it clearer whether a command-line option
> > (migration capability or per-device) is sufficient or whether the
> > vhost-user protocol needs to be extended.
> >
> > If the vhost-user protocol is extended then maybe no user-visible
> > changes are necessary. QEMU will know if the vhost-user-fs backend
> > supports migration and which type of migration. It can block migration
> > in cases where it's not possible.
> >
> > Thanks,
> > Stefan
>
>
> Thank you, Stefan,
>
> That's OK. The discussion is very helpful and showed me some parts
> that should to be checked to make sure no harm is done by this feature.
> I needed some time to step back, review my approach to this feature
> with all valuable feedback and ideas that were suggested and check
> what other backend implementations can or can't do.
> I'll answer today the emails with questions that were addressed to me.
>
> This is all the code that QEMU needs to support stateless migration.
> Do you mean backend and/or orchestrator parts?

It's unclear to me how the destination QEMU is able to connect to the
vhost-user back-end while the source QEMU is still connected? I
thought additional QEMU changes would be necessary to make migration
handover work.

Stefan

