Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243422C6861
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:03:34 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifHZ-0004ns-4y
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kif6w-0000un-WF
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:52:35 -0500
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:58239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kif6u-0005M4-Sm
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1606488752;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jJUcZXbN3G+d9ShSTyFz3C85sAOZLC2pSugnQvqiPxY=;
 b=SRir0pA0xg2rY6NnGEth/v/tfW7VCWwaetiy3WWe5FvCDBA7cPfU3QlL
 mXHGGZ7hmPfQznw49NcWTHNANavJ1CIqR8d7pJMg0hjwUtUf3d6R2+gou
 6XKh3cGzo5+K4LFk7MLU4m9zA26byCFUcGgMRmf2mYSI1X6iVksIIYNhI I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: F81GW4oBIsFnf3DpXILoVgoHENqX4BfBxXBaBnkRhAWH2+0zZ2j/guKA7KooSvnQBEafrTkZ6M
 /oDh/0MtzQL+Oo/kRAgHJctdgjnO7t/IAK5MClGk/Fy5K7LKR/Nl/KgNrDQQTo+g+mlRuwJG/Q
 syHLyYIFRvxFxwKnMBuarl5+WmLWeGYUn1xa1Ucupfe+7PCki/nrGDZZY6ii6ABS+LZCuWPcXk
 1qKpPJ7dPIU7mEFeeOARLuQpowzPwkC6/nkvmQvalyskPkB4lGAc+D0dXvMcOeBlzu0FcYT8nb
 K0U=
X-SBRS: None
X-MesageID: 33214504
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; d="scan'208";a="33214504"
Date: Fri, 27 Nov 2020 14:52:27 +0000
To: Eduardo Habkost <ehabkost@redhat.com>
CC: <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 <xen-devel@lists.xenproject.org>, Richard Henderson
 <richard.henderson@linaro.org>, Claudio Fontana <cfontana@suse.de>, Roman
 Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2 4/6] xen: Delete xen_available() function
Message-ID: <20201127145227.GD2098@perard.uk.xensource.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
 <20201125205636.3305257-5-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201125205636.3305257-5-ehabkost@redhat.com>
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=anthony.perard@citrix.com; helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to: Anthony PERARD <anthony.perard@citrix.com>
From: Anthony PERARD via <qemu-devel@nongnu.org>

On Wed, Nov 25, 2020 at 03:56:34PM -0500, Eduardo Habkost wrote:
> The function can be replaced with accel_available("xen").
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

