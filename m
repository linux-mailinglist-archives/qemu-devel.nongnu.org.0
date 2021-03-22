Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E18343FEC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:34:28 +0100 (CET)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIpH-0006Pg-VC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lOIoM-0005rt-0S
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:33:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lOIoK-00025E-Gj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616412807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iaoh85QvGzl5H56/LFLcAbT2b7UqD8DUh6R+dTwgt6U=;
 b=eAR9iXYv6Q5ZKFZNrpJVtnA/UG7tWggF2EI1kG3gxBzd91t9lMwOpHeyEh9G24BwvS4oNs
 6D8n1PPuzBHE4aEqRfo/2oYMctbZSpvUuoUqCeZsULLlC7O+VXxuRJLRQxqyVKwaQctwNk
 xW3+YaOWON5a3JHwDK6/kiYQYQ+YfG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-2DZWgD4iOFWV-CtEvFOeBA-1; Mon, 22 Mar 2021 07:33:23 -0400
X-MC-Unique: 2DZWgD4iOFWV-CtEvFOeBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF58281631;
 Mon, 22 Mar 2021 11:33:22 +0000 (UTC)
Received: from lws.brq.redhat.com (unknown [10.40.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28EE32A2D6;
 Mon, 22 Mar 2021 11:33:20 +0000 (UTC)
Date: Mon, 22 Mar 2021 12:33:18 +0100
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH 1/2] disas/arm-a64.cc: Fix build error
Message-ID: <20210322113318.pz7paluwfjtj6nv3@lws.brq.redhat.com>
References: <20210320041854.68668-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210320041854.68668-1-gshan@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 20, 2021 at 12:18:54PM +0800, Gavin Shan wrote:
> This fixes the following build error with gcc v11.0.0:
> 
>   # gcc --version
>   gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
>   [969/2604] Compiling C++ object libcommon.fa.p/disas_arm-a64.cc.o
>   FAILED: libcommon.fa.p/disas_arm-a64.cc.o
>     :
>   In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
>                    from /usr/lib64/glib-2.0/include/glibconfig.h:9,
>                    from /usr/include/glib-2.0/glib/gtypes.h:32,
>                    from /usr/include/glib-2.0/glib/galloca.h:32,
>                    from /usr/include/glib-2.0/glib.h:30,
>                    from /home/gavin/sandbox/qemu.main/include/glib-compat.h:32,
>                    from /home/gavin/sandbox/qemu.main/include/qemu/osdep.h:126,
>                    from ../disas/arm-a64.cc:21:
>   /usr/include/c++/11/type_traits:56:3: error: template with C linkage
>      56 |   template<typename _Tp, _Tp __v>
>         |   ^~~~~~~~
>   ../disas/arm-a64.cc:20:1: note: ‘extern "C"’ linkage started here
>      20 | extern "C" {
>         | ^~~~~~~~~~
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  disas/arm-a64.cc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
> index 9fa779e175..8545c04038 100644
> --- a/disas/arm-a64.cc
> +++ b/disas/arm-a64.cc
> @@ -17,13 +17,13 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include "vixl/a64/disasm-a64.h"
> +
>  extern "C" {
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  }
>  
> -#include "vixl/a64/disasm-a64.h"
> -
>  using namespace vixl;
>  
>  static Decoder *vixl_decoder = NULL;
> -- 
> 2.23.0
> 
> 

This error occurs when c++ compiler is used. With the fix, build pass.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>


