Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D850C09F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 22:11:29 +0200 (CEST)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhzcl-0005Y0-SG
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 16:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhzbf-0004mb-6r
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhzbP-0002gs-Pr
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 16:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650658203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C0km3zs4AAcQ+2PEB0bcBXr7mthtrsYM9+Iw/CrAj/Y=;
 b=b4aNcOZaFpoow6Z9er1zU+8RPvtm3OpbPZ6IIsfAQ08c0ueu8sCJRzmiDEPZp70/QrFBa9
 0KcOjZp4EEa+IwWTyqIUWw2vjiXoggO/TIiMXNu4eiOK5Ecf4nQcUNV3huJIrLGxQ1KCQT
 Fr3iDpCQKqJQJrGQR6TP6rFW3o1oKzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-HQk0QaquNjCFlixC2EuXDA-1; Fri, 22 Apr 2022 16:09:59 -0400
X-MC-Unique: HQk0QaquNjCFlixC2EuXDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83E3585A5A8;
 Fri, 22 Apr 2022 20:09:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 306602166B5E;
 Fri, 22 Apr 2022 20:09:56 +0000 (UTC)
Date: Fri, 22 Apr 2022 15:09:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
Subject: Re: [PATCH v2 for-7.1 0/3] qapi: nbd-export: select bitmap by
 node/name pair
Message-ID: <20220422200954.jjs6akap2bccczuc@redhat.com>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <f6d36eb5-2dd7-6139-a021-40733d6482b1@ya.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6d36eb5-2dd7-6139-a021-40733d6482b1@ya.ru>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 hreitz@redhat.com, yuriy.vasiliev@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 12:45:04AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 15.03.2022 00:32, Vladimir Sementsov-Ogievskiy wrote:
> > From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> > 
> > Hi all!
> > 
> > Here is small improvement for bitmap exporting interface.
> > 
> > v2: Sorry for the noise, me trying to find a email service, that don't
> > consider sending patch series by git-send-email as as spam :/
> 
> Aha, and @mail.ru works a lot better. So, that's a candidate for v2 of my "[PATCH] MAINTAINERS: change Vladimir's email address".
> 
> This series itself is OK for reviewing, but email in s-o-b mark may change in v3.

Vladimir, do I have your permission to alter your S-o-b marks from
@ya.ru to @mail.ru (since we have established that you have sent mail
from both addresses, but selected @mail.ru in MAINTAINERS)?  That's
the only thing that's preventing me from queuing this series as-is.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


