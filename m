Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029E4ECD2F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:24:08 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdvL-0005wJ-En
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:24:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdu5-0004ck-8r; Wed, 30 Mar 2022 15:22:49 -0400
Received: from smtp53.i.mail.ru ([94.100.177.113]:59948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdu2-0007OI-VF; Wed, 30 Mar 2022 15:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DHrSvMStQnUcbM3H26Aplf4Xcw+Cwxa6Yw0L9/SK8+4=; 
 t=1648668167;x=1649273567; 
 b=V5d15w0cqZsPD+5tOiWMhy5yczgebra81wo64/0AiYXYuFIInQQdsMYzjCtcaxFKcyD1Ik117cOLhGwBuqLpkRv/hwBwV6HlQucSI9swnTuGrtqH7vZh9GjDhVqdB8wavA4ppDTNg42Y2z0ETvbsXU61Y3snd/wC1VZP19p10R/Hm99ogz3PWl/s5gqcq+PIUnLoXH7n6Ho6nPIixKpm5Vc4lMDc9Vb5d0o8fC12YuOLu3UmjyoiewIJkF2uAjt5DWlyU3X6rUS7V8A1CxaEPSIL6H8QtpHLLU044HonZtmkqHa6sMHvjkIBg4008AollhZoeyO2MicbOh2xu6nBRA==;
Received: by smtp53.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZdtz-0007te-Bs; Wed, 30 Mar 2022 22:22:43 +0300
Message-ID: <718cfaba-3b99-e816-1ea3-46a4c29b4519@mail.ru>
Date: Wed, 30 Mar 2022 22:22:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 8/9] python: rename 'aqmp-tui' to 'qmp-tui'
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220330172812.3427355-1-jsnow@redhat.com>
 <20220330172812.3427355-9-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220330172812.3427355-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp53.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B9328758C69F4EF094F86C1C8C331315CD58CD314E3E819EA6B939BEC6D9612482
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE787D390A33DAA1DB5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371DF52D98DC3592C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B2B2254ACA3136FD5CE7906D4141BA536F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7D843C564432FD9A99FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCBEC796C496361B333AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006373FF21A5414A8D508D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC36703085CE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A596528F81AB391FCE709AE6C6A4B0ADEA1DF0D86788C7F504D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3475FE4AA98865E2355BEB64DC9AEF7AA8AA747AB4E19A77A7FD1023CF354D648F7E7E7FF3618D67451D7E09C32AA3244C8D94D89CDEF488FD25E5FDDB066A8AAAB018FE5BB746DCD1AD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UYCgE2h7OLQg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEDD14D49A88947D1BE395E890B08656929DE5AA633C6E80F5E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.113;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp53.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

30.03.2022 20:28, John Snow wrote:
> This is the last vestige of the "aqmp" moniker surviving in the tree; remove it.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Beraldo Leal<bleal@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

-- 
Best regards,
Vladimir

