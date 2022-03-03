Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137254CBDB4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:25:11 +0100 (CET)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkW6-0002Zc-6o
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nPkUg-00012F-KE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nPkUe-0007E7-A2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646310219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqB53/OlukljnakrlD0/NJ34F7CHmRudeq/p9wfXyzQ=;
 b=YhfpJuJHXaEU0spY+oLArIvVgwOuQdTrOgiyPHSc27wYFm3l4nKBouVB0oivlSuOThwAcy
 vztt+MXUBNAVFDbmS9UY5HkAtnX15D5ZxeUUkziuao4ONkdE+Ei6Wn9JAYqRDKjaFv1XqO
 3Mep0dr+QPaWCmeo1BzddbjMxDDX5is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-tQLhhOIDMvC_5mYdQvLgDw-1; Thu, 03 Mar 2022 07:23:36 -0500
X-MC-Unique: tQLhhOIDMvC_5mYdQvLgDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707291006AA6;
 Thu,  3 Mar 2022 12:23:32 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org (unknown
 [10.22.32.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 772987B6FD;
 Thu,  3 Mar 2022 12:23:05 +0000 (UTC)
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-6-crosa@redhat.com>
 <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
User-agent: mu4e 1.6.6; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing
 accel (tcg) tag
Date: Thu, 03 Mar 2022 07:13:43 -0500
In-reply-to: <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
Message-ID: <8735jzmdib.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> writes:

> On 25/2/22 22:01, Cleber Rosa wrote:
>> Being explicit about the accelerator used on these tests is a good
>> thing in itself, but it will also be used in the filtering rules
>> applied on "make check-avocado".
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/avocado/linux_ssh_mips_malta.py | 3 +++
>>   1 file changed, 3 insertions(+)
>> diff --git a/tests/avocado/linux_ssh_mips_malta.py
>> b/tests/avocado/linux_ssh_mips_malta.py
>> index c0f0be5ade..0179d8a6ca 100644
>> --- a/tests/avocado/linux_ssh_mips_malta.py
>> +++ b/tests/avocado/linux_ssh_mips_malta.py
>> @@ -23,6 +23,9 @@
>>   @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout=
')
>
> Should we remove this line then? ^^^
>

Yes, we definitely should.  But, I thought it should be a next step.
The reason being that manual invocations of avocado or a custom list of
tests to "make check-avocado" will still respect that at this point.

What do you think?

Cheers,
- Cleber.


