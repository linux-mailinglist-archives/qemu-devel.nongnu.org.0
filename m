Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6771791A7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 14:45:00 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9UKZ-00043d-Cv
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 08:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9UJL-0003at-J0
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:43:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9UJJ-00005U-Tz
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:43:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41273
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9UJJ-0008V2-QP
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 08:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583329420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wNGSjOSP+nOjiOkTvB2i77b0dayWREmsIYEvA7IKPo=;
 b=WOZ8BaqZ7GIsgFnkyF/YY8jj0tRnfn7qmmZGDTwG3sEY244+FPXLPTsOND1j3WPvRCUkAR
 w6rroXBTvkOHzTtzCWUKUn6uvwZ+YICOH5L5ZDDc0/7wboCxbZ+PuAinH8zuWtDOjAvIxy
 d9vZfM5t5PPX1SIrNX1hW6Hy0WN1jSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-2cBiRGqNO6mGsp9Nk1Rpug-1; Wed, 04 Mar 2020 08:43:37 -0500
X-MC-Unique: 2cBiRGqNO6mGsp9Nk1Rpug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 064721007279;
 Wed,  4 Mar 2020 13:43:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C52215DA2C;
 Wed,  4 Mar 2020 13:43:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 523CB11386A6; Wed,  4 Mar 2020 14:43:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/30] Configurable policy for handling deprecated
 interfaces
References: <20200303163505.32041-1-armbru@redhat.com>
Date: Wed, 04 Mar 2020 14:43:31 +0100
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 3 Mar 2020 17:34:35 +0100")
Message-ID: <87sgiojkvw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Based-on: <20200227144531.24309-1-armbru@redhat.com>
>
> This series extends QMP introspection to cover deprecation.
> Additionally, new option -compat lets you configure what to do when
> deprecated interfaces get used.  This is intended for testing users of
> the management interfaces.  It is experimental.
>
> -compat deprecated-input=3D<in-policy> configures what to do when
> deprecated input is received.  Available policies:
>
> * accept: Accept deprecated commands and arguments (default)
> * reject: Reject them
> * crash: Crash
>
> -compat deprecated-output=3D<out-policy> configures what to do when
> deprecated output is sent.  Available output policies:
>
> * accept: Emit deprecated command results and events (default)
> * hide: Suppress them

Missing: hide in output of query-qmp-schema.  I can look into that.

> For now, -compat covers only deprecated syntactic aspects of QMP.  We
> may want to extend it to cover semantic aspects, CLI, and experimental
> features.
>
> PATCH 01-04: Documentation fixes
> PATCH 05-10: Test improvements
> PATCH 11-24: Add feature flags to remaining user-defined types and to
>       =09     struct members
> PATCH 25-26: New special feature 'deprecated', visible in
>       =09     introspection
> PATCH 27-30: New -compat to set policy for handling stuff marked with
>       =09     feature 'deprecated'
>
> Comparison to RFC (24 Oct 2019):
> * Cover arguments and results in addition to commands and events
> * Half-baked "[RFC PATCH 18/19] qapi: Include a warning in the
>   response to a deprecated command" dropped
>
> See also last item of
>     Subject: Minutes of KVM Forum BoF on deprecating stuff
>     Date: Fri, 26 Oct 2018 16:03:51 +0200
>     Message-ID: <87mur0ls8o.fsf@dusky.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2018-10/msg05828.htm=
l


