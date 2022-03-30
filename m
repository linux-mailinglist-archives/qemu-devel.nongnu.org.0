Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4E54EBFD6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 13:34:01 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZWaO-000453-Hz
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 07:34:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZWYq-0002vf-Sw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:32:24 -0400
Received: from smtp41.i.mail.ru ([94.100.177.101]:48430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZWYo-0006Xm-Hj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 07:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=h00XM6oxtMBuBoW+IHqUbpxXk+d43GE8P8avIKgJ0EU=; 
 t=1648639942;x=1649245342; 
 b=T0mxapZK4Wyl4GR3Wrfe7LSR0SjhCppPzs59EsXhtwBN8Mr44xcPJLzgVvAi3FNpsFYCUkW1YmOKSA54PccdgY7Hn1ZaUnbwsxtsJx34tKT4Ab3xc0BnEqBkxAMDc59NyIYGjyfy8kj5VcQ4O+4AgfzssNo/+Z+P7Z9GMis8wI9p440SrTcZGIkdcnyWCesvei0mwjOLW+SIJt1xUcmBVrZOnsiNh70jTsYzsfvRxUThir4y5bJcv/l5s07UG1iY4MIFZjnl+6knsoyRBHGB7N8Hj4I5DYd7MYZSMnzqtLh8CmJGaLCcJy1sfjauFA+OzGWM6YQn5fVGoeo6KK1mRg==;
Received: by smtp41.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZWYk-0003u2-Sf; Wed, 30 Mar 2022 14:32:19 +0300
Message-ID: <5c20f014-27e3-d6bb-1e8d-e111134a8dc3@mail.ru>
Date: Wed, 30 Mar 2022 14:32:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/9] chardev: add appropriate getting address
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-7-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-7-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp41.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61AD608933592879E20A8B16C77A2AB91B00894C459B0CD1B9D19EA465FA1BFD171D4D39E2D93C7660691DD2F401EE62A72059E94B53F79380
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE789066434B85BF7C7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C867FEFF36BCDF178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B64DFD228E8B299D3F3B1D30B28726B96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74F330F0740BBDD1F9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B47272755C61AA17BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC1C0C0CA3525CD776D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE75279A685C79E1982CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6DEED4A3DC2092D10089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A59780FF070B8B086BAB751A0CCC24F1CF7F7CE57D3B8A3024D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3473688ED311681BF0A5A1AB5A5841E906F5965FE642E19C1B27B9B891322F17B26563FD8B7582B9C31D7E09C32AA3244C74021480B95BD061548362C8F41016B91DD47778AE04E04D4A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojlgoDDUY05+VKKKvecxF9uA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FEC442A2C58CC758FD3F7A19EB8EE262E540E9BB12924E08C1E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.101;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp41.i.mail.ru
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

29.03.2022 00:15, Maxim Davydov wrote:
> Attempt to get address after initialization shouldn't fail on assert in
> the qapi automatically generated code. As a possible solution, it can
> return null type.

But at some point this address appears? May be we try to query it too early, or we need some more initialization steps?

Isn't it better to report failure, when we try to query things that are not yet initialized?

> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>   chardev/char-socket.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index fab2d791d4..f851e3346b 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -33,6 +33,7 @@
>   #include "qapi/clone-visitor.h"
>   #include "qapi/qapi-visit-sockets.h"
>   #include "qemu/yank.h"
> +#include "qapi/qmp/qnull.h"
>   
>   #include "chardev/char-io.h"
>   #include "chardev/char-socket.h"
> @@ -1509,6 +1510,14 @@ char_socket_get_addr(Object *obj, Visitor *v, const char *name,
>   {
>       SocketChardev *s = SOCKET_CHARDEV(obj);
>   
> +    QNull *null = NULL;
> +
> +    /* Return NULL type if getting addr was called after init */
> +    if (!s->addr) {
> +        visit_type_null(v, NULL, &null, errp);
> +        return;
> +    }
> +
>       visit_type_SocketAddress(v, name, &s->addr, errp);
>   }
>   


-- 
Best regards,
Vladimir

