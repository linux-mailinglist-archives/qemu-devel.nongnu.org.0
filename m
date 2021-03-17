Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7D33ED8C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:55:58 +0100 (CET)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSuD-0006Tt-W3
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lMSt7-00060w-62
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lMSt5-0000Bb-Nr
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615974886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZoGPBl7yakNhUIB6yDi+NXgWNcPflNkRpBQRKdHLRY=;
 b=YPGQAyCQuwGDBuLmDW8Ay4k26w87Nw5TnOIL2K8/snYnISJ9nGUVJgfdH9Jj5RkCRKnovc
 Ao8Z7gpdlvms40NH3Vsh4DaEPRefbeuJQS50vqDEJNvOkR8A/DINN9sjOFns7Lv9E4ZaVL
 DTyXtOKxSVSA1kWYDR8zwyapPjc8Okg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-zqprqOcFN32fDz8z-ubyNg-1; Wed, 17 Mar 2021 05:54:44 -0400
X-MC-Unique: zqprqOcFN32fDz8z-ubyNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE76A19251A0;
 Wed, 17 Mar 2021 09:54:43 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFA0E5C1CF;
 Wed, 17 Mar 2021 09:54:42 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:54:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Reinoud Zandijk <reinoud@NetBSD.org>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210317105440.15d95133@redhat.com>
In-Reply-To: <YFHEsXnxK62EXYLv@dropje.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316135301.4fd08476@redhat.com>
 <YFDcxAK8/XokMJoi@diablo.13thmonkey.org>
 <20210316181750.6306bfc5@redhat.com>
 <20210316213408.0de27ac2@redhat.com>
 <YFHEsXnxK62EXYLv@dropje.13thmonkey.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 09:58:25 +0100
Reinoud Zandijk <reinoud@NetBSD.org> wrote:

> On Tue, Mar 16, 2021 at 09:34:08PM +0100, Igor Mammedov wrote:
> > Thanks for reporting it before it was released
> > please test/review fix that I've just posted:
> > 
> >  "[PATCH for-6.0] x86:acpi:piix4: reinitialize PM1.CNT on reset"  
> 
> I've tested qemu with the patch, booted the install without specifying the
> machine with -M and it boots!
Thanks for testing.

> Thanks! I think it could be considered fixed now?
I think so.

If you wish, you can reply here with 'Tested-By:'
so your contribution would be mentioned in commit message,
and may add "Reported-by:" as well (sorry I forgot about including it)

> 
> Reinoud
> 


