Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361904F37F9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:26:47 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbk8r-0007FZ-Vv
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0878235d2=anthony.perard@citrix.com>)
 id 1nbk6Y-0005rH-Jm; Tue, 05 Apr 2022 10:24:22 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:42918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0878235d2=anthony.perard@citrix.com>)
 id 1nbk6W-0000Dp-8o; Tue, 05 Apr 2022 10:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1649168660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZZI+unHahHiJhTMT+graTuIHpLZ2cRUWGttaIkS9G8g=;
 b=cohQS7MHcjSVS+v2axs/ZC08+7nNQODAK5co3PF8JO2W0ZNiV/Sa5M6J
 nOkCsjWL5ZtOLbBxuJOre6G7SqKWIJhxjILLd1rL7vD9eAex6KEnDUxKn
 N2fASpuCH/o0HvcHrQmtiMNUGjkrpIgzCoXXlDKtLz6aLrjbladwiwLVl U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 68068257
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kGda9KreGPa4VtqjvROAuIgSFJVeBmJiZBIvgKrLsJaIsI4StFCzt
 garIBmPPayCazCjc9BwPY3j8EgAvcWHyoM2GwZpqi9jQylH9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Y6q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPInts8cWWUdjDjx3GrxtyYb9Oki1mJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPEyeM0cSZT/7DrowoMKSp1fkWQderU+7goYp4TLK9ixYhe2F3N39P4biqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntTvyRYY6BLC+sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHmXxC+vHOVlhEZUttUVeY97Wml06fR/kOVC3YJShZHb9opstJwQiYlv
 neQktb0QCB1saOUQHa18LCSojWvfy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJs+AZ0ArYm
 1iixBXSTZ1J0qbnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:PcYl2638jRxgM4wUCzfa/AqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; d="scan'208";a="68068257"
Date: Tue, 5 Apr 2022 15:24:09 +0100
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] hw/xen/xen_pt: Resolve
 igd_passthrough_isa_bridge_create() indirection
Message-ID: <YkxRCYmMYYmU3lsW@perard.uk.xensource.com>
References: <20220326165825.30794-1-shentey@gmail.com>
 <20220326165825.30794-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220326165825.30794-3-shentey@gmail.com>
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=0878235d2=anthony.perard@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
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

On Sat, Mar 26, 2022 at 05:58:24PM +0100, Bernhard Beschow wrote:
> Now that igd_passthrough_isa_bridge_create() is implemented within the
> xen context it may use Xen* data types directly and become
> xen_igd_passthrough_isa_bridge_create(). This resolves an indirection.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

