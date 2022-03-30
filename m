Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA254ECD2B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:22:26 +0200 (CEST)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdtf-0003qw-5a
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:22:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdsP-00032V-V2; Wed, 30 Mar 2022 15:21:05 -0400
Received: from smtp29.i.mail.ru ([94.100.177.89]:35330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdsL-0007AT-2c; Wed, 30 Mar 2022 15:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=SJ8K01vV9j7yWUJWtOVD/2Pr0i8hg1dizLCVa2xDkEQ=; 
 t=1648668061;x=1649273461; 
 b=W9TEVo4LLznReX6F7VNh13OCy2ICl8l+vEJIpGCP0uzTgE22I3c7PYBWJ35+y9KaIHr8mGtb4PE1X0w958U11ZfMeAxgQ8ITaZnznCePN9c0+ehXemumCs6wZv9elPVx8s0XzszqmTEi4dGJiJojvB7bOzYV+G0Td3I4e+LViLK8OjHo04pfgBVE9N0Y4R3o4j3Soit82wesiMHQlsNx4UPbgZEVdv0vsY+QeafHr7At1vX/P0rmeCXgLSogTOk7ru49a1M/dwLuOevzWeXSPyLgpfrYuEtW42lor66ei5XalhuAhtlQYexC6+ebR+V9v18fPqaMIDt/d82i6Jvwyg==;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZdsE-0007Dh-HT; Wed, 30 Mar 2022 22:20:55 +0300
Message-ID: <3d559026-6933-1387-d6b2-49b55cd7f103@mail.ru>
Date: Wed, 30 Mar 2022 22:20:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/9] python: rename qemu.aqmp to qemu.qmp
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220330172812.3427355-1-jsnow@redhat.com>
 <20220330172812.3427355-8-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220330172812.3427355-8-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp29.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB617BAFEA8A05E639C3B4E0E7AAF66DFFB700894C459B0CD1B96B9A70639D02C0D0D403DD13D4E4653958CD314E3E819EA62770ED6FFD3D5E82
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7832AD58179B12F4FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637782358EF9635990EEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6CA18F7F5FAED11B4C1E63B2CC8CE1AA320879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0565C7A4E90E531F78941B15DA834481FA18204E546F3947C724336BCC0EE1BA8F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637994E438D700A90A6D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE78C2874D3AEDE837BEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C376B12FEE68107A2B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A52F9E07E45A20B3306FA24D9295A654FEC5567B7AF2FC87A5D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3454548929AF40B4285F89E549DD684A8E662479BA3C6C68261F64C0081B208D50C4A1820E706269EC1D7E09C32AA3244C3F357577991D07774A0603B4F806AAA3F165894D92D62706AD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+VbaqWvwbhm3Q==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE8A02B1134DCAD25657B9FEF95AEA92229C70852D818E7B91E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.89;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp29.i.mail.ru
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
> Now that we are fully switched over to the new QMP library, move it back
> over the old namespace. This is being done primarily so that we may
> upload this package simply as "qemu.qmp" without introducing confusion
> over whether or not "aqmp" is a new protocol or not.
> 
> The trade-off is increased confusion inside the QEMU developer
> tree. Sorry!
> 
> Note: the 'private' member "_aqmp" in legacy.py also changes to "_qmp";
> not out of necessity, but just to remove any traces of the "aqmp"
> name.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Beraldo Leal<bleal@redhat.com>
> Acked-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

-- 
Best regards,
Vladimir

