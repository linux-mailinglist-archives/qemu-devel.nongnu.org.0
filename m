Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B538E7C8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:38:33 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAmu-0003fh-KT
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llAlU-0002rC-Va
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:37:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llAlT-0003jf-0I
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:37:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x7so8966504wrt.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TlQbWiyErufmLxIWHOHxy8+qCaW9I+ehxUHqZqETENY=;
 b=fVMfLK9tfIqPUeCnmUBt78LpFeydlTR8xZQXZQAI621D/VbTLiMvL0TE9ThTRitoaF
 lSrregNqCir02iNS8EQuu3yeQ8OvsFzWPyabDlewlcVJgCiqPfsJRvCYwUNbuH3MGxOg
 3EA3vUABvLbd+ULJIoUccPF2vvwmyVdoz1qHmtxg86SjakjRydLHi6ahH2ryBn87VmLX
 MtqMy7Ik+bpg1Kih0xMvIwfnyiyhSFgLqBgJ39lll8X1mu6h/mrqOTVyWQPh/9SgnERJ
 Zx/euI71L3KJRZO9aT3If0JSFZeBl0h6GOI3FXCIOv8DllaOBnCw4wHR8DVeW5gkjqyq
 LSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TlQbWiyErufmLxIWHOHxy8+qCaW9I+ehxUHqZqETENY=;
 b=faQOdILsnZnFbljyzDlC3Encau2KYx/ARiwUEIG4rZWo74dBxx+/dbvRqxJYfvaL0e
 R3P4IlPQR23OjoM+EzmjE1aKCUDkWOJU4m982wo+DQzRXwSZXNi8MU7GGtMev4kA/HA3
 5qXIci7DkY0QZiK8YNOErw9RyZNddnR7cB4mBBMNc/0CQ7Efvo8C5OQcgvoxkwDu9s+6
 0Sofi5yAA11+RmQgM1bp0fQUtkUd4EVrWkvdjnw0dSZvrmWJPlLlvN8HrsnIBmUqiWM0
 f5XWnybzYNxYK8b7olWHCAnOhGYYgqypvZlBJRsop7rsKNSvb+JADMezUGpIQQQouCwA
 KwoA==
X-Gm-Message-State: AOAM532J0WBhvgVxHYbf0KM0asPYaouLJbjE45rbwhn0dJA0QW78BMJo
 5pcSWX0Vtjw6jCJXuF6bNWt3UQ==
X-Google-Smtp-Source: ABdhPJwwkYqb1XTCJiUNNKm47DeOgXfQXHOmVFKl6T/Mg2LcVEDTbzUseMGOqbEyev06YhsYMbPCsQ==
X-Received: by 2002:a05:6000:4d:: with SMTP id
 k13mr22709564wrx.98.1621863421347; 
 Mon, 24 May 2021 06:37:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d141sm8023251wmd.21.2021.05.24.06.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 06:37:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5BFD91FF7E;
 Mon, 24 May 2021 14:36:59 +0100 (BST)
References: <20210524112323.2310-1-alex.bennee@linaro.org>
 <YKuPiul64Uu9vlHs@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] linux-user: glib-ify is_proc_myself
