Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1183C28BAF8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:39:48 +0200 (CEST)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRyzL-00050Y-44
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyvZ-0001wq-LY; Mon, 12 Oct 2020 10:35:53 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:38603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyvX-0007Le-Lk; Mon, 12 Oct 2020 10:35:53 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHX3X-1kfRCc07nt-00DYNN; Mon, 12 Oct 2020 16:35:47 +0200
Subject: Re: [PATCH] mingw: Fix builds on f33 mingw
To: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 quintela@redhat.com
References: <20201008174359.157627-1-dgilbert@redhat.com>
 <7f8ffa77-cc95-b121-0da8-269d37c52830@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <fa6c8769-b1d7-cd75-2c2e-d8bc74ebe51e@vivier.eu>
Date: Mon, 12 Oct 2020 16:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7f8ffa77-cc95-b121-0da8-269d37c52830@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LKzn7fSMu3cxQ/2d/XzOnMyLs32GzSSTolKqDUrCWaMeZhmvPD7
 D7eiG09Lrf1n/ViJtCn+PVlGd88vwKjlompFAWfdSrfxLQadwvM8/eqs/QIo98905ew99EB
 pNkLYpKQXsZT81kZNe/rNpf06ibxuF5sF+Xct5RpjdKoRl3Y8ezllzA1YpPRLm9MA3iUWDg
 Ltyqpw3hbMPyltylB7ztw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GN/y/+qZrSo=:wWoO3LxBJ4s51Bf+KzPmgq
 uhxGCq/wiV+JyTmChwlN0gDRoqb/60XdY/74IalCtyK6yBqWXTbmUbHPTjDUbi1OPuJxfVwFs
 ua+zFVyfym8BOM/jOZrqn+vLtipCTQUWOp6b45mXnuzvcFrSZ/irAo3NxUReYyPb7pLRA+11c
 ZOr9pAlQ0iuTDO47DdalGvyK2Qvehm4FpEvo342wCLHmCur53lmMqpTV1DLL4fwkZGeBtr1CV
 Y+AuVF9LLU6n07AfRsL3PVG9ejbqV72kqmaSKN/QtdY95NCOpO89qZ56dMV3hQd2m8xxD8wDW
 dCFHxY94fj+OMbgnLZbz8DZ9fyajtzxD0KqyWr2G/ZP7LANS6WAAd7g1vlIbgJb02fgSILZlR
 lotZxaGkV17mlUb7+EmaXy2QWlSSjX0yOCfaexaK2ISPjMLpGXPlQZUjx6x3CCUxAFzvdIJ2x
 iIW4yZz4q5z1BOkr2m+nAP7stQ2vjkwT9uu/V3pb4ElmKmWTDhA+LzPk8e8FbQ4afTYWru4TY
 4jqQNyp7VcOqGqRY/GG1muZsCEaaaf9lWupV1LgI870MDKYmy/qLlPkgxnYbYCnaYDOVlvnac
 Q1I4a5T8aEOSGBg9mdXNJS0T6n+rPiBw++8k2nDGNIGjmJfQT52PehW6K6Cg7iupfa00vAfSK
 /D1C74ihSUxTsyMLaN54FXi2Z+cVpHR+lF1Q1uUqzQCR2yUIk2kJrqxodzCFWqpaO5MpRuQ1e
 nN1l6NDjBQSR0wV87gdwNGFbk9ITpCBgNF2Z8qdbEzRzf7kpKULzBX04gRYFlpLUM/zx98Ks6
 CYFWa0+vsK8BeP5T5tbTVTOs17aQJLWST51zF3o1vLYF3lKiIKy6ymRZSK2FBtkXc5LSSIX
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:26:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/10/2020 à 19:46, Thomas Huth a écrit :
> On 08/10/2020 19.43, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> Fedora 33's mingw moans about:
>>
>> In file included from ../tests/test-bitmap.c:12:
>> /home/dgilbert/git/migpull/include/qemu/osdep.h:76: error: "__USE_MINGW_ANSI_STDIO" redefined [-Werror]
>>    76 | #define __USE_MINGW_ANSI_STDIO 1
>>       |
>>
>> the fix is to make sure osdep.h is the first include - which is our
>> rule anyway; but one we broke in a couple of places.
>>
>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  migration/dirtyrate.c | 2 +-
>>  tests/test-bitmap.c   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index ab9e1301f6..42b71e771e 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -10,8 +10,8 @@
>>   * See the COPYING file in the top-level directory.
>>   */
>>  
>> -#include <zlib.h>
>>  #include "qemu/osdep.h"
>> +#include <zlib.h>
>>  #include "qapi/error.h"
>>  #include "cpu.h"
>>  #include "qemu/config-file.h"
>> diff --git a/tests/test-bitmap.c b/tests/test-bitmap.c
>> index 2f5b71458a..c3c9d79667 100644
>> --- a/tests/test-bitmap.c
>> +++ b/tests/test-bitmap.c
>> @@ -8,8 +8,8 @@
>>   * Author: Peter Xu <peterx@redhat.com>
>>   */
>>  
>> -#include <stdlib.h>
>>  #include "qemu/osdep.h"
>> +#include <stdlib.h>
>>  #include "qemu/bitmap.h"
>>  
>>  #define BMAP_SIZE  1024
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


