Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124F679CFF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 16:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKKuh-0003o1-BL; Tue, 24 Jan 2023 10:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKKue-0003no-T0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 10:08:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKKub-0001gm-EJ
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 10:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674572916;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSRfcA8+xkvV/cdOvWe0Cu0GbtHL9v6vQzidRcDgl6Y=;
 b=if9b+0A2SKIWhrvvHA2eSbnqvHD329fXVGmSRXVPyza8iBxRJogfM4YYkax93cZZFyo+g+
 y5Zs4Tp6eFuVZdcH2I22OiXHi+fSVvs097teUCWuf4Usoh+s6REmxtWQ74EtCFhaMwsGSH
 nKkjbgVtSMZrjdMFdsTSKcFFfMEZlZs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-Cg8Gm_qUOeO_9LGZWNM8-Q-1; Tue, 24 Jan 2023 10:08:32 -0500
X-MC-Unique: Cg8Gm_qUOeO_9LGZWNM8-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61ECF2804829;
 Tue, 24 Jan 2023 15:08:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9B9639D92;
 Tue, 24 Jan 2023 15:08:30 +0000 (UTC)
Date: Tue, 24 Jan 2023 15:08:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>
Subject: Re: MinGW and libfdt (was: Re: MSYS2 and libfdt)
Message-ID: <Y8/0bBPM0cxnYnKy@redhat.com>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
 <0c771cc2-4746-0e5b-e372-c2a7be830144@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c771cc2-4746-0e5b-e372-c2a7be830144@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Tue, Jan 24, 2023 at 03:43:25PM +0100, Thomas Huth wrote:
> On 23/01/2023 17.23, Daniel P. Berrangé wrote:
> > On Fri, Jan 20, 2023 at 05:57:29PM +0400, Marc-André Lureau wrote:
> ...
> > > > > On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
> > > > > > 
> > > > > > 
> > > > > >     Hi all,
> > > > > > 
> > > > > > in some spare minutes, I started playing with a patch to try to remove the
> > > > > > dtc submodule from the QEMU git repository - according to
> > > > > > https://repology.org/project/dtc/versions our supported build platforms
> > > > > > should now all provide the minimum required version.
> ...
> > So in theory we can try to drop the submodule for dtc now
> 
> The dtc package is also still missing in the MinGW cross compiler suite in
> Fedora ... does anybody know what's the right way to request it there?

Someone will need to write a specfile, and submit it for review. I can do
the submission, or the review, but not both (can't mark your own homework)


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


