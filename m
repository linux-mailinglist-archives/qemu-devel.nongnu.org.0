Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA890A5C0A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 20:07:29 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4qjg-0002F7-FM
	for lists+qemu-devel@lfdr.de; Mon, 02 Sep 2019 14:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1i4qiL-0001nZ-Ly
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 14:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1i4qiK-0000h1-Bs
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 14:06:05 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:45866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1i4qiJ-0000er-82
 for qemu-devel@nongnu.org; Mon, 02 Sep 2019 14:06:03 -0400
Received: by mail-qk1-x742.google.com with SMTP id z67so313834qkb.12
 for <qemu-devel@nongnu.org>; Mon, 02 Sep 2019 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=V7hgOrq+XzgrG0AWCotfArAc2Sr4PZw4BITKvcfe/B8=;
 b=DkGEZLFwgLTylZNQ2tEI+76XWdY4SoeAkJcKLTRqDy6RTTm23tdA86y7dsmsUu4pGx
 BmQmTK9vhcFPdDhmorqavPPKgn0JDx9bsFPiVjxUmVkrvTusZcL+IqZaiebpPhhvnBze
 GiH5SR5CYJziCA/4zi9p9VNyo59mWUHM//HKtGMpkueREpz1HhwF8pmpkDXl9L76OFCF
 EK2CdIFuXIHdL3WFj2hWXO938sBE+q2OeYgY08jpCxuoiN5zxoh9fITYufh9bQpLSm6y
 czLq0t1eRhSX/k61rqcyet2PAcAUqTV976GeE3v60U17iUAuaCKy4h03n6nW5Zefoc/E
 69vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=V7hgOrq+XzgrG0AWCotfArAc2Sr4PZw4BITKvcfe/B8=;
 b=Dam0Gu2mCi+rL1ixJn0ULHOKSz0Jfazw3qEQcCY1dPgx5winaXFCibabP7QcSjPssI
 MBq4RKae/Y51MwXPHs4HV1eIdnz+tYi3wk4lAcpxbrAdSBrV4xBDku90MZ6NERkWLwoN
 6GhkvMydEmCc23WODbkli0P6GJwApyI40y4lUfm/chG1gbEoPqJwgWhrXXl0xk+eoJUs
 8eEh4t64AX91F36oB52kdiGNTYE2FjcEqqzJpPnJGonEgWfp476n7g4nxVyznSQcnMsO
 qZUhEA0ZlENFVo+3kWvcGMUTZ69A5U+pFRXxFC8elnwVr+pP3I07RXPXiBReVnRr+rTh
 SL8g==
X-Gm-Message-State: APjAAAX/4WDGUW7Uyir1GrKbOO7LoqHjRKo6JDxzXtA39LOcy7Nrrlz8
 lb3RZ52H8MG79xm1CVuz0is=
X-Google-Smtp-Source: APXvYqzVmI4uN0XF3i/wdJ13tJxqjlHoY1Tit2quCya0n/auOJTcNuZI3yn6w4yD3N9ygt4GlmPqeQ==
X-Received: by 2002:ae9:e102:: with SMTP id g2mr29538265qkm.182.1567447561922; 
 Mon, 02 Sep 2019 11:06:01 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:9589:1351:c7eb:87b:c9d5?
 ([2804:431:c7c6:9589:1351:c7eb:87b:c9d5])
 by smtp.gmail.com with ESMTPSA id y17sm3829510qty.10.2019.09.02.11.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2019 11:06:01 -0700 (PDT)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20190807142114.17569-1-danielhb413@gmail.com>
 <20190807142114.17569-3-danielhb413@gmail.com>
 <a3b0480c-da0e-d182-335d-77568efb8121@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <239f663b-c87d-a800-03fc-39f15064c9d0@gmail.com>
