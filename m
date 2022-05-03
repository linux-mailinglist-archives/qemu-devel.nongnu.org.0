Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616245180D7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:19:17 +0200 (CEST)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloge-0003RS-C9
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nloct-0000k4-9x
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nlocr-0000ll-J3
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651569320;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpVSazeqDOv2ZXvVybfSbCmhsTVm5XdtDJmayDz3PMk=;
 b=bx5RWLh2OGwBkZxAHFjJJo1n46vUO6hO7gVRyEinTnFaJX4g9bl4gICAsWNi6vqQja9K0q
 ye8yp2I2L7TqA2WHVOsPH6dmiyjnHhnB3CYmXwUokWv1tVAE2FZ0ef0PQm+zVqm0g5Fmmv
 X2Cf0uNxe9e5fXINlEHOiF468Xcd9Ic=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-KcP-UTjjPJ2TQPxwC5rioA-1; Tue, 03 May 2022 05:15:17 -0400
X-MC-Unique: KcP-UTjjPJ2TQPxwC5rioA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4124E3C0E186;
 Tue,  3 May 2022 09:15:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39BBE416385;
 Tue,  3 May 2022 09:15:16 +0000 (UTC)
Date: Tue, 3 May 2022 10:15:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] ui/gtk: new param monitor to specify target monitor
 for launching QEMU
Message-ID: <YnDyodis9sdnyh3O@redhat.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-2-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428231304.19472-2-dongwon.kim@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 04:13:02PM -0700, Dongwon Kim wrote:
> Introducing a new integer parameter to specify the monitor where the
> Qemu window is placed upon launching.
> 
> Monitor can be any number between 0 and (total number of monitors - 1).
> 
> It can be used together with full-screen=on, which will make the QEMU
> window full-screened on the targeted monitor.
> 
> v2: fixed typos and updated commit subject and msg
>     (Philippe Mathieu-Daudé)
> 
>     changed param name to monitor, removed unnecessary condition check
>     on the parameter
>     (Paolo Bonzini)
> 
> v3: updated Since version to 7.1 for monitor parameter
> 
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  qapi/ui.json    | 6 +++++-
>  qemu-options.hx | 2 +-
>  ui/gtk.c        | 8 ++++++++
>  3 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 059302a5ef..ddcea7349b 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1204,13 +1204,17 @@
>  #               assuming the guest will resize the display to match
>  #               the window size then.  Otherwise it defaults to "off".
>  #               Since 3.1
> +# @monitor:     Indicate monitor where QEMU window is lauched. monitor
> +#               could be any number from 0 to (total num of monitors - 1).
> +#               since 7.1
>  #
>  # Since: 2.12
>  #
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +                '*monitor'       : 'uint32' } }

I feel like this ought to be an array of monitors, so that we can have
explicit positioning when we have multiple graphical outputs and are
creating a separate window for each.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


