Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03E2F62EE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:20:17 +0100 (CET)
Received: from localhost ([::1]:54706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03U1-0004jW-1W
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:20:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l03Sh-0003sF-Ez
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:18:55 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l03Se-0006eU-Ba
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:18:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6ECAA7462D3;
 Thu, 14 Jan 2021 15:18:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3DB437456B7; Thu, 14 Jan 2021 15:18:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3BA0D7456E3;
 Thu, 14 Jan 2021 15:18:48 +0100 (CET)
Date: Thu, 14 Jan 2021 15:18:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
In-Reply-To: <20210114140217.GD292902@stefanha-x1.localdomain>
Message-ID: <6bf62c67-7dff-11e2-37e8-a0e67da89bb2@eik.bme.hu>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
 <b06344f0-892f-4ff0-782f-1d55862a2c2b@redhat.com>
 <1cd6e449-cdde-adf6-a3ef-b2e95cd04add@redhat.com>
 <95abf7c3-4338-1659-8c83-e4fb886794b7@eik.bme.hu>
 <20f2dbbf-638c-4c3f-0513-0c7f1afed15d@redhat.com>
 <20210114140217.GD292902@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021, Stefan Hajnoczi wrote:
> On Wed, Jan 13, 2021 at 07:20:42PM -0500, John Snow wrote:
>> On 1/13/21 6:45 PM, BALATON Zoltan wrote:
>>>
>>> Please don't. That would break all scripts that already call qemu using
>>> single dash options. Forcing everyone to edit their scripts is not nice.
>>> How about also accepting single dash in qemu-img for consistency then
>>> you can use whatever you want in docs as long as single dash still works
>>> for consistency and backward compatibility.
>>
>> That's not what I meant -- I meant for documentation purposes. QEMU can keep
>> accepting single dash, but we should standardize on the spelling for
>> purposes of interactive messages, documentation, etc.
>
> I wasn't aware of the fact that some of the utilities are sensitive to
> '--' vs '-'! I'm in favor of consistently using '--' in documentation
> but allowing both for backwards compatibility where '-' is currently
> supported.
>
> If we are in agreement, then let's:
>
> 1. Add a section to CODING_STYLE.rst or other developer documentation
>   documenting this.

I'd be more in favour of documenting that QEMU accepts - options but also 
-- as alternative and fixing the tools that currently use getopt_long to 
use getopt_long_only to keep it consistent with main QEMU executable. 
Otherwise this will get more and more inconsistent with new options added 
with -- and old ones only exist in - form so to keep consistency we should 
standardise on - not --.

> 2. Convert existing documentation to use '--'. This will make it more
>   consistent and also avoid confusion about '-' vs '--'.

You could still use -- in documentation but what's the problem with - if 
-- is also accepted if one wants to type that?

Regards,
BALATON Zoltan

