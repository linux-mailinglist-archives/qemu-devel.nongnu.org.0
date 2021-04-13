Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CF35D688
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 06:39:50 +0200 (CEST)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWAq5-0003LB-HI
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 00:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWAp5-0002up-Q0
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 00:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWAp2-0002lJ-SU
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 00:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618288720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o8C8HvIKQONAiRoSAuYe5Ome176OMNoWgRCP2eK01oU=;
 b=JQdBUTorncbTXZAy+wo8yvR/HUcDYPd0V/G0t6cwjR6hhK8YIaMuCG4GAt4DdJUMGSZNGU
 A9sqawtvUfNUa51NJVMTeKd97lQP5tIhnRKHoOpAybeMYJGbYHuGnEIC1pPUO39zWE1exQ
 1Rnm3AxmdZIjOxejm8euqqU4BICsxmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-24o1qoE-PACwVRLfT5HJ4Q-1; Tue, 13 Apr 2021 00:38:35 -0400
X-MC-Unique: 24o1qoE-PACwVRLfT5HJ4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21D6107ACCD;
 Tue, 13 Apr 2021 04:38:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AFE5C1BB;
 Tue, 13 Apr 2021 04:38:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B9B0113525D; Tue, 13 Apr 2021 06:38:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: any remaining for-6.0 issues?
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
Date: Tue, 13 Apr 2021 06:38:32 +0200
In-Reply-To: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 (Peter Maydell's message of "Mon, 12 Apr 2021 16:32:42 +0100")
Message-ID: <87mtu223zr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> Last call to note anything we need to fix for 6.0 on
> https://wiki.qemu.org/Planning/6.0#Known_issues please.

Done for

    [PATCH 0/1] sphinx: qapidoc: Wrap "If" section body in a paragraph node

I asked how to get it merged last week:

    Message-ID: <87r1jmzb1n.fsf@dusky.pond.sub.org>
    https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg00818.html

"In 6.1" is a valid, if sad answer.

> The schedule is to tag rc3 tomorrow, which I would ideally like
> to be the last rc before release. After rc3 I will only be taking
> fixes for bugs which are absolutely critical...

Understood.


