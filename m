Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9979318812
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:27:19 +0100 (CET)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Bu-0005u5-PA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA98y-0004B3-K7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:24:16 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lA98x-0001wG-0H
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:24:16 -0500
Received: by mail-ej1-x634.google.com with SMTP id jj19so9261884ejc.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zgVJbafETI8M0mwVWjTQwhHvGsMiKFAlwK3SjjwR+kA=;
 b=J7eex5fWg+qmdd14Ow2l1dofXF8+y8yV+g/m5+IfeeHnK/eIt/W08UspKBJFLRC/fM
 kEhcdg3tHyeLijdSpjdJ2UwagFx+WjFbmB2DokdGwXi7fVJDAflsKa3rX1oY3qjywDFo
 4NVfTiYwYZi5IeoSv1aCE6XtPP8wih/w2GmyXosdI1/qTo7O9r+pFp3ir+3YjGhU9SQE
 zpjbM/YnzZ7lBcQOHYk4ER6cWyWxrNQltwm+ZZd/Zw3vMv8a6yeeMCu6RYgUt56mMBPa
 McutHXUiyryiM+1zSRi4daBUwXiRnyrDPCeAcqpQ4wWAO4xsbBPb4abKimP3LxNJHRzZ
 CUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zgVJbafETI8M0mwVWjTQwhHvGsMiKFAlwK3SjjwR+kA=;
 b=NYVdeztD8IsMbR2idxagNd7HLlSKMRqI3/naK3XdO5lULyLJEsRT4xf/e55lJC1f/J
 XmzR4slIinDWmZ2aA6xww+gmDlsVYDUINgzW/EX7LNR/OAAvpY6ymXWVvcmDXF2KsPOc
 +tgiXwKU8vjFNrTvzVPb+5OoQuk2zM6/w0BaW7BeCtWtL6pHFOa9RcNdvewoxgzOHEkO
 9dQHm698g4d0C7TJaLrO65aJAsTyOMsmgFomoR8EVyOGHH6FQxupUzfpXg3FdVaysiFH
 kRL27PBxaRPkxmCNztn6v6zgpClR9OE4QLxUEXoms9Lvsta/8nt+xbiRJ0GFWqL0XMRh
 adZA==
X-Gm-Message-State: AOAM531hWC0pgept+qf+1mCad+j9L3DuAJkNgQuROxehc1YP4LhkfDWp
 S+zQfLmJD3VCkYjNIQLOqNihJmAYPLdUlrwEn/k=
X-Google-Smtp-Source: ABdhPJxOptXquwWQn1wV2LkgPGIG1wEDfNKY0YegSqb3dirBFrWXbl7y6hiHiiD4cHQT1W9CilqW5h/q4UfOKYZ4O/Q=
X-Received: by 2002:a17:906:2bc2:: with SMTP id
 n2mr7623516ejg.381.1613039052659; 
 Thu, 11 Feb 2021 02:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-21-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-21-crosa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Feb 2021 14:24:00 +0400
Message-ID: <CAJ+F1CKJdcqzNz2Dqy3DqUFNKG5hUXiu4oSQ2U_uPBaxhuPEaw@mail.gmail.com>
Subject: Re: [PATCH 20/22] Acceptance Tests: add basic documentation on
 LinuxTest base class
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 9:47 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  docs/devel/testing.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 209f9d8172..fe0112b21c 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -790,6 +790,32 @@ and hypothetical example follows:
>  At test "tear down", ``avocado_qemu.Test`` handles all the QEMUMachines
>  shutdown.
>
> +The ``avocado_qemu.LinuxTest`` base test class
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The ``avocado_qemu.LinuxTest`` is further specialization of the
> +``avocado_qemu.Test`` class, so it contains all the characteristics of
> +the later plus some extra features.
> +
> +First of all, this base class is intended for tests that need to
> +interact with a fully booted and operational Linux guest.  The most
> +basic example looks like this:
> +
> +.. code::
> +
> +  from avocado_qemu import LinuxTest
> +
> +
> +  class SomeTest(LinuxTest):
> +
> +      def test(self):
> +          self.launch_and_wait()
> +          self.ssh_connect('root', self.ssh_key)
> +          self.ssh_command('some_command_to_be_run_in_the_guest')
> +
> +Please refer to tests that use ``avocado_qemu.LinuxTest`` under
> +``tests/acceptance`` for more examples.
> +
>  QEMUMachine
>  ~~~~~~~~~~~
>
> --
> 2.25.4
>
>


--=20
Marc-Andr=C3=A9 Lureau

