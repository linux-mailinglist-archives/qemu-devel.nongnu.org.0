Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78150A043
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:03:04 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWSc-0003FU-SZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nhWNp-0004x2-8P
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nhWNm-00057g-5V
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650545880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xCSxTazBpZuImVax2vZDMVVaCu5qjjuzfO3Md94Y+Vc=;
 b=dRPvw6zcUP9qtOTLnsI3lMXeShU57VpntY3BJcKi2u1GALqXuc8HawZHUxtKWROGod+mdj
 5VUMc1HHQ8ODmZ5DXePuo/6LalbZE/JyiZoTaJqjzGd+nXMRncD/kGpiotV3kkaQcMkeoz
 ONcXl24/1MBI4kXU9bT/FaIdMUak/Is=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-AiknFicfOdG2HKCwduJ49Q-1; Thu, 21 Apr 2022 08:57:56 -0400
X-MC-Unique: AiknFicfOdG2HKCwduJ49Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C961802C16;
 Thu, 21 Apr 2022 12:57:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3D2B2166B48;
 Thu, 21 Apr 2022 12:57:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Anders Pitman <anders@apitman.com>, qemu-devel@nongnu.org
Subject: Re: Future of libslirp in QEMU
In-Reply-To: <ac3d61d4-17d0-49d4-8eb2-27e450d51928@www.fastmail.com>
Organization: Red Hat GmbH
References: <8f5cc095-e5e9-486d-8e52-d22cac6d2379@www.fastmail.com>
 <a78fd584-2d40-cbd4-95db-8a6729087a93@gmail.com>
 <ac3d61d4-17d0-49d4-8eb2-27e450d51928@www.fastmail.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Thu, 21 Apr 2022 14:57:54 +0200
Message-ID: <87y1zy8ugd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Apr 20 2022, "Anders Pitman" <anders@apitman.com> wrote:

> Awesome, thanks.
>
> Apparently I'm not properly performing a date-sorted search on the list archives. I started here:
>
> https://lists.gnu.org/archive/html/qemu-devel/
>
> Then entered "slirp" and searched with chronological order, but the latest entry is from 2020. What am I doing wrong?

FWIW, I'd recommend searching the qemu-devel mailing via public inbox on
lore:

https://lore.kernel.org/qemu-devel/

[I got the same outdated results on the page you listed, no idea what is
wrong there.]


