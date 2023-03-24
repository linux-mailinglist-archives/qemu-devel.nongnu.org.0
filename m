Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752D6C81EE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:56:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfilN-0002ut-0I; Fri, 24 Mar 2023 10:51:29 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfilK-0002uI-Hk
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:51:26 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfilG-0004Wm-Av
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679669482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YuCyO2YU2quaoAmFDdKczCUFwNTV4tF8lC1oimdVCdI=;
 b=Y6T95XLu5y4QS0Zqma3OJmSmEEzvlH69aWZC5uH71wgIkmRjk0e2viD8
 dgHFlSAL6vQ/ctyCR7w0WfcyZQH9Ek3eKEOP39twV7dmkwzXGCn18WD/c
 lR4bsW5m0aH2fIB7qnKZvFDxcTR6X6Wu3hRaY7514rt8W/Wty+CZUkjxn o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101002808
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:g+9mbK+iGzwXxqPmSg6iDrUD4HmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 DBLXWnQOf6IZzOhf9EkOoqw/E5Xvp/Tm4RqHFY/pCs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkQ1
 s0kGiIwVSnensaHy7mqE6pCoYc8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxh/A/
 jiWpzSR7hcyOdex5R6s31mWo+rggjn2ZYIvRZOh36s/6LGU7jNKU0BHPbehmtG1lUuhAfpeL
 UIO8yYjpKR081akJvHlVgC8iG6JuFgbQdU4O/Q37RzIxqfK7gKxAG8CQThcLts8u6ceXTYt0
 E2ImdLBHzFjsLSJD3ma89+8rzS7Pm4Qa2oLfzMFSxAt5MPqq4U+yBnIS75LGai2k8ezEHf52
 TeQpQA5nbwYicNN3KK+lXjcmC6lrJXNSg8z5y3UU3ij4wc/Y5SqD6S26FvB5PMGI4+DTkaIu
 FANnsTY5+cLZbmdmSrITOgTEbWB4/eeLCaakVNpB4Mm9Tmm5zikZ484yChjJUF1P8INUSXkb
 E/apUVa45o7FHelbKt9bpitI94nwajpCZLuUfW8RsJDfpVrMgqO7S1jYUq422HrmVIr16YlN
 v+zeN6hF38ABYx7zTC9QKEW1rpD+8wl7TqNH9ahlU3hiOfAIifPEt/pLWdicMhnz5K4khfoy
 O8CLu+7wB5OCa7QRWrIpNt7wU8xEZQrOXzng5UJKb/dfFc8QzlJ5+z5mu14JdE890hBvqKRp
 yzmBBcFoLbqrSefQThmfEyPf18GsXxXiXsgdRIhMl+zs5TISdb+tfxPH3fbkFROyQCC8RKXZ
 6NfEyl4Kq4TIgkrAhxEBXUHkKRsdQ6wmSWFNDe/bT40cvZIHlKWq4K1IFa3rXdQUkJbUPfSR
 JX+vj43vLJZH1gyZCooQKvHI6yNUYg1x7spAhqgzih7c0Tw6ol6QxHMYgsMC5hUc33rn2LKv
 zt69D9E/YEhVadpqoiW7U1Fxq/1e9ZD8r1yRDGBt+ntZXeBrgJOA+ZoCY61QNwUb0uskI3KW
 Amf56qU3CEv9LqSj7dBLg==
IronPort-HdrOrdr: A9a23:/9ePgavTxnEN/DZClOTO0iZm7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; d="scan'208";a="101002808"
Date: Fri, 24 Mar 2023 14:51:06 +0000
To: David Woodhouse <dwmw2@infradead.org>
CC: Paul Durrant <paul@xen.org>, <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/xenpv: Initialize Xen backend operations
Message-ID: <ac5c322b-7774-45ce-9583-01771e43f54d@perard>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-10-dwmw2@infradead.org>
 <209fe980-7f9d-4d79-90fb-12e38f12b2bc@perard>
 <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=440da7b32=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 23, 2023 at 10:57:34AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> As the Xen backend operations were abstracted out into a function table to
> allow for internally emulated Xen support, we missed the xen_init_pv()
> code path which also needs to install the operations for the true Xen
> libraries. Add the missing call to setup_xen_backend_ops().
> 
> Fixes: b6cacfea0b38 ("hw/xen: Add evtchn operations to allow redirection to internal emulation")
> Reported-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Tested-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

