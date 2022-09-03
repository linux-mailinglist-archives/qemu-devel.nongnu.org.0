Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828175ABF23
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 15:32:55 +0200 (CEST)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUTGX-0005rQ-H6
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 09:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oUTEb-000428-8H; Sat, 03 Sep 2022 09:30:53 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oUTEZ-0000wK-9m; Sat, 03 Sep 2022 09:30:52 -0400
Received: by mail-qk1-x72c.google.com with SMTP id w18so3667522qki.8;
 Sat, 03 Sep 2022 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=PfUbQLazhIZZjkgGskmduu3ZNDf0E2gQd1WABACo4NY=;
 b=P/fXQwQaHmiD1wOAnGGI0t5tcoa+lylH7Mv6USQHQCVaquzY5om7cnc5esPql+zMfo
 Y+h86a1m7aFPLjccnH8+/nfjYCO5wCw/2QttWknyMXZJUzUHGqIPeAyfU22kxR6x+JJQ
 lzwadkg7Afx5wT3ItFpftBZDhUcX7kzU+WMLXiSdUHVgo8kPTmg5k3nQOAlAT93cRFJe
 3UOgeYHgGcTxxn5UHzNleTC+I0OA8EJdN0sLBIikXlGLMUuAiYwpmEBjDp/Q6N4uE7a8
 g0n5PLIuRhluV6msO6E6EZ4YskPcmvFldrxf5Mlze5xym/NV5sL2krYZ+Ps5aGkd1e31
 fRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PfUbQLazhIZZjkgGskmduu3ZNDf0E2gQd1WABACo4NY=;
 b=wDodn+Ww8JJAIjphb6dfrR2Zp8h3y2yhgjkQwJnoFzxlu/Od1CDpnjnYus71yVxaUK
 mwl9IPc8GI3Kk9ifPhCbWZ7ZJeE0pBur+aGdFrMOn8TobZ2Dd0j5qZAz3+/5HTQkHXik
 NjrqpcisII9bwJGFFjWOT+tjmP70jzPQNJEdi9tq7zeX6PmCA+vsPVyql0vtOqZUgi3v
 11O7mvRfeDstikb+VlLnq1UjsBEFga7gfVStLUTHlGUaxZr3KAwrnPamHijGIuUWXfai
 v1Hnsp5sJB6jHVurgPCsSBFJVipwuFG4XTeLHSKgfwWRIZdNwrt7zFhhWq1NlRw+A/xW
 3L4Q==
X-Gm-Message-State: ACgBeo0L9USY3EbWoEwyyUTCPsuFibHUYHz+/XCP54MDJJPBq/xV2MBA
 9/mIqzk+5WzSTReOOJilQcOBrD6KcZG39zEeFVs=
X-Google-Smtp-Source: AA6agR66LXRu9TSb8Hg3JIqsUGcpXxDRNhFhKRzkNlhnlZKMl75tim890gWQPzjHPRRlBC2TOnjmMSkwG1noTAOX3bQ=
X-Received: by 2002:a05:620a:430d:b0:6be:7846:2169 with SMTP id
 u13-20020a05620a430d00b006be78462169mr23223795qko.389.1662211849577; Sat, 03
 Sep 2022 06:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-34-bmeng.cn@gmail.com>
 <CAJ+F1CKLkBXFXToPZ_DtQShA+EYHCKWUsWcZ3zwx_v5o2-o+JQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKLkBXFXToPZ_DtQShA+EYHCKWUsWcZ3zwx_v5o2-o+JQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Sep 2022 21:30:38 +0800