Date: Mon, 2 Sep 2019 15:05:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a3b0480c-da0e-d182-335d-77568efb8121@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
Subject: Re: [Qemu-devel] [PATCH v5 2/4] block.c: adding bdrv_delete_file
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
Cc: kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/28/19 11:07 PM, John Snow wrote:
>
> On 8/7/19 10:21 AM, Daniel Henrique Barboza wrote:
>> Using the new 'bdrv_co_delete_file' interface, bdrv_delete_file
>> can be used in a way similar of the existing bdrv_create_file to
>> to clean up a created file.
>>
>> The logic is also similar to what is already done in bdrv_create_file:
>> a qemu_coroutine is created if needed, a specialized function
>> bdrv_delete_co_entry is used to call the bdrv_co_delete_file
>> co-routine of the driver, if the driver implements it.
>>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   block.c               | 77 +++++++++++++++++++++++++++++++++++++++++++
>>   include/block/block.h |  1 +
>>   2 files changed, 78 insertions(+)
>>
>> diff --git a/block.c b/block.c
>> index cbd8da5f3b..1e20250627 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -547,6 +547,83 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
>>       return ret;
>>   }
>>   
>> +typedef struct DeleteCo {
>> +    BlockDriver *drv;
>> +    BlockDriverState *bs;
>> +    int ret;
>> +    Error *err;
>> +} DeleteCo;
>> +
>> +static void coroutine_fn bdrv_delete_co_entry(void *opaque)
>> +{
>> +    Error *local_err = NULL;
>> +    DeleteCo *dco = opaque;
>> +
>> +    assert(dco->bs);
>> +
>> +    dco->ret = dco->drv->bdrv_co_delete_file(dco->bs, &local_err);
>> +    error_propagate(&dco->err, local_err);
>> +}
>> +
>> +int bdrv_delete_file(const char *filename, Error **errp)
>> +{
>> +    BlockDriver *drv = bdrv_find_protocol(filename, true, NULL);
>> +    BlockDriverState *bs = bdrv_open(filename, NULL, NULL,
>> +                                     BDRV_O_RDWR | BDRV_O_PROTOCOL, NULL);
>> +    DeleteCo dco = {
>> +        .drv = drv,
>> +        .bs = bs,
>> +        .ret = NOT_DONE,
>> +        .err = NULL,
>> +    };
>> +    Coroutine *co;
>> +    int ret;
>> +
>> +    if (!drv) {
>> +        error_setg(errp, "File '%s' has unknown format", filename);
>> +        ret = -ENOENT;
>> +        goto out;
>> +    }
>> +
> I was going to say that ENOENT is a weird error here, but I see it used
> for !drv a few other places in block.c too, alongside EINVAL and
> ENOMEDIUM. ENOMEDIUM loks like the most popular.

Didn't spend too much time thinking about it. I copied the same behavior 
from
bdrv_create_file:

---------

int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp)
{
     (...)

     drv = bdrv_find_protocol(filename, true, errp);
     if (drv == NULL) {
         return -ENOENT;
     }
-----

I can change to ENOMEDIUM if it's indeed more informative than ENOENT.


>
>> +    if (!drv->bdrv_co_delete_file) {
>> +        error_setg(errp, "Driver '%s' does not support image delete",
>> +                   drv->format_name);
>> +        ret = -ENOTSUP;
>> +        goto out;
>> +    }
>> +
>> +    if (!bs) {
>> +        error_setg(errp, "Could not open image '%s' for erasing",
>> +                   filename);
>> +        ret = 1;
> Please keep all errors negative (or at least consistent within a function).

Got it. I'll fix it in the re-spin.


>
>
> I'm also wondering if we want a version of delete that doesn't try to
> open a file directly -- i.e. a version that exists like this:
>
> bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
>
> That simply dispatches based on bs->drv to the correct routine.
>
> Then, you are free to have bdrv_delete_file handle the open (and let the
> opening figure out what driver it needs), and just hand off the bds to
> bdrv_co_delete_file.
>
> I'm not the authority for block.c, though, so maaaybe I'm giving you bad
> advice here. Kevin's away on PTO for a bit and gave you advice most
> recently, so I might try to gently ask him for more feedback next week.

I appreciate. I'm not acquainted with the block code at all - I'm playing
by ear since the first version. Any tip is appreciated :)


Thanks,


DHB

>
>> +        goto out;
>> +    }
>> +
>> +    if (qemu_in_coroutine()) {
>> +        /* Fast-path if already in coroutine context */
>> +        bdrv_delete_co_entry(&dco);
>> +    } else {
>> +        co = qemu_coroutine_create(bdrv_delete_co_entry, &dco);
>> +        qemu_coroutine_enter(co);
>> +        while (dco.ret == NOT_DONE) {
>> +            aio_poll(qemu_get_aio_context(), true);
>> +        }
>> +    }
>> +
>> +    ret = dco.ret;
>> +    if (ret < 0) {
>> +        if (dco.err) {
>> +            error_propagate(errp, dco.err);
>> +        } else {
>> +            error_setg_errno(errp, -ret, "Could not delete image");
>> +        }
>> +    }
>> +
>> +out:
>> +    bdrv_unref(bs);
>> +    return ret;
>> +}
>> +
>>   /**
>>    * Try to get @bs's logical and physical block size.
>>    * On success, store them in @bsz struct and return 0.
>> diff --git a/include/block/block.h b/include/block/block.h
>> index 50a07c1c33..5e83532364 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -369,6 +369,7 @@ bool bdrv_is_backing_chain_frozen(BlockDriverState *bs, BlockDriverState *base,
>>   int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
>>                                 Error **errp);
>>   void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
>> +int bdrv_delete_file(const char *filename, Error **errp);
>>   
>>   
>>   typedef struct BdrvCheckResult {
>>


