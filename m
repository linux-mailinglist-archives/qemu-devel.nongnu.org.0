Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7337883D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 13:42:43 +0200 (CEST)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg4J8-0006fH-0M
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 07:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg4H1-0005KW-Ng; Mon, 10 May 2021 07:40:33 -0400
Received: from mail-eopbgr50099.outbound.protection.outlook.com
 ([40.107.5.99]:35969 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg4Gw-0001XB-RK; Mon, 10 May 2021 07:40:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvKWwIzBQ3YIDPNjLBkRYk9wTnfHLqvLJi1TPcAPv1yzx2rGIjRlXbwzesL5hpRekzu15R2LRjESjXEIJpz8dn8pSf6MGUjI4eDPJScALzmt33pnrp8i090Bf9BQ2j7jVjIn8nn5aSLh1Taruc7jS6jmoEcOyRSEs44fBj+ZZaLvfc1WOsM+rQh/NqkYQsilSNbih4HhG41/T314bWie7Ej6V88aSQ8I6+PXwG1kgOAJRNVM+XTPcptcK59PG21BWSwl1HkIxYlM366SZ76hArp4RMyVR0TEA6pZcawBtW0mSFM6TG+Eh7J2JkVr81z9rpYxQGt1WuedGbb9Vcn7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XokSWwsL4tlXQtyAsF9NsGRkgu1zWGi9VvyiGgmgwOM=;
 b=Qsbv5gWVR5dadk8srztvMmrDf7KApDbEzlDjX4102PeOqssmXboUon2Q2NyIDASQfXY9U8xncXlQQbDJKzzzi3+A6MAOXBoe4Nqu/Zf0b4rcnP903NwZKTTlMhUgVVRLtjC8TAMJpkuIv93pkaEpKt1aY/YAEUZOk8HCR99IjL1e3M5a4TS0FlZ+CvuaPcH1K5tXk5q7a1SlnVvRrbFnalCAu/BWAahA+QH8mCJgGmnctJXI3INR7weF+YGs5QOyCPHv+ZZDUHGXLGbXQh23scTTme7EduyH+LJtYF/NXcWvDanZycy+dqtuR7NXjG90vJMVpmNxqaN0FOj3z/NsCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XokSWwsL4tlXQtyAsF9NsGRkgu1zWGi9VvyiGgmgwOM=;
 b=NeQUjH0oHGvG0n2nxba5cXh00dIV7tZT4LFQKiSOwF+cjOwuVMprr7F0Neiml0snpQ6RCsN2vS5H358dZTnxznxoHpBzTxtipg6ezGujviZr1Pl6/LQBuER22yO1zTVsOxEN7HO8N7KMcKjM7fZsOah1iArvtaq0Cc91bHYdm6w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Mon, 10 May
 2021 11:40:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 11:40:22 +0000
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <57fd4d5f-4645-905f-998c-a120c042fdc7@virtuozzo.com>
Date: Mon, 10 May 2021 14:40:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210510085941.22769-6-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM4PR0902CA0018.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM4PR0902CA0018.eurprd09.prod.outlook.com (2603:10a6:200:9b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Mon, 10 May 2021 11:40:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e9870b3-9a5d-4864-210d-08d913a86575
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2529646C72057E9C81E02E7EC1549@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BH5Qa+HORlyneMQJOthCHnLGEqi5E2bybP3DBna0HRKnFLU2dgzhKxmHJuPJcovOrn0Rws4TciCpdMyngT5P0H4uyung66x+O6vHhuJ1YRA87AHHuMJXCKgL2AVARTlXUbf3mQwYkvuEVYaA2mv3K6QKWbqcqaK+KA8VciPHbAJ7Wlqr0cj4fAbIViAU0nFehNHXBFfd020zS3bGy//DKJBfoUdM1cZ7y0YSX5+rBNitTcvmgFjts7CFL4OYCNN65n6rf7cIzImxquOstOTCCOkLyp7u8Pmp72aqhRaxe7iA6kWZQ0P7pKoaMCOvpDX0Ef3KhJn2PxOK2R56zijPWRImzclhhHbGh69VJNUekHfE7XLs07FnRVKMNl+GJ69s1GKgbw4WjPE1jgdBYyjFomM1QUOsOQ3BthG8sX3FUDLFmy/iex8yN409QGyG5PM6JA4DC4CH4b3h9E4GKkK0wmJtDfPl509SrvjhAn5ZYZlnZ9/8jKHDQQveFdb0QFIhR7QM33xneX6wOh42pqYyntFTFCU8oJxpgWnZc7TDrgP8OVaBw8xR/v/JCux1vHp0dlz0xw0Oh8xZWoG3LKMAThXL4LbWtw55NhJ6Kf1CadA2qBfW9eICRiTD5hJ+N8EJjoN4A9G/ozpZd1VC19+bIKWl3V4NN1kvvzihZJEW3ZqHFXx7nkmy0uSF4TBgXjWVSFlWVDh+iJoePcI+Jg2Fv+poaFcuBydrWIIeKV6F4YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(66556008)(4326008)(66476007)(8676002)(86362001)(6486002)(36756003)(16576012)(186003)(316002)(16526019)(52116002)(956004)(26005)(2616005)(8936002)(31686004)(66946007)(478600001)(83380400001)(31696002)(54906003)(5660300002)(2906002)(38100700002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGNTS0pXQ3d2Z0ZxSlVYRHpHSWdMaGYrMHNTdis0bFVFMjhpclAzZ0xveG1p?=
 =?utf-8?B?d0lZNEVRQndvTGlsZEpZSWRHSWgydUZPQzN5TzUyUjV5RWgyUFNxdHVuWjBt?=
 =?utf-8?B?ZTlYRFhCeWpoa3NmUXhubzd3K3BPcS8xa3NMdGlwNGVwbW1nK2QweVI3TEd0?=
 =?utf-8?B?YWJFWjF1Tnp1ampXOXdWZXNUZ21iRllKdnhPT2dEMFo1UUx2SktzZ29zUGtZ?=
 =?utf-8?B?MXFyNW54UGk3QkloemJuSUJPY2NEWGx2VzB0dndJQUlPdEJkSEJ2OFR5ODFO?=
 =?utf-8?B?RW52TERVOTlyQ1JhL1Vsb2FKelNFSFdxMEc1bGJDVUtmVWlHUFkrRGZNc1Iw?=
 =?utf-8?B?dWR5T0hjUjIvdTIxeFhONWVONVBEOThOOElVMFNoUGl2M1JYaGNaYjExYXhk?=
 =?utf-8?B?Wnk0cFFmdlVTMTA4dmlaOVRUYjRUL3E5SlVzSTVXWmtnUW1IcVpabm5jaDlt?=
 =?utf-8?B?ZXd4V1hZbTQzNlNJY055U0V0Wmoyamp1YlQ4UERoYXd1MUFrRE5SRW9QbGxL?=
 =?utf-8?B?M092U2xsa2ZuczNVY3ZWZ1pSUWVOYndOL0I3MUZnclpvMlpZVitqM1BFemR4?=
 =?utf-8?B?R1BFUXdUS3YzcWROVjV5YWs2Z3NTYzRyRlhVV1NVT1IzTUZFSStFZzVsOTlU?=
 =?utf-8?B?V2VQbWNYOEJPQnJyN0tPeUVobjdPVFhnVjNMRUJzemxhMU5mTDlBNHVrRVNW?=
 =?utf-8?B?cElRM1F2ZVNOeXRxZVhHaERRQXdnRW50TDFvSElObXk5aklWQzNMSjJKaVdM?=
 =?utf-8?B?RUxPdFY2eXVDSzErbzlSRUpJdzZnaWR5Y3JpR1lXQkI3RGtIOGVxNnhNM2N5?=
 =?utf-8?B?VlY0TjVzTGl6WFhsTG1BVzVGZW1pMi9lZi8xWFQ2cHhpTUJwamFETThQWjl5?=
 =?utf-8?B?Y0c2cEZsMHc5ZzRISksydlB5WXBUellCOEU1TzN6Q3JPempNZkFoT2RVWTBx?=
 =?utf-8?B?M21id2hpMHJsQ04zakwxSmo5anFuTGxBVEFMV1lzUExWSTJrS0lsRU4yQ3FK?=
 =?utf-8?B?NGN2UFVaYlUzYm9mZHpQV1hYNnhVang4YzQ5T2lzaGhibUMwRjFVVHlGNnNE?=
 =?utf-8?B?UlZ3SmxvK1V4Qnp1c3Q4NWFQOE9qcXp1WnkvWUlnMmRuOFpyWVFyZWJjR0cx?=
 =?utf-8?B?K0MwdW51TWhTbkZvRVd1cmZXM1FPcnAxcFhRanArTHdjbit0V0JPR2thM3BS?=
 =?utf-8?B?M0MvRG0xV3hldWFKWENaOFA4VXY1SnVWSUNqUm1uTmV4dlEvS2N3Ty91OHBp?=
 =?utf-8?B?UGFQemlXTkcvaW1SVmUyd0hpRHpWUWNCcWo4dWNjcEQ2QVVWOFFsb1dGYjcy?=
 =?utf-8?B?YmNRcHQrOHVrWnRnVGFsR1N1S3hyVzAzak5lamlyY3JxY1FQQWRKSHk0a2Qy?=
 =?utf-8?B?MWIrSkxwbVNPbml2aFRpM2hSM1prbEt4amVxSE52WVRRTDI0LzltM3Y4aHRG?=
 =?utf-8?B?RmlGRG5DbkcyL0I3UXk4TGtJSFIzUDNTdER2OEkrNGg1TnFmTmxwSGxOU01J?=
 =?utf-8?B?VGplQ2UvNlhxb3pGWnAzbmpDZmVSdXJhVkUvWXlBOHZwKytDTHR3T0cvUUVj?=
 =?utf-8?B?Zk93RzlwUDN6MnE1ejVSWC9nakZhQXJCN0pFYVh6MXR4UzBnVVl4S1V4Ujdi?=
 =?utf-8?B?WFk5S1JYa1Q5OEtzMjcwVGtTVHdQRTBpVVlLWDcvZUgzVE5RRmgwU2V1UDk5?=
 =?utf-8?B?M3kzcjMxOU93NHhhL2ZsZ1drUG9iTStDMERKMnpGaXpBaTFtUThja25EY2ZE?=
 =?utf-8?Q?HTVoK3PAHl+KQQsLKstF5y2EOZ6Nru8nK+B9s1k?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9870b3-9a5d-4864-210d-08d913a86575
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 11:40:22.8140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRSyws+X/0eu3RF6cueyS2Ov64vm/4lCDqLnqoK8uzI4a4ofvuCQVAjr0gcyC6E+tWeOESOHWSGZJQOQCKaryqnC2I/s3HA1mOCqkCLYzTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.5.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.05.2021 11:59, Emanuele Giuseppe Esposito wrote:
> co-shared-resource is currently not thread-safe, as also reported
> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
> can also be invoked from non-coroutine context.

But it doesn't. It's called only from co_get_from_shres(). So, better make it a static function first.

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
> index 1c83cd9d29..c455d02a1e 100644
> --- a/util/qemu-co-shared-resource.c
> +++ b/util/qemu-co-shared-resource.c
> @@ -32,6 +32,7 @@ struct SharedResource {
>       uint64_t available;
>   
>       CoQueue queue;
> +    QemuMutex lock;
>   };
>   
>   SharedResource *shres_create(uint64_t total)
> @@ -40,17 +41,23 @@ SharedResource *shres_create(uint64_t total)
>   
>       s->total = s->available = total;
>       qemu_co_queue_init(&s->queue);
> +    qemu_mutex_init(&s->lock);
>   
>       return s;
>   }
>   
>   void shres_destroy(SharedResource *s)
>   {
> -    assert(s->available == s->total);
> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> +        assert(s->available == s->total);
> +    }

shres_destroy can't be thread-safe anyway, as it does qemu_mutex_destroy() and g_free. So, let's don't try to make part of shres_destroy() "thread safe".

> +
> +    qemu_mutex_destroy(&s->lock);
>       g_free(s);
>   }
>   
> -bool co_try_get_from_shres(SharedResource *s, uint64_t n)
> +/* Called with lock held */

