Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B41327A7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:31:53 +0100 (CET)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iooxa-0007Sc-9M
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ionT8-00049x-5H
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ionT6-0000vn-St
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:56:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38820
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ionT6-0000vY-Oh
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578398176;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwJ1rMU3VQl5V/RiTacanmZiUVAi98iCtwJ2TepIAt8=;
 b=VZdm5nd/qztXep5jdVxaXN2J1mlaG9z4ml1tmB+dPS7wLePNmN5I8TszGVXOmlwtEV+hMX
 qUJfonkyPHGB4Pq8D37UAwi2eQR59EFC3LHwDIwUhTR0QzkeFXpn8j6vfV0hWDVJgp6/51
 f5AJUih5a2c4N5rGEMxm1PHNnr1Ogbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-dWH5cCLnPOy0Q4RCW0yhvw-1; Tue, 07 Jan 2020 06:56:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1508110054E3;
 Tue,  7 Jan 2020 11:56:12 +0000 (UTC)
Received: from redhat.com (ovpn-116-141.ams2.redhat.com [10.36.116.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8515D28980;
 Tue,  7 Jan 2020 11:56:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 1/3] migration-test: Add migration multifd test
In-Reply-To: <20200107110717.GB2732@work-vm> (David Alan Gilbert's message of
 "Tue, 7 Jan 2020 11:07:17 +0000")
References: <20200107104914.1814-1-quintela@redhat.com>
 <20200107104914.1814-2-quintela@redhat.com>
 <20200107110717.GB2732@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 07 Jan 2020 12:56:08 +0100
Message-ID: <87tv57qy3r.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: dWH5cCLnPOy0Q4RCW0yhvw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> We set multifd-channels.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Tested-by: Wei Yang <richardw.yang@linux.intel.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  tests/migration-test.c | 56 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>=20
>> diff --git a/tests/migration-test.c b/tests/migration-test.c
>> index 53afec4395..1a8d06718e 100644
>> --- a/tests/migration-test.c
>> +++ b/tests/migration-test.c
>> @@ -1202,6 +1202,61 @@ static void test_migrate_auto_converge(void)
>>      test_migrate_end(from, to, true);
>>  }
>> =20
>> +static void test_multifd_tcp(void)
>> +{
>> +    MigrateStart *args =3D migrate_start_new();
>> +    QTestState *from, *to;
>> +    QDict *rsp;
>> +    char *uri;
>> +
>> +    if (test_migrate_start(&from, &to, "defer", args)) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * We want to pick a speed slow enough that the test completes
>> +     * quickly, but that it doesn't complete precopy even on a slow
>> +     * machine, so also set the downtime.
>> +     */
>> +    /* 1 ms should make it not converge*/
>> +    migrate_set_parameter_int(from, "downtime-limit", 1);
>> +    /* 1GB/s */
>> +    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
>> +
>> +    migrate_set_parameter_int(from, "multifd-channels", 16);
>> +    migrate_set_parameter_int(to, "multifd-channels", 16);
>> +
>> +    migrate_set_capability(from, "multifd", "true");
>> +    migrate_set_capability(to, "multifd", "true");
>> +
>> +    /* Start incoming migration from the 1st socket */
>> +    rsp =3D wait_command(to, "{ 'execute': 'migrate-incoming',"
>> +                           "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }=
}");
>> +    qobject_unref(rsp);
>> +
>> +    /* Wait for the first serial output from the source */
>> +    wait_for_serial("src_serial");
>> +
>> +    uri =3D migrate_get_socket_address(to, "socket-address");
>> +
>> +    migrate_qmp(from, uri, "{}");
>> +
>> +    wait_for_migration_pass(from);
>> +
>> +    /* 300ms it should converge */
>> +    migrate_set_parameter_int(from, "downtime-limit", 600);
>
> Comment doesn't quite match here; but other than that;

Fixed code, thanks.


