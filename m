Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735282EF760
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:32:20 +0100 (CET)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwYc-00011m-37
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kxwXR-0000ZS-0a
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:31:06 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kxwXN-00021c-I0
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:31:04 -0500
Received: by mail-oi1-x233.google.com with SMTP id d189so12312499oig.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1JMzFfC3qdmBxn0QNvnHixb0vmIlyMFl858UbScnE4A=;
 b=qeLQlJdstx0teChFvlpGz51R4qgqtUgdHP1ACkgSDcKlSLDEQvxpFNVDs8JgPlUScS
 6LLbW8CkqUiuXZ+B0xjsIyyuZmYxmJWpy7LZGjhmkZtv4cz1P9o0VLH6q96rPK15QpLh
 FLTUicAGmtU2TQzZRUbOpHetS/zXDh/iYve5AgV3CUH948GkjdB5Q/ExHjjaEiwLOaFG
 byTEij2dCUv6S+FlYmvYc0jbuFYGpEFve9fItIrkGLKIr6/l+EAPI0D+5go6mzHFNd++
 2FD0br7sTEFdULZtIaboeICoXZwuNJhD77KbMUDwtk6qjj19oFeRn0q6XMLwECqMWOsS
 HmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1JMzFfC3qdmBxn0QNvnHixb0vmIlyMFl858UbScnE4A=;
 b=hOeVSy9kSAzwnVfFl5krYCJokzA6wuS66RETEmHvbbLXcym8C5K7BRGzEA8Uz3iGqu
 +MYP+y3a5KybG2tc5JriPgOBUB9Ps3kjLy/DK4FpU0b3MAAFWDHP0gpVg/thn0Q0OIc3
 /gVTOnpbCDrwK5NW6F+lOBngwdtnC8w0roSAynpJ4c/jiUqE5tLCtcdxHj5aPu3yaZXK
 hWZ/e/lbiQqathjjRETc9dYy12PbfXe0LGn1liDXJpf8kJzXH6VpFZlWHp7UbLU7jcqK
 wtMNyIcUHXiR3IrWlpD9DB7Y1UhtESL6ErSPSu8lpHzJ931t5IMYiw/x3RxAQC2FqtvC
 3mCQ==
X-Gm-Message-State: AOAM532D5kM+kovTZs8k+LKe0TWjhn1PHQuJ0KsRhNqahOUsc+jGJUN8
 E8FaRu+h1TkBhojUCrkzfyA=
X-Google-Smtp-Source: ABdhPJwed/lcxgxZqeF9I0apxqAbCTHq5cbw0RAl3yJHp7O4tTk5Pq13CNM4Uf0FlVZBXQocokLjGw==
X-Received: by 2002:aca:1a09:: with SMTP id a9mr3141657oia.12.1610130660306;
 Fri, 08 Jan 2021 10:31:00 -0800 (PST)
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
 by smtp.gmail.com with ESMTPSA id m18sm1874060ooa.24.2021.01.08.10.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 10:30:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [PATCH] configure: Add flags for MinGW32 standalone build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
Message-ID: <0e956e41-4862-f979-3247-40d03c5054e4@gmail.com>
Date: Fri, 8 Jan 2021 12:30:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=jpewhacker@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/21 1:25 AM, Thomas Huth wrote:
> On 07/01/2021 22.38, Joshua Watt wrote:
>> There are two cases that need to be accounted for when compiling QEMU
>> for MinGW32:
>>   1) A standalone distribution, where QEMU is self contained and
>>      extracted by the user, such as a user would download from the QEMU
>>      website. In this case, all of the QEMU files should be rooted in
>>      $prefix to ensure they can be easily packaged together for
>>      distribution
>>   2) QEMU integrated into a distribution image/sysroot/SDK and
>>      distributed with other programs. In this case, the provided
>>      arguments for bindir/datadir/etc. should be respected as they for a
>>      Linux build.
>>
>> Add a configure time flags --enable-standalone-mingw and
>> --disable-standalone-mingw that allows the user to control this
>> behavior. The flag defaults to "enabled" if unspecified to retain the
>> existing build behavior
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   configure | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 5860bdb77b..5c83edb502 100755
>> --- a/configure
>> +++ b/configure
>> @@ -358,6 +358,7 @@ strip_opt="yes"
>>   tcg_interpreter="no"
>>   bigendian="no"
>>   mingw32="no"
>> +mingw32_standalone="yes"
>>   gcov="no"
>>   EXESUF="$default_feature"
>>   HOST_DSOSUF=".so"
>> @@ -1558,6 +1559,10 @@ for opt do
>>     ;;
>>     --disable-fuse-lseek) fuse_lseek="disabled"
>>     ;;
>> +  --enable-standalone-mingw) mingw32_standalone="yes"
>> +  ;;
>> +  --disable-standalone-mingw) mingw32_standalone="no"
>> +  ;;
>>     *)
>>         echo "ERROR: unknown option $opt"
>>         echo "Try '$0 --help' for more information"
>> @@ -1570,7 +1575,7 @@ libdir="${libdir:-$prefix/lib}"
>>   libexecdir="${libexecdir:-$prefix/libexec}"
>>   includedir="${includedir:-$prefix/include}"
>>   -if test "$mingw32" = "yes" ; then
>> +if test "$mingw32" = "yes" && test "$mingw32_standalone" = "yes"; then
>>       mandir="$prefix"
>>       datadir="$prefix"
>>       docdir="$prefix"
>> @@ -1897,6 +1902,7 @@ disabled with --disable-FEATURE, default is 
>> enabled if available
>>     libdaxctl       libdaxctl support
>>     fuse            FUSE block device export
>>     fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
>> +  standalone-mingw  Build for standalone distribution on MinGW
>>     NOTE: The object files are built at the place where configure is 
>> launched
>>   EOF
>
> I think this should maybe be done independently from MinGW, so that it 
> could be used on other systems, too. Thus maybe rather name the switch 
> "--enable-standalone-distribution" or 
> "--enable-standalone-installation" or something like this? On MinGW, 
> the value of the switch could then default to "yes" while on other 
> systems it would be "no" by default.

We could, but I'm curious how useful that is? Does that make the option 
just a shorthand for "--mandir=$prefix --bindir=$prefix 
--datadir=$prefix etc..." for all builds?

>
>  Thomas
>

