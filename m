Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476F1D6688
	for <lists+qemu-devel@lfdr.de>; Sun, 17 May 2020 10:16:35 +0200 (CEST)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaETK-0004Km-8K
	for lists+qemu-devel@lfdr.de; Sun, 17 May 2020 04:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaESP-0003PL-Jw
 for qemu-devel@nongnu.org; Sun, 17 May 2020 04:15:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31255
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jaESO-000417-Tq
 for qemu-devel@nongnu.org; Sun, 17 May 2020 04:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589703335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6wu0BMy/pZdhk5SQFrpryGBuuiOwpAAn01vInkq4W0=;
 b=EESsmsc4n+MQxG2Kiny2pHwCQYulLcddKR8zB4jEuD8OXaZEjSB2j0Ov64u9WsDd2MoaFD
 OGPMrYxsyeBrDvQL/HIyWghVrsmFttYYJZzcqmpsx44CLQi9CwrG7hkw4AN2tiHKHiNx4V
 rxkBV5aUjhJW4LioUzLSAcYUEr/VQZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-cAwfd9NJOb6Om-RZiYzOKg-1; Sun, 17 May 2020 04:15:30 -0400
X-MC-Unique: cAwfd9NJOb6Om-RZiYzOKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 460CF107AFAF;
 Sun, 17 May 2020 08:15:29 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F9365D9D3;
 Sun, 17 May 2020 08:15:26 +0000 (UTC)
Message-ID: <d08212c262c6b623c0ea2bd81e55c849ffa8d00c.camel@redhat.com>
Subject: Re: [PATCH v6 03/14] block/amend: add 'force' option
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Date: Sun, 17 May 2020 11:15:26 +0300
In-Reply-To: <b12bc2a1-7c22-b082-db2d-9d9fc9f826d1@redhat.com>
References: <20200510134037.18487-1-mlevitsk@redhat.com>
 <20200510134037.18487-4-mlevitsk@redhat.com>
 <b12bc2a1-7c22-b082-db2d-9d9fc9f826d1@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 04:15:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-05-14 at 14:18 +0200, Max Reitz wrote:
> On 10.05.20 15:40, Maxim Levitsky wrote:
> > 'force' option will be used for some unsafe amend operations.
> > 
> > This includes things like erasing last keyslot in luks based formats
> > (which destroys the data, unless the master key is backed up
> > by external means), but that _might_ be desired result.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  block.c                   | 4 +++-
> >  block/qcow2.c             | 1 +
> >  docs/tools/qemu-img.rst   | 5 ++++-
> >  include/block/block.h     | 1 +
> >  include/block/block_int.h | 1 +
> >  qemu-img-cmds.hx          | 4 ++--
> >  qemu-img.c                | 8 +++++++-
> >  7 files changed, 19 insertions(+), 5 deletions(-)
> 
> [...]
> 
> > diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> > index 0080f83a76..fc2dca6649 100644
> > --- a/docs/tools/qemu-img.rst
> > +++ b/docs/tools/qemu-img.rst
> > @@ -249,11 +249,14 @@ Command description:
> >  
> >  .. program:: qemu-img-commands
> >  
> > -.. option:: amend [--object OBJECTDEF] [--image-opts] [-p] [-q] [-f FMT] [-t CACHE] -o OPTIONS FILENAME
> > +.. option:: amend [--object OBJECTDEF] [--image-opts] [-p] [-q] [-f FMT] [-t CACHE] [--force] -o OPTIONS FILENAME
> >  
> >    Amends the image format specific *OPTIONS* for the image file
> >    *FILENAME*. Not all file formats support this operation.
> >  
> > +  --force allows some unsafe operations. Currently for -f luks, it allows to
> > +  erase last encryption key, and to overwrite an active encryption key.
> 
> *erase the last encryption key
Fixed, thanks!
> 
> With that fixed:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 

Thanks for the review,
	Best regards,
		Maxim Levitsky


