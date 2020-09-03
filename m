Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9525C70A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 18:38:23 +0200 (CEST)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDsFi-0001fG-CA
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 12:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDsEJ-0000ng-66
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:36:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24914
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDsEH-0003lW-I4
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 12:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599151012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KId+HjDSTVAe20JCdebZBb2h1nHCVGs9Mr5J92SJoYQ=;
 b=eK3dm4jabhS09xJzX1JeLdLT01UFae6H3SWfAYNPoshGu9XOnSibXQ73ph7uXzEwzPkY47
 jAQxVDWDke2cBlL3o/pUo503SZvarcgmvCMxQNNnVQGZ5KQ+hBboeiAS2srmP3+xxmXfF+
 Qn6rvjuPTiQf72n6kdlZlAZUkva9RG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-FWllZ_pAPruQzXhbl475qg-1; Thu, 03 Sep 2020 12:36:51 -0400
X-MC-Unique: FWllZ_pAPruQzXhbl475qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEC05800688;
 Thu,  3 Sep 2020 16:36:49 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4015910013C4;
 Thu,  3 Sep 2020 16:36:49 +0000 (UTC)
Date: Thu, 3 Sep 2020 12:36:48 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 39/63] esp: Rename ESP_STATE to ESP
Message-ID: <20200903163648.GL4940@habkost.net>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-40-ehabkost@redhat.com>
 <469af456-1ad7-0355-1470-798679fa7268@redhat.com>
MIME-Version: 1.0
In-Reply-To: <469af456-1ad7-0355-1470-798679fa7268@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, berrange@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 03, 2020 at 03:01:33PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/3/20 12:42 AM, Eduardo Habkost wrote:
> > Make the type checking macro name consistent with the TYPE_*
> > constant.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > Cc: "Hervé Poussineau" <hpoussin@reactos.org>
> > Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> > Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Fam Zheng <fam@euphon.net>
> > Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> > Cc: qemu-devel@nongnu.org
> > ---
> >  include/hw/scsi/esp.h | 2 +-
> >  hw/dma/sparc32_dma.c  | 2 +-
> >  hw/m68k/q800.c        | 2 +-
> >  hw/mips/jazz.c        | 2 +-
> >  hw/scsi/esp.c         | 6 +++---
> >  hw/sparc/sun4m.c      | 2 +-
> >  6 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
> > index f281625dd5..20800dbf5b 100644
> > --- a/include/hw/scsi/esp.h
> > +++ b/include/hw/scsi/esp.h
> > @@ -67,7 +67,7 @@ struct ESPState {
> >  
> >  #define TYPE_ESP "esp"
> >  typedef struct SysBusESPState SysBusESPState;
> > -DECLARE_INSTANCE_CHECKER(SysBusESPState, ESP_STATE,
> > +DECLARE_INSTANCE_CHECKER(SysBusESPState, ESP,
> >                           TYPE_ESP)
> 
> "ESPDMA" would less likely clash with eventual 'ESP' definition.

I want to make the changes less intrusive as possible.  If the
macro is already called ESP and the type name string is already
"esp", I will just keep the existing naming.

-- 
Eduardo


