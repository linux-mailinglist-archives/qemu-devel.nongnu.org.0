Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A86E5BDE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:18:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogXO-0007D5-GJ; Tue, 18 Apr 2023 04:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pogXL-00077H-Ic
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pogXG-0005EN-La
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681805870;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h67/eXG23cyggFAMTuWQClAURIX69Ai48UqMm3QHv9I=;
 b=YTNP/dNbCHupjX+eXkd4Ja9uHPtAYWTJwlFkTYKV6otS3UqTkjAH2LJQD0oUaxKh06H2DV
 Gx75V/X5HffCPptHEX6BcAW87jJInS5qMHXOuxThPo8PVWkY+gzTNN6DrLAhXNVVolrAvQ
 xYNNF866nFumwKewQwvTOzy+aPM69Ps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-n6qBBzt0Olu9orOLZetIaQ-1; Tue, 18 Apr 2023 04:17:46 -0400
X-MC-Unique: n6qBBzt0Olu9orOLZetIaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 412BF85A588;
 Tue, 18 Apr 2023 08:17:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90AAF492B0D;
 Tue, 18 Apr 2023 08:17:35 +0000 (UTC)
Date: Tue, 18 Apr 2023 09:17:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 1/1] ui/gtk: Added a no-input mode
Message-ID: <ZD5SHSIkmfSxRWuc@redhat.com>
References: <MW3PR11MB46848D06ADD48751C810EE769F9C9@MW3PR11MB4684.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MW3PR11MB46848D06ADD48751C810EE769F9C9@MW3PR11MB4684.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Apr 17, 2023 at 11:02:00PM +0000, Singh, Satyeshwar wrote:
> In a multi-seat scenario where multiple keyboards and mice are connected
> to the host but some are dedicated for the guests only (through pass
> through mode) and some are only for the host, there is a strong use case
> where a customer does not want a HID device connected to the host to be
> able to control the guest.
> In such a scenario, neither should we bind any input events to Qemu UI,
> nor should we show menu options like "Grab on Hover" or "Grab Input".
> This patch adds a GTK command line option called "no-input".
> It can be set like this:
>   gtk,no-input=off/on
> 
> If set to off or completely left out, it will default to normal
> operation where host HID devices can control the guests. However, if
> turned on, then host HID devices will not be able to control the guest
> windows.
> 
> Signed-off-by: Satyeshwar Singh <satyeshwar.singh@intel.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  qapi/ui.json    |  5 ++++-
>  qemu-options.hx |  4 +++-
>  ui/gtk.c        | 39 +++++++++++++++++++++++++++------------
>  3 files changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 98322342f7..cd3ef4678e 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1214,6 +1214,8 @@
>  #               Since 7.1
>  # @show-menubar: Display the main window menubar. Defaults to "on".
>  #                Since 8.0
> +# @no-input: Don't let host's HID devices control the guest. Defaults to "off".
> +#                Since 8.0
>  #
>  # Since: 2.12
>  ##
> @@ -1221,7 +1223,8 @@
>    'data'    : { '*grab-on-hover' : 'bool',
>                  '*zoom-to-fit'   : 'bool',
>                  '*show-tabs'     : 'bool',
> -                '*show-menubar'  : 'bool'  } }
> +                '*show-menubar'  : 'bool',
> +                '*no-input'      : 'bool'  } }

We don't generally like negative boolean options.

IOW, we would prefer '*input':  'bool'  with the default being
'on' if omitted, of course.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


