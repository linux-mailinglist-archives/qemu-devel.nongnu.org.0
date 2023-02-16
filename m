Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B7699A18
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:34:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShBq-0006UD-FI; Thu, 16 Feb 2023 11:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShBo-0006Tt-3P
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:32:56 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShBk-00033d-Do
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:32:54 -0500
Received: by mail-pf1-x434.google.com with SMTP id bw10so1865007pfb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/i1UovRLqcCkRr++ZAhGKLpndFwUNCMyBEn75c/NSUQ=;
 b=rSo8u+FYSnAuG63ykZ0LIQhDp4uqOzgDw4n/pLuwD8lGJe8H7rKT/cDcU0lIptbSfz
 1xgqJKknXD4i3wXC3E3KkVM1RQ82I4mpYmjZvFGVk69xMWo0pBW+IhmKYs9UFdlOFldg
 VvZs18wFi5Lmaj29MYfm8L54cypq7zCAfDGQnypbp8QuVDS5zPSJ3k3tnAthXhqiTre3
 yuTYzeSqthjXBrJ1+diAfPy7atbMep/hqcC/b6fN052k1FQqmGKyid5xEkk6aXZBxzvj
 jp5s4zeqh2kJs2fePMXd5EvXdvY5zzBjrk9LAuWzRUri2XBUlfDP3wT0jUKJ5r+SCdPm
 lzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/i1UovRLqcCkRr++ZAhGKLpndFwUNCMyBEn75c/NSUQ=;
 b=xHh0xKH6UuP/M5ZJrdLz72X70w9tDvA4eT/XUvJ1QmsoM6H57LsloBS8rQey2wTrlc
 WDcMaQVcbPk3Xgo57XZjRORlQifdr01wOsBt5RK1zg01pdJ3MTcMNWm4VlEGNwWCljo4
 M+NkAQU0XU2DwafUmM4Ko8Ki0GDvIpKKl2XWdP+Yr1AlFwXGDRJQ/l16I0sqHVCI2Rrh
 qbE6Byo8DhFuTyu/y6/kiaOw5G+KZAlowq67PZqzk6ShS0bd3EyVHAnjm7vHxx/WZRJk
 JUc/bbaX9v8sLpXY6AxYIQoYdO+rZPnyrEAKqpMa7ztQvSzs8Nettec0/JDUv6gNRuqq
 4KkA==
X-Gm-Message-State: AO0yUKV/A7a5Ti5LqPcVoRXOPYTcxceE5JRUu0TPUZqKnDMacUAzbe5d
 cZycMCggTylKSp3wea4Lb3Tf+bTn6suKeLprfUTPjQ==
X-Google-Smtp-Source: AK7set/DcxxHfSadQwC9zOLGVbY8SwuTKaL67kn4967mHmm+4U06EIOQnJe6cHMp5lslqexPOoacdbwEM49XopQ5JI4=
X-Received: by 2002:a63:360c:0:b0:4f9:cd40:f59a with SMTP id
 d12-20020a63360c000000b004f9cd40f59amr788752pga.21.1676565170979; Thu, 16 Feb
 2023 08:32:50 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
 <20230213202927.28992-26-farosas@suse.de>
In-Reply-To: <20230213202927.28992-26-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:32:39 +0000
Message-ID: <CAFEAcA-sSjjhrSkwD+b8RX_YyXcbmnob7caTot5Ym=v5TntELw@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 25/28] target/avocado: Pass parameters to
 migration test on aarch64
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Feb 2023 at 20:33, Fabiano Rosas <farosas@suse.de> wrote:
>
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line. Most other architectures define a default value in QEMU for
> these options, but arm does not.
>
> Add these options to the test class in case the test is being executed
> in an aarch64 host.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/avocado/migration.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 4b25680c50..ffd3db0f35 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -11,6 +11,8 @@
>
>
>  import tempfile
> +import os
> +
>  from avocado_qemu import QemuSystemTest
>  from avocado import skipUnless
>
> @@ -26,6 +28,14 @@ class Migration(QemuSystemTest):
>
>      timeout =3D 10
>
> +    def setUp(self):
> +        super().setUp()
> +
> +        arch =3D os.uname()[4]
> +        if arch =3D=3D 'aarch64':
> +            self.machine =3D 'virt'
> +            self.cpu =3D 'max'
> +
>      @staticmethod
>      def migration_finished(vm):
>          return vm.command('query-migrate')['status'] in ('completed', 'f=
ailed')
> --

This looks odd. Don't we run this test in our CI currently?
I'm not sure that specialcasing aarch64 here is the right
approach -- David, any opinions?

thanks
-- PMM

