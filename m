Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39334263DC6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 08:56:42 +0200 (CEST)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGGVd-0003PP-29
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 02:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kGGUZ-0002kE-QB; Thu, 10 Sep 2020 02:55:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kGGUY-0000wT-0x; Thu, 10 Sep 2020 02:55:35 -0400
Received: from [192.168.100.1] ([82.252.148.206]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MQ5f4-1juDMG2RnM-00M3s7; Thu, 10 Sep 2020 08:55:20 +0200
Subject: Re: [PATCH] test-vmstate: remove unnecessary code in
 match_interval_mapping_node
To: Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org
References: <20200910023818.11880-1-pannengyuan@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cf8ced1a-8fc4-89ae-c468-00f9dba9ba8b@vivier.eu>
Date: Thu, 10 Sep 2020 08:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910023818.11880-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jJjcYA3ruRvPfVjS6KA0sVeDAkUR6wQ2DBQbj+3wokP4ESPCekw
 LQypU46qiKQ+Q1zdybX+AstHJyTqpYZA2r3Wjn2kYjxnpOxm0uyQHm0LjAlMJL21QPAlqbT
 HeASGTC2SMLu6bTmu7tKYtqoZxmb2QBmfFH0jrPwLRWVe47yRHioT2p/LQLwXsUSeXapTZC
 bPBgdQ7viHO5HhY9DuXJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:492Rh1SZAZ8=:UM2oaVaMZfJBPO1xUhd2La
 b7dTWppIymv1dygFO6PAyfh/ZcZLuq+Sr8z56o3p8VCe+iDJB2dMEtWzIVDQIOwL8loXvpa8R
 tDop6PdOHv3PjTGrJwoN0VEtfulwidYsDnAOHSXyfGKpWFg9IQgnqh2lN1I6F0s0PF8lnH8JJ
 XrpKxwly0kvl5diCCbuyRRsMjS7nVjfKbq88X+S1apSD/IncrgKwsDxsm7oXM26zwdpJqNX6M
 cT+kbuBloZUETdIKCuFDavoHqFLgsO5O01E+NGhIYDH/T8GUaLDsxmHw6NpX6YC+fO+zOQ1Sz
 I+PHdUS0HIkV+op7FJ72eQxogCwwU5hzjnpfMg0VgiAdxkCsEDrSGRuG39pK2QsxgVF5Hmvu/
 5VMSVvUdyhvZIxwScSt1lGrOII+rwwFi+Ylb+HRcyJrW4AhJlINiqvcwO4bjDQeZfJ7TIVOYv
 xiTAoRcx0GifwYqo7WXJdl+WNKmfnS68DYMCgrwNnR3Q/76DtZy/XaP85jbi1UwBUFB4BWhx4
 7PcpSFcmSbynIVZEBzldQOSuegkt3pLkHVtS5sLZ4M63+1PBgSMO8CQyCkvs/lvNTemWtor0e
 ZecckasVLs8lEA7NVxq+fiIzS2FbeV8J02x/fD/n/+mxDktL7XvD359foatDyjtSN84MYrSqt
 Gnh/tLwKY6z4NjUek3NNWnGa3bEXgN+09iwrBaGX3wE337PMk9nW44PrPugwny8H1Zbb973sm
 Ga08+aMTvY3TZYMecw8hA/9nNxZa9es6kDCgy3yZcfm0E+xXmWSo5RZvYI5SB3sEvVBiDgh9+
 MVd3F8gVHLo7Rn0PzxG/iAUZm9d0m71Jpw2z1d0guQr1IyGhJsT9dzAL3Pgx30NJt+XTmpX
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 02:55:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.576,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 qemu-trivial@nongnu.org, f4bug@amsat.org, dgilbert@redhat.com,
 eric.auger@redhat.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/09/2020 à 04:38, Pan Nengyuan a écrit :
> 'str' is not used in match_interval_mapping_node(), remove it.
> 
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
>  tests/test-vmstate.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
> index f8de709a0b..1c763015d0 100644
> --- a/tests/test-vmstate.c
> +++ b/tests/test-vmstate.c
> @@ -1055,9 +1055,6 @@ static gboolean match_interval_mapping_node(gpointer key,
>      TestGTreeMapping *map_a, *map_b;
>      TestGTreeInterval *a, *b;
>      struct match_node_data *d = (struct match_node_data *)data;
> -    char *str = g_strdup_printf("dest");
> -
> -    g_free(str);
>      a = (TestGTreeInterval *)key;
>      b = (TestGTreeInterval *)d->key;
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

