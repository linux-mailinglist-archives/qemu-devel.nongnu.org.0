Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB74ECD33
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:27:13 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdyK-0000Au-4Y
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:27:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdwX-0007Fb-3E; Wed, 30 Mar 2022 15:25:21 -0400
Received: from smtp38.i.mail.ru ([94.100.177.98]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZdwU-0007td-3S; Wed, 30 Mar 2022 15:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=KMHuKhQJ5NB3EcPhHZLnBSxv05PIZfFcIC59ygYv4V4=; 
 t=1648668318;x=1649273718; 
 b=nZAlPgf5J7DOYOVjldcg/0IZveyqs5noqQrzW20HuADpKTfunuzpMuob27SQfmimLVP51jhgLCdbbBlka/8JDkiFmNCMCErep8XbslhLrMWgpYqUpjkOzKCMSPGwHbLqfgimb7Zmea/u8xZON7kHCu7HBv9ZuyU7ZVlMIauX7ZqTJwVLMelEieALR9VnM7LhdyKL2xD62rOuDK0nmAEEnHPYdqGLaFtmtSuJtd8K2G9DR77scicPqOj8U4Kesy4zFgRZNXxw4X9KjEZUGpNxeT92BRTzXU23dhfIm3O2whkamEDYQcIIXktyZnZwtsaNHJgYCs/jElnqs16UePEKSA==;
Received: by smtp38.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZdwR-0005E2-8X; Wed, 30 Mar 2022 22:25:15 +0300
Message-ID: <c3538c99-c40f-a517-4915-4746f42fe238@mail.ru>
Date: Wed, 30 Mar 2022 22:25:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 9/9] python/qmp: remove pylint workaround from legacy.py
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220330172812.3427355-1-jsnow@redhat.com>
 <20220330172812.3427355-10-jsnow@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220330172812.3427355-10-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp38.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE6427D5C075F9E61C41307589F8F117601A182A05F5380850404C228DA9ACA6FE27F700DBF7FAFE73A40FC3029D5433EC020FE05EC86C67C26E129A34488B4BE346
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7571C18AED7CB6805EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D7F1BE85E7B0CA818638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8AC59344B599382A583BAC056E7E22F996F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75A31C54DA8CF07A79FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2CCD8F0CAA010FB389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637994E438D700A90A6D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE75279A685C79E1982CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6D844BA284C397EC175ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5F4F05FCBF1F7E5666C31CD381A5451EDC284AC03FB0F00C5D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34197948450CB5442A8CB8575951C24CEC8EF61B72225298C66BA19908452F7445C8D964A33C938AE21D7E09C32AA3244C20ED8192B274EB013F56F56A7606E2D230452B15D76AEC14AD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+UzE+UXEt8qGw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEA4071643EACC87BB3DE491EE3079741C8E4BF35A5A934752E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.98;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp38.i.mail.ru
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
> Pylint upgraded recently (2.13.z) and having a pylint: disable comment
> in the middle of an argument field causes it some grief (It appears to
> stop parsing when it encounters it, causing some syntax problems). Since
> the duplicate line threshold was bumped up in 22305c2a081b, we don't
> need this workaround anymore. Drop it.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

-- 
Best regards,
Vladimir

