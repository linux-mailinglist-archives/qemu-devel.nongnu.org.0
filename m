Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55982760DF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 21:19:08 +0200 (CEST)
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLAIF-0003mV-TT
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 15:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLAG9-0002Yx-4E
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:16:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kLAG7-0006Sp-K6
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 15:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600888614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qatDLIgE/EBO+TJjpmEbTaTttL6kZuZOZDTxY0jx3oA=;
 b=batsNsELk+B6FHbjs5UtQtVKTUx3c3rnuoulgG7ZjxrCbmh8HnvqRyDwzkMABIE5GaDo8d
 IvMCQbE6Mzc9e/tbric9mT86u3BB0vlBYbXkX/K4mghUIoho/mDqngIitJda4fpkPQh/ZG
 nX1bBeG0QU3WCPUXZqfpvOauoB+KXIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-3rTjbXNBNs-J6o557-PxEg-1; Wed, 23 Sep 2020 15:16:46 -0400
X-MC-Unique: 3rTjbXNBNs-J6o557-PxEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DCB2800400;
 Wed, 23 Sep 2020 19:16:45 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4829D78823;
 Wed, 23 Sep 2020 19:16:45 +0000 (UTC)
Date: Wed, 23 Sep 2020 15:16:44 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 37/38] qapi/visit.py: remove unused parameters from
 gen_visit_object
Message-ID: <20200923191644.GZ3312949@habkost.net>
References: <20200922210101.4081073-1-jsnow@redhat.com>
 <20200922210101.4081073-38-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200922210101.4081073-38-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 22, 2020 at 05:01:00PM -0400, John Snow wrote:
> And this fixes the pylint report for this file, so make sure we check
> this in the future, too.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


