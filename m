Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C71D8FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 08:08:33 +0200 (CEST)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1javQW-0005Ws-Na
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 02:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1javPm-00057i-Oo
 for qemu-devel@nongnu.org; Tue, 19 May 2020 02:07:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22712
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1javPl-0008TC-VQ
 for qemu-devel@nongnu.org; Tue, 19 May 2020 02:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589868465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2hND47Sv86D7IuBKDIXMwQhxQSoj9fX/OQTPqm9A/3w=;
 b=Bu/YGQnMRu+KDPmxXq3XX6GtzBaK/VvACQO7I3TeIPzdbxuH7FuM7V+SogKkXmj0pF6EWw
 Zp149HaIidQ4cZsWNoAtTd0Y1huuZPkKy6KfSlEI9nwcSfKCjr/wTay1HcAXYcpFzpbvG+
 ahi2l4KUQZM6UeJrH4vnig5gnicG3l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-TM7H7TT9OJ2vFHBwy8GWpQ-1; Tue, 19 May 2020 02:07:41 -0400
X-MC-Unique: TM7H7TT9OJ2vFHBwy8GWpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18589100CCC2;
 Tue, 19 May 2020 06:07:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA21D60BE1;
 Tue, 19 May 2020 06:07:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46CA611358BC; Tue, 19 May 2020 08:07:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 13/24] ppc4xx: Drop redundant device realization
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-14-armbru@redhat.com>
 <alpine.BSF.2.22.395.2005181226160.5961@zero.eik.bme.hu>
Date: Tue, 19 May 2020 08:07:38 +0200
In-Reply-To: <alpine.BSF.2.22.395.2005181226160.5961@zero.eik.bme.hu> (BALATON
 Zoltan's message of "Mon, 18 May 2020 12:27:58 +0200 (CEST)")
Message-ID: <87h7wc5ufp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Mon, 18 May 2020, Markus Armbruster wrote:
>> object_property_set_bool(OBJECT(dev), true, "realized", ...) right
>> after qdev_init_nofail(dev) does nothing, because qdev_init_nofail()
>> already realizes.  Drop.
>>
>> Cc: BALATON Zoltan <balaton@eik.bme.hu>
>
> Shouldn't this Cc line come after the --- so it's not included in the
> final commit? Thanks.

We routinely include it in git history.

> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Thanks!


