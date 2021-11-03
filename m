Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7176444437
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:04:06 +0100 (CET)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHo5-0000mX-QD
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miHjH-0003VZ-3l
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miHjE-00065B-W5
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Yxn7rCEGjzVm1Y5yuVrltJoZSlZm1z+nM93HuXti1D4=;
 b=Cjq/6xSRJybRIy/9/iXeROsxbVjW6/KUKi0BTpBusJClnlk/WrBlZLk7fVVqHieR9vup+X
 gNMProO2IHM7vn5+a5tkQ3i4BbfKP8JmHnrpxgmLJ0do5nSGKzyTBtf/XL0oyB8LgfxmJn
 gA3a7xZFaHKNGAfP69bCW9XgH/l7aqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-rpbY9VMWPfip8AI_Wm-eGg-1; Wed, 03 Nov 2021 10:58:56 -0400
X-MC-Unique: rpbY9VMWPfip8AI_Wm-eGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF09BAF82;
 Wed,  3 Nov 2021 14:58:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8999E1064152;
 Wed,  3 Nov 2021 14:58:52 +0000 (UTC)
Date: Wed, 3 Nov 2021 14:58:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/6] ui/clipboard: Don't use g_autoptr just to free a
 variable
Message-ID: <YYKjqVGr4QxB6wax@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103144844.1285634-3-jsnow@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 10:48:40AM -0400, John Snow wrote:
> Clang doesn't recognize that the variable is being "used" and will emit
> a warning:
> 
>   ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>       g_autoptr(QemuClipboardInfo) old = NULL;
>                                  ^
>   1 error generated.
> 
> OK, fine. Just do things the old way.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  ui/clipboard.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/clipboard.c b/ui/clipboard.c
> index d7b008d62a..d53576b0f6 100644
> --- a/ui/clipboard.c
> +++ b/ui/clipboard.c
> @@ -44,13 +44,14 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
>  
>  void qemu_clipboard_update(QemuClipboardInfo *info)
>  {
> -    g_autoptr(QemuClipboardInfo) old = NULL;
> +    QemuClipboardInfo *old = NULL;
>      assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
>  
>      notifier_list_notify(&clipboard_notifiers, info);
>  
>      old = cbinfo[info->selection];
>      cbinfo[info->selection] = qemu_clipboard_info_ref(info);
> +    g_free(old);
>  }

Surely the right answer here is to get rid of the variable
entirely as it isn't adding value

   g_free(cbinfo[info->selection]);


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


