Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCA01683D8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:42:16 +0100 (CET)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5BNX-00066I-P8
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j5BLt-0004w2-9g
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:40:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j5BLs-0004aB-4s
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:40:33 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59895
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j5BLs-0004ZL-0d
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582303230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5m45+iI9fwusuKb+VopaNjfyolvGlQWvmOpBl4B9YxI=;
 b=gOolDmfVWyHxFIuBZikVkuWYrgaBnO2xsJldODN80cIs15wcAkcjYus3+2zzMQB8HtY7Xp
 43C5puxxbjIfxRMMKfZdSnXUYH69dnNifi7tU6OGLpjTa5q6Mo/ZH2ulno7KMyrp0jDHJh
 jRNL7dmmazrIj0GGEvbfIcTOMlxPVcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-vcnuk47LNzKZ1oLgC4uIKw-1; Fri, 21 Feb 2020 11:40:28 -0500
X-MC-Unique: vcnuk47LNzKZ1oLgC4uIKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94ECA107ACC5;
 Fri, 21 Feb 2020 16:40:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B988B570;
 Fri, 21 Feb 2020 16:40:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D964411386A6; Fri, 21 Feb 2020 17:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] maint: Include top-level *.rst files early in git diff
References: <20200220162214.3474280-1-eblake@redhat.com>
 <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
Date: Fri, 21 Feb 2020 17:40:25 +0100
In-Reply-To: <CAFEAcA8p7D_XFZ9e66wWHNSD6fh2yUvFyAM3QVrwBP7oonoCjQ@mail.gmail.com>
 (Peter Maydell's message of "Fri, 21 Feb 2020 10:17:36 +0000")
Message-ID: <87wo8f51xi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 20 Feb 2020 at 16:22, Eric Blake <eblake@redhat.com> wrote:
>>
>> We are converting more doc files to *.rst rather than *.texi.  Most
>> doc files are already listed early in diffs due to our catchall
>> docs/*, but a few top-level files get missed by that glob.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Both *.texi and *.rst entries make sense while we are still converting
>> things, but we'll need a followup to drop *.texi when the conversion
>> is complete...
>
> I was wondering what rst files we had outside docs, and
> the answer is "README.rst, CODING_STYLE.rst and
> tests/acceptance/README.rst".
>
> (There's a reasonable argument for moving CODING_STYLE.rst to
> docs/devel now; depends how highly you rate having it more
> "discoverable" to new contributors.)

The little cynic in the back of my head cackles and points out that
CODING_STYLE.rst exists not for new contributors to discover, but so
that old contributors have something to smack on new heads.

SCNR :)


