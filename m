Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84122682FE7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:57:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrnm-0000iP-51; Tue, 31 Jan 2023 09:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMrni-0000dA-PB
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:39:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMrnR-0002nl-9t
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675175978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CkVWG/akQJ6p4UG6ISC8uHd3dwf/85YgMJckQZTYBrs=;
 b=etQOGheiwXJZ/U4c2jBqNd6QIvYEBQuP3USQ//gA/IQs1sf1GRcgnAMQXlIm7nxfAG9rWB
 5kaeiKo29ZwF/rgC0Ictvy2i74TSUjOD8dRCax+immIexYMQRjL3O7QmDJFYKOtwGml3kk
 KSccoQa6k7fhiXoZqZqoW5NK2zKktvA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-JzZoUl3mM4yE2QV8x704Sw-1; Tue, 31 Jan 2023 09:39:35 -0500
X-MC-Unique: JzZoUl3mM4yE2QV8x704Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D11E53C0E46B;
 Tue, 31 Jan 2023 14:39:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30F37112132C;
 Tue, 31 Jan 2023 14:39:32 +0000 (UTC)
Date: Tue, 31 Jan 2023 14:39:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Guohuai Shi <guohuai.shi@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
Message-ID: <Y9koH+ElplpptxWp@redhat.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <CAMxuvayW7mzQcVLrB8v-adoKXVKgq-pGCf6uT-cURcmDW51bFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvayW7mzQcVLrB8v-adoKXVKgq-pGCf6uT-cURcmDW51bFQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 31, 2023 at 06:31:39PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jan 30, 2023 at 1:52 PM Bin Meng <bin.meng@windriver.com> wrote:
> 
> > At present there is no Windows support for 9p file system.
> > This series adds initial Windows support for 9p file system.
> >
> > 'local' file system backend driver is supported on Windows,
> > including open, read, write, close, rename, remove, etc.
> > All security models are supported. The mapped (mapped-xattr)
> > security model is implemented using NTFS Alternate Data Stream
> > (ADS) so the 9p export path shall be on an NTFS partition.
> >
> > 'synth' driver is adapted for Windows too so that we can now
> > run qtests on Windows for 9p related regression testing.
> >
> > Example command line to test:
> >
> >   "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device
> > virtio-9p-pci,fsdev=p9,mount_tag=p9fs"
> >
> > Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a
> >
> > Changes in v4:
> > - Fixed 9pfs mounted as read-only issue on Windows host, adding a
> >   win32_error_to_posix() to translate Windows native API error to
> >   POSIX one.
> > - Fixed errors of handling symbolic links
> > - Added forward declaration to avoid using 'void *'
> > - Implemented Windows specific xxxdir() APIs for safe directory access
> >
> >
> Sorry to look a bit late at this series, I don't know what was discussed
> previously.
> 
> My general feeling is that a lot of this FS portability work would be
> better handled by using GIO (even though this may add some extra
> dependency). GIO lacks some features on win32 (for example xattributes on
> win32), but they could have been proposed there too and benefiting other
> apps.

The currently impl relies on the openat, fstatat, mkdirat, renameat,
utimensat, unlinkat functions. IIRC this was in order to deal with
various security vulnerabilities that exist due to race conditions.
AFAIK, there's no way to achieve the same with GIO as its a higher
level API which doesn't expose this kind of functionality


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


