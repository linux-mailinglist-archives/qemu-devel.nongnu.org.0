Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E992DBEE0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:44:01 +0100 (CET)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUHo-00022d-3M
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpUGy-0001RF-1r
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:43:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kpUGv-00044R-MM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 05:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608115385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dCad2xXJNEIxfXaYy26myboR3JiW1OYgaSIHALAmvt4=;
 b=esmy/hae/bdlFsYEcdmUTH4uSkhscSztzF+37EclW42UJcLkKWV5QVbsyxePlphwdzwFqY
 2SX21uJ/UUvdTSPv+7zn5+qANlXa9tJB7m5AlKtGKlOnn++PcyV4HonSVoF9/a9AYzdsWJ
 m4lW3zlro8heFomQawyvcirAw2DRfew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-_guF39BxNSupMlSVrexRYw-1; Wed, 16 Dec 2020 05:43:03 -0500
X-MC-Unique: _guF39BxNSupMlSVrexRYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B52D800D53
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:43:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BAA810016F5;
 Wed, 16 Dec 2020 10:42:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E102511329A5; Wed, 16 Dec 2020 11:42:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 11/12] qapi/schema: Name the builtin module "" instead
 of None
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-12-jsnow@redhat.com>
Date: Wed, 16 Dec 2020 11:42:57 +0100
In-Reply-To: <20201214235327.1007124-12-jsnow@redhat.com> (John Snow's message
 of "Mon, 14 Dec 2020 18:53:26 -0500")
Message-ID: <87mtyeqbf2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Instead of using None as the built-in module filename, use an empty
> string instead.

PATCH 05's changes the module name of the special system module for
built-in stuff from None to './builtin'.  The other system modules are
named like './FOO': './init' and './emit' currently.

This one changes the module *filename* from None to "", and not just for
the builtin module, but for *all* system modules.  Your commit message
claims only "the built-in module", which is not true as far as I can
tell.

Should we use the opportunity to make the filename match the module
name?

>                 This allows us to clarify the type of various interfaces
> dealing with module names as always taking a string, which saves us from
> having to use Optional[str] everywhere.
>
> Signed-off-by: John Snow <jsnow@redhat.com>


