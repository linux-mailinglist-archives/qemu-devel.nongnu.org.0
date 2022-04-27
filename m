Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DCA511873
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:42:12 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhvn-0007iN-Kv
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1094d0c61=anthony.perard@citrix.com>)
 id 1njhsp-0006CR-L7; Wed, 27 Apr 2022 09:39:10 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:12271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1094d0c61=anthony.perard@citrix.com>)
 id 1njhsm-0008Dj-Qv; Wed, 27 Apr 2022 09:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1651066744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KEH0uihlxnEuFRyeMAETigwL92GSAiyMausO3tgEKXc=;
 b=U7/Jbd/5t5f7jyy70bcRtNjZovL+VmfB0BPAi0actOM6lWsMCyptKHbA
 wsHudR/aDVN3njF/A46df6E6xnZBmbTwK2jpa5/9WfxKaUFcutDCqQDOT
 fzYDBY2+nVMHDnEpaDCkm2IeUWszk1XTcp+qAWGLS0VjK5Fp5qjMWqVKs Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69925381
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YUFkT6NsV8N8MLXvrR1El8FynXyQoLVcMsEvi/4bfWQNrUp01TBWy
 mMeWzuGaf+KZWagfNl0bI62pB5Tu5KHnN5lTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 tISsr6qRjUQHffxn/hNejBxIz9XMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQTKeEO
 pFJMFKDajzyehFwPnotCqgap7aMqViiTzFKknWs8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTQY8XCfik7P90gVSX7moUDhIQSB28u/bRola3RtZ3O
 0ESvC00osAa71e3R9PwWxm5pn+svRMGXddUVeog52ml06fR/kOVC3YJShZHb9opstJwQiYlv
 neVn871BRR1vbGVQG7b/bCRxRuxIyEFIGsqfyIITQIZpdLkpekblhjISMRiFq+dlND5GTjsh
 TuNqUADa6471JBRkf/hpBae3mzq9sOhohMJChv/QGX66SFja7ycRNaV7kSLxN9pHJiwQQzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMd4qWn0k5K3VcUJuWwleh81WioRUWWxC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPIt4wOuBJ1+U3aB
 Xt8WZzxZUv28Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bbQPfNbxjtPzf+1+9H
 zNj2yyikUs3bQEDSnOPrd57wa4icBDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzaAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tJpvQX6wTGmiWk9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:XuoJnazq7VB1nUORQ7P1KrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; d="scan'208";a="69925381"
Date: Wed, 27 Apr 2022 14:38:45 +0100
To: Thomas Huth <thuth@redhat.com>
CC: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 <kraxel@redhat.com>, <qemu-trivial@nongnu.org>,
 <xen-devel@lists.xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] softmmu/vl: Fence 'xenfb' if Xen support is not compiled
 in
Message-ID: <YmlHZTcghklUZjok@perard.uk.xensource.com>
References: <20220427123316.329312-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427123316.329312-1-thuth@redhat.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=1094d0c61=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Wed, Apr 27, 2022 at 02:33:16PM +0200, Thomas Huth wrote:
> The 'xenfb' parameter for the '-vga' command line option is currently
> always enabled unconditionally (since the xenfb is not a proper QOM
> device that could be tested via its class name). That means it also
> shows up if Xen is not enabled at all, e.g. like this:
> 
>  $ ./qemu-system-sparc -vga help
>  none                 no graphic card
>  xenfb                Xen paravirtualized framebuffer
>  tcx                  TCX framebuffer (default)
>  cg3                  CG3 framebuffer
> 
> Let's avoid this situation by fencing the parameter with the
> CONFIG_XEN_BACKEND switch.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

