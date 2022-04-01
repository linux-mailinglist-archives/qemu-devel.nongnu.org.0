Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081C54EEEBD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:02:19 +0200 (CEST)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHr0-0004f7-4Q
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:02:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naHo7-0001Ou-Ot; Fri, 01 Apr 2022 09:59:19 -0400
Received: from smtp61.i.mail.ru ([217.69.128.41]:56476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naHo5-0004R2-Qi; Fri, 01 Apr 2022 09:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=oGqPuSxm+0sAt+I553dbGA1DFKvb7T1L6VzzPSrSCDw=; 
 t=1648821557;x=1649426957; 
 b=F9yxev/oJ4uYp8N3Tx6CjZFLF2ks744r1f7vcE061hrkEjdljuESSvj9NYhlIHF6Vmnlwn5reg/gKugE1R9KvfrVKqMIH6eZcsDbr1dHPn8EXyXRIB6pOUhPGRBc4jyrTCOCzioGV9RyHYA/SEZz+5zpuqfGzJQc5msF+CBDrj/+IMAK4ZVIx5ASJS1XLV7SvbPTx3NP76Pk8u5aGC9WMMj7S1t7gO7iRHoIroO8rKI+teZ5Q+d+DoivBlaVmI4cHhrxLGTTwqST+nUwH4GC93J4oNjh7UqaSnkwes58Z719szMS+TXIOSCwSK8+gZB+tU4YkAKyVJ120gK+0gbA9w==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1naHo3-0004uf-1C; Fri, 01 Apr 2022 16:59:15 +0300
Message-ID: <d16d96f0-d0de-cf8c-c6ad-26f9b2719fd0@mail.ru>
Date: Fri, 1 Apr 2022 16:59:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/7] iotests: copy-before-write: add cases for
 cbw-timeout option
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-8-vsementsov@openvz.org>
 <830479ed-6bb7-771e-0d4a-db3c3346670c@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <830479ed-6bb7-771e-0d4a-db3c3346670c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp61.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9771EFB8797C310D1FE519B944DE714847DCE9C180800E4D7182A05F5380850407AFE7821DDA976AFBC92C9C8580CF50692B9A6E239ADE3DAFC0360345A37E990
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70312E9A300D47E3BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376473F174BDE74BA48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D813AB14E0CB94E3A30D80963337D44E2B6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE715C5AF61602698339FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE652FD71AFB96DC7D45B9AC499A3C791CD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3AD74539164518AE5BA3038C0950A5D36B5C8C57E37DE458B0BC6067A898B09E46D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE784355C927A450B6A731C566533BA786AA5CC5B56E945C8DA
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A56A708DFD5EE1D3189909BFA3E31D82CB30FFF325F49BEF5ED59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EB7BD66E9101C100FEC485C6FDCCEF473773C872C58BECE50FE6D52F949FFBAC39C3BA34FDFC21361D7E09C32AA3244C15FEFEF775826C3D5FAE05728A7488B895A9E0DC41E9A4CFED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhgUChjrcp6G6n52egQrTPg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FED3D9D57775C6F1E321ACDB02B2DBEA108070B02EA316FCECE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.41;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp61.i.mail.ru
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

01.04.2022 16:36, Hanna Reitz wrote:
> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>> Add two simple test-cases: timeout failure with
>> break-snapshot-on-cbw-error behavior and similar with
>> break-guest-write-on-cbw-error behavior.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   tests/qemu-iotests/tests/copy-before-write    | 78 +++++++++++++++++++
>>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>>   2 files changed, 80 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 

Thanks for reviewing!

-- 
Best regards,
Vladimir

