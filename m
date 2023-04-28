Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803386F144E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:42:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKbo-0002bu-4T; Fri, 28 Apr 2023 05:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psKbj-0002bS-GW
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psKbi-0007JW-3j
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682674896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uaYtgnj1E9JP8WLhzfRe8BEE7qzzn/V0CJU6bNrRYOQ=;
 b=eVwMMp41RL9Bgzm5pjk4ByGE5m/HiQPv1dm6BH7oKxMejLmeb0h2BiZp6hWPFK0Rn3oKrW
 /ifX8A1K8rPrFq5SQ7zlXAYo/1IUkcV9+cmv3TMhuBaHpNbsZydfbEFHi6T9+XckL93xkV
 8tWIYqymAPsb8QJs0qJwyvMcBuLudiQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-SXxyKEvRPNejcMsMbPl6AA-1; Fri, 28 Apr 2023 05:41:34 -0400
X-MC-Unique: SXxyKEvRPNejcMsMbPl6AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D35893810B02;
 Fri, 28 Apr 2023 09:41:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC70D1121315;
 Fri, 28 Apr 2023 09:41:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A54F421E66EF; Fri, 28 Apr 2023 11:41:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,
 quintela@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org
Subject: Re: [PATCH 00/16] qapi qga/qapi-schema: Doc fixes
References: <20230404115912.2829251-1-armbru@redhat.com>
 <5aa56e46-a411-ce0a-58ca-9695c1215a70@yandex-team.ru>
Date: Fri, 28 Apr 2023 11:41:32 +0200
In-Reply-To: <5aa56e46-a411-ce0a-58ca-9695c1215a70@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 4 Apr 2023 15:58:06 +0300")
Message-ID: <87sfckny2b.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 04.04.23 14:58, Markus Armbruster wrote:
>> It's always nice to get doc fixes into the release, but if it's too
>> late, it's too late.
>> Generated code does not change, except for the last patch, which moves
>> a bit of code without changing it.
>
>
> I didn't deeply check the details, but looked through and nothing seems wrong to me. Good cleanup!
>
> all patches:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Thanks!  (Belatedly)

> PS: do you plan some automatic checks in build process to avoid similar style/naming problems in future?

I'm about to post patches that make it somewhat harder to screw up
indentation (PATCH 10 fixes such screwups).  Harder, not impossible,
because indentation is meaningful in rST.

I believe the best way to catch argument description screwups is making
argument descriptions mandatory.  I hope to find time for that.

Other than that, no promising ideas, I'm afraid.