Date: Mon, 24 May 2021 13:35:47 +0100
In-reply-to: <YKuPiul64Uu9vlHs@redhat.com>
Message-ID: <87o8d045j8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: yamamoto@midokura.com, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, May 24, 2021 at 12:23:23PM +0100, Alex Benn=C3=A9e wrote:
>> I'm not sure if this is neater than the original code but it does
>> remove a bunch of the !strcmp's in favour of glib's more natural bool
>> results. While we are at it make the function a bool return and fixup
>> the fake_open function prototypes.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  linux-user/syscall.c | 30 ++++++++++++------------------
>>  1 file changed, 12 insertions(+), 18 deletions(-)
>>=20
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index e739921e86..18e953de9d 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -7987,33 +7987,27 @@ static int open_self_auxv(void *cpu_env, int fd)
>>      return 0;
>>  }
>>=20=20
>> -static int is_proc_myself(const char *filename, const char *entry)
>> +static bool is_proc_myself(const char *filename, const char *entry)
>>  {
>> -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
>> +    if (g_str_has_prefix(filename, "/proc/")) {
>>          filename +=3D strlen("/proc/");
>> -        if (!strncmp(filename, "self/", strlen("self/"))) {
>> +        if (g_str_has_prefix(filename, "self/")) {
>>              filename +=3D strlen("self/");
>> -        } else if (*filename >=3D '1' && *filename <=3D '9') {
>> -            char myself[80];
>> -            snprintf(myself, sizeof(myself), "%d/", getpid());
>> -            if (!strncmp(filename, myself, strlen(myself))) {
>> -                filename +=3D strlen(myself);
>> -            } else {
>> -                return 0;
>> +        } else if (g_ascii_isdigit(*filename)) {
>> +            g_autofree char * myself =3D g_strdup_printf("%d/", getpid(=
));
>> +            if (!g_str_has_prefix(filename, myself)) {
>> +                return false;
>>              }
>> -        } else {
>> -            return 0;
>> -        }
>> -        if (!strcmp(filename, entry)) {
>> -            return 1;
>> +            filename +=3D strlen(myself);
>>          }
>> +        return g_str_has_prefix(filename, entry);
>>      }
>> -    return 0;
>> +    return false;
>>  }
>
> Diff is hard to compare, so this is what it looks like:
>
>  static bool is_proc_myself(const char *filename, const char *entry)
>  {
>      if (g_str_has_prefix(filename, "/proc/")) {
>          filename +=3D strlen("/proc/");
>          if (g_str_has_prefix(filename, "self/")) {
>              filename +=3D strlen("self/");
>          } else if (g_ascii_isdigit(*filename)) {
>              g_autofree char * myself =3D g_strdup_printf("%d/", getpid()=
);
>              if (!g_str_has_prefix(filename, myself)) {
>                  return false;
>              }
>              filename +=3D strlen(myself);
>          }
>          return g_str_has_prefix(filename, entry);
>      }
>      return false;
>  }
>
> I think if we don't mind two heap allocs it can be simplified to:
>
>   static int is_proc_myself(const char *filename, const char *entry)
>   {
>     g_autofree char *procself =3D g_strdup_printf("/proc/self/%s", entry);
>     g_autofree char *procpid =3D g_strdup_printf("/proc/%d/%s", getpid(),=
 entry);
>     return g_str_equal(filename, procself) || g_str_equal(filename, procp=
id);
>   }

Ahh nice, even simpler and easy to follow. I don't think the double
alloc is too much of a concern because we are typically on a syscall
path anyway so have a bunch of stuff to check.

> This makes me wonder if the code needs to cope with non-canonicalized
> filenames though. eg /proc///self/maps  or /proc/./self/maps
>
> Is something further up ensuring canonicalization of 'filename' ?

It seems so from my cursory pokes but I'm not convinced all paths do. We
could throw in a g_canonicalize_filename to be sure.

>
>
>>=20=20
>>  #if defined(HOST_WORDS_BIGENDIAN) !=3D defined(TARGET_WORDS_BIGENDIAN) =
|| \
>>      defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPP=
A)
>> -static int is_proc(const char *filename, const char *entry)
>> +static bool is_proc(const char *filename, const char *entry)
>>  {
>>      return strcmp(filename, entry) =3D=3D 0;
>>  }
>> @@ -8097,7 +8091,7 @@ static int do_openat(void *cpu_env, int dirfd, con=
st char *pathname, int flags,
>>      struct fake_open {
>>          const char *filename;
>>          int (*fill)(void *cpu_env, int fd);
>> -        int (*cmp)(const char *s1, const char *s2);
>> +        bool (*cmp)(const char *s1, const char *s2);
>>      };
>>      const struct fake_open *fake_open;
>>      static const struct fake_open fakes[] =3D {
>> --=20
>> 2.20.1
>>=20
>>=20
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

