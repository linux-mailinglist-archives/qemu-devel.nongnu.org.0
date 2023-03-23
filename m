Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1068A6C6516
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfICt-0004fp-L6; Thu, 23 Mar 2023 06:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439de8c1e=anthony.perard@citrix.com>)
 id 1pfICr-0004fW-06
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:30:05 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439de8c1e=anthony.perard@citrix.com>)
 id 1pfICo-000771-Ps
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679567402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E8F6wRr5iSbNAZFQckGgVmxQX0o0SKgl7mU+nuPfjHs=;
 b=dplU5sBDakMFrbujEaBvP9iyHdxAbphr5tzP7iiGkZCbnwTApUVZYMYa
 TRKrMvd0NyD+MC7C0HfVRSL/CQrjhNviPNjhXGJFwy08ZC+qxzS04vvdy
 8xeA3/4h0K0V+89LiAALZl4TE+nBprXZOQPyLPMLmCRf8mUENG/8sIINM M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 104414549
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:sk1DWK71k/ASEX4nGGMYawxRtFfAchMFZxGqfqrLsTDasY5as4F+v
 mYaWDqOOa2OMGHwLd0jOtvj9R5XusKEnNZnQQZkqXhkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasR5weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 cc3KxMXTiG4uueQ6pGJeuhivsocM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7E+
 juaojioav0cHOeFwiGh/UrwusPkmzGhA5lIOLK2p/E/1TV/wURMUUZLBDNXu8KRhlG7RIh3K
 koa4CMioKE+skuxQbHVRxSlpFaUsxhaXMBfe8Uj5QSQj6bZ/QudLm4DSDFHdZohrsBebSQg0
 VmbntXoLSZivL2cVTSW8bL8hTG1MC9TKCkHbDUYTA0ey975qYo3g1TESdMLOKezjcDvXzi2y
 iqNtiEWgK8ahsoGka68+DjvmCmwr5LESgo04AT/XW+/6A59Iom/aOSA91nY9/9FaomQVFmet
 Xwsks2SqusJCPmlhCGLBekAArytz/KEKyHHx05iGYE78Dag8GLleppfiBlnOUZvLssAcBfzb
 UPTsB8X75hWVFOmYq5zaY+rF+wwwKTgHMijXffRBvJWb4R8bkmC9TBiaEqU92TslkE2luc4I
 5jzWc+0AGwTE6hP0Du8TOBb2rgurh3S3kuKG8q9lU7+l+PDOjjME+xt3Eaygv4RyJiroybP0
 +dkCs6s4TZtYOzwWifo7ttGRbwVFkTXFawauuQOKLHSeVQ7SDh6YxPC6eh/ItI4xsy5gs+Np
 yjgAREAlTITkFWdcW23hmZfhKQDtHqVhVYyJmQSMFmhwBDPiq7/vf5EJ/PbkVTKndGPLMKYr
 NFfIa1s+twVFlz6F801NPERVrBKehWxnh6pNCG4ejU5dJMIb1WXpY65J1O2rnNeUXHfWS4CT
 1qIiGvmrWcrHVw+XK46ltr2p79OgZTtsL0rBBaZSjWiUE7t7JJrO0TMsxPDGOlVcU+r7mLDj
 26+WE5IzdQhVqdoqbElc4jf9Nz3ewa/d2IHd1TmAUGebnSHozrykdQbD45lv1n1DQvJxUlrX
 s0Np9mUDRHNtAwiX1ZUe1qz8Z8D2g==
IronPort-HdrOrdr: A9a23:6BnEEK0jqoc7g57AKSUPDgqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; d="scan'208";a="104414549"
Date: Thu, 23 Mar 2023 10:29:52 +0000
To: David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
CC: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
 <xen-devel@lists.xenproject.org>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 09/27] hw/xen: Add evtchn operations to allow
 redirection to internal emulation
Message-ID: <209fe980-7f9d-4d79-90fb-12e38f12b2bc@perard>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
 <20230307171750.2293175-10-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307171750.2293175-10-dwmw2@infradead.org>
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=439de8c1e=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
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

On Tue, Mar 07, 2023 at 05:17:32PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The existing implementation calling into the real libxenevtchn moves to
> a new file hw/xen/xen-operations.c, and is called via a function table
> which in a subsequent commit will also be able to invoke the emulated
> event channel support.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>

Hi David, Paul,

This patch prevents existing use case from booting, that is even with the
state change notification fix. It seems that trying to create a PV guest
with libvirt fails, with "xen be core: can't connect to xenstored" in
QEMU's log but it doesn't says if that's the reason qemu failed to
start. But it's probably not related to libvirt.

Our bisector pointed out this patch, see details and logs:
    https://lore.kernel.org/xen-devel/E1pdvdx-0006lh-Oe@osstest.test-lab.xenproject.org/
    https://lore.kernel.org/xen-devel/E1pcg3G-0000NS-9x@osstest.test-lab.xenproject.org/
    https://lore.kernel.org/xen-devel/E1pf9hf-0005EB-1r@osstest.test-lab.xenproject.org/

I did run a test with patch "Fix DM state change notification in
dm_restrict mode", but I think only the *dmrestict* tests have been
fixed.
    http://logs.test-lab.xenproject.org/osstest/logs/179868/

Some failures of running PV guests without libvirt, from that flight:
    http://logs.test-lab.xenproject.org/osstest/logs/179868/test-amd64-amd64-xl-qcow2/info.html
    http://logs.test-lab.xenproject.org/osstest/logs/179868/test-amd64-i386-xl-vhd/info.html

Any idea of what's wrong?

Thanks,

-- 
Anthony PERARD

