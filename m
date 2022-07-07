Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC956A6D2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:24:54 +0200 (CEST)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TN7-0000Tb-9K
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9TLd-0007Yn-8z
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9TLY-000786-L0
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657207395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPuBCKjA9514NNX8upDgfdjDu/pPwkgOmWpJwRiXlgo=;
 b=B0extHxtmmB3oTJRntAB14Xq174ubUnh6LJqzg0HShou9G0wYr4civbfkkpNkKlWSnMVyn
 CX2ewb04ogXT6I3QhJfBGVOvFvUbOQR6RVexxYak0UqfSSvccH2Tn3I01zsQjmrJvdWaBH
 qHOyivFi3KEkYm7hQETMBu3t9yg7BaE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-4Rj4y3HmP4O16C15BRZjMA-1; Thu, 07 Jul 2022 11:23:14 -0400
X-MC-Unique: 4Rj4y3HmP4O16C15BRZjMA-1
Received: by mail-ua1-f72.google.com with SMTP id
 b10-20020ab0238a000000b0037efa0a4ba0so5715551uan.11
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 08:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OPuBCKjA9514NNX8upDgfdjDu/pPwkgOmWpJwRiXlgo=;
 b=73sTUvyg38+Pd6Xizgn5va3p621MkMFgTCVOJp90BHgCSaXs+qmmzUCAomMVj+jZ+W
 UkCTkNq4L6/yeLShCWm8/15Tr3WA5EZrCFd6w87tR/YSXKpO9kPbv4GNInVzrhL+8QTM
 Skcnq+LFrzcCiZ5YOkJQGptKlPdH/BNn3QSwINmnq+TfAB5y1fYsGhNWtF232K7CBjaN
 wyZy2plu6c0vUx+Ty5vupjscf7ZksyBUhJlXQMM9PhuG6JHkjNHzeFEbH2Ebry/mYrcB
 Q/1LcX37wfJ8Kj4V5biUBQFiLw4BCXIv0VY/aXtLaaMpMioqH0mQ6dot2rVTh10wZlYr
 W3nQ==
X-Gm-Message-State: AJIora+/fk3t++Bmn9LLPcmlyRKepqgtQLdtjqs0hPHP30hiDiVFTB13
 qX29c4Vcp4wJsCF0LMOq73g6IHu4w1egB1pZmPLJPnYsExL+s/IVmxebi/JGvl6Nw6/yEMz1Pk0
 vANhbZQiHRX+WZbIXDS5r2ftU1kfa39A=
X-Received: by 2002:a05:6102:101:b0:354:355b:711b with SMTP id
 z1-20020a056102010100b00354355b711bmr28030486vsq.61.1657207393881; 
 Thu, 07 Jul 2022 08:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzL5eVDOH6iqAMADvN/yVpWEs1xZCYtrXvNZr8ySfAURmmn8DMx9qBfKjfYRCqROwO4Myn0Ub2OO1Ofm4iRKE=
X-Received: by 2002:a05:6102:101:b0:354:355b:711b with SMTP id
 z1-20020a056102010100b00354355b711bmr28030465vsq.61.1657207393684; Thu, 07
 Jul 2022 08:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-2-jsnow@redhat.com>
 <CAJ+F1C+NAmgaMxB-XuzNUvn3i_=bK8pf0cEY+=06NZc4V5+fYQ@mail.gmail.com>
In-Reply-To: <CAJ+F1C+NAmgaMxB-XuzNUvn3i_=bK8pf0cEY+=06NZc4V5+fYQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Jul 2022 11:23:03 -0400
Message-ID: <CAFn=p-ZS+pRwQ-Z5e1dQzacPFE7d3q2hmF5_eoFBb0SiVwJwcw@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] qga: treat get-guest-fsinfo as "best effort"
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jul 7, 2022 at 4:40 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Thu, Jul 7, 2022 at 8:10 AM John Snow <jsnow@redhat.com> wrote:
>>
>> In some container environments, there may be references to block devices
>> witnessable from a container through /proc/self/mountinfo that reference
>> devices we simply don't have access to in the container, and cannot
>> provide information about.
>>
>> Instead of failing the entire fsinfo command, return stub information
>> for these failed lookups.
>>
>> This allows test-qga to pass under docker tests, which are in turn used
>> by the CentOS VM tests.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  qga/commands-posix.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 0469dc409d4..950c9d72fe7 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -1207,7 +1207,12 @@ static void build_guest_fsinfo_for_device(char co=
nst *devpath,
>>
>>      syspath =3D realpath(devpath, NULL);
>>      if (!syspath) {
>> -        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>> +        if (errno =3D=3D ENOENT) {
>> +            /* This devpath may not exist because of container config, =
etc. */
>> +            fs->name =3D g_path_get_basename(devpath);
>> +        } else {
>> +            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
>> +        }
>
>
> It looks like this function is called recursively with the same "fs" argu=
ment. That's probably why there is a if (!fs->name) check next. You may wan=
t to check it too to avoid leaks and incorrect info.

Oh, I see what you mean. I am not sure if it will come up in
practice*, but I see the theoretical concern at least. I can amend it.

--js

* (Genuinely; I have no idea.)


