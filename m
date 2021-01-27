Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C437305E6D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:36:25 +0100 (CET)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lvj-0006AY-NT
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l4ltT-0005NC-Qc
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:34:03 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l4ltP-0002z9-Ko
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=AT1hoA1UNGZJvKOaym6NdpJA2jxflUETe1VHMvEmdgA=; b=T7PFT5D2zix9MGdhf4Djl1sSCJ
 6kqLRZJQ/wgzEOZzc50u6o6/tTqSeqlz0H9BbnV14+xLt4eVzMomidkxaJNB4xvO8TVyYqXkSP7N5
 L7FYY1KIqaXKYmszFkOAXbNGljZheMCwLbl/awOlvQRpJLcbWO3QSRHvdzSonpQdsu3VJZwFqE1VJ
 qaEPsEnGpOsr4D9pJd91GXxdngz6XkUKhQLU0CdYjxHpcDLaL3BDDydqcgeZEDOLjEEVbD4nVGnJg
 VxawCzVxHxRWnOwgYX9lk1cu5upc+rAvUzkHAafYYdlRCKc6JQP/JqaGs742JrPuCyeDSl32KcOR5
 V4VJ3v/EwRFveVWQXVGkNiNLycnLg353upMqGsm6HqYPXJVyGHgLbJePCMaiDDvgj0lOm48T298rH
 jVO5lawzO3rS2lYck66CJvZTXSEebLlC2MLoXp+HQwcGByoT6gA/tLG+pANcDop9cdanqppQPNFe2
 n7KYjQeyVd75dwAjNbgb+FOaEeT22SyZjXNBQ2q04dOPh+J/9CKrEM2wMUnGJ92dpWAiXtdVDuksR
 Oo2RZys73XN5Yer89i9uiojmMvVI+DPOJNGXw5YYNDX3kgdoZ2I58hIu+f43Cl4Hr46zlKCg3ybmD
 RzVFhxxuBsjrqTquBYh8/8z84NSAwM6hRaem35dMY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: Update 9pfs tree URL
Date: Wed, 27 Jan 2021 15:33:51 +0100
Message-ID: <1679340.e36fRnoiaZ@silver>
In-Reply-To: <2867808.c4G3KLOmWt@silver>
References: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
 <2867808.c4G3KLOmWt@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 15. Januar 2021 14:50:17 CET Christian Schoenebeck wrote:
> On Freitag, 15. Januar 2021 14:42:24 CET Greg Kurz wrote:
> > I've already moved my repositories to gitlab for extra CI coverage,
> > and I won't use the ones at github anymore.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> > ---
> > 
> >  MAINTAINERS |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cb0656aec3d4..21038d3fdfce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
> > 
> >  F: fsdev/
> >  F: docs/interop/virtfs-proxy-helper.rst
> >  F: tests/qtest/virtio-9p-test.c
> > 
> > -T: git https://github.com/gkurz/qemu.git 9p-next
> > +T: git https://gitlab.com/gkurz/qemu.git 9p-next
> > 
> >  virtio-blk
> >  M: Stefan Hajnoczi <stefanha@redhat.com>

What's the status of this patch? I would add my T: line below just for the 
records. But I'd rather wait for this patch being merged to main line.

Best regards,
Christian Schoenebeck



