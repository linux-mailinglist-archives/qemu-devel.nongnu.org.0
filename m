Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D34420C5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:24:12 +0100 (CET)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcuh-0004zH-0B
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbd0-0008FA-4Q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:01:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbcw-0001Tr-2h
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635789704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksSclwanCZfaR0gMdqRD5SAuV2HJqaeQ0LJ3h7gB0lQ=;
 b=Pf7wsh8K9eusHCXbP0sGrb9VLkmluEGqEvUr3De1QWxLmK3dc3ywiMoNlLV+14I5vIvVMX
 PtMNtrZ9xQ4X54oz4ulqdw4iFCz4l44DlvDkT5ZJFhsllj1X+73eqv73/qzVzoIcg5RN1o
 J8PGnTVbcNXTYU76M+Uni5+FFyPs/Xo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Tx66IL1KNEaXbeCL1VnYuQ-1; Mon, 01 Nov 2021 14:01:42 -0400
X-MC-Unique: Tx66IL1KNEaXbeCL1VnYuQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 x13-20020a17090a1f8d00b001a285b9f2cbso9685903pja.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ksSclwanCZfaR0gMdqRD5SAuV2HJqaeQ0LJ3h7gB0lQ=;
 b=eWsKBDeFDbyH15K7dStpwhK2IfrZdgEQHKiPfJ84q2cQQRykDydfgOgbHw9UrMDAP6
 CpS3pp3am/bPdqXoYtukZYVPhh7GTOFZV9bVfIZ5j75QTbkqI4qwbMxV+tpgCNSSsHyz
 Sc8Ya1CSOSPhvvyeei/Y5gIiJFR3S0OnFMM9Dae/xntNTJxVsLUmXnSD7rSkbtm3vsM4
 JnR9gSpbLvWDMAJr3L9ADPEueZtNGE+eNqg3day4SYsngjdqeTJuPeLf2Qq07b8Wqyk/
 exwGTBybzSiEwHulw0KkrRjpDPzmeKuMHve7cAXraTKNv+Mvoog2J2ZZXCd3Ru1HHUkR
 DrSQ==
X-Gm-Message-State: AOAM533z+qHIiV2RmE0hyaVWGh3C3JD2smKRN1Zcb3oPDq4JtiqLPvXO
 AoyhXCQ2XvFZBDyCCwDZB+DAZ7kUy5h9dYLpXdocvpVOGclp16q9Cki5P/CElH0UNksDGnvAt9N
 i3u6KyOqWtfjZFZZ59mSD0TLGu5IqIX0=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr478611pju.123.1635789701533; 
 Mon, 01 Nov 2021 11:01:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ2XZgTAA8UzB5ZRQCyFuMsC/yyilKYe6MGdnf1YhoTmIAqns3TQbeJ15+B3LaeGHwU0KnfsZaDsNfetHnlUg=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr478556pju.123.1635789701154; 
 Mon, 01 Nov 2021 11:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-2-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 15:01:15 -0300
