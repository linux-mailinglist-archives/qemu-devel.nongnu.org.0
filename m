Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2A155566
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 11:15:24 +0100 (CET)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j00fT-0005rd-7Q
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 05:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j00dV-0003nl-GG
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j00dU-00076f-Jt
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:13:21 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58405
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j00dU-00075W-Fp
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581070399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOFH7CSkJDfiLO5dtapMdhzMrDCNcWbkaoV1ATbXF+Y=;
 b=dK/mrqRZxsvb+bynN/rIO/peg9iP3mWVfLVxbUN3fc7QHeoQ19QpNnedq13taXideXM3EL
 kmSSMKTSK+iqpILTO49R3P3c7jGdJZf8ah5YT7Im0hcLEwlwC/mqvj8q9S6fKOboLVZj/c
 haSsaFcTsf09x4PdwCS4H+j5gPMD02w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-TzIexyAyNriu8d8LYAIZmg-1; Fri, 07 Feb 2020 05:13:12 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E881034B3A;
 Fri,  7 Feb 2020 10:13:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-136.ams2.redhat.com
 [10.36.116.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D71C1001B28;
 Fri,  7 Feb 2020 10:13:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE89811386A7; Fri,  7 Feb 2020 11:13:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 13/29] qapi/ui.json: Avoid `...' texinfo style quoting
References: <20200206173040.17337-1-peter.maydell@linaro.org>
 <20200206173040.17337-14-peter.maydell@linaro.org>
Date: Fri, 07 Feb 2020 11:13:04 +0100
In-Reply-To: <20200206173040.17337-14-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 6 Feb 2020 17:30:24 +0000")
Message-ID: <87imkiso27.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: TzIexyAyNriu8d8LYAIZmg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: John Snow <jsnow@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> Avoid texinfo style quoting with `...', because rST treats it
> as a syntax error. Use '...' instead, as we do in other
> doc comments. This looks OK in texinfo, and rST formats it as
> paired-quotation-marks.

It's kind of wrong in TexInfo; results in "Right single quotation mark"
(U+2019) on both ends.  But we're doing it this kind of wrong all over
the place anyway, and the wrongness will go away when we switch to rST.
Acceptable.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


