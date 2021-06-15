Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D01F3A89FD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:10:48 +0200 (CEST)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltFOY-0007Lk-51
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltFN8-0006fT-Ph
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:09:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltFN7-000216-3v
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:09:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a20so30757wrc.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a4ewMdENPxS8c2Ydk8IdnyAGjdz91LTqBTid5AxQKN0=;
 b=SCSuaS4jwXC28pe9uUu8rseoNlK/3NIzPXGOJI1DcuZrrcWc9CAV17qCIEiARhLeN9
 drGLC1vclelzqBSaSPhm/jw2R98zBi1U6uszVBlJ2fVLOri+991RxICmb6XvvFo/tMrZ
 N8/I3Qw6UFl+3nK++JRcb//HmATWEfjoJSP720UBcrXfsvhSDdNpcVuFdqrnWvcwKnY6
 dGR+NgFiwNJ7914T/l/AL0eCvSSBupsjfEeJMXfOGuB0ZfY4fCI1p2NZqOaymmLU90zw
 r7AARxquxhfRv4ib0Bpq06ycN0hMk7WzpC++oXhTQRownrFJtMh75RQiuWbWY/8gzUUA
 CeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a4ewMdENPxS8c2Ydk8IdnyAGjdz91LTqBTid5AxQKN0=;
 b=pgPhdNU6hI75x9BkJccXvsVufwsbcoE4RzggiRvxNVIz0NHlBvPdVSldNLFrr/jihm
 0dfzW+Y/iS0bE5ZRq0WrPvvR9ycG+Uzd9fcjY0g4hK76T+q/U+7L0iX49Q6D18Y28slN
 n85Ov2RzMMjud9Hn1mSY9Ma2HaEv2WOJR+PofWs/1IaPlELekc3SmWYmwAz9WHBD5bb4
 jw0EZK5BvUptu74F4M1TzU5A8l4OSKF5syOQ5ipPW/skio2HailcsVZiwGqQS0WIybcI
 UFPqRfedomfmwMAmSMAspTP5SGKAsvHPShCGmEfsvHAiCaZx7Ys1yuhVJ+ZthTj22pei
 l52w==
X-Gm-Message-State: AOAM533jJjd6inGtCZn6vE8PtKCbka7QQxxmKEocOIcUOuhFjFmzNqUy
 jcmJS3dGtQV7HEXk/950vuE=
X-Google-Smtp-Source: ABdhPJypFdBB6MhaXgNlcqtLXpB6rUkwxuu45Fazabh/9BSc+70umzvKC2x8M1zpnb81G1PMitDAww==
X-Received: by 2002:adf:a489:: with SMTP id g9mr954686wrb.103.1623787753854;
 Tue, 15 Jun 2021 13:09:13 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j18sm19533776wrw.30.2021.06.15.13.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:09:13 -0700 (PDT)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <YMgLha7YL8XYrShS@yekko> <05a484e7-bbd3-ca9f-5642-ef98d92ad4b3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a411581b-5916-999c-dbc5-c48b055f65c8@amsat.org>
Date: Tue, 15 Jun 2021 22:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <05a484e7-bbd3-ca9f-5642-ef98d92ad4b3@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 9:27 PM, John Snow wrote:
> On 6/14/21 10:08 PM, David Gibson wrote:
>> On Mon, Jun 14, 2021 at 01:32:11PM -0400, John Snow wrote:
>>> Hi, I'd like to work out our collective preferences for how we triage
>>> issues
>>> that concern the execution environment; namely the arch (now
>>> "target", os,
>>> and accel labels.
> 
> [...]
> 
>> In general, what's the convention when a bug is independent of (say)
>> the accel: does it get none of the accel tags, or all of them?
>> Likewise with OS and the other categories.
> 
> So far, I have been labeling bugs reported against a specific
> accel/guest/host combination with those bugs. It doesn't necessarily
> mean they are bugs *in* those components. They might be, they might not be.
> 
> Generally I have been treating these labels as descriptors of the
> problem environment and not necessarily descriptors of the root cause.
> At a glance I often have no clue what the root cause might be. In just a
> few minutes, translating some of the details of the environment into
> labels in the hopes that it floats by someone with more knowledge in one
> or more of those areas is the best I can do.
> 
> This *does* mean that for TCG developers, there's a high ambiguity here
> because "accel: TCG" && "target: i386" applies to a pretty broad
> category of reports, not all of them necessarily bugs primarily
> suspected to be *about* TCG. Maybe, maybe not.
> 
> Phil sometimes removes these labels once it becomes apparent to him that
> the bug doesn't actually involve the system mentioned. Maybe it was
> filed under i386 but impacts all architectures, so we'd remove that label.

I was doing this hoping it would help the triage, so further updates
won't trigger notification to the maintainers subscribed to the labels
that became irrelevant.

But now I understood other maintainers use the labels to sort bugs, so
I think we should first agree on what we expect from gitlab labels and
how to use them, before discussing on what labels to use.

Personally I see labels like a tree of IRQ lines :)
We want to always reach someone, starting broad to eventually get to
the right person able to help. The sooner we disable an IRQ where it
is not required the better, because we release uninterested maintainers
from noise, so they can attending other issues.

