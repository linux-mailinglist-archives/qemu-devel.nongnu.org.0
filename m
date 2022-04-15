Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7050287A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:50:30 +0200 (CEST)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJX3-0005g6-9H
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfIwm-0003vm-B1
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 06:13:03 -0400
Received: from smtp36.i.mail.ru ([94.100.177.96]:39320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nfIwj-0000fV-AZ
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 06:12:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=p3YRENMyKniahWpxq42dQ2FylD8fBIm8W+wRkO5QXok=; 
 t=1650017577;x=1650622977; 
 b=UIDmoBVSmhCsEsfax7suwRWZCuaTnbGa2aXWiWA3qjio3gbx8Er8YrlqbUtXF0xPbugLufB1AfCX0P6+hQW3i2t5+T2vyjYcjWSD43fJvfkF8P+b2tV4WvY9WIl36PFfTCCqPuYWqRRL5ttIdbc6fElSAnRBJDqv5xrabhD7NCscEpZ70Bov6uhQn4qjwSg9mtDgI3atgQ6k9aVx6irbznZ8p914GPBip7HogN/0KpPE/56QHflsptDQMc1K6uzsQRMK9sa3TaDKvoyyZowS2XBZP4zis+mFbmoMee4lC8op+/txNPRGo196lP/r3WfzWMRUSdxo5X8HbjhER6thCA==;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nfIwf-0000aK-P0; Fri, 15 Apr 2022 13:12:54 +0300
Message-ID: <1e61b9bf-25e6-f874-21cf-e3a75fb6511a@mail.ru>
Date: Fri, 15 Apr 2022 13:12:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 2/9] nbd: mark more coroutine_fns
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-3-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220414175756.671165-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp36.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD916C41472748AFA043E4DABFCF256290B705C36BFA1E9B4D600894C459B0CD1B9E494B664E29B5DC54152C389FA57F7D8E9E34DC3F82E62F35D31DA4D2BDE68BB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74D0D2DEF2EB846B0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063726CA83C7ABDB938E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D42EE9F0F72BDDD5E2B8ED4956E978056F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EEB1593CA6EC85F86DCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B07CB022245CAE856389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637BE8EF786F63CF00FD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE74721ADB44190F2ABEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C325AE611EB865B371089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A52E60CC10C14907D70042F7A4466F43312866E7DE80C347CCD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343D50AEDB859DBAD9CE6166FDD9685698E42C8B3BC66F72BDADC0B9CC62C1C11EFFF16176C2E601721D7E09C32AA3244CD34FE2B8EC6E16C8D02C987C50C1542BB038C9161EF167A1FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojNgQIGdrTxngFhCBviZgAGQ==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913075E31794FAD69EFC403CC17F8D56AC10ED030F7240E6698E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.96;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp36.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.04.2022 20:57, Paolo Bonzini wrote:
> Several coroutine functions in block/nbd.c are not marked as such.  This
> patch adds a few more markers; it is not exhaustive, but it focuses
> especially on:
> 
> - places that wake other coroutines, because aio_co_wake() has very
> different semantics inside a coroutine (queuing after yield vs. entering
> immediately);
> 
> - functions with_co_  in their names, to avoid confusion
> 
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

nbd_reply_chunk_iter_receive is forgotten :)

Also, many function headers becomes >80 character length, checkpatch should complain.

That all is not critical and may be fixed by follow-up.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

-- 
Best regards,
Vladimir

