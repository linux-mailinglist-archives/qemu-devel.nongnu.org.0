Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B061127CF37
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 15:33:08 +0200 (CEST)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNFkh-0005PU-Q6
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 09:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNFjN-0004cl-MH
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 09:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNFjK-00006l-UD
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 09:31:45 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601386300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/421ktFcbgq5jFLd7OoQ6SbZN76zdpHnh8aEHfXy2ho=;
 b=Zje5chftn2xvk7C1p6IYMmKypbN4usbA4woA7ebInuM/NFqC1T30Q64xO08IrhtbxSRbcy
 6hGY/bXEjtfPPw0SXCAWYjbof5+EOXN+t5ip3ibZMRS67Hj9x7aSNhEvlyzWuIIjbuPJRK
 oXMmar/gouWKCCItWMz77JoSJ3J5seI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-FGL8mvX6Ogq6bLxd67eBpg-1; Tue, 29 Sep 2020 09:31:38 -0400
X-MC-Unique: FGL8mvX6Ogq6bLxd67eBpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157A18015DB;
 Tue, 29 Sep 2020 13:31:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA48273663;
 Tue, 29 Sep 2020 13:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F149113864A; Tue, 29 Sep 2020 15:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 00/21] Convert QAPI doc comments to generate rST
 instead of texinfo
References: <20200925162316.21205-1-peter.maydell@linaro.org>
Date: Tue, 29 Sep 2020 15:31:35 +0200
In-Reply-To: <20200925162316.21205-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 25 Sep 2020 17:22:55 +0100")
Message-ID: <87eemkr9oo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> This series switches all our QAPI doc comments over from texinfo
> format to rST.  It then removes all the texinfo machinery, because
> this was the last user of texinfo.
>
> I think I have now resolved all of Markus' issues raised in his
> review of v5, and IMHO this is ready to commit.  If there are still
> things needing fixing, it would be nice if we were able to commit
> patches 1-5, which are the ones which add the new indent-sensitive
> code to the QAPI parser.  That would put a stop to the steady trickle
> of doc-comment changes which break the new rules...

I found several small things to improve.  I'll now try to address them
in my tree.  If I fail, I'll take PATCH 01-05 now, and ask for a respin
of the rest.

[...]


