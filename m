Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C532B23221F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 18:05:55 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0oaY-0003CO-FW
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 12:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1k0oWz-0006wD-Nf
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 12:02:13 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55557
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1k0oWx-0000u1-QL
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 12:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596038530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92MyhSeistOJZvnkvNBQ5DUgEsXmlH27mjnQIJee6OM=;
 b=Zfwf/mlvXHB9L2imiRVqC220EQCC4XYEswfsbSpPXNQaLMB1jpeY72b1khlKek/ay5u8dV
 ZlD0z/ilBcvcyLjnhuDq+V71xUYAZdtDkb6hriDuzOwWlqVyav6yugKfRUXQG4piJzrFNC
 O4e9n5oI0V3yrcZn2sw1c65cbj905So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-skv8hwvHM5eUQfdGePkYSg-1; Wed, 29 Jul 2020 12:02:08 -0400
X-MC-Unique: skv8hwvHM5eUQfdGePkYSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77EA800465;
 Wed, 29 Jul 2020 16:02:07 +0000 (UTC)
Received: from titinator (ovpn-114-132.ams2.redhat.com [10.36.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8B761799;
 Wed, 29 Jul 2020 16:01:59 +0000 (UTC)
References: <20200723174615.2370096-1-dinechin@redhat.com>
 <20200723174615.2370096-3-dinechin@redhat.com>
 <84be9a34-9f87-1660-3a43-aea72d9496cd@redhat.com>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/7] build: fix device module builds
In-reply-to: <84be9a34-9f87-1660-3a43-aea72d9496cd@redhat.com>
Date: Wed, 29 Jul 2020 18:01:57 +0200
Message-ID: <lyy2n2e2dm.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 kraxel@redhat.com, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020-07-28 at 18:37 CEST, Philippe Mathieu-Daud=C3=A9 wrote...
> On 7/23/20 7:46 PM, Christophe de Dinechin wrote:
>> From: Gerd Hoffmann <kraxel@redhat.com>
>>
>> See comment.  Feels quite hackish.  Better ideas anyone?
>
> I don't understand this patch, how is it related to the rest of
> your series?

It's a leftover from an earlier workaround. For some reason, only some
spurious submodule changes remained over time. That patch can now be
dropped, I believe.

>
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
>>  dtc           | 2 +-
>>  roms/SLOF     | 2 +-
>>  roms/openbios | 2 +-
>>  roms/opensbi  | 2 +-
>>  roms/seabios  | 2 +-
>>  slirp         | 2 +-
>>  6 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/dtc b/dtc
>> index 85e5d83984..88f18909db 160000
>> --- a/dtc
>> +++ b/dtc
>> @@ -1 +1 @@
>> -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
>> +Subproject commit 88f18909db731a627456f26d779445f84e449536
>> diff --git a/roms/SLOF b/roms/SLOF
>> index e18ddad851..9546892a80 160000
>> --- a/roms/SLOF
>> +++ b/roms/SLOF
>> @@ -1 +1 @@
>> -Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
>> +Subproject commit 9546892a80d5a4c73deea6719de46372f007f4a6
>> diff --git a/roms/openbios b/roms/openbios
>> index 75fbb41d28..7e5b89e429 160000
>> --- a/roms/openbios
>> +++ b/roms/openbios
>> @@ -1 +1 @@
>> -Subproject commit 75fbb41d2857d93208c74a8e0228b29fd7bf04c0
>> +Subproject commit 7e5b89e4295063d8eba55b9c8ce8bc681c2d129a
>> diff --git a/roms/opensbi b/roms/opensbi
>> index 9f1b72ce66..be92da280d 160000
>> --- a/roms/opensbi
>> +++ b/roms/opensbi
>> @@ -1 +1 @@
>> -Subproject commit 9f1b72ce66d659e91013b358939e832fb27223f5
>> +Subproject commit be92da280d87c38a2e0adc5d3f43bab7b5468f09
>> diff --git a/roms/seabios b/roms/seabios
>> index 88ab0c1552..f21b5a4aeb 160000
>> --- a/roms/seabios
>> +++ b/roms/seabios
>> @@ -1 +1 @@
>> -Subproject commit 88ab0c15525ced2eefe39220742efe4769089ad8
>> +Subproject commit f21b5a4aeb020f2a5e2c6503f906a9349dd2f069
>> diff --git a/slirp b/slirp
>> index 2faae0f778..126c04acba 160000
>> --- a/slirp
>> +++ b/slirp
>> @@ -1 +1 @@
>> -Subproject commit 2faae0f778f818fadc873308f983289df697eb93
>> +Subproject commit 126c04acbabd7ad32c2b018fe10dfac2a3bc1210
>>


--
Cheers,
Christophe de Dinechin (IRC c3d)


