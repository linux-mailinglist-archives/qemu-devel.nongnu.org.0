Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086775EABA5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:52:08 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqOq-00066N-0L
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocpgD-0006W7-WA
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:06:02 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocpg9-0002Bq-UM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:05:56 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e187so8713742ybh.10
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=3uK2KJUZoGDkUriMiVcq2KAVP53JvGGeI9iPHy8w5AU=;
 b=mj1eTyot4rpFx9HmZW95mrDO1UEpmk5yVRHcuC9FGfFCc/wWhVWE3pGN7ElklwHCx9
 CWkjlygxIRNmGlxdZO4TOQ0gDCjzE/jEtHr/915LilCAPOgVbsZayBx68ifiUMkGH5Ct
 WzGJoc571QvDjcmGE/faqSHQjLRoYY/3wiExXTdTaD5rmjpzX1C31Rkg/3w2sNc2z23D
 YYP7HUnpUvOHumijrwePihTrxXMvCwPsDhYEDlEvTeGDDDHqz0/g48oMqrfEJg9uo0KU
 lwGl1wcqemVtERjo7OJlCtdDFtc3RAeG+jrdQWu3LjBb1jtH+FkX3wWc7lTOmBrfCmfI
 2wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3uK2KJUZoGDkUriMiVcq2KAVP53JvGGeI9iPHy8w5AU=;
 b=5cLY0zaEJZWABESj7qGYbmN7pRVevEE16qxH+I3rnUBFVafA/bkOjkO4zEfvysztwi
 p1nDQnzwvWFcgM5PZYHZwi37DpXRwECu+I6btnXHJu54FG0dTw1AL3PUpylnJqz8riRA
 BYTiJ1T+6CDKK08G5SLA9PKHIiVbj1fq6CBiDRCeXYVhbtSkQbXGU9xp6TRU+LX4AeFq
 2i09h5g2G1++lCDt1FJ1Yx0QW0wMSnp1o0JxJNkt3hVZoSGn3k1Nr4Nvwy/Itu+5ktNw
 +bGCnCJUfWbb4pRS/IIdiqP+guOpPF1VwdG7X0mXNV+fa5Nqsw/zoyC994+4iUaMQhdZ
 htyw==
X-Gm-Message-State: ACrzQf0hfrXjK/1PBtvodNq2UKtt+j8JpiI3HALZaeR7ASdUdNlh0br6
 kaTk84rruHSPwpv1/2o55Geho4ikULIFcFfn3A8=
X-Google-Smtp-Source: AMsMyM5FpUs2CAXldeJ77fD4453PT8fKCD26CI8Rtmp8iP5n8fhGxG3x7sQkMGcOUNq+DYPrtCLQpXvShHfUOOke94E=
X-Received: by 2002:a05:6902:42:b0:695:9d03:f138 with SMTP id
 m2-20020a056902004200b006959d03f138mr19976302ybh.503.1664204752213; Mon, 26
 Sep 2022 08:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-43-bmeng.cn@gmail.com>
 <CAJ+F1CLh=GzJ4gxQ+dEriC2nMzn5nUM-JBdhRpzai-z-RcPmxA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLh=GzJ4gxQ+dEriC2nMzn5nUM-JBdhRpzai-z-RcPmxA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Sep 2022 23:05:41 +0800
Message-ID: <CAEUhbmX+Nsyf9dFb3D1TT0DaiUGZ4Z_G-ojnJmDXZXngyhqdRg@mail.gmail.com>
Subject: Re: [PATCH v3 42/54] chardev/char-file: Add FILE_SHARE_WRITE when
 opening the file for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 26, 2022 at 9:27 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Sun, Sep 25, 2022 at 4:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>
>> The combination of GENERIC_WRITE and FILE_SHARE_READ options does not
>> allow the same file to be opened again by CreateFile() from another
>> QEMU process with the same options when the previous QEMU process
>> still holds the file handle opened.
>>
>> This was triggered by running the test_multifd_tcp_cancel() case on
>> Windows, which cancels the migration, and launches another QEMU
>> process to migrate with the same file opened for write. Chances are
>> that the previous QEMU process does not quit before the new QEMU
>> process runs hence the old one still holds the file handle that does
>> not allow shared write permission then the new QEMU process will fail.
>>
>> There is another test case boot-serial-test that triggers the same
>> issue. The qtest executable created a serial chardev file to be
>> passed to the QEMU executable. The serial file was created by
>> g_file_open_tmp(), which internally opens the file with
>> FILE_SHARE_WRITE security attribute, and based on [1], there is
>> only one case that allows the first call to CreateFile() with
>> GENERIC_READ & FILE_SHARE_WRITE, and second call to CreateFile()
>> with GENERIC_WRITE & FILE_SHARE_READ. All other combinations
>> require FILE_SHARE_WRITE in the second call. But there is no way
>> for the second call (in this case the QEMU executable) to know
>> what combination was passed to the first call, so we will have to
>> add FILE_SHARE_WRITE to the second call.
>>
>> For both scenarios we should add FILE_SHARE_WRITE in the chardev
>> file backend driver. This change also makes the behavior to be
>> consistent with the POSIX platforms.
>
>
> It seems to me the tests should be fixed instead. I thought you fixed the=
 first case. For the second case, why not close the file before starting qe=
mu? If you have issues, I will take a deeper look.

Indeed, the following test case change can "fix" this issue:

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.=
c
index 72310ba30e..f192fbc181 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -233,6 +233,7 @@ static void test_machine(const void *data)
ser_fd =3D g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
g_assert(ser_fd !=3D -1);
+ close(ser_fd);
if (test->kernel) {
code =3D test->kernel;
@@ -266,6 +267,7 @@ static void test_machine(const void *data)
unlink(codetmp);
}
+ ser_fd =3D open(serialtmp, O_RDONLY);
if (!check_guest_output(qts, test, ser_fd)) {
g_error("Failed to find expected string. Please check '%s'",
serialtmp);

But I think it just workarounds the problem. The original test case
looks reasonable to me. If we update the case like above, we cannot
guarantee users will do like the updated test case does.

>
>>
>>
>> [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-o=
pening-files
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> Changes in v3:
>> - Add another case "boot-serial-test" to justify the change
>>
>> Changes in v2:
>> - Update commit message to include the use case why we should set
>>   FILE_SHARE_WRITE when opening the file for win32
>>
>>  chardev/char-file.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>

Regards,
Bin

