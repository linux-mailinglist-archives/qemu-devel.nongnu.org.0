Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95619604846
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:53:34 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9Vk-0007Pf-AF
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol9P1-00025R-JM
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:46:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ol9Ox-0004LP-3g
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:46:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id b2so17300850plc.7
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FrUCmj2KY50tOH3mHL0EFGw4z3oNrTxu2acBiLZCYZo=;
 b=MsvzFsU5d0VqYUi28qovNkwEmdS2YhsFig2xAph1xkUebSlQ6otdxExrcvQUQX0+gK
 JfQL/DnC+NV5qMLGVOjUZ6qWhtnwEqUiELZNz79hIfu+aG3rArA16iRF0xbB8+fmItLY
 ZdWl4imPyatIGno1bpNwbcjxmPAdhU0x69e8UuTdAnxFxKpqdhYhzP2tmmtEIn2lY8TF
 b0AYuAl0vv0Bg7k6/qk1vuQJM78HsBx2LvNcn++pUSDaCbBR0363Bl1UsyFJeBaTupJ3
 3pT48NaizaZYPwXu2NLdi0tcZy7q96QhgJxIJxhZnIBzqn7aZPD7wMKPoeruChtICpzD
 HkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FrUCmj2KY50tOH3mHL0EFGw4z3oNrTxu2acBiLZCYZo=;
 b=RryatSBo9VhPEDSZ96UR2d4gGG0ghiNf0lyRpMS3XOxuE1N6C+IldPjcdxdMHJycfb
 rcHJHrvoy35BHtioSXX/rE/bFuEttoc6YsyKfryDNf84/sItfkuAIfjs0e4UoMxFykBy
 UXPsVvnKWXQSVaAPQWEqzQcrYsjJjJMv5CNJqoOLgzE0owmY2ffEwsIqHmmlndVaYFV2
 1CScBZ66pqd/+Hel41t/2KiyUWfMrMe+hPEUQ0gJRE1fFcAq8i+LZDAk+i1MdWz0HfVW
 rMhLwaP0DQJF3MjCxM62ZrwmeQryqg8FjsNamKMr0QJnC6Kd7749/IfMiAQL9Hot3e0w
 dpcQ==
X-Gm-Message-State: ACrzQf2unN6SQ7zvbTPnQ3fpa4nWBLUT8tuWWtU2WuTHe5kf1qFzJFVK
 yWSQJxNOsHV4IYHQSU11bNL5/w==
X-Google-Smtp-Source: AMsMyM6FcExU6LtFnTCTTpHHyMMSEihG6fl/iWdpWud8yn9Vkyu/yf0o4Olzp7g+pOnzpqKgZkjyeQ==
X-Received: by 2002:a17:902:ce09:b0:178:bb78:49a5 with SMTP id
 k9-20020a170902ce0900b00178bb7849a5mr8601650plg.100.1666187188892; 
 Wed, 19 Oct 2022 06:46:28 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020aa79985000000b0054223a0185asm11292310pfh.161.2022.10.19.06.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 06:46:28 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 19 Oct 2022 19:16:20 +0530 (IST)
To: Ani Sinha <ani@anisinha.ca>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
In-Reply-To: <CAARzgwxqVYmv7fNWVxjN8F=jXgDYSK4GSePTtrXSmR6Q55PPNA@mail.gmail.com>
Message-ID: <352e1482-6ae8-8052-bd17-d43191be2d0@anisinha.ca>
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-9-ani@anisinha.ca>
 <CAARzgwz6DwgfOcyq9fFitu7SKUfx6xz_WUiYj8pkP0wmeT=UZQ@mail.gmail.com>
 <CAARzgwyRwh-fYuUTNjOgoRzjf4UZbAVCxJvSGzf4b-2jmqq=cQ@mail.gmail.com>
 <297ffc66-9d0a-37c7-f700-cea17ecd5707@linaro.org>
 <CAARzgwxqVYmv7fNWVxjN8F=jXgDYSK4GSePTtrXSmR6Q55PPNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-859636309-1666187187=:741552"
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-859636309-1666187187=:741552
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 19 Oct 2022, Ani Sinha wrote:

