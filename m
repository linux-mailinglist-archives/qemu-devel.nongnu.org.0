Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB3F915F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 15:04:30 +0100 (CET)
Received: from localhost ([::1]:35434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUWmT-000365-SE
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 09:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iUWin-00017L-Dk
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 09:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iUWim-0005xd-51
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 09:00:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20134
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iUWim-0005xV-1y
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 09:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573567239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R3MJt3TIkkobIvD1VeTWMOFbqEEL1wCtlj/pmY8FQM=;
 b=ahRbmuPjtJIxlQNcuDdPrlmGpmAohETGMk8RnliswTxnPNsXMwKkzhRdY/wwVvvauU/PW3
 6m2LTAexXD5HsBuxYMeWtGDPPiK8sFIDJ4VQtRVBoNZe4hxQ3nEKZgXopb7uGuZ1VnDo0m
 DXsyY45dn1RWHdL1epUMWLXWI8avVZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-k8_fAhusMbun86oWMTsYqQ-1; Tue, 12 Nov 2019 09:00:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3F72801E69;
 Tue, 12 Nov 2019 14:00:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-3.gru2.redhat.com [10.97.116.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B890563147;
 Tue, 12 Nov 2019 14:00:22 +0000 (UTC)
Subject: Re: [PATCH v7 6/8] Acceptance tests: add the build directory to the
 system PATH
To: Cleber Rosa <crosa@redhat.com>
References: <20191104151323.9883-1-crosa@redhat.com>
 <20191104151323.9883-7-crosa@redhat.com>
 <0660a16e-2ffc-fd3f-bfc7-cb0c43f1aef9@redhat.com>
 <20191111224929.GF19559@localhost.localdomain>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <74c176fe-5853-93d4-2329-8920af1f33a4@redhat.com>
Date: Tue, 12 Nov 2019 12:00:20 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191111224929.GF19559@localhost.localdomain>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: k8_fAhusMbun86oWMTsYqQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
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
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/11/19 8:49 PM, Cleber Rosa wrote:
> On Thu, Nov 07, 2019 at 05:46:13PM -0200, Wainer dos Santos Moschetta wro=
te:
>> On 11/4/19 1:13 PM, Cleber Rosa wrote:
>>> So that when binaries such as qemu-img are searched for, those in the
>>> build tree will be favored.  As a clarification, SRC_ROOT_DIR is
>>> dependent on the location from where tests are executed, so they are
>>> equal to the build directory if one is being used.
>>>
>>> The original motivation is that Avocado libraries such as
>>> avocado.utils.vmimage.get() may use the matching binaries, but it may
>>> also apply to any other binary that test code may eventually attempt
>>> to execute.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    tests/acceptance/avocado_qemu/__init__.py | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
>>> index 17ce583c87..a4bb796a47 100644
>>> --- a/tests/acceptance/avocado_qemu/__init__.py
>>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>>> @@ -110,6 +110,12 @@ class Test(avocado.Test):
>>>            return None
>>>        def setUp(self):
>>> +        # Some utility code uses binaries from the system's PATH.  For
>>> +        # instance, avocado.utils.vmimage.get() uses qemu-img, to
>>> +        # create a snapshot image.  This is a transparent way of
>> Because PATH is changed in a transparent way, wouldn't be better to also
>> self.log.info() that fact?
>>
> I don't have a problem with logging it, but because it will happen for
> *every single* test, it seems like it will become noise.  I think it's
> better to properly document this aspect of "avocado_qemu.Test" instead
> (which is currently missing here).  Something like:
>
> "Tests based on avocado_qemu.Test will have, as a convenience, the
> QEMU build directory added to their PATH environment variable.  The goal
> is to allow tests to seamless use matching built binaries, instead of
> binaries installed elsewhere in the system".
>
> How does it sound?


It does.


>
>>> +        # making sure those utilities find and use binaries on the
>>> +        # build tree by default.
>>> +        os.environ['PATH'] =3D '%s:%s' % (SRC_ROOT_DIR, os.environ['PA=
TH'])
>> I think PATH should be set only once at class initialization. Perhaps in
>> setUpClass()?
>>
>> - Wainer
>>
> The Avocado test isolation model makes setUpClass() unnecessary,
> unsupported and pointless, so we only support setUp().
>
> Every test already runs on its own process, and with the nrunner
> model, should be able to run on completely different systems.  That's
> why we don't want to support a setUpClass() like approach.

Okay, thanks for the explanation.

Thanks,

Wainer

>
> - Cleber.
>
>


