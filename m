Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B365FD70E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:27:51 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuVJ-0005nX-RP
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oitm8-0005ua-Fr
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oitlt-0006M0-2p
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665650450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vP0/LBVa1f1E1gXHRHrXHEdv5usMBX3+rdMoFawr9To=;
 b=DZ7q+vtKPnbdQQTlyJa/jEFfHi0XCPx63fcTLsoXc0Blyl2EHykX4ShGKQYTywmCOKZPGk
 5UCLwh9UsMtHqanRLVll9ziO2N0sVL6qWfhz7NHA7jBP3weQOVB+NMIjmk3QmaKc0x3e15
 jy7FLYRfYORv67Mm6VwL+lOzFNtsxgY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Y8nf09j7PHekbkZ_g9nhIQ-1; Thu, 13 Oct 2022 04:40:45 -0400
X-MC-Unique: Y8nf09j7PHekbkZ_g9nhIQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B895C1C068C6;
 Thu, 13 Oct 2022 08:40:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8604B1759E;
 Thu, 13 Oct 2022 08:40:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DF1321E691D; Thu, 13 Oct 2022 10:40:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  pbonzini@redhat.com,  stefanha@redhat.com,
 peter.maydell@linaro.org,  agraf@csgraf.de
Subject: Re: [RFC PATCH 4/4] docs/devel: try and improve the language around
 patch review
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-5-alex.bennee@linaro.org>
Date: Thu, 13 Oct 2022 10:40:43 +0200
In-Reply-To: <20221012121152.1179051-5-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 12 Oct 2022 13:11:52 +0100")
Message-ID: <87zge0yv3o.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> It is important that contributors take the review process seriously
> and we collaborate in a respectful way while avoiding personal
> attacks. Try and make this clear in the language.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


