Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F2342471
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:19:07 +0100 (CET)
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNJiE-0000V3-6N
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNJem-0007Lw-KJ; Fri, 19 Mar 2021 14:15:35 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNJeh-0003rz-Su; Fri, 19 Mar 2021 14:15:32 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MA7X0-1lYotu0N7S-00BZhy; Fri, 19 Mar 2021 19:15:20 +0100
Subject: Re: [PATCH v2 3/6] blockdev: with -drive if=virtio, use generic
 virtio-blk
To: Cornelia Huck <cohuck@redhat.com>
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-4-laurent@vivier.eu>
 <20210319154655.44418034.cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1834c894-aa02-8da5-cf3d-33790fa73bbe@vivier.eu>
Date: Fri, 19 Mar 2021 19:15:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319154655.44418034.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zbKBT2caODYYv0epYEdVjklUZvwBscWo9IA8VgFHYv27z9UrI4Z
 xmmseBv30XXE2EmPWeZuWXVlySnpWjZTPXxmTfZ5wgaBwGqUgfYTg7cNCOuPHu5/oM1msW2
 i3GwSOZHrkhTHh4LxSJhmhyuKCXB0EzXeOj6NO2lklOLM5tKtycp3pJ9x035Qtp2ca6OAt4
 nFruc/Siiw36qMkwUopyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WsznWY9UcbE=:LmNmOLA03UEFbilgXAXeFU
 v9xWn3MDP16ur9wEYpzskE55Rf/uY3wAV6nxL6A/p1Vd22jiv761RtiIADgpImxPZ8eafyMAK
 7HG2YrNsv7fjD5fhs6w3VXl+gDXykd4CnfHP60xgJkdgJJvud8Ub1zMPkTuapNRrLdMUoqXn3
 s6msSexyqKBqqHSFfIQQDAdj/jOtT1JjVTcsj//HxbTb7avu9E132lj7m1uRJ+DTMxFRClmXT
 YkjYfUYZBxfwCqpzGYIZg71IjLXdn1yISq0BBdaN2x8vaumrM5z6NJKzgWxLQyElX7Mvdl/Zw
 5Z2u6mBcoljQ5uokmYge38ECPn5PxCKcK2zVkakQhrNr8PuK9UjeRrJyEapD9ItXXKKEMLsfM
 XXhlx29u9lnJFNgM5zQSxkk+tljBGI0JXOLfo5pPd83R4RCcmvToUw3oKGtmGOcj/U7LiCBmr
 6HhZeJqjFg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/03/2021 à 15:46, Cornelia Huck a écrit :
> On Fri, 19 Mar 2021 14:25:34 +0100
> Laurent Vivier <laurent@vivier.eu> wrote:
> 
>> Rather than checking if the machine is an s390x to use virtio-blk-ccw
>> instead of virtio-blk-pci, use the alias virtio-blk that is set to
>> the expected target.
> 
> One side effect: if we add a new architecture and don't define the
> aliases for it, this function probably won't do the right thing; prior
> to the patch, it would simply default to virtio-blk-pci. Probably not a
> big deal, but we need to be careful to keep the alias defines up to
> date, which previously wasn't such a big deal.

But it will be easy to detect because we will have the error "unknown device: virtio-blk".
It will be a good reminder to add the aliases...

Thanks,
Laurent

> 
>>
>> This also enables the use of virtio-blk-device for targets without
>> PCI or CCW.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  blockdev.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/blockdev.c b/blockdev.c
>> index 5cc7c7effe9f..64da5350e3ad 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -969,11 +969,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>>          QemuOpts *devopts;
>>          devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
>>                                     &error_abort);
>> -        if (arch_type == QEMU_ARCH_S390X) {
>> -            qemu_opt_set(devopts, "driver", "virtio-blk-ccw", &error_abort);
>> -        } else {
>> -            qemu_opt_set(devopts, "driver", "virtio-blk-pci", &error_abort);
>> -        }
>> +        qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
>>          qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
>>                       &error_abort);
>>      }
> 


