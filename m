Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AAF515116
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:44:36 +0200 (CEST)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkTjP-0008Rg-C5
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nkTVB-0007fD-Mz; Fri, 29 Apr 2022 12:29:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nkTV9-0008V7-6Q; Fri, 29 Apr 2022 12:29:53 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h1so7327425pfv.12;
 Fri, 29 Apr 2022 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VvyPZQjMPM7rsfLgRgN8fGH1WwwLBmpmQUVu9EXdxmc=;
 b=fJt+OT83lyXqlyiMV5nOYyE9Myc1hjtBGx1uZBOtnIZNcOVgHQKM9vLPWufvZOtM+H
 4cSyyN0fd6yCvl3WKCI0Fb8DmSFFfwSE/oWVdTumNBBhXoaztwKkzCbIu28DGckKJxG6
 w25pQUI8PRs7+Esn5s87Y6GA6znCmjMkhb87bCjws7S5eL03N2Cl0b7HlL08iLbcbtn9
 Zzx5K5cPQcezNN2X/ijTvOrVw2Doud6kZzdk5drTL8QGYBIxAAov0RwOEQm5YFBkxNub
 St24yaKI5es0TN+4/EE2kxaG1NHH6qxlnI3adfg8gJCgwpFFlaF6LdYnE4LPHqVUFC8x
 I3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VvyPZQjMPM7rsfLgRgN8fGH1WwwLBmpmQUVu9EXdxmc=;
 b=dMdpBaVolx59lCwl06wHg1KC3r/c+GxUBDic7nE1gzvtKoXhMFVo4+u+4uyzBjoIkA
 QjqoFv13wnji8Dk8qDdNl4g5aaF9kfGFZSVb7XB+vOJF6DSbn8MzBrU3E/1ZDQHzGewV
 d79Bwq6vlKVBI1eR9VSAuUjo6d6p2XDET+RRm1qczEgkSN6Wd7Qi6ZRXNATWZS5iWo3k
 0PAB2/DmgeeX6a9//5UnYDcCx0/bt0QsuXl5LBzr6SMZTxDDVusIiEISjOJ5mgl4ieAH
 oaXBpc/pFynJOPbq6LrzOvmZuNC+HEa2WI7h0ltMYKSuVoz19Dx0/foLHOlVccA4UNGf
 z2yQ==
X-Gm-Message-State: AOAM5332p/NxoUIJoDtJsW133/Sp3z52QRWIxvIhkv2SZsnKLJawFdWS
 IcCZ9w5/Q2sjMDVX4bhlhrU=
X-Google-Smtp-Source: ABdhPJzeeK6aUc54DJxG3/ZPKyLFYH+yu4sEIpIHJVWsQpN3Qkq9/xSaDoq0Zk0IKdFKz6rwvlvL7A==
X-Received: by 2002:a05:6a00:24d0:b0:50d:a3de:fbf6 with SMTP id
 d16-20020a056a0024d000b0050da3defbf6mr7015806pfv.15.1651249789298; 
 Fri, 29 Apr 2022 09:29:49 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090ac71300b001cd4989fecbsm14872198pjt.23.2022.04.29.09.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 09:29:48 -0700 (PDT)
Message-ID: <106d514e-b452-ba1b-9985-6910dc1056b2@gmail.com>
Date: Sat, 30 Apr 2022 01:29:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <5815688.WPY9AJzlUa@silver> <20220429163507.2e822089@bahia>
 <1652707.ZjVTVKMb3i@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <1652707.ZjVTVKMb3i@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/04/30 0:20, Christian Schoenebeck wrote:
> On Freitag, 29. April 2022 16:35:07 CEST Greg Kurz wrote:
>> On Fri, 29 Apr 2022 15:50:35 +0200
>>
>> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>>> On Freitag, 29. April 2022 14:56:50 CEST Greg Kurz wrote:
>>>> On Fri, 29 Apr 2022 12:25:11 +0200
>>>>
>>>> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>>>>> mknod() on macOS does not support creating sockets, so divert to
>>>>> call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
>>>>> was passed with mode argument.
>>>>>
>>>>> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
>>>>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>>>> ---
>>>>>
>>>>>   hw/9pfs/9p-util-darwin.c | 42
>>>>>   +++++++++++++++++++++++++++++++++++++++-
>>>>>   1 file changed, 41 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
>>>>> index e24d09763a..619c403ba7 100644
>>>>> --- a/hw/9pfs/9p-util-darwin.c
>>>>> +++ b/hw/9pfs/9p-util-darwin.c
>>>>> @@ -74,6 +74,42 @@ int fsetxattrat_nofollow(int dirfd, const char
>>>>> *filename, const char *name,>
>>>>>
>>>>>    */
>>>>>   
>>>>>   #if defined CONFIG_PTHREAD_FCHDIR_NP
>>>>>
>>>>> +static int create_socket_file_at_cwd(const char *filename, mode_t
>>>>> mode) {
>>>>> +    int fd, err;
>>>>> +    struct sockaddr_un addr = {
>>>>> +        .sun_family = AF_UNIX
>>>>> +    };
>>>>> +
>>>>> +    err = snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s",
>>>>> filename); +    if (err < 0 || err >= sizeof(addr.sun_path)) {
>>>>
>>>> According to POSIX [1]:
>>>>
>>>> The snprintf() function shall fail if:
>>>>
>>>> [EOVERFLOW]
>>>> [CX] [Option Start] The value of n is greater than {INT_MAX}. [Option
>>>> End]
>>>>
>>>> [1]
>>>> https://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.htm
>>>> l
>>>>
>>>> Since we're passing sizeof(addr.sun_path), I'm pretty sure snprintf()
>>>> cannot fail. No big deal.
>>>
>>> The question is whom you would want to trust on this? POSIX? ISO-C? Clang?
>>> BSD? Apple? And for how long into future? I mean in general yes, I would
>>> not
>> To improve overall portability across all possible hosts, I'd stick to
>> POSIX semantics but here this is macOS only code so you can assume
>> this is Apple's snprintf().
>>
>>> expect it to fail with -1 here either, but there are various different API
>>> docs on snprintf() out there, and most of them don't even bother to
>>> enumarate which encoding errors may happen. And I'm pretty sure if I'd
>>> drop the negative err check here, then Akihiko would slap me for
>>> unforeseeable additional error cases on snprintf() that may be added in
>>> future. >>
>> /o\ ;-)

I would rather throw the system which decided returning a negative value 
for snprintf() OK away, but it is always good to be cautious anyway. ;)

For the entire series:
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

>>
>>> Apple's documentation on snprintf() BTW just says:
>>>    "These functions return a negative value if an error occurs."
>>
>> How valuable this is !!! ;-)
>>
>>> So Apple does not even restrict the return value to -1 on errrors, you
>>> would also need to expect other negative values.
>>>
>>> So on doubt, I leave this negative result check for now. ;-)
>>
>> Fair enough.
> 
> Hey, don't shoot the servant! I'm just trying to find compromises that aim to
> suit as many people as possible, as always. :)
> 
> Best regards,
> Christian Schoenebeck
> 
> 


