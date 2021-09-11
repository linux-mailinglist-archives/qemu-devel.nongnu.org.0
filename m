Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0864075CF
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:31:45 +0200 (CEST)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOzMO-0004mk-8y
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mOzKj-0003xe-Lw
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:30:01 -0400
Received: from relay.yourmailgateway.de ([188.68.63.165]:50477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mOzKf-0006Rq-Np
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:30:01 -0400
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4H66sH1j4yz3sN8;
 Sat, 11 Sep 2021 11:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1631352595; bh=sX7fJBDEYEHkgb/OKg5hU0/tOxAmhEo3tcnV6naMV8w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MtLut50bcdn59WOlAlZEdoDNkxYFS5MOVMRPQNG+7ztTwn7UHhrzOuIWu2fkggloi
 O3ckkikuNd+292sl4FJmey1vrNxI5ewywG7ztNUMbssFGovLEZok9MgfemfrFkqRhN
 P9gDE8pbvjLcY266cVv74Y1wbxmG7w2wmfNAaeof5W55BZc+3ZWxiHtqZLhwO5UzuF
 eh0oXpIZQpQKPOQ0H9zKroSx/35uo+J9aK7BpAbRvGelz4N4aXiZhPyggmHBlwng+9
 IFB2fkSBeWtLAiSiI6ETpuKEAVH4H80AlTl7uqQ8Cu2GTjHJ2mS42d90jatyF/t8mk
 Nnl/8Qwt3x8hg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4H66sH1Hz6z3sMj;
 Sat, 11 Sep 2021 11:29:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4H66sF3zv5z8sgy;
 Sat, 11 Sep 2021 11:29:53 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-41.hsi16.unitymediagroup.de
 [95.223.69.41])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id C9EE5625DA;
 Sat, 11 Sep 2021 11:29:52 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.41) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Howard Spoelstra <hsp.cat7@gmail.com>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
From: Helge Konetzka <hk@zapateado.de>
Message-ID: <b353ed86-43e8-498d-1d92-a5d0434da93d@zapateado.de>
Date: Sat, 11 Sep 2021 11:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <163135259312.5192.9505259094875709533@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: jllFVp6tbv8mPDHLZK6M3Ob83HdPqSJI/BKn4x+MzqaB
Received-SPF: pass client-ip=188.68.63.165; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.09.21 um 10:43 schrieb Howard Spoelstra:
> 
> Perhaps it would be better to fix configure for the MSYS2 case so the 
> flags or the renaming are not required?
> 

Currently MSys2 packages qemu successfully for 3 different toolchains:
MINGW64: msvcrt / libstdc++
UCRT64: ucrt / libstdc++
CLANG64: ucrt 	libc++

see https://www.msys2.org/docs/environments/ and 
https://packages.msys2.org/base/mingw-w64-qemu

For CLANG64 configure needs different flags - all other flag-definitions 
failed:

AR=llvm-ar RANLIB=llvm-ranlib NM=nm OBJCOPY=objcopy STRIP=strip 
WINDRES=windres \
./configure.sh --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl

see 
https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-qemu/PKGBUILD

Just a note to keep in mind if someone wants to fix.

Regards Helge.

