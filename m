Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC535F479
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:06:14 +0200 (CEST)
Received: from localhost ([::1]:60448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfDh-000399-Ay
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lWepp-00074S-1O
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:41:33 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:33083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lWepj-00016U-72
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 08:41:32 -0400
Received: from [192.168.100.1] ([82.142.18.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mr8zO-1lqqxB0xaI-00oIEg; Wed, 14 Apr 2021 14:41:07 +0200
Subject: Re: [PATCH] hw/elf_ops: clear uninitialized segment space
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210414105838.205019-1-laurent@vivier.eu>
 <c8f39459-5106-bafb-94e5-2116546f75e0@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d4874de4-9bf2-f0b6-0b4c-3d0b97d26b0d@vivier.eu>
Date: Wed, 14 Apr 2021 14:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c8f39459-5106-bafb-94e5-2116546f75e0@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7QcuWK0Xixg+hzfZvpdiyjfk5ueTLYoxK3H6odlwcoo/X4g5yXm
 fhvzT1IOAGhijgOofDBHncPTvnfBhQu5t6XHSkaccG/dGz0nd5R8P/YFBUkWGW/Ks3x42Fl
 +e4GYzVAThKNYd9xh4pUwwDZDfHkfLzIPDPVuMn+hvj298xooBBPsnpdjnbnGsFcEonBSWd
 gvzOxfuVQm4t3NIoGSxGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+C0DDR7qrJU=:/Kzkm/t2XWrFrQ01viznM1
 ntx1s1yynumB2rc22Vz/1131D0xvVD74QTz5P7GEC6gXF4nQm5kntREJSz3NvZAn/2yZ2Yel0
 aEbgYbHkmvDXhKUpeRzLSKCT2emlF+J1tqKaxnOcbTI5fKJNwEw2ppWoAKoTZ45Ohh/hHJpPI
 uGdoIvLlileR7utxY2cXcqI5ttmNWwtuI8ncItL3TaKu2p7PESjnVUNfkOzU9cYkOM/h1WgRJ
 rJHWcr7QXLEV/14V+U3SFcU1A7E1aSgjIKpI32q+kQM2yqzfMq1To+xYbvjScvPLKIrVemSuM
 FIdhNXCju9v9N9NuStbyJvdJB8iU/ut5dkKmhiUwvV945P5jxiaLGAT5irkxobLioYpgJI7fW
 eR5JoVCThwF//UFndSLdBbogW/Ebvq3LE+JwRy1RKA+0SKpY0feNpI5e6N62VWE5CimIWpnQK
 dvpVxl6jHD+BxgG/zuS5rgEO9X0sqGUqPAiwBlxDVKQ46gyK4phD3/qpms1sP140bUYyRG9S8
 sUIeI6bvH9/jX5vF2K9yWs=
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/04/2021 à 14:16, Philippe Mathieu-Daudé a écrit :
> On 4/14/21 12:58 PM, Laurent Vivier wrote:
>> When the mem_size of the segment is bigger than the file_size,
>> and if this space doesn't overlap another segment, it needs
>> to be cleared.
>>
>> This bug is very similar to the one we had for linux-user,
>> 22d113b52f41 ("linux-user: Fix loading of BSS segments"),
>> where .bss section is encoded as an extension of the the data
>> one by setting the segment p_memsz > p_filesz.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  include/hw/elf_ops.h | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
>> index 6ee458e7bc3c..e3dcee3ee349 100644
>> --- a/include/hw/elf_ops.h
>> +++ b/include/hw/elf_ops.h
>> @@ -562,6 +562,23 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>>                      if (res != MEMTX_OK) {
>>                          goto fail;
>>                      }
>> +                    /*
>> +                     * We need to zero'ify the space that is not copied
>> +                     * from file
>> +                     */
>> +                    if (file_size < mem_size) {
>> +                        static uint8_t zero[4096];
> 
> Given it is unlikely, maybe better use:
> 
>               g_autofree uint8_t *zero = g_new0(uint8_t, 4096);
> 
>

I don't know what is the best solution but this seems to introduce a lot of complexity only to have
a page of 0s.

Thanks,
Laurent


