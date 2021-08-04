Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AA3DFD3F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:49:09 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCaK-0007oG-EK
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBCZY-000799-K7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBCZW-000781-P7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628066897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cKGsg9g3hPrpn8RTrtFeFfdn9z1WcNqisXbeYyQWeek=;
 b=bmbiIk4kNwrE0BJLPRzpfs6XINPifgwcFlaQfDXHA9aa61XSK10uHKxDPj5KZVHTi61Jbb
 0oeURfr9IwSfUI86OOzvmSnzFwFNvJV0FAuL6u2FD58zoXgozLSFjCmjFOKH4H8bZANmlM
 PIWGEqcelJHuAvXOTLnPmBM0ua0bOk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-xztaExjMMiqWg1AnTBlCfA-1; Wed, 04 Aug 2021 04:48:16 -0400
X-MC-Unique: xztaExjMMiqWg1AnTBlCfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82261107ACF5;
 Wed,  4 Aug 2021 08:48:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 505CB19C44;
 Wed,  4 Aug 2021 08:48:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CEA3211380A0; Wed,  4 Aug 2021 10:48:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/3] docs: convert qapi-code-gen.txt to qapi-code-gen.rst
References: <20210720235619.2048797-1-jsnow@redhat.com>
 <CAFEAcA8fG4Tuk04VuOHoeRBPdjvgDYhyyBUqyKOj045=uqxH1Q@mail.gmail.com>
Date: Wed, 04 Aug 2021 10:48:13 +0200
In-Reply-To: <CAFEAcA8fG4Tuk04VuOHoeRBPdjvgDYhyyBUqyKOj045=uqxH1Q@mail.gmail.com>
 (Peter Maydell's message of "Tue, 27 Jul 2021 13:48:55 +0100")
Message-ID: <87im0lioj6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 21 Jul 2021 at 00:58, John Snow <jsnow@redhat.com> wrote:
>>
>> Patch 1 does (roughly) the bare minimum, patch 2 adds some formatting,
>> and patch 3 adds cross-references.
>>
>> John Snow (3):
>>   docs: convert qapi-code-gen.txt to ReST
>>   docs/qapi-code-gen: Beautify formatting
>>   docs/qapi-code-gen: add cross-references
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Let's queue this after my "[PATCH] docs/devel/qapi-code-gen: Update
examples to match current code".

For 6.1, or "don't rock the boat now"?


