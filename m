Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82B2889FB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 15:46:54 +0200 (CEST)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQsjV-00074p-Ar
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 09:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQshA-0005ag-IQ
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 09:44:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kQsh8-0001Gc-Hu
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 09:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602251065;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YNniShT7St4VH9bctvtOt0EMAMkeVtw9quJLLuUhL1o=;
 b=Pwe99QpC1KN+S3lPtxac50Tcu2gKXXZpQkHd5v/h9jYutd7rvaLlzUpTxa3xI5I8NF1Jfa
 DNU0MLuzSPsCnGZj6vyxCaJzh1uim4H9F9VAPP79X9Y84oPYRFdWC+M7eb1vgvYg8M2frZ
 mBRQIbSU8SgUMwmq+uW+IkLH/CjnDx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-a3VkcY_eMDq19aZxDbI_pw-1; Fri, 09 Oct 2020 09:44:24 -0400
X-MC-Unique: a3VkcY_eMDq19aZxDbI_pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02EA2101962F;
 Fri,  9 Oct 2020 13:44:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-251.ams2.redhat.com [10.36.114.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B765D6EF59;
 Fri,  9 Oct 2020 13:44:21 +0000 (UTC)
Date: Fri, 9 Oct 2020 14:44:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chetan Pant <chetan4windows@gmail.com>
Subject: Re: [PATCH 2/5] Fixing Lesser GPL version number [2/5]
Message-ID: <20201009134418.GD25901@redhat.com>
References: <20201009063934.2679-1-chetan4windows@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201009063934.2679-1-chetan4windows@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 09, 2020 at 06:39:34AM +0000, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License. It is
> either "GPL version 2.0" or "Lesser GPL version 2.1". This patch replaces all
> occurrences of "Lesser GPL version 2" with "Lesser GPL version 2.1" in comment section.
> Also, It came to notice that some of the files that were edited for the change
> were not following latest comment rules. For example using "//" to mark comment
> instead of "/*". That is also fixed in this patch.
> 
> This patch is divided in 5 parts, directory wise, in order to make reviewing process easier.
> Below listed are the parts of the patch, where asterisk denotes the part you are currently viewing.
> 
> 	[ ] Files in authz/backends/block/linux-user/tests/migration directory (82 Files)
> 	[*] Files in hw/include/disas (100 files)
> 	[ ] Files inside target/ 'alpha,arm,cris,hppa,i386' (96 files)
> 	[ ] Files inside target/ 'lm32,microblaze,mips,ppc,rx,sparc,tilegx,tricore,xtensa' (63 files)
> 	[ ] Files in ui/util/include/scripts and QEMU root directory (76 Files)
> 
> Below is how the license version was corrected:
> 
> 1. To find the number of file having "Lesser GPL version 2 ":
> 	grep -l Lesser $(grep -rl "version 2 " * ) > result.dat
>    Total of 417 files were found (After manually exluding the files like COPYING and COPYING.LIB from the result)
> 
> 2. To find the number of occurences of "version 2 " in the resulted files:
> 	egrep -c "version 2 " $(cat result.dat)
>    410 files had "version 2" occurence 1 time (name of those files was saved in one_timers.dat)
>    and in 7 files "version 2" occurences were multiple times.
> 
> 3. Files having occurence exactly 1 time were corrected using below command:
> 	sed -i "s/version 2 /version 2.1 /g" $(cat one_timers.dat)
>    For rest of 7 files, correction was done manually.
> 
> Note:
> During validating this patch (2/5), It was noticed that "hw/i2c/mpc_i2c.c" file had below license text mentioned:
> "You should have received a copy of the GNU Lesser General Public"
> But the file was actually using "GNU General Public License, version 2 or later," which was confusing
> so I've not included the that change in this patch. So in fact, only 99 files are changed in this patch.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---

>  io/channel-buffer.c                   |  2 +-
>  io/channel-command.c                  |  2 +-
>  io/channel-file.c                     |  2 +-
>  io/channel-socket.c                   |  2 +-
>  io/channel-tls.c                      |  2 +-
>  io/channel-util.c                     |  2 +-
>  io/channel-watch.c                    |  2 +-
>  io/channel-websock.c                  |  2 +-
>  io/channel.c                          |  2 +-
>  io/dns-resolver.c                     |  2 +-
>  io/task.c                             |  2 +-

I'll queue these if you combine them with the "io" pieces from
patch 1.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


