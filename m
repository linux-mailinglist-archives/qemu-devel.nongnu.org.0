Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C15EC013
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:48:00 +0200 (CEST)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od887-0006lO-Rz
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od84T-0001Xb-TS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:44:13 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od84S-0008RF-7N
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:44:13 -0400
Received: by mail-qv1-xf32.google.com with SMTP id l14so5947776qvq.8
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=sIxSo3P0RymD65TZj92gVCM1CsN4heuUYSR5I5KzSFc=;
 b=aHKSsmFXjtVU5ELc91QIsQn0tHswaWiwkzITECgPq/FL6i1Njy2lJTiC8uPd+FV2H6
 xLF98jBBCWZSV1bWCcr+DGb+rLfLX93DFmf/qHTGCdE3sDdDNoRAFqNK1yiLhwO0lzyg
 tJxKreRIkHthCcG8RSz8yle4PssXRRChd/3IPCntSHMpyGhbE67OhihwGYA35a5e6N7f
 v/ESlS5fopUoDOty9xiw3xJ7PL/DzSg17Xy5lzrCETz81Ya4QdZmY59Gqq3MyG1mJ+fZ
 BoRDY51k9h7xG5zIq6Pe41PJ+1pEM5LGDpvEpvHwQAJZnL3lCeQEKdRxZG0nrguz2sDl
 lV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sIxSo3P0RymD65TZj92gVCM1CsN4heuUYSR5I5KzSFc=;
 b=D7WPeN7cV3xmmjjaTjmsCazyVa5+ZmdeWPpyg5dkdwq5nU/RCvCIXSLvF+mfP/8s1w
 X87EsiO72wWYs/mt0Q1RkH2RD6FgV/FsDlQQdSKIK/SWS9Vj3jxCAygW9Me8Wi+vPvNP
 f1nLF3um1LBSrvFHN1PB8XbHfh4aeq80eWhuB/H9o+rxXn+M8vN6doEOh0yUEhxfshnX
 aOa7GrecJpumHEFh0yxvIcnYobz1F19Fa98nVtBdSX9cejrpNKij8xOJzZbLR9uRG2U9
 BW6fNIJs9iSNhQtUKlGzkRCrRjPy0i9ju5Jf5EvEXUhhbyi8hLXHqu19QlAdEHHJfQua
 We4A==
X-Gm-Message-State: ACrzQf3J2E806K21am9BBT3m9AU8iSztq6f4qlO1PGCW182EIot0+O73
 veq7IxYExT77ZGbwE3XglNHOdXHZPd0N1WVf4oQ=
X-Google-Smtp-Source: AMsMyM5fMQnxyIkY+XVAK8mZQBEImkWajBCiSt36wHHhblaQSZIW2cKBG6zVeFLuQci3Mhrc/i6O3iWlgb4HMBfrfwY=
X-Received: by 2002:a0c:e511:0:b0:4aa:73d9:f4c3 with SMTP id
 l17-20020a0ce511000000b004aa73d9f4c3mr20591727qvm.51.1664275451093; Tue, 27
 Sep 2022 03:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-43-bmeng.cn@gmail.com>
 <CAJ+F1CLh=GzJ4gxQ+dEriC2nMzn5nUM-JBdhRpzai-z-RcPmxA@mail.gmail.com>
 <CAEUhbmX+Nsyf9dFb3D1TT0DaiUGZ4Z_G-ojnJmDXZXngyhqdRg@mail.gmail.com>
 <CAJ+F1CJjtspCoyH0=hhhRa=J9824sKbnOhcpJh_i9CFQMNuDHQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CJjtspCoyH0=hhhRa=J9824sKbnOhcpJh_i9CFQMNuDHQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Sep 2022 18:44:01 +0800
Message-ID: <CAEUhbmVRK4nOvsDA-mvuMs1r9Ag-zWRfpoxzxSA4s3B+GgP0=w@mail.gmail.com>
Subject: Re: [PATCH v3 42/54] chardev/char-file: Add FILE_SHARE_WRITE when
 opening the file for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf32.google.com
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

On Tue, Sep 27, 2022 at 5:00 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Sep 26, 2022 at 7:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Mon, Sep 26, 2022 at 9:27 PM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Sun, Sep 25, 2022 at 4:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >>
>> >> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> >>
>> >> The combination of GENERIC_WRITE and FILE_SHARE_READ options does not
>> >> allow the same file to be opened again by CreateFile() from another
>> >> QEMU process with the same options when the previous QEMU process
>> >> still holds the file handle opened.
>> >>
>> >> This was triggered by running the test_multifd_tcp_cancel() case on
>> >> Windows, which cancels the migration, and launches another QEMU
>> >> process to migrate with the same file opened for write. Chances are
>> >> that the previous QEMU process does not quit before the new QEMU
>> >> process runs hence the old one still holds the file handle that does
>> >> not allow shared write permission then the new QEMU process will fail=
.
>> >>
>> >> There is another test case boot-serial-test that triggers the same
>> >> issue. The qtest executable created a serial chardev file to be
>> >> passed to the QEMU executable. The serial file was created by
>> >> g_file_open_tmp(), which internally opens the file with
>> >> FILE_SHARE_WRITE security attribute, and based on [1], there is
>> >> only one case that allows the first call to CreateFile() with
>> >> GENERIC_READ & FILE_SHARE_WRITE, and second call to CreateFile()
>> >> with GENERIC_WRITE & FILE_SHARE_READ. All other combinations
>> >> require FILE_SHARE_WRITE in the second call. But there is no way
>> >> for the second call (in this case the QEMU executable) to know
>> >> what combination was passed to the first call, so we will have to
>> >> add FILE_SHARE_WRITE to the second call.
>> >>
>> >> For both scenarios we should add FILE_SHARE_WRITE in the chardev
>> >> file backend driver. This change also makes the behavior to be
>> >> consistent with the POSIX platforms.
>> >
>> >
>> > It seems to me the tests should be fixed instead. I thought you fixed =
the first case. For the second case, why not close the file before starting=
 qemu? If you have issues, I will take a deeper look.
>>
>> Indeed, the following test case change can "fix" this issue:
>>
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-te=
st.c
>> index 72310ba30e..f192fbc181 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -233,6 +233,7 @@ static void test_machine(const void *data)
>> ser_fd =3D g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL=
);
>> g_assert(ser_fd !=3D -1);
>> + close(ser_fd);
>> if (test->kernel) {
>> code =3D test->kernel;
>> @@ -266,6 +267,7 @@ static void test_machine(const void *data)
>> unlink(codetmp);
>> }
>> + ser_fd =3D open(serialtmp, O_RDONLY);
>> if (!check_guest_output(qts, test, ser_fd)) {
>> g_error("Failed to find expected string. Please check '%s'",
>> serialtmp);
>>
>
> Please send this fix as a new patch in the series.
>
>>
>> But I think it just workarounds the problem. The original test case
>> looks reasonable to me. If we update the case like above, we cannot
>> guarantee users will do like the updated test case does.
>
>
> If the test is enabled, it will fail, and the reasons are reasonably vali=
d: two processes shouldn't share the same file for writing with a chardev.
>
> I still think the windows file chardev behavior is superior and we should=
 instead teach the posix implementation of exclusive write access, rather t=
han downgrading the windows implementation. I'd drop this patch from the se=
ries for now.
>

Okay, will drop this patch, and add the test case fix as a new patch in v4.

Regards,
Bin