it should be called _locked() than.


> +static bool co_try_get_from_shres_unlocked(SharedResource *s, uint64_t n)>   {
>       if (s->available >= n) {
>           s->available -= n;
> @@ -60,16 +67,27 @@ bool co_try_get_from_shres(SharedResource *s, uint64_t n)
>       return false;
>   }
>   
> +bool co_try_get_from_shres(SharedResource *s, uint64_t n)
> +{
> +    bool res;
> +    QEMU_LOCK_GUARD(&s->lock);
> +    res = co_try_get_from_shres_unlocked(s, n);
> +
> +    return res;
> +}
> +
>   void coroutine_fn co_get_from_shres(SharedResource *s, uint64_t n)
>   {
> +    QEMU_LOCK_GUARD(&s->lock);
>       assert(n <= s->total);
> -    while (!co_try_get_from_shres(s, n)) {
> -        qemu_co_queue_wait(&s->queue, NULL);
> +    while (!co_try_get_from_shres_unlocked(s, n)) {
> +        qemu_co_queue_wait(&s->queue, &s->lock);
>       }
>   }
>   
>   void coroutine_fn co_put_to_shres(SharedResource *s, uint64_t n)
>   {
> +    QEMU_LOCK_GUARD(&s->lock);
>       assert(s->total - s->available >= n);
>       s->available += n;
>       qemu_co_queue_restart_all(&s->queue);
> 


-- 
Best regards,
Vladimir

