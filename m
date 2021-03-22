Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A614344899
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:06:09 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOM88-0007Us-MT
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOLbK-00064C-E0; Mon, 22 Mar 2021 10:32:15 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:52314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lOLb9-0005EC-Oz; Mon, 22 Mar 2021 10:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1616423523;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nyr8KSk+KDPShgitquX43mntR61x5GxDgHO+N7oBzic=;
 b=dOEtW+gyp47Wjdo8XrOuTAtiyufygIrCbAr52jcnFm+7lw9sztsTtx5j
 Y3hqtdd1p2DBUqTeSnYIvSKTPMmL5G5sDVQ8oflUmct+HaRWTs6zBgsnA
 N4L5xIlMQs8WiKdmuUFgKmxL+QD0D7dfBX6caBY/rzGK6Qc751L0yoAOP c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YVWbBJuBGOAQTWgyEqclvkf4VOJr4eJz3KJSkuniw0VkBeBN7px9XY5p504LvHluUxBhdTehuV
 KjDHwF3WBcrfdo1Qr7ySAEUI/l8H3hl8Y+nW2htupQqOOGmLbazAJtSkklQ0A9bIhMR1T4Cmpy
 tvtUM/K6v5f8qdcH7kC0X7c8xU+mfnOl3SK5zAd8rcad4mr/4InKcks+XwS/6xONHrRCpHFYUT
 BDrIfJrkesy+727zF0QB5ruwUG82YhASU8hV4KmBzb6N5PjxIn0fhLCFJFuU7nBin9NQBAkfc/
 u+g=
X-SBRS: 5.1
X-MesageID: 39812241
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qTNpx66woxGi2m+VigPXweaEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBxh8ri/U2cG9Ev3NGI/MmT9J3j5l1GJDsaCZ1IxQF/FwqdDwlSTA5JGZI2GP
 Onl7d6jhCnfmkaadn+O2kdU4H41pD2vb/vfBJuPW9A1CCgljWtgYSbLzG52VMkXypL0fMe9w
 H+4nfEz4GCl93+9RPGzW/U6P1t6Zfc4/9OHtaFhMRQChiEsHfQWK1bV7ePvC84rYiUgT5A+r
 esnz4aM8t+8H/XdG2uyCGdozXI6zoy92TkjWaRnHqLm728eBsBF8FDiYhFGyGpjnYIgdBm3K
 pHm0KfupZHZCmw+xjV2tnSWxlm0nezuHop+NRj60B3bI12Us4zkaUvuGduVLsQFiPz744qVM
 N0CtvH2fpQeVSGK1jEo2hG2rWXLzsONybDZnJHlt2e0jBQknw85VAf3tYjknAJ8494Y4VY5t
 7DLr9jmNh1P4ErRJM4IN1Ebdq8C2TLTx6JGnmVO07bGKYOPG+IjJLr/rMv5qWPdIYTxJU/3L
 TNOWko9FIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nyX7zuPSqfSE0/kseprvkFa/erGM
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5I6Vju104D2A7yvktaeXOfYJbLrHzphcHj4GG
 E/UD/6I9gF6FuqVH/+iB3YQGjsZUT74JJ1HMHhjqgu4blIErcJnhkeiFy/6M3OFCZLtbYuel
 BiZJn9lLmgmGWw9WHUzmlgNxZHFHxJ6LH4X34in35OD2rENZI4//SWYyR7wWaOLB4XdbKrLC
 dv43BMvZ+RA7PV7yY4EN6jOn+dlBIo1Q23ZqZZvLaC68fjco4/FbA8VsVKZEL2PhRohAdnr3
 pCYgcYRknZUijjk7mhkYZ8PpCgS/BsxAisOsJasnTZqAGVotwuXGISW3q0XdeQmhtGfUseun
 Rht6seiqGHgzChNC82h/k5KkRFbA2scft7JRXAYIVfgbbwfg5sCW+MmDyBkhk2Pm7n7V8biG
 CkLSqaf5jwcxJgk2Ed1qbh61VvcGqBO0p2d3BhqIV4UX3cpWwb657+WoOjl2+KLlcSyOAUNz
 /IJTMUPwN13tiykBqYgiyLG3kqzognV9atRogLYvXWwDegOYeInaYJE7tP8JFpOMvnv+ULXe
 icEjXlWg/QGqcswUiYt3wlMC57pD04ivvuwgTi93X903glA/beSW4WMo0zMpWZ9SzjSPmJ2p
 ki0o5wsuu0L2nratmJjavQdCVOLxvPoWiwC+EkwKokzp4apf92Bd3cVzCNyXRMmBM5J83wnF
 kFQKt67KvaU7UfCPA6amZc5B4xiN+LLEE3qQT4De81YEE1gxbgTqO0yquNraBqH1aIqwTxM0
 SO6iFR///KWC2YyL4RYphAU1h+eQw783Rt/OSLao3WBkGrboh4jSuHDkM=
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; d="scan'208";a="39812241"
Date: Mon, 22 Mar 2021 14:31:54 +0000
To: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, <qemu-block@nongnu.org>
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
Message-ID: <YFiqWsUC2q+01xQD@perard>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210308143232.83388-1-anthony.perard@citrix.com>
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=anthony.perard@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

Hi Paul, Stefano,

Could one of you could give a Ack to this patch?

Thanks,


On Mon, Mar 08, 2021 at 02:32:32PM +0000, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Whenever a Xen block device is detach via xenstore, the image
> associated with it remained open by the backend QEMU and an error is
> logged:
>     qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> 
> This happened since object_unparent() doesn't immediately frees the
> object and thus keep a reference to the node we are trying to free.
> The reference is hold by the "drive" property and the call
> xen_block_drive_destroy() fails.
> 
> In order to fix that, we call drain_call_rcu() to run the callback
> setup by bus_remove_child() via object_unparent().
> 
> Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CCing people whom introduced/reviewed the change to use RCU to give
> them a chance to say if the change is fine.
> ---
>  hw/block/xen-block.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a3b69e27096f..fe5f828e2d25 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
>  
>      object_unparent(OBJECT(xendev));
>  
> +    /*
> +     * Drall all pending RCU callbacks as object_unparent() frees `xendev'
> +     * in a RCU callback.
> +     * And due to the property "drive" still existing in `xendev', we
> +     * cann't destroy the XenBlockDrive associated with `xendev' with
> +     * xen_block_drive_destroy() below.
> +     */
> +    drain_call_rcu();
> +
>      if (iothread) {
>          xen_block_iothread_destroy(iothread, errp);
>          if (*errp) {
> -- 
> Anthony PERARD
> 

-- 
Anthony PERARD

