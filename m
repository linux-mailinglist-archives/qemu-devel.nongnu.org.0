Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7768B21E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 23:14:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOnFk-0004ti-0q; Sun, 05 Feb 2023 17:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOnFf-0004tC-9g
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 17:12:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOnFT-0003yH-99
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 17:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qPCaKOleTwK5DZ4bW6+OBbDlEWN0+sNmIKwrAuwDCqY=; b=e9nyhgfqjq1qvhOOILYoFwruEJ
 ri3AYWONJLmLW089wwanRhCo66k8AQzMYnSYN3cnq75czrV3q1/ozOoqUomoQGOasDrKbWaKAFR0o
 POFXQyDapJ8+cO7u2j4uB4LgtCN9fuFHcPhr16E4nsv0/9jGkL4KPYRUMpNlMjNN2Lpl+PM8Hlul0
 vg0bAl411NbxJdgz3WBqq4Ga9DnSffZUERGRuKWbwHmh5qzQwIrc34GZI4fyc366WOWLv5RYz6NLK
 GP/thb3I4JWNKmeSceZIx4+BnXdo0eqWyE5Vk1MY0izR/07KERtydwEiPHDiF+7dyFVlHzz9EjDzD
 fNRd4k353XHs8OSv62LvS+dQzg//FWVNIG5wl/iDcj2masPTsSWaX4Rm+g+2euC8STszJ1oYzhtzY
 kfn5VgvzsYpoI1uo/HhUI2GSHAwpxeS9AhMMDjb+fPcylEAT+NUb8G97YTSNNLjx3PuUfbNIcbLyY
 YsB5fPUsgllzYHCUTrl3zyhvm11GrUT81CePrn10CzPjTXaNLTPr1a0i/HmythVSPbECKn5FAqKlD
 /1ReVEcMg+i1URCy/o6k5T1EnBdRPoNyTE8KGVjiDyaWuP4ZBCFb30D0g8Etk5nl38MdUn8QkBwfY
 mXCW09ImRTUBNVnymDotGE/ObRvVHhLclvDOqjNUw=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOnEp-0007wD-0u; Sun, 05 Feb 2023 22:11:55 +0000
Message-ID: <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
Date: Sun, 5 Feb 2023 22:12:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <87h6w7694t.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 30/01/2023 20:45, Alex Bennée wrote:

> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> Testing 32-bit host OS support takes a lot of precious time during the QEMU
>>>> contiguous integration tests, and considering that many OS vendors stopped
>>>> shipping 32-bit variants of their OS distributions and most hardware from
>>>> the past >10 years is capable of 64-bit
>>>
>>> True for x86, not necessarily true for other architectures.
>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>> I'm not entirely sure about whether we're yet at a point where
>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>
>> Do we have a feeling on which aspects of 32-bit cause us the support
>> burden ? The boring stuff like compiler errors from mismatched integer
>> sizes is mostly quick & easy to detect simply through a cross compile.
>>
>> I vaguely recall someone mentioned problems with atomic ops in the past,
>> or was it 128-bit ints, caused implications for the codebase ?
> 
> Atomic operations on > TARGET_BIT_SIZE and cputlb when
> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
> throughout.

I am one of an admittedly small group of people still interested in using KVM-PR on 
ppc32 to boot MacOS, although there is some interest on using 64-bit KVM-PR to run 
super-fast MacOS on modern Talos hardware.

 From my perspective losing the ability to run 64-bit guests on 32-bit hardware with 
TCG wouldn't be an issue, as long as it were still possible to use qemu-system-ppc on 
32-bit hardware using both TCG and KVM to help debug the remaining issues.


ATB,

Mark.

