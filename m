Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC2C24901C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 23:31:53 +0200 (CEST)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k89Cy-0002qP-Cn
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 17:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k89Bt-0002NS-N4
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 17:30:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26571
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k89Bq-0004Zv-Sl
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 17:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597786240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OscN3Odz1QQpF74Zwq965J8y5fAWpiUPlgLENO8pCsA=;
 b=fX2PB0ig3Pgm2IRIy0uNwFaJ1l/SY2elhZ7ETAfyV+M+3ZcNezzjHFM1iICmQma3I47SRM
 +9hlE1AKC9LaZ06qDJZ4xqwofaz0ak+4SqWoy9Y6oLcGQ2JpAOpSHx4mPndtwHi0WjP/hh
 xY2Q9JwRJFx+xVrlYhyqfD8osZdM/dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-HfXF-PBTNviqzzRLhlg5eg-1; Tue, 18 Aug 2020 17:30:37 -0400
X-MC-Unique: HfXF-PBTNviqzzRLhlg5eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74BE981F021;
 Tue, 18 Aug 2020 21:30:36 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45ED31002391;
 Tue, 18 Aug 2020 21:30:34 +0000 (UTC)
Date: Tue, 18 Aug 2020 17:30:33 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/41] pl1110: Rename PL1110 enum
Message-ID: <20200818213033.GB500103@habkost.net>
References: <20200813222625.243136-1-ehabkost@redhat.com>
 <20200813222625.243136-2-ehabkost@redhat.com>
 <3af41d38-3d5f-bdc3-9624-8848151992ae@amsat.org>
MIME-Version: 1.0
In-Reply-To: <3af41d38-3d5f-bdc3-9624-8848151992ae@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 15:10:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing maintainer (pmaydell).

On Fri, Aug 14, 2020 at 07:45:40PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/14/20 12:25 AM, Eduardo Habkost wrote:
> > The PL1110 enum value name will conflict with the PL1110 type
> > cast checker, when we replace the existing macro with an inline
> > function.  Rename it to PL1110_STOCK.
> 
> typo s/PL1110/PL110/ in subject and description.

Thanks for spotting that!  Will be fixed in v2.

> 
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  hw/display/pl110.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/display/pl110.c b/hw/display/pl110.c
> > index c2991a28d2..4664fde3f2 100644
> > --- a/hw/display/pl110.c
> > +++ b/hw/display/pl110.c
> > @@ -42,7 +42,7 @@ enum pl110_bppmode
> >  /* The Versatile/PB uses a slightly modified PL110 controller.  */
> >  enum pl110_version
> >  {
> > -    PL110,
> > +    PL110_STOCK,
> >      PL110_VERSATILE,
> >      PL111
> 
> For completeness I'd also rename PL111.
> 
> What about:
> 
>  enum pl110_version
>  {
>     PL110_VERSION,
>     PL110_VERSATILE_VERSION,
>     PL111_VERSION
>  }
> 
> ?

That would work too, although I'm more used to enum values to
have a common prefix instead of a common suffix.

Any objections to:

  enum pl110_version
  {
      VERSION_PL110,
      VERSION_PL110_VERSATILE,
      VERSION_PL111
  }

?

-- 
Eduardo


