Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAC6C8A3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 07:19:17 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnyp2-0003jc-Kl
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 01:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59723)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hnyop-0003Ki-Nn
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 01:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hnyoo-0000QQ-Fs
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 01:19:03 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43680)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hnyoo-0000Pb-9H
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 01:19:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so27102523wru.10
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 22:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7DPOcpX14NROkrxLKukkowrmyXVqjiEIGmyC7xGPKmI=;
 b=D6jdnmm4PZK0eQrO94maGnSczO6gSUygJZ2dxFrTybro9zXJOSzItMMmht9GivrK8C
 QhyTPzhYYOVyR9ntCboKuL2+kZROaxjIwsoVz5r/oKP0VbKuaJfrJL7Lv7ZIhhR3lydG
 CNzbtdu3F2cYpg+MXpHEUlIZnkH7zLuBKLB+gMh8kYyp3EqNQQAS0rMemVgoa+nhpFkU
 /5g3hUyFwNaYx510BHqOsI8NGtFGLUG2gI0hU4A6gH2dch4Fh3wSzueOiN70BhxL1HAv
 s9AGpE5xCpoz+WxX0VtbPBWaDDehX6iVbc0NJW8ocCszD667d33i7KNrDKLozI+cZFcW
 dGtg==
X-Gm-Message-State: APjAAAWrd6LOStlW/D9w7JnBq6ng6hXfsJsjynhm7KZjoyIX91OQmc8w
 lBqpaWKi+bp6PI0aWpVn9cktQA==
X-Google-Smtp-Source: APXvYqxXWP6FViW6LfURhClRoyvS10lczUBv/xaYWd2WFj/nIgp51Q3gPEc/Pq33OxqzWh5/7EuxXA==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr17593056wrv.39.1563427141079; 
 Wed, 17 Jul 2019 22:19:01 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id g19sm27028385wmg.10.2019.07.17.22.19.00
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 22:19:00 -0700 (PDT)
To: Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20190712053704.21228-1-mrolnik@gmail.com>
 <CAK4993h_VjHbg-BSbuH469fEZYy9zTz8Uh2o080vySNeopiHQQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7c7dda7e-0a3a-dfb8-eae1-a4ae36c002cc@redhat.com>
Date: Thu, 18 Jul 2019 07:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAK4993h_VjHbg-BSbuH469fEZYy9zTz8Uh2o080vySNeopiHQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v26 0/7] QEMU AVR 8 bit cores
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 7/17/19 5:46 PM, Michael Rolnik wrote:
> ping.

QEMU is currently preparing for the next release (4.1) and we entered
the "freezed" period where no new features are accepted.

This does not mean people are not allowed to post new features to the
list, but most volunteering reviewers will focus on bug-fixing patches
and testing.
(This is why I hadn't reply to your questions on v25).

You can see the schedule here:
https://wiki.qemu.org/Planning/4.1

Meanwhile, could you have a look at adding a test for your work?
(suggested in reply v24 cover).

Cc'ing Yoshinori which series is in the same case than your.

Regard,

Phil.

