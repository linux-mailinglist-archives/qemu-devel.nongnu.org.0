Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4CD361038
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:32:44 +0200 (CEST)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4v5-0002J3-FU
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lX4t6-0001oN-AV
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lX4t2-00050x-Dc
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmYeJHtax2gpPn/6qq7IJRyePswTlPywhUGWa4Vv9ks=;
 b=DdSvgAfwDvtVFU4x7ES7NymgiRxAqoTvPsi56R3B276c5bVqgcUkaCLUCClTFbVpYv2NWc
 roO62fo7pdiyQQ/vohgH5wyO++4DJyvLkHSikjdI7/KZD3f1ZR2O9NCRM2OaLDNPUgtn+T
 itR/1v2n7mKCjvB/UsuNLnb3rl3qd8Y=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-eeriPHHeNKykUv3w9GP6cg-1; Thu, 15 Apr 2021 12:30:28 -0400
X-MC-Unique: eeriPHHeNKykUv3w9GP6cg-1
Received: by mail-lj1-f199.google.com with SMTP id
 q17-20020a05651c0551b02900bdd1e782edso2029077ljp.3
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UmYeJHtax2gpPn/6qq7IJRyePswTlPywhUGWa4Vv9ks=;
 b=XZdzjbNCCnKcAksXc7VAVmQTxO8LYBwHkxwrlkkKqatOJZP2G8+SDkbJVfAUfR6rzC
 6qbD39eSDHaMrUFIoSPSlKBXYTv7WB3XsEP6vOWL3zd+IdlSrb95Z3Vxgk+GDxngHSmt
 OqMAzXEEjntIm/Cofhk/rJDrfPnVBdiZ/yxYFxwfISvKYrEiYkPoBv5nwXaRJfrl5Z2O
 LUOiYfXPhLmPp9TkIPOJUJqkZiPbjmEp2MTXAkndbACg577loe0xXRgtqiplJFMtCPub
 7o4V1xEwJgURxCMoEaIHZxdD2sAyvASIxUCxPo3aj9BFj/EEyavHU+dtqst0yIVi9TY6
 OWOg==
X-Gm-Message-State: AOAM530YXiimef2/dtjhEjdV8cG7teQt0Q7u4jci866Rm/YKSRLQT6qW
 sP1GV7hF56sKW7gewfgvq9LyQtiyGCuSufS+4BoQjU3NBEOKPGOUeTt/ARe1ZAnDMMXnSJL5hZ/
 bGUqvk7mi7g1bIPAfIgVMrsYy8uBDjmw=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr4850ljl.329.1618504227112;
 Thu, 15 Apr 2021 09:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd36iKVyo5nF1kIZHLSZYg3TINYq16k8b+gdcqzwBsScxZMc3iWpoJ7rzbhprhUJHTrOhrUNkO6zUeWqs/rxM=
X-Received: by 2002:a2e:a177:: with SMTP id u23mr4832ljl.329.1618504226839;
 Thu, 15 Apr 2021 09:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com>
In-Reply-To: <YHhj/bo883jJ9ocy@redhat.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 15 Apr 2021 12:30:11 -0400
Message-ID: <CAOpTY_r-sSdNEWCqoAbSfOvnAAbgEAKgU=LfeVco65gD=k3uDQ@mail.gmail.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 12:04 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Apr 15, 2021 at 05:44:02PM +0200, Vitaly Kuznetsov wrote:
> > When a migration blocker is added nothing is reported to the user,
> > inability to migrate such guest may come as a late surprise. As a bare
> > minimum, we can print a warning. To not pollute the output for those, w=
ho
> > have no intention to migrate their guests, introduce '--no-migration'
> > option which both block the migration and eliminates warning from
>
> I wonder how this is actually going to work in practice ?
>
> At the time libvirt starts a guest, it has no idea whether the guest
> is likely to need migration 3, 6, 12, 24 months in to the future.

I believe the libvirt API could be extended so applications can
indicate that migration is not a required feature. This would let QEMU
automatically enable useful but non-migration-friendly features. For
example, I would expect "-cpu host" to become the default CPU model if
--no-migration is specified.

>
> IOW, we can't use a --no-migration flag and will be stuck with these
> warnings no mtter what.

The expected behavior of the libvirt API is to create migratable VMs
by default, isn't it? This means it would be valid for libvirt to use
"--only-migratable" by default.

If libvirt can't use "--only-migratable" by default, I would say it's
a deficiency of the libvirt API that needs to be addressed.

>
> Is it possible to query the migration blockers via QMP ?

I don't think it is, but we can add that if it's useful for libvirt.

>
> Libvirt recently introduced a new API 'virDomainGetMessages' which
> lets us report a list of human targetted message strings against
> a guest. We use it for reporting when an operation has tainted
> a guest, and also use it for reporting when a deprecated QEMU
> feature is used.  We could use it to report any migration
> blockers that exist.
>
> These are visible from 'virsh dominfo $guestname' and could also
> be displayed by a mgmt application.

Cool!

Will the API include all warnings printed by QEMU to stderr?

>
> NB, the messages are intentionally declared opaque strings, so
> mgmt apps shouldn't try to parse them. They merely know whether
> the count is non-zero for any given message class.
>
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

--
Eduardo


