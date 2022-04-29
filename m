Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F7514060
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 03:53:57 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkFpU-0006eg-9D
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 21:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nkFnf-0005mH-Fg; Thu, 28 Apr 2022 21:52:03 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nkFnd-0004tk-Ja; Thu, 28 Apr 2022 21:52:03 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so4502161pjh.4; 
 Thu, 28 Apr 2022 18:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h01DjMKov0pYpBTKHyho9kDfTMpdi0yzYtH/hgXwnqc=;
 b=nV3zsXTgVAoSCgm1H5nXr3EJuyJAnrBPKVtdsll8dXiHrv1CJlwBxiOg0Cbc9i3dMW
 ukjWwh8f0KJAOsKfAg8t+v72s7iOzoJPW8eDCKEjl5NSUXtntUI/q6W/MlvR5qTENidm
 9IBqhMLB7ldr0RtaBcKv60w2/1W4NEgoCznhDbGfczIZbotRvxS/4zuboSDKVMro4gAE
 48nFD6sxyMq1Mn60qMlIix4+VsSOWN6EGXXnTG+gx/iIeQLAhrLFqgEb3UXcQPDhZhMa
 A5q8zTIs3fhkTikWe/zISLcPHwOPE8T5FVCv92Ro84+CokBKhdqls3SYU+xrPJjAyrvD
 /oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h01DjMKov0pYpBTKHyho9kDfTMpdi0yzYtH/hgXwnqc=;
 b=kl35RvUrFrnwLzaYYqBbLKbhmEzv9CP8+Aabv+LhUxqGgOKgiCK8PJQRQQMOKxgCdg
 fmQ8xCZTQp43o10nlgHSeYJfca1RigiNZ+a2WWPwe+DYaSktVkHaPk2xne3eL4VYDJuK
 Jbw+kB8DElPBgWjED4TVmxWMc+13hEGWn7JJfASlQr8WkZWSGDIRYUUTWi1kwe6Mfrzf
 w0v/TGFxVOpfXN9BXND8rN+ka6tZRIBoSYv1u314Cz68rgRX92ajl0poBxOJm7qTtjBQ
 J+GrtmS3JbIjLBCpB8JHwkiZDaz7U3xud3Jvy7e/rwzz+zGzyTrmzEkz++76F2bX/Km1
 IFNw==
X-Gm-Message-State: AOAM532AHCzDJBJl9nK3zQszzdNl+2oLhpZmdyO00zgOhPo2JEYlSavf
 OuNY5LEWj7qKt4nSVEZK6rU=
X-Google-Smtp-Source: ABdhPJwQPFK1q4U6vKxeKvxXvnRA0jILRSIy6zDZIOJS6D55m0UomWF5Qvduji32VMbC3R1axGo2cw==
X-Received: by 2002:a17:902:a705:b0:156:9cc5:1d6f with SMTP id
 w5-20020a170902a70500b001569cc51d6fmr36066295plq.66.1651197117972; 
 Thu, 28 Apr 2022 18:51:57 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004fac74c8382sm1061110pfv.47.2022.04.28.18.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 18:51:57 -0700 (PDT)
Message-ID: <097617ae-02c7-cabf-7e33-4f25b0f3b1de@gmail.com>
Date: Fri, 29 Apr 2022 10:51:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
 <489275615f29a2efc97cbd6130c98669ed28a24b.1651085922.git.qemu_oss@crudebyte.com>
 <20220427223625.52e0e23f@bahia> <1976549.2SI88kFQN7@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <1976549.2SI88kFQN7@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
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

