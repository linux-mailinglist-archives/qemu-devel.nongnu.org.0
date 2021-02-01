Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F830ACB6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:35:25 +0100 (CET)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cAd-0002PR-Tl
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6c55-0006IE-K3; Mon, 01 Feb 2021 11:29:40 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6c51-0001Co-It; Mon, 01 Feb 2021 11:29:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 105217462DB;
 Mon,  1 Feb 2021 17:29:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CC3147456B4; Mon,  1 Feb 2021 17:29:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CA8A17456B7;
 Mon,  1 Feb 2021 17:29:31 +0100 (CET)
Date: Mon, 1 Feb 2021 17:29:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <20210201161352.GH13157@merkur.fritz.box>
Message-ID: <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-568678945-1612196971=:91053"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-568678945-1612196971=:91053
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 1 Feb 2021, Kevin Wolf wrote:
> Am 01.02.2021 um 17:05 hat BALATON Zoltan geschrieben:
>> On Mon, 1 Feb 2021, Stefan Hajnoczi wrote:
>>> It is possible to repeat the --trace option to specify multiple
>>> patterns. This may be preferrable to users who do not want to create a
>>> file with a list of patterns.
>>>
>>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Message-id: 20210112165859.225534-2-stefanha@redhat.com
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> docs/devel/tracing.rst | 9 +++++++--
>>> 1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
>>> index af395e957d..e8f9b82c5e 100644
>>> --- a/docs/devel/tracing.rst
>>> +++ b/docs/devel/tracing.rst
>>> @@ -22,10 +22,15 @@ events::
>>> This output comes from the "log" trace backend that is enabled by default when
>>> ``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
>>>
>>> -More than one trace event pattern can be specified by providing a file
>>> -instead::
>>> +Multiple patterns can be specified by repeating the ``--trace`` option::
>>> +
>>> +    $ qemu --trace "kvm_*" --trace "virtio_*" ...
>>
>> Does that actually work? I've always used -trace enable="pattern1" -trace
>> enable="pattern2" Not sure if omitting enable= is the same.
>
> qemu_trace_opts has .implied_opt_name = "enable", so without having
> tested it, I assume this works.

How does this option parsing work? Would then multiple patterns separated 
by comma as in -trace pattern1,pattern2 also work? (Although quoting * in 
that may be a challenge don't know if it should be "a*,b*" "a*","b*" or 
a\*,b\* or any of these would be OK.) I've just found one way by repeating 
-trace options that worked and then used that without ever trying to 
explore other ways but if we're about to document it maybe somebody who 
actually knows how it works could tell what is the best way.

Regards,
BALATON Zoltan
--3866299591-568678945-1612196971=:91053--

