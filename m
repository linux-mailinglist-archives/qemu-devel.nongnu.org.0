Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D14421AA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:29:24 +0100 (CET)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdvm-0006Ai-Mq
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcQd-00031y-U8
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcQc-0001HU-2P
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tEi3aBNy//N4HYvlfbsqMsJ0BuAM3mn9Kp1CJ9GpnM=;
 b=hlSt2EdpjD4oM8bY22BXy2u4cEsgyA5q+X6RpRuET9qiS+I5CjZ+i5hW2cAxOUb30QWCbR
 5eKTho9hEKJIqRTGkVz0xgkys5jUIU0t3HLhpIo9el0eM7ivGpD5/ZwTaF+JQwa9l5jLNr
 l6AYhHEGLD7JpNhd7BGP84XFmrgTFIE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-C-2UZG_WMf2Fh_wp383DfA-1; Mon, 01 Nov 2021 14:53:04 -0400
X-MC-Unique: C-2UZG_WMf2Fh_wp383DfA-1
Received: by mail-pg1-f198.google.com with SMTP id
 z7-20020a63c047000000b0026b13e40309so9729593pgi.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0tEi3aBNy//N4HYvlfbsqMsJ0BuAM3mn9Kp1CJ9GpnM=;
 b=wWuoa2IKd7o10CjRM3pemIsXIMLXJpCedzm0mOj5cdcvFHtUHG8Ekm7ql82l6x2BJ0
 duMhK5wvNtznaYo1oV6mUe5GnT6XcARZbxQcJWwMRX2h9CrmoBKqjXqIHg/sqKsDEwBo
 B5Q5E9V5nj4RyTQ5fy20LrnxW4tBo7Y+ZHAonQ+epeA6g+gFlw7hdi4/yvQ+F/gtMcbd
 jLoqSBrfVTbH4Ekfov4v6cYbrb0n991zmih56qFFB7JtIba2CNrhYI0xPdXS7pAcjwOb
 W4q3L/9CaEPQeRdlq4Vg7H3PP/H+RPfQcLVPVNQRdKahyqhdS9eV8IJvqFn5BHh4eJ9d
 alyw==
X-Gm-Message-State: AOAM531fDy0or4W4s2ptZvicFxYm/QNT2ZwdwbxaCsZdrdHBD1TZ+tSD
 dg1AGBgMw1FEZFoTjr+QcrPEX7RQLLv38fWiPohjPd4N3sm5ZZcc6/0d3/taCLeVB+ojsfl8pI1
 8f+OMAq4aosnekiODxOJmV+zFhrnRNsY=
X-Received: by 2002:a62:8817:0:b0:481:7fe:c736 with SMTP id
 l23-20020a628817000000b0048107fec736mr9752157pfd.42.1635792783136; 
 Mon, 01 Nov 2021 11:53:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIXOwngdJ5dj6GcAzh11mYf4JWeOcOPBqxwsxN1une+yEKUGOxn1jmGIfiBuvC8pUf9CMSxoUNV0xMoz8YYxg=
X-Received: by 2002:a62:8817:0:b0:481:7fe:c736 with SMTP id
 l23-20020a628817000000b0048107fec736mr9752130pfd.42.1635792782878; Mon, 01
 Nov 2021 11:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-3-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-3-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 15:52:36 -0300
Message-ID: <CAKJDGDbmMCugZQNmnpsTJ=+w0JF9MZVEiuzs__FvnjaauNQP_g@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] tests/acceptance: Make pick_default_qemu_bin()
 more generic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Make pick_default_qemu_bin() generic to find qemu-system or
> qemu-user binaries.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 8fcbed74849..2b9b5dd27fe 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -52,7 +52,7 @@ def is_readable_executable_file(path):
>      return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>
>
> -def pick_default_qemu_bin(arch=3DNone):
> +def pick_default_qemu_bin(bin_prefix=3D'qemu-system-', arch=3DNone):
>      """
>      Picks the path of a QEMU binary, starting either in the current work=
ing
>      directory or in the source tree root directory.
> @@ -71,7 +71,7 @@ def pick_default_qemu_bin(arch=3DNone):
>      # qemu binary path does not match arch for powerpc, handle it
>      if 'ppc64le' in arch:
>          arch =3D 'ppc64'
> -    qemu_bin_relative_path =3D "./qemu-system-%s" % arch
> +    qemu_bin_relative_path =3D os.path.join(".", bin_prefix + arch)
>      if is_readable_executable_file(qemu_bin_relative_path):
>          return qemu_bin_relative_path
>
> @@ -185,14 +185,14 @@ def _get_unique_tag_val(self, tag_name):
>              return vals.pop()
>          return None
>
> -    def setUp(self):
> +    def setUp(self, bin_prefix):
>          self.arch =3D self.params.get('arch',
>                                      default=3Dself._get_unique_tag_val('=
arch'))
>
>          self.cpu =3D self.params.get('cpu',
>                                     default=3Dself._get_unique_tag_val('c=
pu'))
>
> -        default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
> +        default_qemu_bin =3D pick_default_qemu_bin(bin_prefix, arch=3Dse=
lf.arch)
>          self.qemu_bin =3D self.params.get('qemu_bin',
>                                          default=3Ddefault_qemu_bin)
>          if self.qemu_bin is None:
> @@ -220,7 +220,7 @@ class Test(QemuBaseTest):
>      def setUp(self):
>          self._vms =3D {}
>
> -        super(Test, self).setUp()
> +        super(Test, self).setUp('qemu-system-')

If you need to change something else in this patch, consider using PEP3135:

super().setUp('qemu-system-')

Anyway,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>
>          self.machine =3D self.params.get('machine',
>                                         default=3Dself._get_unique_tag_va=
l('machine'))
> --
> 2.31.1
>


