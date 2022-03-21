Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40834E31D9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:33:07 +0100 (CET)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOiA-0002B3-ST
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:33:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWOgX-0007uL-Bz; Mon, 21 Mar 2022 16:31:25 -0400
Received: from smtp35.i.mail.ru ([94.100.177.95]:58576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWOgV-0005q8-2P; Mon, 21 Mar 2022 16:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=/RDiBuz35xYoZq5nEhCNAGQs251ekFBQ8DYwk8oYkLA=; 
 t=1647894683;x=1648500083; 
 b=o6IHqQYqa942/LMt0s6oUi/YFRZbldnVQa4kkTV2owKewOF/LGl5niyuosB61NjnVbodd6woaTU1U1eOmAC3APBWzB18UrLu1s/xl3e7wSby9utiD4d7rY100aue+vJpA/IRxQuT8apSIzNTM9dX1gvI5lAL81EyZX1MBwmb9Gx3KTVOfjJ7rdyc3Qx1nY1pFhhM+DCkdMYPI/llCRPXdCh4DREFcWpx5W/teP0p1FC7K+V0kW3DH/geSnRgFT3VFZSgH8BVdBvlgxgAKEdRaYINn94eAUgryDXxyzMsA3vY97mi59D00+p+31uBnqNjysxOHXtOWdxTT1qYaTjSng==;
Received: by smtp35.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWOgR-0005j7-Ea; Mon, 21 Mar 2022 23:31:19 +0300
Message-ID: <a788ef1d-45e8-85ef-583b-227710351f3f@mail.ru>
Date: Mon, 21 Mar 2022 23:31:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] MAINTAINERS: change Vladimir's email address
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220316092702.426629-1-v.sementsov-og@mail.ru>
 <20220316213620.yrc6fvskjqabogoi@redhat.com>
 <3e0a174c-71e1-2308-855e-0cc9102a8ee0@mail.ru>
 <20220321201251.ohhzthftzmijihf2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220321201251.ohhzthftzmijihf2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp35.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC3ADA2256CB2C78C641D053A0B6D83E8182A05F5380850400B576371791C644E7C5E71598827EC51C65E2B22E03B2E1D31B8F5E922AF676F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F6EE1C40B2E8BE15EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637ECAF4C2CEE0D0B2F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D839D2B25C8E01C7D72B05B8D013F82EB86F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7FAECCCEA3C6131909FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC79416704721CF3893AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006370CF4C22D54FE07E1D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F29C2079CDE5AC98057739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5CB7F4F7F0C87DB7373F0E6C536BD227668116C2A7167E3D2D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA7506FE1F977233B9BB410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C2BE7381A0AD3DF17281FA21BFD2E891C72447BF98DA67C97C68D969EFA4C20A990A5A4CB15CB97E1D7E09C32AA3244CB884B223F4D89BDD978E5F0D02971ED0E3D93501275E802FFACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojSLL0ldHQslaNIOydPLU5fw==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15C7BF2EDADDF4F7B9A6D922758612432F32EB7D721F4F4800E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.95;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp35.i.mail.ru
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

21.03.2022 23:12, Eric Blake wrote:
> On Thu, Mar 17, 2022 at 11:24:28AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 17.03.2022 00:36, Eric Blake wrote:
>>> On Wed, Mar 16, 2022 at 12:27:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>> Old vsementsov@virtuozzo.com is not accessible anymore.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
>>>> ---
>>>>
>>>> v2: @ya.ru mailbox works bad with mailing lists and git send-email
>>>> command, @mail.ru works normally.
>>>>
>>>> Probably, I'll have to change the email again in the near future. May be
>>>> not. But I think it worth to change it now to something that works.
>>>
>>> Same comment as with your attempt with @ya.ru - I'm happy to
>>> incorporate this through my NBD tree, but want to confirm that we had
>>> a round-trip conversation so that you are happy with the address
>>> working to your needs.
>>>
>>
>> It works)
> 
> Okay, I'm queueing this up through my NBD tree.  Do you also want to
> tweak .mailmap and/or contrib/gitdm/aliases?
> 

I looked them through, but didn't finally understand, how they are used, and therefore, is it really needed.

-- 
Best regards,
Vladimir

