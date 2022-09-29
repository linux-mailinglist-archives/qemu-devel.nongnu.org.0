Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5B5EFDEF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:29:25 +0200 (CEST)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzDo-0004Ol-1r
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzBq-0001nb-BB; Thu, 29 Sep 2022 15:27:22 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzBo-000829-Jm; Thu, 29 Sep 2022 15:27:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MT9v5-1oo4US17UN-00UYTL; Thu, 29 Sep 2022 21:27:11 +0200
Message-ID: <0025c80e-9183-d22c-79a4-fd0b5b9cbf4d@vivier.eu>
Date: Thu, 29 Sep 2022 21:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] block/qcow2-bitmap: Add missing cast to silent GCC error
Content-Language: fr
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>
References: <20220919182755.51967-1-f4bug@amsat.org>
 <YyyBMe72wjTK3l0x@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YyyBMe72wjTK3l0x@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Tm72X2NlxzmTuCtk6CFJ/VSJ8TnaP+roNGqtNoPCM7oIpKF7ype
 BCna/MZ4OHBLHW9Fl/1JHp6O+Z0gsA4ECD+i4F+5e2zYWSidVttfTT0QH00SKnV2XLGSZyd
 7rHRezgax/UToxfhQPHzH3t/eimyRv5Dbc9TQp38yDLTgedhmpqdzVruPYJMrwRexZ7vDWT
 cBJ+Ywy7WiVYECxtdHCLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S1ZnzNZWJ20=:YA07r9bth1cLSggu/oUkJR
 ue7hRcO0E+ZaLNN0BNE50LFymwtnttN/y3pCRbMloWCNNEqplmtUKwIZybCfLHysEcnuL+ueU
 N7qo+7TOTikvQuw3NdQ4hP7opOTzwuURdnJp80aGpQkJ5czIvTbSWP9Yf/s4pqTIDqFcm6Ut9
 BiZ8V/k+zQrfrdQiCHQZwgAyMG1pAGkJ6uCT99QlQpefAiUHM0f9PbO3kGeYUKyctxGmh6Y8B
 AkkaFSrIhMjWjqvcm3bdL8HMzkcHoLHiQL6aNg/XxKrO7g6Ad163r9QFK4lbNZT3HE7sqLmYY
 jp/Yvp8l13nVpjwm/e8V6hQq2jjO58EplzJJEMnNDO2sx6wQaLjflNZrLDpT3V0lOhyHgPe4v
 aUO+9FqtFXY7Daet8Wbwf8Q4lnDZKP1xElwTW95X+XP8o60XIAeCJa28ss6pqJg0BTCXvJx31
 ztIHPR37BnILjOqntzyO71iAXvZJCKk8US+Gyvdwy3tgSQeFhN4ouaITu5eODgeImnbnTiau4
 Ok8sG5URlylY/q0XvYO+XkACLXSa1tIAQg/Yia1NOqrJOXT4ltbNySzc4lkD9if0qiFM3s7jR
 9iOeh5DEF+384etg76RnOXIPGMTMT+8ufHKYo3XVNEFOMrRHk78PXxZssza2vmnMJ0bzX8fsy
 uNaqc34QFdR0qQFX8IQauut9BkHif91qpCwzdqtNkUpMRELPbXHpErLGRaixfCQEISzDSiHSL
 Q3zSkRX2BKHpg6ZdD+ZsAPifP8p/3xu4hhO+TOkbA6EfOMikRtNGJR9tskefwUp0ebiL/ypLS
 K2JNtAM
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 22/09/2022 à 17:37, Kevin Wolf a écrit :
> Am 19.09.2022 um 20:27 hat Philippe Mathieu-Daudé geschrieben:
>> Commit d1258dd0c8 ("qcow2: autoloading dirty bitmaps") added the
>> set_readonly_helper() GFunc handler, correctly casting the gpointer
>> user_data in both the g_slist_foreach() caller and the handler.
>> Few commits later (commit 1b6b0562db), the handler is reused in
>> qcow2_reopen_bitmaps_rw() but missing the gpointer cast, resulting
>> in the following error when using Homebrew GCC 12.2.0:
>>
>>    [2/658] Compiling C object libblock.fa.p/block_qcow2-bitmap.c.o
>>    ../../block/qcow2-bitmap.c: In function 'qcow2_reopen_bitmaps_rw':
>>    ../../block/qcow2-bitmap.c:1211:60: error: incompatible type for argument 3 of 'g_slist_foreach'
>>     1211 |     g_slist_foreach(ro_dirty_bitmaps, set_readonly_helper, false);
>>          |                                                            ^~~~~
>>          |                                                            |
>>          |                                                            _Bool
>>    In file included from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gmain.h:26,
>>                     from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/giochannel.h:33,
>>                     from /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib.h:54,
>>                     from /Users/philmd/source/qemu/include/glib-compat.h:32,
>>                     from /Users/philmd/source/qemu/include/qemu/osdep.h:144,
>>                     from ../../block/qcow2-bitmap.c:28:
>>    /opt/homebrew/Cellar/glib/2.72.3_1/include/glib-2.0/glib/gslist.h:127:61: note: expected 'gpointer' {aka 'void *'} but argument is of type '_Bool'
>>      127 |                                           gpointer          user_data);
>>          |                                           ~~~~~~~~~~~~~~~~~~^~~~~~~~~
>>    At top level:
>>    FAILED: libblock.fa.p/block_qcow2-bitmap.c.o
>>
>> Fix by adding the missing gpointer cast.
>>
>> Fixes: 1b6b0562db ("qcow2: support .bdrv_reopen_bitmaps_rw")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Thanks, applied to the block branch. And in case qemu-trivial picks it
> up anyway:
> 
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> 
> 

It doesn't seem to be merged yet. Applied to my trivial-patches branch.

If you push it first I will remove it.

Thanks,
Laurent