On 2022/04/28 20:22, Christian Schoenebeck wrote:
> On Mittwoch, 27. April 2022 22:36:25 CEST Greg Kurz wrote:
>> On Wed, 27 Apr 2022 20:54:17 +0200
>>
>> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>>> mknod() on macOS does not support creating sockets, so divert to
>>> call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
>>> was passed with mode argument.
>>>
>>> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
>>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>> ---
>>>
>>>   hw/9pfs/9p-util-darwin.c | 45 +++++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
>>> index e24d09763a..7d00db47a9 100644
>>> --- a/hw/9pfs/9p-util-darwin.c
>>> +++ b/hw/9pfs/9p-util-darwin.c
>>> @@ -74,6 +74,45 @@ int fsetxattrat_nofollow(int dirfd, const char
>>> *filename, const char *name,>
>>>    */
>>>   
>>>   #if defined CONFIG_PTHREAD_FCHDIR_NP
>>>
>>> +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
>>> +    int fd, err;
>>> +    struct sockaddr_un addr = {
>>> +        .sun_family = AF_UNIX
>>> +    };
>>> +
>>> +    /*
>>> +     * sun_path is only 104 bytes, explicit filename length check
>>> required
>>> +     */
>>> +    if (sizeof(addr.sun_path) - 1 < strlen(filename) + 2) {
>>
>> True but I was a bit puzzled by the math until I realized the '+ 2' was
>> for the prepended "./" ;-)
> 
> Correct ...
> 
>>> +        errno = ENAMETOOLONG;
>>> +        return -1;
>>> +    }
>>> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
>>> +    if (fd == -1) {
>>> +        return fd;
>>> +    }
>>> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
>>
>> What about the more generic approach of checking snprintf()'s return
>> value ? If it is >= sizeof(addr.sun_path) then truncation occured.
> 
> ... well, I can send a v5 if you prefer that solution, or you can send a follow-up
> patch later on. As you wish.

I also prefer that solution and would like to see v5. The checking code 
has a redundant knowledge about how the output length becomes, and it is 
dangerous if it becomes out of sync with the snprintf() call. Using the 
value returned by snprintf() would eliminate such a potential 
programming error in the future.

> 
>>> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
>>> +    if (err == -1) {
>>> +        goto out;
>>> +    }
>>> +    /*
>>> +     * FIXME: Should rather be using descriptor-based fchmod() on the
>>> +     * socket file descriptor above (preferably before bind() call),
>>> +     * instead of path-based fchmodat(), to prevent concurrent transient
>>> +     * state issues between creating the named FIFO file at bind() and
>>> +     * delayed adjustment of permissions at fchmodat(). However currently
>>> +     * macOS (12.x) does not support such operations on socket file
>>> +     * descriptors yet.
>>> +     *
>>> +     * Filed report with Apple: FB9997731
>>> +     */
>>> +    err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
>>> +out:
>>> +    close_preserve_errno(fd);
>>
>> You could close(fd) earlier now, but you might want to keep the code
>> as is in case FB9997731 gets proper attention.
>>
>> Anyway, this should do the job so:
> 
> Sounds like Akihiko's previous suggestion. I would keep it that way:
> https://lore.kernel.org/qemu-devel/eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com/
I don't think it would need an extra code change when FB9997731 is 
resolved even if you close the socket immediately after bind(). However, 
I'm not pursuing such a change since doing so would have the same 
trade-off my previous suggestion as Christian noted.

Regards,
Akihiko Odaki

> 
>> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Thanks!
> 
> Best regards,
> Christian Schoenebeck
> 
>>> +    return err;
>>> +}
>>> +
>>>
>>>   int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
>>>   {
>>>   
>>>       int preserved_errno, err;
>>>
>>> @@ -93,7 +132,11 @@ int qemu_mknodat(int dirfd, const char *filename,
>>> mode_t mode, dev_t dev)>
>>>       if (pthread_fchdir_np(dirfd) < 0) {
>>>       
>>>           return -1;
>>>       
>>>       }
>>>
>>> -    err = mknod(filename, mode, dev);
>>> +    if (S_ISSOCK(mode)) {
>>> +        err = create_socket_file_at_cwd(filename, mode);
>>> +    } else {
>>> +        err = mknod(filename, mode, dev);
>>> +    }
>>>
>>>       preserved_errno = errno;
>>>       /* Stop using the thread-local cwd */
>>>       pthread_fchdir_np(-1);
> 
> 


