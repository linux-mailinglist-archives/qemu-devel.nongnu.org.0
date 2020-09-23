Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0366276108
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 21:28:24 +0200 (CEST)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLARD-0008Ts-KU
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 15:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLAPZ-0007Xn-Gb
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:26:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLAPX-0007ao-NW
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600889198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=COQx/ReFSStWEUMijidMWig5dAVTpmxc97ITtO6uLsI=;
 b=d1HzC3XyMbGxyxJHSSnImMtYh0zuF6l7TbbmsWETaTR5ZKSiW61bFssAJbm7Hy9+IoqHsO
 x5mJrPnqA9wc+aBQS5Sb3j0iFZX9k8daDvFYyzz7pX5/u8+8nOEKHobxk3Zu/WPoUz/sQM
 OldiT4P1PgdGg0+fJxChMx3OGD8zBMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-r6Papr-rNwqAA5htBbd6KA-1; Wed, 23 Sep 2020 15:26:36 -0400
X-MC-Unique: r6Papr-rNwqAA5htBbd6KA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF94D1017DD0;
 Wed, 23 Sep 2020 19:26:35 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C1949CBA;
 Wed, 23 Sep 2020 19:26:35 +0000 (UTC)
Date: Wed, 23 Sep 2020 15:26:34 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/16] qapi/expr.py: Remove 'info' argument from nested
 check_if_str
Message-ID: <20200923192634.GB3312949@habkost.net>
References: <20200922211313.4082880-1-jsnow@redhat.com>
 <20200922211313.4082880-2-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922211313.4082880-2-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 05:12:58PM -0400, John Snow wrote:
> The function can just use the argument from the scope above. Otherwise,
> we get shadowed argument errors because the parameter name clashes with
> the name of a variable already in-scope.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


