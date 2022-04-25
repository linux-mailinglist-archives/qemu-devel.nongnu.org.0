Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DF50E181
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:22:59 +0200 (CEST)
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niyg6-0004jn-PG
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1niyd6-0001pR-QN
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1niyd4-0001oy-3o
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yb4+GJwfImq8gPJ+GUlH92vOJKl71bw5AeeZyXxF+l0=;
 b=MYihGUq6wgFa0TTCouGBMzyL7P9bWwJHCbnTdVdD/YPJH52lVfQL5Ja7wIfTmdniHldYLN
 v3eeu31yEZo37RN8AGROBQUsGPjS7Ya1Kq1Y98bzKA8lfEETEv6skA27Bzdn6T0r0jU/UD
 E28/LEZ6P8JjOdUH6x7FHHV7dx2L2F4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-hM3TvezQN6Ov68F0WQPaCQ-1; Mon, 25 Apr 2022 09:19:47 -0400
X-MC-Unique: hM3TvezQN6Ov68F0WQPaCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86E8118E52C0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:19:47 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D7131121320;
 Mon, 25 Apr 2022 13:19:45 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:19:43 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 11/12] remove sub-dependency pins from Pipfile
Message-ID: <Ymaf77sfhrqYVvsA@paraplu>
References: <20220422184940.1763958-1-jsnow@redhat.com>
 <20220422184940.1763958-12-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422184940.1763958-12-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
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
Cc: Cleber Rosa <crosa@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 02:49:39PM -0400, John Snow wrote:
> Now that we've got a Pipfile.lock generated that works, we can remove
> the static pins from the Pipfile to allow various dependencies to be
> added or removed as necessary when updating our direct dependencies in
> the future.
> 
> So long as --keep-outdated is always passed to Pipenv, items that aren't
> absolutely necessary to update will not be, which will help keep our
> requirements more at the very oldest possible versions that still work.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Makes sense.

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

PS: I see that you've also documented a summary version of Pipfile.lock
    et al in FILES.txt; thank you.

[...] 

-- 
/kashyap


