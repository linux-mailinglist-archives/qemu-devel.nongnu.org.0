Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C803751E7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 12:02:48 +0200 (CEST)
Received: from localhost ([::1]:35590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaqF-0005Ls-Gt
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 06:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leao0-0004MF-8j
 for qemu-devel@nongnu.org; Thu, 06 May 2021 06:00:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leanr-0001gy-Bf
 for qemu-devel@nongnu.org; Thu, 06 May 2021 06:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620295218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vVTIopn8Rx9WvqCwRC67BuIM1swgVzHVS3B/hwDd5EI=;
 b=HZ6evBKiETgfpwY7dZkeaymj63HmhHsn5W4v95jDCknZQeIZ3BQc6PVGgCdc5WcYksvZYC
 gHmFLzCNZzg7doHlcmPVinVw3KtuUJccc2W8DqyqiaVzxKP5hk4KFHyiyEp/B2lxmtpMOl
 H2xT4OQTg13gznwySrFqLek09+izksU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-kBMY0o7WPq2etYjKGGrXBA-1; Thu, 06 May 2021 06:00:16 -0400
X-MC-Unique: kBMY0o7WPq2etYjKGGrXBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4F711006C84;
 Thu,  6 May 2021 10:00:15 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CB615D9C0;
 Thu,  6 May 2021 10:00:08 +0000 (UTC)
Date: Thu, 6 May 2021 11:00:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH 1/2] virtiofsd: Allow use "-o xattrmap"
 without "-o xattr"
Message-ID: <YJO+JVvEU3BM0SWi@work-vm>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
 <20210414201207.3612432-2-jose.carlos.venegas.munoz@intel.com>
 <20210416130537.2046bd26@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210416130537.2046bd26@bahia.lan>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: virtio-fs@redhat.com, Carlos Venegas <jose.carlos.venegas.munoz@intel.com>,
 qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Wed, 14 Apr 2021 20:12:06 +0000
> Carlos Venegas <jose.carlos.venegas.munoz@intel.com> wrote:
> 
> > When -o xattrmap is used, it will not work unless xattr is enabled.
> > 
> > This patch enables xattr when -o xattrmap is used.
> > 
> > Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index ddaf57305c..2337ea5a58 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -3939,6 +3939,7 @@ int main(int argc, char *argv[])
> >      }
> >  
> >      if (lo.xattrmap) {
> > +        lo.xattr = 1;
> >          parse_xattrmap(&lo);
> >      }
> >  
> 
> This seems reasonable. I'm just wondering if we should also
> add an explicit error if the user tries something silly
> like -o xattrmap=MAPPING,no_xattr instead of silently
> ignoring no_xattr...

That would be a nice addition, although I'll take this set is for now.

Dave

> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


