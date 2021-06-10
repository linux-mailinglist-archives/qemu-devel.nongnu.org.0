Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9883A2BBF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:38:14 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJwr-0003O6-Bs
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrJvv-0002RR-KP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrJvp-0008SW-FK
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623328627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1n8gccanYkigZVxxbpKS0Add2fM0op1eMforM4vPcc=;
 b=DdF65eSQHlgA61jXyNR04s3lSvJRybLEUAZtiI70PXeES1IwuFFJJ/HzJ6RDk5RMYC8EgI
 yQx18mxrY/e9m6B5fhssrZrOD+14UMlHhJCufJ0LvNtJsg0Jkn8cc0cd8HfNJA7Qq+jI0j
 2soMUiS9rCqNbTcTqUIlVYidI85mplE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-478ush58NDWxIZzCZAot_g-1; Thu, 10 Jun 2021 08:37:05 -0400
X-MC-Unique: 478ush58NDWxIZzCZAot_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E92A100C610;
 Thu, 10 Jun 2021 12:37:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A29B10016F8;
 Thu, 10 Jun 2021 12:37:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BAC76113865F; Thu, 10 Jun 2021 14:37:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 02/11] qapi/misc-target: Group SEV QAPI definitions
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-3-philmd@redhat.com>
 <875yymdpo7.fsf@dusky.pond.sub.org>
 <043f0098-d043-b649-9b2d-1ebee6f5f92c@redhat.com>
Date: Thu, 10 Jun 2021 14:37:02 +0200
In-Reply-To: <043f0098-d043-b649-9b2d-1ebee6f5f92c@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 10 Jun 2021 12:15:39
 +0200")
Message-ID: <87o8cd6glt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 6/10/21 11:39 AM, Markus Armbruster wrote:
>> Just code motion, so
>>=20
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>>=20
>> Opportunity to wrap the long doc comment lines.  Should be kept under 70
>> or so.
>
> Hmm is that a QAPI specific requirement? It is not enforced by
> checkpatch, and still in the 80-90 grey area:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg763806.html

Consider why we limit line length at all: it's for *legibility*.  Humans
tend to have trouble following long lines with our eyes (I sure do).
Typographic manuals suggest to limit columns to roughly 60 characters
for exactly that reason[1].  Four levels of indentation plus 60
characters of actual text yields 76.

We add a grey area to provide for the occasional case where deeper
indentation pushes code of reasonable width beyond the "white" area, and
breaking these lines would be less legible than making use of the grey
area.

The lines I referred to are long for no good reason.  Wrapping them will
improve legibility.

> (I can do if respin required, but I'd rather have this catch earlier,
> not at code movement).

Before, during, after, or even not at all *clank*[2], your choice.

> Thanks for the A-b!


[1] https://en.wikipedia.org/wiki/Column_(typography)#Typographic_style

[2] Sad sound of a can being kicked down the road