> On Wed, Oct 19, 2022 at 3:05 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > >>> +    List,
> > >>> +    Optional,
> > >>> +    Sequence,
> > >>> +)
> > >>> +from qemu.machine import QEMUMachine
> > >>> +from avocado import skipIf
> > >>> +from avocado_qemu import QemuBaseTest
> >
> > >>> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> > >>> +class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
> > >>> +    """
> > >>> +    ACPI and SMBIOS tests using biosbits.
> > >
> > >   <snip>
> > >
> > >>> +
> > >>> +    def setUp(self): # pylint: disable=arguments-differ
> > >>> +        super().setUp('qemu-system-')
> > >>> +
> > >>> +        if shutil.which('xorriso') is None:
> > >>> +            logging.error('xorriso is required to run this test.')
> > >>> +            self.skipTest("xorriso is not installed. Please install it.")
> > >>
> > >> This would result in output like this when xorriso is not found:
> > >>
> > >> $ which xorriso
> > >> /usr/bin/which: no xorriso in
> > >> (/home/anisinha/.local/bin:/home/anisinha/bin:/usr/share/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
> > >> [anisinha@centos8 build]$ ./tests/venv/bin/avocado run -t acpi tests/avocado
> > >> Fetching asset from
> > >> tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
> > >> JOB ID     : 95aba043201755ed888ef7d1598402c555118df4
> > >> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-19T02.27-95aba04/job.log
> > >>   (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> > >> ERROR: xorriso is not installed. Please install it. (0.00 s)
> >
> > If an optional tool is missing, the test should be SKIPped, this is not
> > an ERROR.
>
> Yes will fix in v6.
>

These are the changes I have made in v6 in this test that are worth taking
into account when reviewing v5. I want to make v6 as close to the final
version as possible.

--- tests/avocado/acpi-bits.py	2022-10-19 19:11:21.506830448 +0530
+++ /home/anisinha/temp/acpi-bits.py.v6	2022-10-19 19:11:12.530782674 +0530
@@ -33,6 +33,7 @@

 import logging
 import os
+import platform
 import re
 import shutil
 import subprocess
@@ -49,12 +50,39 @@
 from avocado import skipIf
 from avocado_qemu import QemuBaseTest

+deps = ["xorriso"] # dependent tools needed in the test setup/box.
+supported_platforms = ['x86_64'] # supported test platforms.
+
 def _print_log(log):
     print('\nlogs from biosbits follows:')
     print('==========================================\n')
     print(log)
     print('==========================================\n')

+def which(tool):
+    """ looks up the full path for @tool, returns None if not found
+        or if @tool does not have executable permissions.
+    """
+    paths=os.getenv('PATH')
+    for p in paths.split(os.path.pathsep):
+        p = os.path.join(p, tool)
+        if os.path.exists(p) and os.access(p, os.X_OK):
+            return p
+    return None
+
+def missing_deps():
+    """ returns True if any of the test dependent tools are absent.
+    """
+    for dep in deps:
+        if which(dep) is None:
+            return True
+    return False
+
+def supported_platform():
+    """ checks if the test is running on a supported platform.
+    """
+    return platform.machine() in supported_platforms
+
 class QEMUBitsMachine(QEMUMachine): # pylint: disable=too-few-public-methods
     """
     A QEMU VM, with isa-debugcon enabled and bits iso passed
@@ -100,7 +128,9 @@
         """return the base argument to QEMU binary"""
         return self._base_args

-@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+@skipIf(not supported_platform() or missing_deps() or os.getenv('GITLAB_CI'),
+        'incorrect platform or dependencies (%s) not installed ' \
+        'or running on GitLab' % ','.join(deps))
 class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
     """
     ACPI and SMBIOS tests using biosbits.
@@ -247,10 +277,6 @@
     def setUp(self): # pylint: disable=arguments-differ
         super().setUp('qemu-system-')

-        if shutil.which('xorriso') is None:
-            logging.error('xorriso is required to run this test.')
-            self.skipTest("xorriso is not installed. Please install it.")
-
         self._baseDir = os.getenv('AVOCADO_TEST_BASEDIR')

         # workdir could also be avocado's own workdir in self.workdir.
--2088271309-859636309-1666187187=:741552--

