Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E789AFF5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 14:53:45 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i194b-0003uI-3V
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 08:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrezanin@redhat.com>) id 1i18rM-00017N-0B
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:40:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrezanin@redhat.com>) id 1i18rK-0007KV-V5
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:40:03 -0400
Received: from 212-4-128-36.cust.selfnet.cz ([212.4.128.36]:52566
 helo=workimage.localdomain) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <mrezanin@redhat.com>) id 1i18rK-0007JA-Op
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:40:02 -0400
Received: by workimage.localdomain (Postfix, from userid 1000)
 id C426448E052; Fri, 23 Aug 2019 14:32:04 +0200 (CEST)
Date: Fri, 23 Aug 2019 14:32:04 +0200
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190823123204.gnrmxyevcrswjagu@lws.brq.redhat.com>
References: <1566495734-23297-2-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566495734-23297-2-git-send-email-pbonzini@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.4.128.36
Subject: Re: [Qemu-devel] [PATCH] modules-test: ui-spice-app is not built as
 module
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 07:42:14PM +0200, Paolo Bonzini wrote:
> $(call land, $(CONFIG_SPICE), $(CONFIG_GIO)) will never return "m" so
> ui-spice-app is always linked into QEMU.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/modules-test.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/modules-test.c b/tests/modules-test.c
> index a8118e9..f9de3af 100644
> --- a/tests/modules-test.c
> +++ b/tests/modules-test.c
> @@ -53,9 +53,6 @@ int main(int argc, char *argv[])
>  #ifdef CONFIG_SDL
>          "ui-", "sdl",
>  #endif
> -#if defined(CONFIG_SPICE) && defined(CONFIG_GIO)
> -        "ui-", "spice-app",
> -#endif
>      };
>      int i;
>  
> -- 
> 1.8.3.1
> 
>

Making make check pass again for me.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com> 

