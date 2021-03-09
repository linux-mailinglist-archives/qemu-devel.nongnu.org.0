Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0D3330E5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:28:52 +0100 (CET)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjuN-0006pk-CZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjaU-0001h3-Gc; Tue, 09 Mar 2021 16:08:18 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjaR-0001At-Tl; Tue, 09 Mar 2021 16:08:18 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5G1T-1liWIA3JVl-0119Sl; Tue, 09 Mar 2021 22:08:03 +0100
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
To: Thomas Huth <thuth@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-devel@nongnu.org
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu>
Date: Tue, 9 Mar 2021 22:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ty1V12YAowO0ta6d48aN3YFy9pV+bZ+592T3WIJi/pYI0OBZrkU
 Wx5Sf3cah4ZfT8xVnjRW4Nq/fPJIwiR52k+W1BdLJpAFeytBSBB7TcPMilVRo59BxCfVUg4
 1t7knKWo6OVdySrDmR6hkL3g4vqL4F89/LYQ32i8oXjucSkiAeMqsLRmTazJEgK98aIB4qP
 7Zm9utfhIVhQGi3nEuSQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G9zRZDAt/58=:Updr2FDvNaBl4saYPMfjus
 7xArot2t0fQBri/Km7B4lxSL2hXqQV7lShwzxY0/HH7eTHEJh1pf93bCuurbipS5PamF7UPBF
 qkRhKTXXN4lwxYSjrsaYb4n/L5Yrv9mQulcWr20nByZgucWuiIC1wR6Lstzg+DbM1ALfAUSWz
 IrvGTVh7bx6GNKoYWH07EnlX/ziG/SNHS/gtmmQ1bUIourJo6a2FiCb7nXpn8N27J7gnJzIKj
 L3DLF+IcYaRyAwLHGcJIx5+aJp7tkiwf622mXo9rTH+wmcWAZ8LH5zL88hAyMRA0axnDLyr9L
 xqALGm1N8Qt+Hqbnh66JQaTS/KdFbxFEf1cgfjDoUZQF1aH1E3xUDRkI34dwng4yPZYRL+vfq
 J/DatCrwvRcGgITU/qUit6dhdXSKC2r9ZqyVcPkM/IH1XzEhtcKNZzwDLEA8PNW/UnRpiszSj
 mnFjKOgUQw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/03/2021 à 12:46, Thomas Huth a écrit :
> On 22/02/2021 08.28, Brad Smith wrote:
>> OpenBSD has supported 64-bit time_t across all archs since 5.5 released in 2014.
>>
>> Remove a time_t cast that is no longer necessary.
>>
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 52e2d72e4b..9557f85ba9 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>>       if (name) {
>>           pstrcpy(sn->name, sizeof(sn->name), name);
>>       } else {
>> -        /* cast below needed for OpenBSD where tv_sec is still 'long' */
>> -        localtime_r((const time_t *)&tv.tv_sec, &tm);
>> +        localtime_r(&tv.tv_sec, &tm);
>>           strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
>>       }
> 

but the qemu_timeval from "include/sysemu/os-win32.h" still uses a long: is this file compiled for
win32?

Thanks,
Laurent

