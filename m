Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634833004A0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:56:05 +0100 (CET)
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wuy-0001FP-Dc
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2wtW-0008O4-Em
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:54:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2wtU-0007Mt-D8
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611323671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3gtLyUF6V9R7A0BRsCWWdEXN8tXE3f7S0lqR9RrYrks=;
 b=i7O6gfkebD/k6dCdZ6oc/TCOPYVb6UAIqFfqcYqNA6jN47FjEdBmMJcxE9zMCdJToMV4RH
 695Drwa4z3jHjGEjg5kFm0mec0iGk2KTn4vgf1/Uz98XpyEo97E45Ht00hR0vpHz8BpZ0M
 MCAR2/4rZA9HhRoqD1UFjas8aVQrbK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-TQm5DN_DPY2250E2uu7LRA-1; Fri, 22 Jan 2021 08:54:29 -0500
X-MC-Unique: TQm5DN_DPY2250E2uu7LRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B353D1DDE0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:54:28 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-243.ams2.redhat.com
 [10.36.112.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 512EA5DA2D;
 Fri, 22 Jan 2021 13:54:25 +0000 (UTC)
Subject: Re: [PATCH] vnc: drop vnc_colordepth() call.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210122085525.3827724-1-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <450c366a-d6a8-8a23-aad7-54eadd444b5e@redhat.com>
Date: Fri, 22 Jan 2021 14:54:24 +0100
MIME-Version: 1.0
In-Reply-To: <20210122085525.3827724-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On 01/22/21 09:55, Gerd Hoffmann wrote:
> With gtk-vnc (which supports VNC_FEATURE_WMVI) this results in
> sending a VNC_ENCODING_WMVi message to the client.  Which in turn
> seems to make gtk-vnc respond with another non-incremental update
> request.  Hello endless loop ...
>
> Drop the call.
>
> Fixes: 9e1632ad07ca ("vnc: move initialization to framebuffer_update_request")
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index d429bfee5a65..0a3e2f4aa98c 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2041,7 +2041,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
>      } else {
>          vs->update = VNC_STATE_UPDATE_FORCE;
>          vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
> -        vnc_colordepth(vs);
>          vnc_desktop_resize(vs);
>          vnc_led_state_change(vs);
>          vnc_cursor_define(vs);
>

while this patch has some effect, it does not fix the issue.

* With the gvncviewer binary I mentioned before, there is no change in
behavior -- initial screen shown, no updates then, and finally
connection dropped:

> Connected to server
> Remote desktop size changed to 800x480
> Connection initialized
> Error: Failed to flush data
> Disconnected from server

* With virt-manager, there is a before-after difference: the screen is
now *flashing*, between actual content and a black void. Meanwhile the
VNC client is still spinning.

* If I pass "--gtk-vnc-debug" to "gvncviewer", the following log snippet
keeps repeating:

> src/vncconnection.c Emit main context 8
> src/vncconnection.c Re-requesting framebuffer update at 0,0 size 640x480, incremental 0
> src/vncconnection.c Num rects 1
> src/vncconnection.c FramebufferUpdate type=-223 area (640x480) at location 0,0
> src/vncconnection.c Desktop resize w=640 h=480
> src/vncconnection.c Emit main context 5
> src/vncdisplay.c Framebuffer size / format unchanged, skipping recreate
> src/vncconnection.c Requesting framebuffer update at 0,0 size 640x480, incremental 0
> src/vncconnection.c Num rects 1
> src/vncconnection.c FramebufferUpdate type=-261 area (1x1) at location 0,0
> src/vncconnection.c LED state: 0

Thanks
Laszlo


