Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536C49B869
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:18:20 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOWR-0004Og-BZ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nCNSF-0006u6-JV
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:09:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nCNSC-0006Gv-As
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vb+x5zgMizsyPz09imfgqiE8GW/Si6w0n+slkjJFdrM=;
 b=YaXcl4Qjzr2DBej4CgdgEvGp8Bao7L0FIAn0IlVrylQqt9qZnzhiMGkGEoC++Ttlapbw+q
 2heFCQVV640Y3H6DgrxhXH+Lj+A3UCyMvYrCBqVfPhTCyLEL6pfOHz824klgmqq97s1+3M
 cxcoZa8jFPtVE0lRGmm9ihoRMnAIKIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-xZWhA6SaMyqvxNKZIcd3HQ-1; Tue, 25 Jan 2022 10:09:48 -0500
X-MC-Unique: xZWhA6SaMyqvxNKZIcd3HQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A64A01006AA5;
 Tue, 25 Jan 2022 15:09:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4202C7E2F9;
 Tue, 25 Jan 2022 15:09:46 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:09:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] docs: expand firmware descriptor to allow flash without
 NVRAM
Message-ID: <YfAStHc/JGDsomC+@redhat.com>
References: <20220121153444.527707-1-berrange@redhat.com>
 <aa00dae7-e092-573a-a6ce-f7cf347f294c@amsat.org>
 <20220125075054.dnlnr4pliw3bio2k@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220125075054.dnlnr4pliw3bio2k@sirius.home.kraxel.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: David Edmondson <david.edmondson@oracle.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 08:50:54AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > >   { 'struct' : 'FirmwareMappingFlash',
> > > -  'data'   : { 'executable'     : 'FirmwareFlashFile',
> > > -               'nvram-template' : 'FirmwareFlashFile' } }
> > > +  'data'   : { 'mode': 'FirmwareFlashMode',
> > > +               'executable'     : 'FirmwareFlashFile',
> > > +               '*nvram-template' : 'FirmwareFlashFile' } }
> 
> I think for backward compatibility reasons we want 'mode' be optional,
> with 'mode' = 'split' being assumed in case it is not present.
> 
> otherwise looks sane to me.

Opps, yes, I even documented that it was optional but then failed
to mark it optional.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