Message-ID: <CAKJDGDZ0S1f26T3J6ajJ++5cGBNCQveisVvqf2WhXCy8EPsnCA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] tests/acceptance: Extract QemuBaseTest from Test
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

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The Avocado Test::fetch_asset() is handy to download artifacts
> before running tests. The current class is named Test but only
> tests system emulation. As we want to test user emulation,
> refactor the common code as QemuBaseTest.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 72 +++++++++++++----------
>  1 file changed, 41 insertions(+), 31 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 2c4fef3e149..8fcbed74849 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -175,7 +175,7 @@ def exec_command_and_wait_for_pattern(test, command,
>      """
>      _console_interaction(test, success_message, failure_message, command=
 + '\r')
>
> -class Test(avocado.Test):
> +class QemuBaseTest(avocado.Test):
>      def _get_unique_tag_val(self, tag_name):
>          """
>          Gets a tag value, if unique for a key
> @@ -185,6 +185,46 @@ def _get_unique_tag_val(self, tag_name):
>              return vals.pop()
>          return None
>
> +    def setUp(self):
> +        self.arch =3D self.params.get('arch',
> +                                    default=3Dself._get_unique_tag_val('=
arch'))
> +
> +        self.cpu =3D self.params.get('cpu',
> +                                   default=3Dself._get_unique_tag_val('c=
pu'))
> +
> +        default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
> +        self.qemu_bin =3D self.params.get('qemu_bin',
> +                                        default=3Ddefault_qemu_bin)
> +        if self.qemu_bin is None:
> +            self.cancel("No QEMU binary defined or found in the build tr=
ee")
> +
> +    def fetch_asset(self, name,
> +                    asset_hash=3DNone, algorithm=3DNone,
> +                    locations=3DNone, expire=3DNone,
> +                    find_only=3DFalse, cancel_on_missing=3DTrue):
> +        return super(QemuBaseTest, self).fetch_asset(name,

It is preferable to use the PEP3135
(https://www.python.org/dev/peps/pep-3135/) when calling `super` as
linter are complaining about it:

return super().fetch_asset(name,

And after reading through the patch I noticed it was a method move,
so, feel free to take the suggestion or ignore it for now.

> +                        asset_hash=3Dasset_hash,
> +                        algorithm=3Dalgorithm,
> +                        locations=3Dlocations,
> +                        expire=3Dexpire,
> +                        find_only=3Dfind_only,
> +                        cancel_on_missing=3Dcancel_on_missing)
> +
> +
> +class Test(QemuBaseTest):
> +    """Facilitates system emulation tests.
> +
> +    TODO: Rename this class as `QemuSystemTest`.
> +    """
> +
> +    def setUp(self):
> +        self._vms =3D {}
> +
> +        super(Test, self).setUp()

Same from previous comment:

super().setUp()

> +
> +        self.machine =3D self.params.get('machine',
> +                                       default=3Dself._get_unique_tag_va=
l('machine'))
> +
>      def require_accelerator(self, accelerator):
>          """
>          Requires an accelerator to be available for the test to continue
> @@ -207,24 +247,6 @@ def require_accelerator(self, accelerator):
>              self.cancel("%s accelerator does not seem to be "
>                          "available" % accelerator)
>
> -    def setUp(self):
> -        self._vms =3D {}
> -
> -        self.arch =3D self.params.get('arch',
> -                                    default=3Dself._get_unique_tag_val('=
arch'))
> -
> -        self.cpu =3D self.params.get('cpu',
> -                                   default=3Dself._get_unique_tag_val('c=
pu'))
> -
> -        self.machine =3D self.params.get('machine',
> -                                       default=3Dself._get_unique_tag_va=
l('machine'))
> -
> -        default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
> -        self.qemu_bin =3D self.params.get('qemu_bin',
> -                                        default=3Ddefault_qemu_bin)
> -        if self.qemu_bin is None:
> -            self.cancel("No QEMU binary defined or found in the build tr=
ee")
> -
>      def _new_vm(self, name, *args):
>          self._sd =3D tempfile.TemporaryDirectory(prefix=3D"avo_qemu_sock=
_")
>          vm =3D QEMUMachine(self.qemu_bin, base_temp_dir=3Dself.workdir,
> @@ -277,18 +299,6 @@ def tearDown(self):
>              vm.shutdown()
>          self._sd =3D None
>
> -    def fetch_asset(self, name,
> -                    asset_hash=3DNone, algorithm=3DNone,
> -                    locations=3DNone, expire=3DNone,
> -                    find_only=3DFalse, cancel_on_missing=3DTrue):
> -        return super(Test, self).fetch_asset(name,
> -                        asset_hash=3Dasset_hash,
> -                        algorithm=3Dalgorithm,
> -                        locations=3Dlocations,
> -                        expire=3Dexpire,
> -                        find_only=3Dfind_only,
> -                        cancel_on_missing=3Dcancel_on_missing)
> -
>
>  class LinuxSSHMixIn:
>      """Contains utility methods for interacting with a guest via SSH."""
> --
> 2.31.1
>

Except for one (or two, if you consider the first) small comment,
looks good to me, so

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


