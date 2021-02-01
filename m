Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8960C30AED0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 19:14:42 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dij-0001Ib-Kk
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 13:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6dhe-0000c2-Kx; Mon, 01 Feb 2021 13:13:34 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:52191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6dha-0008Hx-G4; Mon, 01 Feb 2021 13:13:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8D5207462BD;
 Mon,  1 Feb 2021 19:13:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5892C7456B7; Mon,  1 Feb 2021 19:13:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 570BB7456B4;
 Mon,  1 Feb 2021 19:13:27 +0100 (CET)
Date: Mon, 1 Feb 2021 19:13:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <20210201174622.GQ4131462@redhat.com>
Message-ID: <283170d9-b1cd-de6c-ba47-dfa2babfa0a9@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
 <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
 <20210201174622.GQ4131462@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1500643584-1612203207=:24026"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1500643584-1612203207=:24026
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 1 Feb 2021, Daniel P. Berrangé wrote:
> On Mon, Feb 01, 2021 at 06:25:33PM +0100, Paolo Bonzini wrote:
>> On 01/02/21 17:54, Kevin Wolf wrote:
>>>> How does this option parsing work? Would then multiple patterns separated by
>>>> comma as in -trace pattern1,pattern2 also work?
>>> This would be interpreted as an implied "enable" option with a value of
>>> "pattern1,pattern2". I don't think anything splits that string at the
>>> comma, so it would look for a trace event matching that string.
>>
>> Even worse, it would be interpreted as "-trace enable=pattern1,pattern2=on"
>> (and raise a warning since recently).
>
> Maybe we're trying to solve the problem at the wrong level.

There's no problem to solve, just trying to understand better what are the 
valid options. It's already possible to enable multiple patterns with 
either events=file or repeating -trace options (with or without enable=) 
so that's already sufficient, I was just curious what other options are 
there and if there's a simpler way that we could document. If not, using 
the current ways that are now documented is OK I think.

> The pattern is currently matched using the GLib glob matching APIs.
>
> If we switched to use the GLib regex matching APIs, then we don't need
> to repeat the args at all. We could just use regex syntax:
>
>  -trace 'enable=(kvm|virtio)*'
>
> It is a little tedious to have to quote the args to avoid shell
> expansion, but as a tradeoff you get much stronger ability todo
> complex matches to filter out irrelevant cruft.

I guess we have enough expressiveness with current pattern matching and 
globs are more easily understood by mere users so regex may not be needed 
here.

> If we want to maintain back compat for glob syntax, then we should
> support both in parallel and accept a different parameter name
> for the regex style.

That would be (even more) confusing so better to just stay with globs.

Regards,
BALATON Zoltan
--3866299591-1500643584-1612203207=:24026--