Message-ID: <CAEUhbmUNXKEeAr4X=dYsKzdQ_nvpPAXma0_kvP5JUGRP9QFdKw@mail.gmail.com>
Subject: Re: [PATCH 33/51] tests/qtest: {ahci, ide}-test: Use relative path
 for temporary files
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Sep 1, 2022 at 4:58 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
>
>
> On Wed, Aug 24, 2022 at 2:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> These test cases uses "blkdebug:path/to/config:path/to/image" for
>> testing. On Windows, absolute file paths contain the delimiter ':'
>> which causes the blkdebug filename parser fail to parse filenames.
>>
>
> hmm.. maybe it should learn to escape paths..
>
>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  tests/qtest/ahci-test.c | 19 ++++++++++++++++---
>>  tests/qtest/ide-test.c  | 18 ++++++++++++++++--
>>  2 files changed, 32 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
>> index 0e88cd0eef..bce9ff770c 100644
>> --- a/tests/qtest/ahci-test.c
>> +++ b/tests/qtest/ahci-test.c
>> @@ -1848,7 +1848,7 @@ static void create_ahci_io_test(enum IOMode type, =
enum AddrMode addr,
>>
>>  int main(int argc, char **argv)
>>  {
>> -    const char *arch;
>> +    const char *arch, *base;
>>      int ret;
>>      int fd;
>>      int c;
>> @@ -1886,8 +1886,21 @@ int main(int argc, char **argv)
>>          return 0;
>>      }
>>
>> +    /*
>> +     * "base" stores the starting point where we create temporary files=
.
>> +     *
>> +     * On Windows, this is set to the relative path of current working
>> +     * directory, because the absolute path causes the blkdebug filenam=
e
>> +     * parser fail to parse "blkdebug:path/to/config:path/to/image".
>> +     */
>> +#ifndef _WIN32
>> +    base =3D g_get_tmp_dir();
>> +#else
>> +    base =3D ".";
>> +#endif
>
>
> Meanwhile, that seems reasonable. Perhaps chdir() to the temporary direct=
ory first? (assuming other paths are absolute)

Other paths in the QEMU command line indeed are absolute, however the
QEMU executable path is set to a relative path from meson.build thus
we cannot chdir() to the temporary directory here.

>
>>
>> +
>>      /* Create a temporary image */
>> -    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>> +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
>>      fd =3D mkstemp(tmp_path);
>>      g_assert(fd >=3D 0);
>>      if (have_qemu_img()) {
>> @@ -1905,7 +1918,7 @@ int main(int argc, char **argv)
>>      close(fd);
>>
>>      /* Create temporary blkdebug instructions */
>> -    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", g_get_tm=
p_dir());
>> +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
>>      fd =3D mkstemp(debug_path);
>>      g_assert(fd >=3D 0);
>>      close(fd);
>> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
>> index ebbf8e0126..c5cad6c0be 100644
>> --- a/tests/qtest/ide-test.c
>> +++ b/tests/qtest/ide-test.c
>> @@ -1011,17 +1011,31 @@ static void test_cdrom_dma(void)
>>
>>  int main(int argc, char **argv)
>>  {
>> +    const char *base;
>>      int fd;
>>      int ret;
>>
>> +    /*
>> +     * "base" stores the starting point where we create temporary files=
.
>> +     *
>> +     * On Windows, this is set to the relative path of current working
>> +     * directory, because the absolute path causes the blkdebug filenam=
e
>> +     * parser fail to parse "blkdebug:path/to/config:path/to/image".
>> +     */
>> +#ifndef _WIN32
>> +    base =3D g_get_tmp_dir();
>> +#else
>> +    base =3D ".";
>> +#endif
>> +
>>      /* Create temporary blkdebug instructions */
>> -    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", g_get_tm=
p_dir());
>> +    debug_path =3D g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
>>      fd =3D mkstemp(debug_path);
>>      g_assert(fd >=3D 0);
>>      close(fd);
>>
>>      /* Create a temporary raw image */
>> -    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>> +    tmp_path =3D g_strdup_printf("%s/qtest.XXXXXX", base);
>>      fd =3D mkstemp(tmp_path);
>>      g_assert(fd >=3D 0);
>>      ret =3D ftruncate(fd, TEST_IMAGE_SIZE);
>> --
>> 2.34.1

Regards,
Bin

