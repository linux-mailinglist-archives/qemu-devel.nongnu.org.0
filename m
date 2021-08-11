Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBC3E8F73
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 13:27:34 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDmOT-0005Rp-BS
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 07:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDmNE-0004kc-IJ
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:26:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDmNA-00075f-Pv
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628681170;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzfGuTJ9LClxO3o02LewFekWjMg4g+fqFex88KjpBO8=;
 b=BAftLosgaytrDR6EK2tXcoQCcLTqGJg35k22YEmWtFX5qo2hS7au9o4bG8sMh1uf352ezf
 eK1+YNnJS8McNHxXG3rQQJ4r7kec/tUkWQVLpKm6WUZgRnsrgLT/L7cxDWx+xhrN4e38R8
 /RrCxUtAwgDC1Bv5Ed+AjH3kBq8dsjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-dD_y4I0KOPCfutXm_6ag7w-1; Wed, 11 Aug 2021 07:26:04 -0400
X-MC-Unique: dD_y4I0KOPCfutXm_6ag7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18A161026200;
 Wed, 11 Aug 2021 11:26:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B04260BF1;
 Wed, 11 Aug 2021 11:26:01 +0000 (UTC)
Date: Wed, 11 Aug 2021 12:25:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2] docs: make sphinx-build be quiet by default
Message-ID: <YROzx5IVaUsX5cQR@redhat.com>
References: <20210810113201.3957815-1-berrange@redhat.com>
 <CAJ+F1CJf=e5DcGji98krxgaqdsKkc=FCHF1JveuBfegovdcbJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJf=e5DcGji98krxgaqdsKkc=FCHF1JveuBfegovdcbJw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11, 2021 at 03:22:43PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Aug 10, 2021 at 3:32 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > The sphinx-build is fairly verbose spitting out pages of output to the
> > console, which causes errors from other build commands to be scrolled
> > off the top of the terminal. This can leave the mistaken impression that
> > the build passed, when in fact there was a failure.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >
> 
> Without this patch, I miss the warnings 99% of the time!!
> 
> You are missing one -q though:
> 
> diff --git a/docs/meson.build b/docs/meson.build
> index 42d7555bc4..51fa902cd9 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -78,7 +78,7 @@ if build_docs
>                  input: files('conf.py'),
>                  depfile: 'docs.d',
>                  depend_files: [ sphinx_extn_depends, sphinx_template_files
> ],
> -                command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
> +                command: [SPHINX_ARGS, '-q', '-Ddepfile=@DEPFILE@',
>                            '-Ddepfile_stamp=@OUTPUT0@',
>                            '-b', 'html', '-d', private_dir,
>                            input_dir, output_dir])
> 
> Why not update SPHINX_ARGS instead?

🤦 that would be a better idea.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


