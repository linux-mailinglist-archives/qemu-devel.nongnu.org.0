Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E934BF49F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 10:25:14 +0100 (CET)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMRQ1-00061m-I1
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 04:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMRMa-0005Cj-N9
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:21:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMRMW-0004D1-EM
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 04:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645521695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=usJUmCqm/1hOeTh4Bv+6Q1yq070VljFV/KG2R2A3uZ0=;
 b=DX5ZDj1ZsTavK25R5l8htnXh4fIBd1CXqxN1BV1a8qsZVQf1/HoHNFOOSoDdPsUt+zWcS0
 E7ZGar55+psjoli4Kdy3Vt45dDUKdVtNc15vpwBEkjNO97ZV4mhHEn1C6yNGo6IzTH0HrK
 yodIx1RA7rSB2q8FC+lCmtTpWkxRqA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-zYBNSe_CMJiplL-03VFsTA-1; Tue, 22 Feb 2022 04:21:29 -0500
X-MC-Unique: zYBNSe_CMJiplL-03VFsTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 369221854E2A;
 Tue, 22 Feb 2022 09:21:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEE627B6C9;
 Tue, 22 Feb 2022 09:21:23 +0000 (UTC)
Date: Tue, 22 Feb 2022 09:21:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
Message-ID: <YhSrD/gmlMkumkah@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 08:57:03AM +0100, Damien Hedde wrote:
> 
> 
> On 2/22/22 07:10, Markus Armbruster wrote:
> > Damien Hedde <damien.hedde@greensocs.com> writes:
> > 
> > > Hi,
> > > 
> > > The main idea of this series is to be a bit more user-friendly when
> > > using qmp-shell in a non-interactive way: with an input redirection
> > > from a file containing a list of commands.
> > > 
> > > I'm working on dynamic qapi config of a qemu machine, this would
> > > be very useful to provide and reproduce small examples.
> > 
> > Why not use plain QMP for that?
> > 
> > [...]
> > 
> What do you mean by plain QMP ?

Directly connect to the socket and send the QMP JSON commands you have.

Essentially qmp-shell is designed for adhoc interactive human usage.
For automated / scripted, non-interactive usage, it is expected that
QMP is simple enough that tools just directly connect to the QMP
socket instead of using a wrapper layer.

What is the reason you want to use qmp-shell for this instead of
directly using the socket from your scripts ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


