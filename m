Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD0832B1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 15:29:20 +0200 (CEST)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huzWh-00085P-9h
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 09:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <danielhb413@gmail.com>) id 1huzVV-0006mL-WC
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:28:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1huzVU-000547-E5
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:28:05 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:38951)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1huzVU-00052s-7H
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 09:28:04 -0400
Received: by mail-qk1-x744.google.com with SMTP id w190so62819099qkc.6
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=EWTCAI2r7z3URSa8vnRE0X84IPY2dTOXYJYyVjzRUT0=;
 b=A3qfDCgRIJaVoF5QMJIFq1KMxz3nzbq0f/mH+14hSI3DbKnjg30BGkeKKLRTnP7YMn
 /Nz3uE9xGUYdSAhkFxuhRP9Mm0vzmf4/RbESvAx0JNrSKpxJ9MOjXr3JjNiFYMzQZ59P
 mw+VPCwgL5EcWEGxqd2gGryqlw0Iy/b9+MpjNSoZCN1GQvMpdev5hIXm83iKYm8230Iz
 R+bzU7LOcXmyNVFJwKY1zLAnyPCOhsu9vbVQ+T6IN1SGgk+ejvN4EQ79znJlxZFz0hQM
 zcgcXqh+JOVOU1+bo7P7jzhUoQWLbs8Z1tHa/7qwcqcF0pRy3DqCCN+Xg4WpXnuGtDGE
 rTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=EWTCAI2r7z3URSa8vnRE0X84IPY2dTOXYJYyVjzRUT0=;
 b=NclFSPVd2oXsWsNRWWiwDmSwQJtxAxNoF8CdGBGLAG2Nz5779JMZz/QZgCkp260wAr
 RGXcY5xslyrUMU/30/XdHzDvk08iqCEQJZCJ6845Pl4vGSL8PL6NgxKMkmQ38PceW2HP
 T/oRwMOhQjeT3H3zHqjwbz4G5GU0lWcAfhlCVBVq2ove3z55D9UvUuGEiFgRg92Enxfc
 L8U6jCVsgDLqmirSv1Tsp35fcGcedwkcSPjzxs7g24b3OUKQLwvzKDTS2TVh1iJItuxI
 Q1C3T2IoLnuHXmzKh7j9u4fP+eJ4TvzEKHRVXzpd5fRGgqBl0R9gL6OXASipbSjPJZ3d
 fXVQ==
X-Gm-Message-State: APjAAAVI5/rQ+lDGDHZ9+RBUycAzhRu3fHta17UnAVlS3WDBDw+Gfrc3
 6IdfLFadnO7Irhejt8c0vAE=
X-Google-Smtp-Source: APXvYqwJB6CSqAl25IvNNlXdNKfVhTQaNMNw4n8S9W64DMnSvfmuJwkOIawcUIsdVZc5yFkY5+WKxg==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr3148567qkm.243.1565098083419; 
 Tue, 06 Aug 2019 06:28:03 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:5ef4:7266:b7a7:9def:f8fc?
 ([2804:431:c7c7:5ef4:7266:b7a7:9def:f8fc])
 by smtp.gmail.com with ESMTPSA id c40sm51135945qtd.14.2019.08.06.06.28.01
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 06:28:02 -0700 (PDT)
To: Kevin Wolf <kwolf@redhat.com>
References: <20190628194512.21311-1-danielhb413@gmail.com>
 <20190628194512.21311-2-danielhb413@gmail.com>
 <20190802160731.GF6379@localhost.localdomain>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <92e47934-88e0-5734-fa35-56ecd700e1d7@gmail.com>
Date: Tue, 6 Aug 2019 10:27:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802160731.GF6379@localhost.localdomain>
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v4 1/4] block: introducing
 'bdrv_co_delete_file' interface
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
Cc: jsnow@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,

On 8/2/19 1:07 PM, Kevin Wolf wrote:
> Am 28.06.2019 um 21:45 hat Daniel Henrique Barboza geschrieben:
>> Adding to Block Drivers the capability of being able to clean up
>> its created files can be useful in certain situations. For the
>> LUKS driver, for instance, a failure in one of its authentication
>> steps can leave files in the host that weren't there before.
>>
>> This patch adds the 'bdrv_co_delete_file' interface to block
>> drivers and add it to the 'file' driver in file-posix.c. The
>> implementation is given by 'raw_co_delete_file'. The helper
>> 'bdrv_path_is_regular_file' is being used only in raw_co_delete_file
>> at this moment, but it will be used inside LUKS in a later patch.
>> Foreseeing this future use, let's put it in block.c and make it
>> public.
>>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   block.c                   | 11 +++++++++++
>>   block/file-posix.c        | 28 ++++++++++++++++++++++++++++
>>   include/block/block.h     |  1 +
>>   include/block/block_int.h |  6 ++++++
>>   4 files changed, 46 insertions(+)
>>
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -309,6 +309,12 @@ struct BlockDriver {
>>        */
>>       int coroutine_fn (*bdrv_co_flush)(BlockDriverState *bs);
>>   
>> +    /*
>> +     * Delete a local created file.
>> +     */
>> +    int coroutine_fn (*bdrv_co_delete_file)(const char *filename,
>> +                                            Error **errp);
> I wonder if it wouldn't make more sense to pass a BlockDriverState
> instead of a filename. In the create options we usually have a BDS
> around, so it should be possible to use.
>
> The only case where it wouldn't work is if creating the image file
> worked, but bdrv_open() fails. I think this is unlikely, and it's even
> more unlikely that unlinking such a file would then work, so I wouldn't
> see it as a problem.
>
> The reason why I'm suggesting this is that we've spent a lot of time in
> the past years to change open and create to an interface that doesn't
> use only filenames, because filenames cover only part of the possibe
> block devices.
>
> So I'm kind of hesitant to add a new interface that can only use
> filenames, while we know that filenames just don't quite cut it in the
> general case - especially if using a BDS, which already has all the
> information needed, is possible as an alternative.

I'll change the parameter to use a BDS instead of a file name in
this new interface.


>
>>       /*
>>        * Flushes all data that was already written to the OS all the way down to
>>        * the disk (for example file-posix.c calls fsync()).
>> -- 
>> 2.20.1
>>
>> diff --git a/block.c b/block.c
>> index c139540f2b..6e2b0f528d 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -621,6 +621,17 @@ int get_tmp_filename(char *filename, int size)
>>   #endif
>>   }
>>   
>> +/**
>> + * Helper that checks if a given string represents a regular
>> + * local file.
>> + */
>> +bool bdrv_path_is_regular_file(const char *path)
>> +{
>> +    struct stat st;
>> +
>> +    return (stat(path, &st) == 0) && S_ISREG(st.st_mode);
>> +}
>> +
>>   /*
>>    * Detect host devices. By convention, /dev/cdrom[N] is always
>>    * recognized as a host CDROM.
> This hunk isn't generic, it belong in file-posix.c

Patch 3 uses this function as part of the core logic of this fix (do not
delete the file if the file already existed) inside block/cryptoc. This
is the reason it is exposed here. I assumed that we do not want a
public function inside file-posix.c (since there is none - everything
is done using the BD interfaces).

I think it would be sensible to simply this code as a static inside
crypto.c, since it's used twice there, and do the regular file check in
raw_co_delete_file using S_ISREG() directly - like it is already done
inside file-posix.c in other circunstances. Another alternative would
be a new bdrv_path_is_regular_file() interface but I don't think the
use I'm making here justifies this new interface as well.


Thanks,


DHB



>
> Kevin

