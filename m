Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A99199E0F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 20:30:14 +0200 (CEST)
Received: from localhost ([::1]:42788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJLeP-0003Ih-CG
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 14:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jJLdH-0002sE-E7
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 14:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jJLdE-0004fi-RT
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 14:29:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50693
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jJLdE-0004f0-Mx
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 14:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585679339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+sHe6l539+bbv7+wuKDGVhNWH6HL9v3EeBpiG8glfQ=;
 b=J/w/T8G7ImcjQJFdEMt+7jEU9jaVcxXcGCcUbqOJsPfoJw3gRN95jH8A+FxWZGaiPd9fF0
 d1xJpJoAL1SNs7W8WvuNJMPV2See9rFZdpI1YishLsl3OxqXIXNshBgTEvg/z+DLtFaoEa
 MaX1VhoYwBP8T9SUEXTHe5p9MUr848A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-GjozwHWONWuEpM6TreFKxg-1; Tue, 31 Mar 2020 14:28:58 -0400
X-MC-Unique: GjozwHWONWuEpM6TreFKxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06ABF107ACCA;
 Tue, 31 Mar 2020 18:28:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-69.ams2.redhat.com
 [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC3D96B8B;
 Tue, 31 Mar 2020 18:28:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1D07611385E2; Tue, 31 Mar 2020 20:28:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3] configure: warn if not using a separate build directory
References: <20200331171606.386801-1-berrange@redhat.com>
 <32d8b69d-1641-f200-e86e-062de6c93caf@redhat.com>
Date: Tue, 31 Mar 2020 20:28:54 +0200
In-Reply-To: <32d8b69d-1641-f200-e86e-062de6c93caf@redhat.com> (Eric Blake's
 message of "Tue, 31 Mar 2020 12:21:32 -0500")
Message-ID: <875zeks7ix.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Liviu Ionescu <ilg@livius.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 Philippe =?utf-8?Q?Mathie?= =?utf-8?Q?u-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/31/20 12:16 PM, Daniel P. Berrang=C3=A9 wrote:
>> Running configure directly from the source directory is a build
>> configuration that will go away in future. It is also not currently
>> covered by any automated testing. Display a deprecation warning if
>> the user attempts to use an in-srcdir build setup, so that they are
>> aware that they're building QEMU in an undesirable manner.
>>
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>
>
>> +if test "$in_srcdir" =3D "yes"; then
>> +    echo
>> +    echo "WARNING: SUPPORT FOR IN SOURCE DIR BUILDS IS DEPRECATED"
>> +    echo
>> +    echo "Support for running the 'configure' script directly from the"
>> +    echo "source directory is deprecated. In source dir builds are not"
>> +    echo "covered by automated testing and thus may not correctly build=
"
>> +    echo "QEMU. Users are recommended to use a separate build directory=
:"
>
> Our mails crossed. I still think this reads a bit awkwardly; maybe:
>
> s/IN SOURCE DIR BUILDS/BUILDING IN THE SOURCE DIR/
> s/In source dir builds/In-tree builds/
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Preferably with Eric's tweaks:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


