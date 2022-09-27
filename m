Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238475EC7B3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:29:47 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCWn-0008QI-Oa
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBr2-0001V9-Pt
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1odBcw-0000Y4-KR
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664289121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/U+KpeeveGhqTWFnVsCDmlmMMaJZ1kse3HxUZ6zzwI=;
 b=G7ymXST/gX13r3gqnTGLHpX4y4DZDVmsXlz2jztLcE0V5WFxUA+m1tM09FG3HMaMa8ms2q
 MiXJ465QcUpRAMXmF62f2ZfwCejkexB5IQYEo2UgGZ3cSR2qtHELP5yacW/SLq2X+XR22+
 EJMW0R8/eZrEvZ9ArxKtLfS+EBH3/0U=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-4-SYrMmJOhS56KNZlCJDjw-1; Tue, 27 Sep 2022 10:30:23 -0400
X-MC-Unique: 4-SYrMmJOhS56KNZlCJDjw-1
Received: by mail-oo1-f72.google.com with SMTP id
 f6-20020a4a9206000000b0044e001dc716so4193715ooh.20
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N/U+KpeeveGhqTWFnVsCDmlmMMaJZ1kse3HxUZ6zzwI=;
 b=ufNRtIJAwkcpGfGdKGCWrGblxUK7WNFqaJT5jFWUhJm7AezTwEz9wYfkiGIyzqI0on
 jvzxBd9tJChp+LWPrzIwzmiqB4wETGtOTH1LoR0/gv+1cnLO7C7lkzb+Dt4QCtGd5WV8
 o1LpDYBVuHAO4qPLeMgWRDcGgBECFwEYhGrniKfb31yLPDkvi2YrSXGOh3Ws8p9mzzKA
 XRhUJ5uMv/cWrtFumtgsp02jtUcR8oWX0sby3VKhweLAD8gU0xMYScA2VqVYV210wyL2
 XF6TYMRTl2U4GtjqIT4TG489thzvr51zSwztbKNgN1fkqVOvd+RgokE6KQS0JVBpxO8X
 J0Pw==
X-Gm-Message-State: ACrzQf0fdTAZBvX4PnK28E5Zo7YseBluXztcxn8ZJNaDxiBEuoCssb3p
 4o3sRplYneqxzwoPta/n/CZMEI21nJflV5oBMPxXRKwrDC/QBUIkmE2DBRYkL1zUoNMOgPV0pnZ
 bEdsIitJE93YMXlcqgjZLpXFKqRuRVZw=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr1367975oao.53.1664288983196; 
 Tue, 27 Sep 2022 07:29:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67t3YjY/B7Cie3jubrN3BBq+4+2se0oxo492Tlt0ERreWRpZHyrBpSDSssCgxe0vM2FPc4WLtdZKQEhIh+OWY=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr1367959oao.53.1664288983014; Tue, 27
 Sep 2022 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-40-bmeng.cn@gmail.com>
In-Reply-To: <20220927110632.1973965-40-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 18:29:31 +0400
Message-ID: <CAMxuvaysRz4pgRKwf=Gp70LZViAMbdPjFWAHkjiure22J4xG5A@mail.gmail.com>
Subject: Re: [PATCH v4 39/54] tests/qtest: boot-serial-test: Close the serial
 file before starting QEMU
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, Sep 27, 2022 at 3:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This qtest executable created a serial chardev file to be passed to
> the QEMU executable. The serial file was created by g_file_open_tmp(),
> which internally opens the file with FILE_SHARE_WRITE security attribute
> on Windows. Based on [1], there is only one case that allows the first
> call to CreateFile() with GENERIC_READ & FILE_SHARE_WRITE, and second
> call to CreateFile() with GENERIC_WRITE & FILE_SHARE_READ. All other
> combinations require FILE_SHARE_WRITE in the second call. But there is
> no way for the second call (in this case the QEMU executable) to know
> what combination was passed to the first call, unless FILE_SHARE_WRITE
> is passed to the second call.
>
> Two processes shouldn't share the same file for writing with a chardev.
> Let's close the serial file before starting QEMU.
>
> [1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-op=
ening-files
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>
> Changes in v4:
> - New patch: "tests/qtest: boot-serial-test: Close the serial file before=
 starting QEMU"
>
>  tests/qtest/boot-serial-test.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-tes=
t.c
> index 72310ba30e..b216519b62 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -233,6 +233,7 @@ static void test_machine(const void *data)
>
>      ser_fd =3D g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, =
NULL);
>      g_assert(ser_fd !=3D -1);
> +    close(ser_fd);
>
>      if (test->kernel) {
>          code =3D test->kernel;
> @@ -266,6 +267,8 @@ static void test_machine(const void *data)
>          unlink(codetmp);
>      }
>
> +    ser_fd =3D open(serialtmp, O_RDONLY);
> +    g_assert(ser_fd !=3D -1);
>      if (!check_guest_output(qts, test, ser_fd)) {
>          g_error("Failed to find expected string. Please check '%s'",
>                  serialtmp);
> --
> 2.34.1
>


