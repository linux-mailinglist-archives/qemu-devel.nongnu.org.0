Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731943107F7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:37:22 +0100 (CET)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xYH-0006yp-Hl
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7xWi-0005d0-R6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7xWg-0007CY-Vz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612517742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Qoq3KYEOCm2Yzn6GooOpeqIP7eZFBEovRLfj+pQSOw=;
 b=CQkx6T5wjKelHD4DK+hgmyvZ5WajkLK5ozRzK+SW8AbW9jT82zo9SxOpmXu9LKutLJRnVh
 fYn215LXPuCjMvSxAib0xGetBjzEdtBkcvBUwj81xuRuoxAWg4+DgdQKXfQlaj7iaHExaa
 iJit+q3YzmJKgKadlVQFLzAmXM8+WYQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-ag7FMXLhO6SAiG-4lSiHkQ-1; Fri, 05 Feb 2021 04:35:40 -0500
X-MC-Unique: ag7FMXLhO6SAiG-4lSiHkQ-1
Received: by mail-ot1-f71.google.com with SMTP id 36so3257421oto.19
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 01:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Qoq3KYEOCm2Yzn6GooOpeqIP7eZFBEovRLfj+pQSOw=;
 b=ERToWZ8ZBWh9XSsuRH+Eg7O0QOsWXHpUV8SzTIEaTRf6TuOVWQLR9VnjKmvLMl9zpy
 mOStvBI9hlGU2GEZ3cA6tIUs6H41RTk+xygdcTYUPx0EyY/79egk3+WwSseLD1ExmdV+
 6gb5Q+h0WlMSuo25Dr8OpmcU452c+MMKhOU7RFLSncAsXWb7M/Wqgv2eTbVVPEPE6bUa
 kM10dPcmdOsginlru6vjmcPwb0BOI7eAV0bHkrU+euksPjrDnMuTyq6eVD+XMoCuRL+E
 ZzCmu1KYmMQ/eKQI0QI3xeYYt8Z5c4+r1QJp/W/hRxu5ERbRJlDsEiYl5QRx5FDpOTgT
 2d1w==
X-Gm-Message-State: AOAM530UV0WRH3/loHpx7XJED9fVj9bRD8sJ3oWb/xB9ZwA5kHeRIkzn
 XBHLPKui/vpbgvvGUoC9ytHqrWHNQJWPQQ7hOsZ7aiUD2pJ8Ppc7N3sVdXIr+IO/eOhfIS2w4nz
 dVPM9GL7M64XZR4dLHDAM0pTE64i87+A=
X-Received: by 2002:a9d:67:: with SMTP id 94mr2871998ota.79.1612517739639;
 Fri, 05 Feb 2021 01:35:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOs9wixLl/woUkOvk5r1Yy/wCdzSnGrER7WTV9MqdBKaELRTpiqcUdg5mfsao3NLggpIK8quU7fixNYmQN2o0=
X-Received: by 2002:a9d:67:: with SMTP id 94mr2871988ota.79.1612517739448;
 Fri, 05 Feb 2021 01:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-2-berrange@redhat.com>
 <74407f84-c670-cc87-27fe-f3d9d38bda33@redhat.com>
 <20210205093345.GA908621@redhat.com>
In-Reply-To: <20210205093345.GA908621@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 5 Feb 2021 10:35:28 +0100
Message-ID: <CAP+75-XnReuDAXw6N28-ckzCtu88A8pn92RH1UgsBMWcN=oYAw@mail.gmail.com>
Subject: Re: [PATCH 01/33] migration: push Error **errp into
 qemu_loadvm_state()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 5, 2021 at 10:33 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> On Thu, Feb 04, 2021 at 10:57:20PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 2/4/21 6:18 PM, Daniel P. Berrang=C3=A9 wrote:
> > > This is an incremental step in converting vmstate loading code to rep=
ort
> > > via Error objects instead of printing directly to the console/monitor=
.
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > ---
> > >  migration/migration.c |  4 ++--
> > >  migration/savevm.c    | 36 ++++++++++++++++++++----------------
> > >  migration/savevm.h    |  2 +-
> > >  3 files changed, 23 insertions(+), 19 deletions(-)
> > ...
> >
> > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > index 6b320423c7..c8d93eee1e 100644
> > > --- a/migration/savevm.c
> > > +++ b/migration/savevm.c
> > > @@ -2638,40 +2638,49 @@ out:
> > >      return ret;
> > >  }
> > >
> > > -int qemu_loadvm_state(QEMUFile *f)
> > > +int qemu_loadvm_state(QEMUFile *f, Error **errp)
> > >  {
> > >      MigrationIncomingState *mis =3D migration_incoming_get_current()=
;
> > > -    Error *local_err =3D NULL;
> > >      int ret;
> > >
> > > -    if (qemu_savevm_state_blocked(&local_err)) {
> > > -        error_report_err(local_err);
> > > -        return -EINVAL;
> > > +    if (qemu_savevm_state_blocked(errp)) {
> > > +        return -1;
> > >      }
> > >
> > >      ret =3D qemu_loadvm_state_header(f);
> > >      if (ret) {
> > > -        return ret;
> > > +        error_setg(errp, "Error %d while loading VM state", ret);
> >
> > Using error_setg_errno() instead (multiple occurences):
>
> I don't think we want todo that in general, because the code is
> already not reliable at actually returning an errno value, sometimes
> returning just "-1". At the end of this series it will almost always
> be returning "-1", not an errno.  There are some places where an
> errno is relevant though - specificially qemu_get_file_error calls.

Fair. Ignore my other same comments in this. R-b tag stands.

>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
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


