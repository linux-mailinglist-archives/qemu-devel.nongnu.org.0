Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAF697D98
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHzV-0003UI-GY; Wed, 15 Feb 2023 08:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pSHzP-0003Sp-7D
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:38:30 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pSHzN-0006jn-ID
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:38:26 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 129C6209BF;
 Wed, 15 Feb 2023 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676468302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGTHJ8Buhy7TKiP8gSqP+VVyyX7ajk2+tDVA/jzav9s=;
 b=yZ4os84jzoI0A7IxhlWZljIoqHPv763gMesy36Krg3fDkiUWKNLhYfp6/J8vIsRS0DQsPO
 x+yPgdbPgmx9q1c7kKxxIOPuWeZBIGENSEEi4uOGiB8CM9QznGBHU9sr8MgaHVWkFP/2tk
 WcnmNEBHIoHfDU0yC2FvnS7S+cqMx1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676468302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGTHJ8Buhy7TKiP8gSqP+VVyyX7ajk2+tDVA/jzav9s=;
 b=WtnQ8qVvyPa5dpNtf9aMTB6nVSgdS0kAfjL6Dvs8wFoQGyvMh6X3fUOiyWPhOPgysc9x1H
 9zdS82VLs/piTVAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97503134BA;
 Wed, 15 Feb 2023 13:38:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qyA2GE3g7GMtbQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 15 Feb 2023 13:38:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/qtest/rtl8139-test: Make the test less verbose by
 default
In-Reply-To: <Y+zUMygZUSwiPRwG@redhat.com>
References: <20230215124122.72037-1-thuth@redhat.com>
 <Y+zUMygZUSwiPRwG@redhat.com>
Date: Wed, 15 Feb 2023 10:38:19 -0300
Message-ID: <87fsb7dp6c.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Feb 15, 2023 at 01:41:22PM +0100, Thomas Huth wrote:
>> We are facing the issues that some test logs in the gitlab CI are
>> too big (and thus cut off). The rtl8139-test is one of the few qtests
>> that prints many lines of output by default when running with V=3D1, so
>> it contributes to this problem. Almost all other qtests are silent
>> with V=3D1 and only print debug messages with V=3D2 and higher. Thus let=
's
>> change the rtl8139-test to behave more like the other tests and only
>> print the debug messages with V=3D2 (or higher).
>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/qtest/rtl8139-test.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>>=20
>> diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
>> index 8fa3313cc3..1beb83805c 100644
>> --- a/tests/qtest/rtl8139-test.c
>> +++ b/tests/qtest/rtl8139-test.c
>> @@ -12,6 +12,8 @@
>>  #include "libqos/pci-pc.h"
>>  #include "qemu/timer.h"
>>=20=20
>> +static int verbosity_level;
>> +
>>  /* Tests only initialization so far. TODO: Replace with functional test=
s */
>>  static void nop(void)
>>  {
>> @@ -45,12 +47,16 @@ static QPCIDevice *get_device(void)
>>  static unsigned __attribute__((unused)) in_##name(void) \
>>  { \
>>      unsigned res =3D qpci_io_read##len(dev, dev_bar, (val));     \
>> -    g_test_message("*%s -> %x", #name, res); \
>> +    if (verbosity_level >=3D 2) { \
>> +        g_test_message("*%s -> %x", #name, res); \
>> +    } \
>>      return res; \
>>  } \
>>  static void out_##name(unsigned v) \
>>  { \
>> -    g_test_message("%x -> *%s", v, #name); \
>> +    if (verbosity_level >=3D 2) { \
>> +        g_test_message("%x -> *%s", v, #name); \
>> +    } \
>>      qpci_io_write##len(dev, dev_bar, (val), v);        \
>>  }
>>=20=20
>> @@ -195,6 +201,11 @@ static void test_init(void)
>>  int main(int argc, char **argv)
>>  {
>>      int ret;
>> +    char *v_env =3D getenv("V");
>> +
>> +    if (v_env) {
>> +        verbosity_level =3D atoi(v_env);
>> +    }
>
> *Not* something I'm requesting you to do now, just an observation / idea.
>
> We've copied this pattern into several tests.
>
> It is starting to feel like we should have a header with a
> 'qtests_env_setup()' method we call as first thing in main,
> and exporting 'verbosity_level' from the header.
>
> Perhaps also with a  'qtest_verbose(...)' macro that wraps
>
>   if (verbosity_level >=3D 2) {
>      g_test_message(...)
>   }

Could we maybe play with g_test_verbose and g_test_quiet? The docs say
"The default is neither g_test_verbose() nor g_test_quiet()."  So
perhaps:

V=3D    --quiet, g_test_quiet
V=3D1 no option, default verbosity
V=3D2 --verbose, g_test_verbose

Then test g_test_quiet|verbose instead of reading from env directly.


