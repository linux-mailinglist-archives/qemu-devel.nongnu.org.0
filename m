Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201436D05D9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:05:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrxP-000861-M8; Thu, 30 Mar 2023 09:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrxO-00085s-JQ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:04:46 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=446aa7e4f=anthony.perard@citrix.com>)
 id 1phrxM-0007zh-PW
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1680181484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xkpy/kjsmo/X9OUmHcSUliZn05A/VqHXLoRZnj02lSc=;
 b=CPRZ5PAu6v6U5NmdsfOLQ2pKsX+yy+UvGvdORYqKqKrqcazyxhbzitYM
 G3SlBmllAXR0bAr4S07POV7q9U0CzRNCl6aXEnsV1hmgyZQhmLczMpQcW
 u5f+ABTlva1/stRTK3pt5uAge84SZDuvm/Slf/P0xv+hQfutyM42ijuoC g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102479599
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:KHAbLqnuFNHxv5OmGTZYucbo5gyYIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWmzVaKrcMDGhL95xad7joB4HsJCHmNdgSgBpqnw1FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5weGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dYfFG4tRRWGu863nvWpR/FnmZkAI8a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 D6ZrjmoU3n2MvSmigvaqU+VodbznD3rYttKFLKi8dN11Qj7Kms7V0RNCArTTeOColW+VtRDJ
 l089S8nrKx0/0uuJvHkUhil5XKJoBMYc9xXFeI89UeK0KW8ywOQHGMJSnhIcNIrsMU/WDkC2
 VqAntevDjtq2JWNQ3Wb5LaSrBuoNCQVJHNEbigBJSMJ/Nz8iIg2hwDISJBoF+iojbXdGSn33
 iuRrS4WnbgahtIMzOO851+vqzuxvJXNTwMzzgzKRG+htVk/YoO5D6Sl5UXS9/pHBIaQRFqGp
 2RCncWChMgWBIyJvDyARqMKBr7Bz+aINnjQjEBiG7El9i+x4DizcIZI+jZ8KUx1dMEedlfBZ
 VTPkRlc6J9aID2haqofS5mqF80gwKzkFNLkfvPZdNxDZt52bgDv1Dtvbk6ZxWyrkEUqnawlI
 pCdWcKtC38ADuJg1jXeb/8d0Lsuygg6xGXaX5e9yA6ouZKUfnWVVLwGInOHaeR/56SByC3c6
 9tFPtGG4wleWub5JCLQ9OYuwUsidCZhQ8qs8ooOK7DFe1A9cI08NxPP6ZkmR9JFtKFQqsvJo
 DavV1dT1wfcinKSfG1mdUtfhKPTsYdX9CxkbH18bQr0ixDPcq70sv5BKsJfka0PsbU6kKUqF
 6Rtl9CoWKwnd9jRx9gKgXARRqRGfQ/juw+BNjHNjNMXL885HFyhFjMJk2LSGMgy4smf75FWT
 0WIjF+zfHb6b10K4DzqQPyu1UitmnMWhfh/WUDFSvEKJhW0qdE2dXOv3qFpSy3pFfkl7mHCv
 +pxKUlwmAUwi9VtrImhaV6s9O9F7NeS7mIFRjKGvN5axAHR/3a5wJ8obdtkiQv1DTuukI37P
 LU98h0JGKFf9Lq8m9YmQukDIGNXz4eHmoK2OSw+RiuTNwnwUuw+SpREtOEW3pBwKnZikVPec
 iqyFhNyZeTh1B/NeLLJGDcYUw==
IronPort-HdrOrdr: A9a23:YdVeBa0CNvNo9YmPXLN7lwqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; d="scan'208";a="102479599"
Date: Thu, 30 Mar 2023 14:04:23 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, Paul Durrant
 <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Richard
 Henderson <richard.henderson@linaro.org>, Philippe
 =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Chuck Zmudzinski
 <brchuckz@aol.com>
Subject: Re: [PATCH v3 4/6] hw/isa/piix3: Avoid Xen-specific variant of
 piix3_write_config()
Message-ID: <3bd7846b-2782-4857-b298-817fd683044e@perard>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-5-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230312120221.99183-5-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=446aa7e4f=anthony.perard@citrix.com;
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

On Sun, Mar 12, 2023 at 01:02:19PM +0100, Bernhard Beschow wrote:
> Subscribe to pci_bus_fire_intx_routing_notifier() instead which allows for
> having a common piix3_write_config() for the PIIX3 device models.
> 
> While at it, move the subscription into machine code to facilitate resolving
> TYPE_PIIX3_XEN_DEVICE.
> 
> In a possible future followup, pci_bus_fire_intx_routing_notifier() could
> be adjusted in such a way that subscribing to it doesn't require
> knowledge of the device firing it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

