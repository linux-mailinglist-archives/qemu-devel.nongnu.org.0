Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92C30DA13
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 13:47:26 +0100 (CET)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7HZ7-00082h-Pg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 07:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l7HXd-00073i-Ti; Wed, 03 Feb 2021 07:45:53 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:41467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l7HXZ-0005HZ-3X; Wed, 03 Feb 2021 07:45:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2D50174632F;
 Wed,  3 Feb 2021 13:45:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DFB397462FD; Wed,  3 Feb 2021 13:45:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DD8E77462E1;
 Wed,  3 Feb 2021 13:45:41 +0100 (CET)
Date: Wed, 3 Feb 2021 13:45:41 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 03/12] qga: Replace '--blacklist' command line option by
 '--denylist'
In-Reply-To: <20210203100952.GD300990@redhat.com>
Message-ID: <50e2133b-a6a2-a878-366f-eadcfd453aa@eik.bme.hu>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-4-philmd@redhat.com>
 <20210203100952.GD300990@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1735583973-1612356341=:74091"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1735583973-1612356341=:74091
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Feb 2021, Daniel P. Berrangé wrote:
> On Tue, Feb 02, 2021 at 09:58:15PM +0100, Philippe Mathieu-Daudé wrote:
>> Follow the inclusive terminology from the "Conscious Language in your
>> Open Source Projects" guidelines [*] and replace the word "blacklist"
>> appropriately.
>>
>> Keep the --blacklist available for backward compatibility.
>>
>> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  docs/interop/qemu-ga.rst | 2 +-
>>  qga/main.c               | 6 ++++--
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
>> index 9a590bf95cb..89596e646de 100644
>> --- a/docs/interop/qemu-ga.rst
>> +++ b/docs/interop/qemu-ga.rst
>> @@ -79,7 +79,7 @@ Options
>>
>>    Daemonize after startup (detach from terminal).
>>
>> -.. option:: -b, --blacklist=LIST
>> +.. option:: -b, --denylist=LIST
>>
>>    Comma-separated list of RPCs to disable (no spaces, ``?`` to list
>>    available RPCs).
>> diff --git a/qga/main.c b/qga/main.c
>> index 249fe06e8e5..66177b9e93d 100644
>> --- a/qga/main.c
>> +++ b/qga/main.c
>> @@ -257,7 +257,8 @@ QEMU_COPYRIGHT "\n"
>>  #ifdef _WIN32
>>  "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
>>  #endif
>> -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
>> +"  --blacklist       backward compatible alias for --denylist (deprecated)\n"
>> +"  -b, --denylist    comma-separated list of RPCs to disable (no spaces, \"?\"\n"
>
>
> "-b" is a bit odd as a short name now, but i guess that's not the end
> of the world.

Maybe -b, --block  or --block-rpc? Not the best but at least preserves 
consistency with the short option.

Regards,
BALATON Zoltan

> The deprecation should be documented though. Ideally we would report
> a warning if the deprecated long arg was used too.
>
>>  "                    to list available RPCs)\n"
>>  "  -D, --dump-conf   dump a qemu-ga config file based on current config\n"
>>  "                    options / command-line parameters to stdout\n"
>> @@ -1111,7 +1112,8 @@ static void config_parse(GAConfig *config, int argc, char **argv)
>>          { "method", 1, NULL, 'm' },
>>          { "path", 1, NULL, 'p' },
>>          { "daemonize", 0, NULL, 'd' },
>> -        { "blacklist", 1, NULL, 'b' },
>> +        { "denylist", 1, NULL, 'b' },
>> +        { "blacklist", 1, NULL, 'b' }, /* deprecated alias for 'denylist' */
>>  #ifdef _WIN32
>>          { "service", 1, NULL, 's' },
>>  #endif
>> --
>> 2.26.2
>>
>>
>
> Regards,
> Daniel
>
--3866299591-1735583973-1612356341=:74091--

