Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731BC465D72
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 05:33:33 +0100 (CET)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msdmm-00045s-3b
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 23:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msdlS-0002vq-BY
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 23:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msdlN-0000kr-4q
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 23:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638419523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DXwv2Ba61EYaphcghyKspMYq9wG+YNpqt4B7j+FRTQ=;
 b=S7/1BAnwH0sRPvGEULJPoTZ/QfKhEcY5gmYi4LFGitijQ+GbVVPDjuRWnhqYjA6cx/Ioi8
 M02uK/yqcpOtMUnlIyRnghef5bmxHdALg+LUimMfaz16SvL+BOQxSvhVNtuPvDlq0ofs5W
 Ulaao5WeA+sgGICAeSK3gihiGRJbTPQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-Jt2eCC-xOx2vEAn7ageeRw-1; Wed, 01 Dec 2021 23:32:02 -0500
X-MC-Unique: Jt2eCC-xOx2vEAn7ageeRw-1
Received: by mail-lf1-f70.google.com with SMTP id
 j9-20020a05651231c900b004037efe9fddso10649157lfe.18
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 20:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DXwv2Ba61EYaphcghyKspMYq9wG+YNpqt4B7j+FRTQ=;
 b=eIBZsiuxh1iSkitveeD6CM2GA+GsYXjiZuLS/4oGwgGAhFhi1kaexaK/JIWGRuhczz
 SkYqI9xjZQPrTGdBQmbBdUHpTA738pnE2IKxsyxSkexKAPpgcHk7N0UyoLgTIAb9uP/q
 4kqKEsGYGaAR7+o/T/ZvTChC2Aq8T4Pj5ebDQTUrKWTf4W4pgyA2JH3SGCC/XxxEeJD1
 dXgyF49LiOHOQR5honzzB8faWTTBO9SwijV+Zi0JbsTAHl/VV0YEb68LD+Yf2vvtexDE
 ofsMDoqmuaxslRH6KAYRzrd9tSo7PgZ2e1ALNjjxwC0KxQk7pwYDXOGAvZ5mxHfxqjJ9
 UbMw==
X-Gm-Message-State: AOAM5339GMBUzkr2iGG6RKstNEcgYisKjTiiuUhZC8YaAaUPM3Qmv52p
 2Z/vxZqqWTm3IcsRYCOHThlTYMr2pashrb8NX2I4oTK8AoydIorGXYuuq1gkM41CedmL+MKFLpV
 lc2DzJMrAmNbYgRaaYAoiFRBWpAntnPA=
X-Received: by 2002:a05:6512:158e:: with SMTP id
 bp14mr10184069lfb.630.1638419520652; 
 Wed, 01 Dec 2021 20:32:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbTpWCKSnwvloj0SPiJpA2PV8R6P3XGXBLl4v2Pns9R6iNsptCf3N2bR9HILvGOOlJ4XNhFhDSK9aCmeq4mjE=
X-Received: by 2002:a05:6512:158e:: with SMTP id
 bp14mr10184047lfb.630.1638419520421; 
 Wed, 01 Dec 2021 20:32:00 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <87pmr5vdmm.fsf@secure.mitica> <8735o1h9c1.fsf@dusky.pond.sub.org>
In-Reply-To: <8735o1h9c1.fsf@dusky.pond.sub.org>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Dec 2021 01:31:49 -0300
Message-ID: <CAJ6HWG7uq7qMtntJpUwgcGZ_m2p8h9qa+2-akEMbPAt4SgwX3Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for
 Linux
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Markus,

On Fri, Nov 12, 2021 at 9:01 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Juan Quintela <quintela@redhat.com> writes:
>
> > Leonardo Bras <leobras@redhat.com> wrote:
> >> Add property that allows zerocopy migration of memory pages,
> >> and also includes a helper function migrate_use_zerocopy() to check
> >> if it's enabled.
> >>
> >> No code is introduced to actually do the migration, but it allow
> >> future implementations to enable/disable this feature.
> >>
> >> On non-Linux builds this parameter is compiled-out.
> >>
> >> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >
> > Hi
> >
> >> +# @zerocopy: Controls behavior on sending memory pages on migration.
> >> +#            When true, enables a zerocopy mechanism for sending memory
> >> +#            pages, if host supports it.
> >> +#            Defaults to false. (Since 6.2)
> >> +#
> >
> > This needs to be changed to next release, but not big deal.
>
> Rename to zero-copy while there.  QAPI/QMP strongly prefer separating
> words with dashes.  "zerocopy" is not a word, "zero" and "copy" are.
>
> [...]
>

Fine then.
To make sure it does not look strange, I will change the naming for
all the code (zerocopy becomes zero-copy or zero_copy according to the
context).

Thanks for reviewing!

Best regards,
Leo


