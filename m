Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F644213D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:01:05 +0100 (CET)
Received: from localhost ([::1]:41564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdUO-0002q8-Ix
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcjA-0000fn-Cy
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcj7-00073F-B5
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635793932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9WkKzGBhUfHJBsn8eoz69jlkrm1w9B2P/vzjoQrRQY=;
 b=acUWoz/lJbu7j18yCTQUODxGhO6t0lvK9oOhaIQCKAYFE+W6o8r/P75OexyoAinKXkisO+
 0oIjKYrzrpx/4DgxpPS9ZvmXH5RhA74sPCQsUfPdF/5uyN+53sQJX/AZaodVibR/YQzcra
 BCTAzuz5nzKwuNtJK/9CIo6py+T69UI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-ksgjj431PCSasxhHTqAyxw-1; Mon, 01 Nov 2021 15:12:09 -0400
X-MC-Unique: ksgjj431PCSasxhHTqAyxw-1
Received: by mail-pf1-f197.google.com with SMTP id
 m26-20020a62a21a000000b0041361973ba7so9817438pff.15
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 12:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i9WkKzGBhUfHJBsn8eoz69jlkrm1w9B2P/vzjoQrRQY=;
 b=7FVBd5WLBkGVXlDsW3yyi7oLPKOaXvBfylcLsyPMnk15dIKoAk2AKB7/B8NsCjX8rJ
 fN/sPH2g9Kqx4FB2zEfJvA5QJsGaSr7O3Qg6MogbJ+2rRABHtwB9l5ypLOHHgOuqCs+Y
 gBG0yTCcuWnQdds1WYH3LyUtRpLGyrzkGNwyijeo9M/NRFqRM/Y6Yx2wOGaKrklU3QzK
 Dpc1oqi+4COjQMRhPVjJuYykXJBUSC1bz2tqAiohOxhJQ17r6Alr7dpRU85B6ogQctZ6
 Xu85tHDQZZmVMIqRFdc7bEfxy5y+CdNv5HDu2nX9hNg6ro4yQ03BGVo2ChrLbmPY+yly
 0hiw==
X-Gm-Message-State: AOAM533Q+f3FXw5fGspY9xPgyj5w3QcwQEMGH3q0QJRYb/9Oxwfb5V1a
 P/5Nf0IucazEOp9HqUZktq3I4HTWRwo0Fx/BQFggJodeeWx70HAC/XxULODwIaIVm7ix6HPBBUg
 PA7chs53fkx+fGa3ur56YB7G1Q0uQBzc=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr968162pjb.10.1635793928208; 
 Mon, 01 Nov 2021 12:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMGRh1hAnX0PaU7S9QAAxr7nB3PR8qJCz9Ejc7aQTsykTrc01SBkXi1z4FrJg/u7IIqnfkerHikTsiO4vd1Ew=
X-Received: by 2002:a17:90b:615:: with SMTP id
 gb21mr968130pjb.10.1635793927987; 
 Mon, 01 Nov 2021 12:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-7-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-7-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 16:11:42 -0300
Message-ID: <CAKJDGDaXZ-rT-MECCVBH5H7_=fj9tjA1Z_R-iGGgHZR-iFN4nA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] tests/acceptance: Rename avocado_qemu.Test ->
 QemuSystemTest
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Warner Losh <imp@bsdimp.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 1:32 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To run user-mode emulation tests, we introduced the
> avocado_qemu.QemuUserTest which inherits from avocado_qemu.QemuBaseTest.
> System-mode emulation tests are based on the avocado_qemu.Test class,
> which also inherits avocado_qemu.QemuBaseTest. To avoid confusion,
> rename it as avocado_qemu.QemuSystemTest.
>
> Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py    | 21 +++++++++-----------
>  tests/acceptance/boot_linux_console.py       |  4 ++--
>  tests/acceptance/cpu_queries.py              |  4 ++--
>  tests/acceptance/empty_cpu_model.py          |  4 ++--
>  tests/acceptance/info_usernet.py             |  4 ++--
>  tests/acceptance/linux_initrd.py             |  4 ++--
>  tests/acceptance/linux_ssh_mips_malta.py     |  5 +++--
>  tests/acceptance/machine_arm_canona1100.py   |  4 ++--
>  tests/acceptance/machine_arm_integratorcp.py |  4 ++--
>  tests/acceptance/machine_arm_n8x0.py         |  4 ++--
>  tests/acceptance/machine_avr6.py             |  4 ++--
>  tests/acceptance/machine_m68k_nextcube.py    |  4 ++--
>  tests/acceptance/machine_microblaze.py       |  4 ++--
>  tests/acceptance/machine_mips_fuloong2e.py   |  4 ++--
>  tests/acceptance/machine_mips_loongson3v.py  |  4 ++--
>  tests/acceptance/machine_mips_malta.py       |  4 ++--
>  tests/acceptance/machine_ppc.py              |  4 ++--
>  tests/acceptance/machine_rx_gdbsim.py        |  4 ++--
>  tests/acceptance/machine_s390_ccw_virtio.py  |  4 ++--
>  tests/acceptance/machine_sparc_leon3.py      |  4 ++--
>  tests/acceptance/migration.py                |  4 ++--
>  tests/acceptance/multiprocess.py             |  4 ++--
>  tests/acceptance/pc_cpu_hotplug_props.py     |  4 ++--
>  tests/acceptance/ppc_prep_40p.py             |  4 ++--
>  tests/acceptance/version.py                  |  4 ++--
>  tests/acceptance/virtio-gpu.py               |  4 ++--
>  tests/acceptance/virtio_check_params.py      |  4 ++--
>  tests/acceptance/virtio_version.py           |  4 ++--
>  tests/acceptance/vnc.py                      |  4 ++--
>  tests/acceptance/x86_cpu_model_versions.py   |  4 ++--
>  30 files changed, 68 insertions(+), 70 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index a497a24f823..1abec2abaca 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -183,7 +183,7 @@ def interrupt_interactive_console_until_pattern(test,=
 success_message,
>
>      :param test: an Avocado test containing a VM that will have its cons=
ole
>                   read and probed for a success or failure message
> -    :type test: :class:`avocado_qemu.Test`
> +    :type test: :class:`avocado_qemu.QemuSystemTest`
>      :param success_message: if this message appears, test succeeds
>      :param failure_message: if this message appears, test fails
>      :param interrupt_string: a string to send to the console before tryi=
ng
> @@ -199,7 +199,7 @@ def wait_for_console_pattern(test, success_message, f=
ailure_message=3DNone,
>
>      :param test: an Avocado test containing a VM that will have its cons=
ole
>                   read and probed for a success or failure message
> -    :type test: :class:`avocado_qemu.Test`
> +    :type test: :class:`avocado_qemu.QemuSystemTest`
>      :param success_message: if this message appears, test succeeds
>      :param failure_message: if this message appears, test fails
>      """
> @@ -211,7 +211,7 @@ def exec_command(test, command):
>      the content.
>
>      :param test: an Avocado test containing a VM.
> -    :type test: :class:`avocado_qemu.Test`
> +    :type test: :class:`avocado_qemu.QemuSystemTest`
>      :param command: the command to send
>      :type command: str
>      """
> @@ -226,7 +226,7 @@ def exec_command_and_wait_for_pattern(test, command,
>
>      :param test: an Avocado test containing a VM that will have its cons=
ole
>                   read and probed for a success or failure message
> -    :type test: :class:`avocado_qemu.Test`
> +    :type test: :class:`avocado_qemu.QemuSystemTest`
>      :param command: the command to send
>      :param success_message: if this message appears, test succeeds
>      :param failure_message: if this message appears, test fails
> @@ -269,16 +269,13 @@ def fetch_asset(self, name,
>                          cancel_on_missing=3Dcancel_on_missing)
>
>
> -class Test(QemuBaseTest):
> -    """Facilitates system emulation tests.
> -
> -    TODO: Rename this class as `QemuSystemTest`.
> -    """
> +class QemuSystemTest(QemuBaseTest):
> +    """Facilitates system emulation tests."""
>
>      def setUp(self):
>          self._vms =3D {}
>
> -        super(Test, self).setUp('qemu-system-')
> +        super(QemuSystemTest, self).setUp('qemu-system-')

If you take my suggestion in one of the previous patches, you don't
need this change here.

>
>          self.machine =3D self.params.get('machine',
>                                         default=3Dself._get_unique_tag_va=
l('machine'))
> @@ -515,11 +512,11 @@ def default_kernel_params(self):
>          return self._info.get('kernel_params', None)
>
>
> -class LinuxTest(Test, LinuxSSHMixIn):
> +class LinuxTest(QemuSystemTest, LinuxSSHMixIn):
>      """Facilitates having a cloud-image Linux based available.
>
>      For tests that indend to interact with guests, this is a better choi=
ce

If you touch this patch again, please, s/indend/intend/

So far, looks good to me

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


