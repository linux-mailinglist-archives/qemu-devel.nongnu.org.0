Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0327255B34
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 15:26:33 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBeOm-00040g-Jh
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 09:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBeO5-0003Wo-Vd
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 09:25:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37718
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBeO3-0005dc-Dw
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 09:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598621145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkuuDv/TOLiOAnkDvE4I+K3cIerUtLB7veEjKQernos=;
 b=PJVf2ZM0NYMH/vvx6T3L8CBd8TI3jnDw8aqf9/LOsa9mAKNFyaheJohnZu/3z5+J1OXRDh
 s7ZUrgDibTWYj7LYB5vRZMVdIXGe5LIxRvTZtEXsBpRSyuTfK/AUcv2j6tWZRdfE6ecUnq
 251YdPc3tdOwz7inA5CCwTlugWH6eVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301--CAoY7yrPNuSfXuCTuiPFQ-1; Fri, 28 Aug 2020 09:25:43 -0400
X-MC-Unique: -CAoY7yrPNuSfXuCTuiPFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 798BE81F02E;
 Fri, 28 Aug 2020 13:25:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-79.ams2.redhat.com [10.36.112.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 886C07D66D;
 Fri, 28 Aug 2020 13:25:41 +0000 (UTC)
Subject: Re: [PATCH 00/16] meson: convert unit tests in tests/Makefile.include
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
 <8b4616c8-8984-92ca-42b8-c3bb59bb5a05@redhat.com>
 <CAJ+F1C+0M4HCs0vTXbLmeUn5kjL1ZmhXPZz=8S1V-OYQct3KVA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <772ecc0e-d3d9-5034-0373-b79cf02e5b88@redhat.com>
Date: Fri, 28 Aug 2020 15:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+0M4HCs0vTXbLmeUn5kjL1ZmhXPZz=8S1V-OYQct3KVA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 01:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.809, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/08/2020 14.59, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Aug 28, 2020 at 4:56 PM Thomas Huth <thuth@redhat.com
> <mailto:thuth@redhat.com>> wrote:
> 
>     On 28/08/2020 13.07, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>     > From: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>     >
>     > Hi,
>     >
>     > This series convert the unit tests from tests/Makefile.include to
>     meson.
> 
>     Just an optional idea: What about moving the unit tests to a separate
>     subdirectory a la tests/unit/ , too?
> 
> 
> Sounds like a good idea to me, but there is already quite a lot going on
> in this series :) Let's add that to the todo list, shall we?

Sure, that's why I wrote "optional" :-)

 Thomas


