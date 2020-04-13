Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A611A6E59
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 23:33:05 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO6hU-0006WW-B4
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 17:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jO6gY-00066d-QG
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 17:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jO6gX-00017t-Ja
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 17:32:06 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jO6gX-00017R-6C
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 17:32:05 -0400
Received: by mail-wm1-x341.google.com with SMTP id y24so11618150wma.4
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 14:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=zcG/Tjcml8VmkEWioCq0XseTka3tmeZmZyzIi0iSc2g=;
 b=LMb3vm1nP8FELye1ns52WZkZoTTPs2iP+2Wo4dxhS8+8aqIyqXyNn5Tj1FyziHPKAh
 3PxhXnqUBAkikN9vYjoacAQ1bqsZchXpyNPnQ0c22Xlvd9qPYUC70HEO9/ojTxV7788T
 B37vYS6KtroQhTJUleOAQG2fLKVNaTVvx5ygQCtDTeTsdlJmXJQ6T+UKnenR0p0vsbvC
 DkrIbDb1AX1mnXjGXo7zjcy1a7dzFF4417OWjxUeO+oOzcJ67F2vAgoAVOepcG95cu4I
 pCBKLYQ1cPekTV8vWiSFl6/vaGJknOYU7RboUq3tm6lPxLULJdmPsk3YOSdk+PeklAY3
 VLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=zcG/Tjcml8VmkEWioCq0XseTka3tmeZmZyzIi0iSc2g=;
 b=jaobOt6ZeuFvFjG84siPHo/260pdONiT0pvvSxwtvVp//5GmYy8yTty9aox9sr1r5p
 IYhcaBMlomujAdWJTmKm9yuNihu0tY5HG2rysu6saTdkbM3DkZl71R/eUxDbdwjgn8J8
 1khUov0/ghEDvx2JdDnx1E7XD7N2SNd4foumwRMnaZYh2x88/9DN0e3X74xlt+/iHSs6
 jxrzfjMHy9dM8y7FulUBdNfsVnXdHPLmcIWWKQ3QH7PX5xtnBlNsH5C5jrPV7QPgHpAe
 vEWQgNLwRBjY+nTWoyJQqqnTbR/A1zUt+cRqKD9RmpYq7DYcviyX7VR6Wn2Zh8elo9cW
 AI0A==
X-Gm-Message-State: AGi0Puaw+iwSyb5kp04NQi6vS8fIWQlcv8gWuEgSXiHzHkHhVEkTpn+X
 WVKttTwDp0qiF1GIGjaPE5OxmeswCj8=
X-Google-Smtp-Source: APiQypIdXZngd/XTP69Pyr4gzzWWPtX3gBmjms0xvIg2RtgDQnl4jrliIt1IfTry0cKPhIee+K5VYQ==
X-Received: by 2002:a7b:cb51:: with SMTP id v17mr19894953wmj.164.1586813522701; 
 Mon, 13 Apr 2020 14:32:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d13sm16316578wrv.34.2020.04.13.14.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 14:32:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5EFA81FF7E;
 Mon, 13 Apr 2020 22:32:00 +0100 (BST)
References: <20200413162902.7985-1-alex.bennee@linaro.org>
 <2c489489-f459-f029-029e-74bfbfc70e49@redhat.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] .gitignore: include common build sub-directories
In-reply-to: <2c489489-f459-f029-029e-74bfbfc70e49@redhat.com>
Date: Mon, 13 Apr 2020 22:32:00 +0100
Message-ID: <87imi38433.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Blake <eblake@redhat.com> writes:

> On 4/13/20 11:29 AM, Alex Benn=C3=A9e wrote:
>> As out-of-tree builds become more common (or rather building in a
>> subdir) we can add a lot of load to "git ls-files" as it hunts down
>> sub-directories that are irrelevant to the source tree. This is
>> especially annoying if you have a prompt that attempts to summarise
>> the current git status on command completion.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitignore | 2 ++
>>   1 file changed, 2 insertions(+)
>> diff --git a/.gitignore b/.gitignore
>> index 0c5af83aa74..7757dc08a08 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -141,6 +141,8 @@ cscope.*
>>   tags
>>   TAGS
>>   docker-src.*
>> +build
>> +builds
>
> Would 'build-*' be worth adding as well?

Sure - I'll add it to v2.

>
> The idea makes sense to me (as I've already done the same in my
> ./git/info/exclude locally),
> Reviewed-by: Eric Blake <eblake@redhat.com>


--=20
Alex Benn=C3=A9e

