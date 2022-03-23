Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09834E5207
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:18:26 +0100 (CET)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzwX-0008HJ-O0
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:18:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWzTf-0002uL-T7; Wed, 23 Mar 2022 07:48:36 -0400
Received: from smtp37.i.mail.ru ([94.100.177.97]:47376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWzTe-0002Td-7F; Wed, 23 Mar 2022 07:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=UG40GknTGBVwrnnkNTUUZO9hh/xq5ynjK/5Ljza37w4=; 
 t=1648036114;x=1648641514; 
 b=Lqbupxa7ZOB39xdHXCLcleLm9OIh2ErVygPeoBCrgD0/HhX+am/VffX6Iv3y6dBeqNiksy1mzblYQLKluWL5InaI1h4EhPDcQmh5VUV0nKv0OXNuUFDqAJX2mcFFZBuCvdpbEhfPx0jAKCxQ6IYSdkSq7CBtuXPqCoTit9cYuhSvazAI19GEasHutjBF0+0oLCsanT/gKFbsopKZ8u3Lk/OMx1ib1rc9OENxFCJIrWy+bGBGnkDzlttRYFWNXiBs8msYin5AOlJ4P/frMvRlmOZs6OxIEJvsEPkyk3pyIjY9f/bmBbXa2o+tZoVoWMp5Qcm/UYI4HKpkfM80Z/sF8A==;
Received: by smtp37.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWzTb-0004Yh-Je; Wed, 23 Mar 2022 14:48:31 +0300
Message-ID: <318e9e54-bc36-ae8f-3fe4-57e48eb466ee@mail.ru>
Date: Wed, 23 Mar 2022 14:48:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] iotests/065: Check for zstd support
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220323105522.53660-1-hreitz@redhat.com>
 <20220323105522.53660-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105522.53660-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp37.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC3ADA2256CB2C78C641D053A0B6D83E8182A05F538085040388B7BA963B7CA83D1A3977E614798F3BC175767DC1B45BC142629AA6E676547
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74BE895B46187343CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8FDCF00C94A5CC11B5C146B8B52E1C8196F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7D9442B0B5983000E8941B15DA834481FA18204E546F3947C062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637094EC5B0CE4D34ABD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE79CA0AEDD937563A1EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3BB32798324996ECA35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A509A85390D995C2B550F7D191855B4B48E16474A598DF91AED59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA754E2A133C74F7AB4F410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3474B2583E51315984052F791AC6D7AEFFC3DA90C3FADB9DFAC1C5D8E529CF482AFC1895A41C7CC0CB1D7E09C32AA3244CB4214191AD38E44F3818049AC6D4C20DA995755A1445935E83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmBiQ4va0sOsZQ==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F1591031358E97279ED2B1D9D1CCFBD6902976AF1CB91E6F681E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.97;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp37.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

23.03.2022 13:55, Hanna Reitz wrote:
> Some test cases run in iotest 065 want to run with zstd compression just
> for added coverage.  Run them with zlib if there is no zstd support
> compiled in.
> 
> Reported-by: Thomas Huth<thuth@redhat.com>
> Fixes: 12a936171d71f839dc907ff ("iotest 065: explicit compression type")
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

-- 
Best regards,
Vladimir

