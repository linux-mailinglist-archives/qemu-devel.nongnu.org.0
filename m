Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11AC181BC5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 15:54:35 +0100 (CET)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC2kl-0001ok-1W
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 10:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jC2jo-00010V-7J
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 10:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jC2jn-0002TN-BS
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 10:53:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40609
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jC2jn-0002T2-7W
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 10:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583938414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuxFAPaknkgR1hDCC5lLvYjwIUA9YYf9cgc79UCZKbs=;
 b=RlLhnhgamCFFr9HtktDNKisLRAqVBM1y0MxLbDV2WwC7dlp2nlwyHPOdzLLWe3RCWRmA+Y
 KwO2qfHxYL9chFwLtC7FywaVA/h90GS1ORt4ofETCkST4kBvd9+oVI+r1H3fK81nqRVO7s
 pPZaJLUhyGgp1cKRVRz0tU5+gUt2kBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-s6HyWgcZNm2-0-JhTy6chA-1; Wed, 11 Mar 2020 10:53:30 -0400
X-MC-Unique: s6HyWgcZNm2-0-JhTy6chA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0987800D48;
 Wed, 11 Mar 2020 14:53:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8820190519;
 Wed, 11 Mar 2020 14:53:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 44DEF11386A6; Wed, 11 Mar 2020 15:53:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 31/33] docs: Stop building qemu-doc
References: <20200228153619.9906-1-peter.maydell@linaro.org>
 <20200228153619.9906-32-peter.maydell@linaro.org>
Date: Wed, 11 Mar 2020 15:53:28 +0100
In-Reply-To: <20200228153619.9906-32-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 28 Feb 2020 15:36:17 +0000")
Message-ID: <87blp3x7rr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> Stop building the old texinfo qemu-doc; all its contents are
> now available in the Sphinx-generated manuals and manpages.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

This appears to lose plain text, PDF and info output.  Any chance to get
plain text back?


