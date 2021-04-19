Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D5364891
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:53:00 +0200 (CEST)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYX8t-0006ga-SZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYX5P-0005Bd-Ku
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYX5L-0005te-UB
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618850958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8B6a+dKbS047P2NmzOtXOLiXIt/SIKkazxsqvRf7bpU=;
 b=Kr5nSJZ75kCl9HvigYzvD5fdzCrVl/q7/p1hGz/p2hMTT8KRE9lJybtR/axLiEW4iysleS
 36ZCCtzjx9hAqfyiOMfwPnjhwmkBnmr4vcFfcrfMKxdjoarEYHYAxJh2dnlIVi44oOAHEK
 d1m6OeBD0Yz5AtdhjqsB6xOUnCkSppU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-2Pa6bon_OW-o0sN9IA4RHg-1; Mon, 19 Apr 2021 12:49:16 -0400
X-MC-Unique: 2Pa6bon_OW-o0sN9IA4RHg-1
Received: by mail-lj1-f199.google.com with SMTP id
 r30-20020a2e575e0000b02900bab4d6b74bso6477229ljd.14
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8B6a+dKbS047P2NmzOtXOLiXIt/SIKkazxsqvRf7bpU=;
 b=j0Mr5Nr1xp/pBXIUeoKTj1u6xD+AATBARJsBEgp+NyDbe0vCFChdcNcDRyiioLwWeE
 cgCRQR0uM3z8p4iAPay2OMOtCH3m6QF8mWE8Wxv/jpE1yywyvuDLUjGJQWqHg6gyb4Us
 8s/xe2KXCltjpfVGlpoCOCDF1rTKPqm6njXLoLW22wiSairfhEk5dvwPhf2LUT2ju+9T
 XnZKAmaBVaRsv2LDmdmtUtirz6UetvNsGcQfihTeoEvyZ6Ct0BIzltY1+9DtXDAuV4lL
 Slewq0a9c5zPELmDwqVHQIxfDhjQdElud9YaB8czkMZDsRIDNtnRnnhFzNq/ktAmYvYJ
 nYIQ==
X-Gm-Message-State: AOAM533XTlttVhNvUjtc3kVQ9+6vYKtRnydXfO/faIgl0SyME0ZOEABs
 fWVQAokyUgqY4G+qOlgosLwxpr8cNubL+fy9ARttmy+PDvzyqUcpFUM2wk/4py4PKOf1vp7PIC6
 P1qFls27Ntf/HFiiBqh8IfknF6R9dQ94=
X-Received: by 2002:a05:6512:3c96:: with SMTP id
 h22mr6961984lfv.574.1618850954338; 
 Mon, 19 Apr 2021 09:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9gCIg9mzpU3Uada8LrrzDZ4ZiaT8VqikEbIhSS5h0a0XgKx/nCiR91VEWRVEID/G3wlkISkXudPEtYmUkgYU=
X-Received: by 2002:a05:6512:3c96:: with SMTP id
 h22mr6961966lfv.574.1618850954042; 
 Mon, 19 Apr 2021 09:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com>
 <YHh3trxdMQ85NRTh@work-vm> <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net> <YH2y47x19jbTApg8@redhat.com>
