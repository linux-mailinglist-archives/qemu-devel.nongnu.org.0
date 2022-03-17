Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13314DC111
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 09:26:10 +0100 (CET)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUlST-0006Nd-GN
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 04:26:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nUlQw-00050s-SJ; Thu, 17 Mar 2022 04:24:34 -0400
Received: from smtp56.i.mail.ru ([217.69.128.36]:60620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nUlQu-0005W8-Kz; Thu, 17 Mar 2022 04:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=yMC33JpNmcM+OOlIjDrR+WU+bbXPKOUbJtoCkgAjCGU=; 
 t=1647505472;x=1648110872; 
 b=Sfd3AhFawgBWZ2UO6GEAXlRt5fCh6VHNbwRgSsAlMo0LBe3wlXXMwILh4VmfxezDEfMdqkKwK92SiMO7ky+m3bzZkSwo/D3bxU8XIQeCaUKiVqQMmMiJTtgkMn6UBBeKAOw3ywCY4O2BsTjg6NViB5GiaoMBaMB9LsScph3kEGP1XrplhB7SgNPWDjEEJkPJ85HmlwwDTXPwcwtkhm7y9uYYt2KjjVwFtHu4Be2SQsmZP5Rh7rtSXHu8VrVvcWB8K7IAfiOuURKN2ZbPs14bF7Kp08K9AzUr2SEqgcUGA8vg4UXhF1UXXt50/RNKhsD57zalM8W5DD5ISwjkav7hmw==;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nUlQq-0006nU-Qp; Thu, 17 Mar 2022 11:24:29 +0300
Message-ID: <3e0a174c-71e1-2308-855e-0cc9102a8ee0@mail.ru>
Date: Thu, 17 Mar 2022 11:24:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] MAINTAINERS: change Vladimir's email address
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220316092702.426629-1-v.sementsov-og@mail.ru>
 <20220316213620.yrc6fvskjqabogoi@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220316213620.yrc6fvskjqabogoi@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp56.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D943F32FEA3DD8B53B2D4598B97B4B69A182A05F538085040E9037A6936F18D1F3D69BBE6CD3785FBBBCF03DFC01348996853E04672FEEEC7
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE771540F9ECFC94C4BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745476ED688D943148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B090DEEFE33FA472CA0B8D50FC464A146F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE77B6A9F97C9A1D64D9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC58EF6B6C4BA7D2813AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637779C3867013E6CCFD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F1FC58B5115ECA9A2262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5A1B6E19D191E891F483CA9A05A10213E402673BA013DDF51D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B742A0F936AD8A56410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340297C696F996E38414166EABA4C4900B0C722A540845B83066E485899A2CA81EB7105FC3EA349A8B1D7E09C32AA3244CB88FC12ABF3BEA30683686E92DDD1EA08894E9C85370243EFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhaSrKeNT9AivhfNryeDSmA==
X-Mailru-Sender: 6C3E74F07C41AE94DFF23C58890DE8D58332D1F88ED5038B18BF190F26B4C94A8284F42B5E333C68E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.36;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp56.i.mail.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

17.03.2022 00:36, Eric Blake wrote:
> On Wed, Mar 16, 2022 at 12:27:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Old vsementsov@virtuozzo.com is not accessible anymore.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
>> ---
>>
>> v2: @ya.ru mailbox works bad with mailing lists and git send-email
>> command, @mail.ru works normally.
>>
>> Probably, I'll have to change the email again in the near future. May be
>> not. But I think it worth to change it now to something that works.
> 
> Same comment as with your attempt with @ya.ru - I'm happy to
> incorporate this through my NBD tree, but want to confirm that we had
> a round-trip conversation so that you are happy with the address
> working to your needs.
> 

It works)

-- 
Best regards,
Vladimir

