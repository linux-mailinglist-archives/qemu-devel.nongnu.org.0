Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65229575E3C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:11:34 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHMD-00027E-B6
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGxb-0003nP-C8
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:46:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGxY-0004vh-Oi
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 04:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eI1fXUzFEQ+XYj91lrwoikq4KMb1NAuge66KD8K3VLQ=;
 b=ISJiyrbV0PWVM+sLfUP9Q16+9ViHk2qvNOkdrTqgHWhXChh5metkf3/uCCZVxRrrHk6tnM
 0C4/X3UdmxPNRfSQdfSfcpJ0iEl1D/8l/yu0COxoNFGA2nwYopEwrpullwxM7J1ZtNmKit
 4yrqMoqChe/rtPUB9gmBpwXMNpfFlqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-VCBVE7-DNkK6W57u_512Gg-1; Fri, 15 Jul 2022 04:46:00 -0400
X-MC-Unique: VCBVE7-DNkK6W57u_512Gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 632B3811E80;
 Fri, 15 Jul 2022 08:46:00 +0000 (UTC)
Received: from localhost (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 279DE141511A;
 Fri, 15 Jul 2022 08:46:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 0/3] target: RFC: display deprecation note for '-cpu help'
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 15 Jul 2022 10:45:59 +0200
Message-ID: <87pmi63gs8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 14 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When querying '-cpu help' there is no presentation of fact that a
> CPU may be deprecated. The user just has to try it and see if they
> get a depecation message at runtime.  The QMP command for querying
> CPUs report a deprecation bool flag, but not the explanatory
> reason.
>
> The Icelake-Client CPU (removed in 6df39f5e583ca0f67bd934d1327f9ead2e3bd4=
9c)
> handled this by modifying the '.notes' section to add the word
> 'deprecated':
>
>             {
>                 .version =3D 2,
>                 .note =3D "no TSX, deprecated",
>                 .alias =3D "Icelake-Client-noTSX",
>                 .props =3D (PropValue[]) {
>                     { "hle", "off" },
>                     { "rtm", "off" },
>                     { /* end of list */ }
>                 },
>             },
>
> This relies on the person deprecating the CPU to remember to do this,
> and is redundant when this info is already expressed in the
> '.deprecation_note' field.
>
> This short series suggests just modifying the '-cpu help'
> formatter so that it displays the full deprecation message
>
> eg
>
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated:=
 use at least 'Nehalem' / 'Opteron_G4', or 'host' / 'max')
>
> I wonder if this is too verbose, and we should just do a
> concise flag like approach, similar to QMP:
>
> $ qemu-system-x86_64 -cpu help:
> Available CPUs:
> x86 486                   (alias configured by machine type) (deprecated)
>
> leaving the full message to be displayed at runtime ? I'm slightly
> inclined to the simpler more concise output.

The good thing about the longer output is that the user gets the full
information right from the start, and does not need to dig around and
figure out why it is deprecated, and what to use instead. That said, if
we have very verbose deprecation notes, the output may get a bit
cluttered. I think I slightly prefer the verbose output.

>
> This series touched x86_64, s390x, and aarch64 because that's all I
> personally needed from a downstream POV, but any & all of the targets
> would benefit from this. They have each implemneted the '-cpu help'
> logic independantly though, and unifying that code is not entirely
> straightforward.

It seems that any arch that does not use a very simple output has chosen
a different format...