In-Reply-To: <YH2y47x19jbTApg8@redhat.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Mon, 19 Apr 2021 12:48:58 -0400
Message-ID: <CAOpTY_q9-RbYgvbmLNisjMWuw8azwNPF6viQGfbs3bP62EzLUw@mail.gmail.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 12:42 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Fri, Apr 16, 2021 at 12:28:01PM -0400, Eduardo Habkost wrote:
> > On Fri, Apr 16, 2021 at 09:33:28AM +0200, Vitaly Kuznetsov wrote:
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> > >
> > > > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > > >> On Thu, Apr 15, 2021 at 05:44:02PM +0200, Vitaly Kuznetsov wrote:
> > > >> > When a migration blocker is added nothing is reported to the use=
r,
> > > >> > inability to migrate such guest may come as a late surprise. As =
a bare
> > > >> > minimum, we can print a warning. To not pollute the output for t=
hose, who
> > > >> > have no intention to migrate their guests, introduce '--no-migra=
tion'
> > > >> > option which both block the migration and eliminates warning fro=
m
> > > >>
> > > >> I wonder how this is actually going to work in practice ?
> > > >>
> > > >> At the time libvirt starts a guest, it has no idea whether the gue=
st
> > > >> is likely to need migration 3, 6, 12, 24 months in to the future.
> > > >>
> > > >> IOW, we can't use a --no-migration flag and will be stuck with the=
se
> > > >> warnings no mtter what.
> > > >>
> > > >> Is it possible to query the migration blockers via QMP ?
> > > >
> > > > It's possible to query the currently active ones, as of 6.0; from m=
y
> > > > commit  3af8554bd068576b0399087583df48518a2a98f6 it appears in the
> > > > output of query-migrate in the 'blocked-reasons' list.
> > > >
> > > > The HMP equivalent is a64aec725ea0b26fa4e44f8b8b8c72be9aaa4230 show=
ing:
> > > >
> > > >     (qemu) info migrate
> > > >     globals:
> > > >     store-global-state: on
> > > >     only-migratable: off
> > > >     send-configuration: on
> > > >     send-section-footer: on
> > > >     decompress-error-check: on
> > > >     clear-bitmap-shift: 18
> > > >     Outgoing migration blocked:
> > > >       Migration is disabled when VirtFS export path '/home' is moun=
ted in the guest using mount_tag 'fs'
> > > >       non-migratable device: 0000:00:01.2/1/usb-serial
> > > >
> > >
> > > FWIW, this patch makes '--no-migration' an 'ultimate big hammer' so n=
ot
> > > matter how many blockers are there, the output will look like:
> > >
> > > (qemu) info migrate
> > > globals:
> > > store-global-state: on
> > > only-migratable: off
> > > send-configuration: on
> > > send-section-footer: on
> > > decompress-error-check: on
> > > clear-bitmap-shift: 18
> > > Outgoing migration blocked:
> > >   Guest is not migratable ('--no-migration' used)
> >
> > I would change that.  I expect "--no-migration" to only mean
> > "live migration not really needed", not "live migration should be
> > blocked".
> >
> > However, I still don't think libvirt should say "live migration
> > not needed" unconditionally (because this isn't always true).  In
> > that case, we would need a different mechanism to silence the
> > warnings somehow.
> >
> > I would make live migration policy an enum, just to make sure
> > we are explicit about the requirements:
> >
> > - UNKNOWN: this is the current state in QEMU 6.0, where we don't
> >   really know what the user expects.
> >   This can be the default on existing versioned machine types,
> >   just for compatibility.
> >   I suggest making this print warnings for every migration
> >   blocker (like this patch does).
> >   I suggest deprecating this behavior as soon as we can.
> >
> > - PREFERRED: try to make the VM migratable when possible, but
> >   don't print a warning or error out if migration is blocked.
> >   This seems to be the behavior expected by libvirt today.
> >
> > - NOT_NEEDED: live migration is not needed, and QEMU is free to
> >   enable features that block live migration or change guest ABI.
> >   We can probably make this the default on machine types that
> >   never supported live migration.
> >
> > - REQUIRED: live migration is required, and adding a migration
> >   blocker would be a fatal error.
> >   This is already implemented by --only-migratable.
> >   I suggest making this the default on versioned machine types
> >   after a few releases, and after deprecating UNKNOWN.
>
> I'm not a fan of tieing migration behaviour to machine type
> versioning as they are independant concepts. It is valid to
> want to use versioned machine types even if you never migrate,
> in order to keep stable guest ABI to avoid license activation
> checks in guest OS.
>
> Changing --only-migratable to a "--migration-policy preferred|required|no=
ne"
> is reasonable, but I think we should just have a fixed global default for
> it rather than trying to second-guess intentions.

Right, if we agree to make it opt-in we probably don't even need a
warning mode. `--only-migratable` should be enough. This means UNKNOWN
from my list above wouldn't exist, and the existing default is already
PREFERRED (which is the one expected by libvirt today).

--
Eduardo


