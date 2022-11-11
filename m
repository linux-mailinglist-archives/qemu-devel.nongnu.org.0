Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E02625261
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZ4-0000Rf-2W; Thu, 10 Nov 2022 23:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otLYz-0000Jh-4e
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:22:45 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1otLYx-0001VS-2s
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:22:44 -0500
Received: by mail-io1-xd2a.google.com with SMTP id p184so2845092iof.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 20:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m425/v1PDzAj8vG9kNvFrl4H4YH1z9KtFZNU6KFaCxE=;
 b=ckwh6FcXPNm3cesyxfC301sP4wPlb8I7MwcU/RBR+lrn5ei0Zq7HVdVcAE4roFPlVx
 bu2QozRCxReM6Zm2IPcvzwjgPu3Bp4hSdFbFgRdXJl5OysV5o5XCK3R3yyEekYZrdRIC
 mTTaQnlux6pwYF/SY6znEV9GkliLEx/O2U8fyFGm7NG3oqacZwgUuvVlAq7yrPCMmsBh
 aZvEMbqlgL9ANxnCrvssOwGMxH6+yEMW/86lwrxsYYm4656Lkn1t+GuubWEAwGvZx3mO
 fG7QT8WSoD/BDl21DfYDHY0mKLPD4jN2hBo+ZOdis7sn584RuiBMyTjznSQj6jYuGJiM
 +aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m425/v1PDzAj8vG9kNvFrl4H4YH1z9KtFZNU6KFaCxE=;
 b=XxcWe/0Ng3SOBw23PFUSBGiWb7Ar2ho9M2s5u6xoz5oczsucFu2hRiZFnyCBtR84fi
 NKLzwZYTfAbBBSNuoz37bizDEjlXMw1H8UVZbb1hJ+34z31EEaVuJqKA5aql60qeKOnC
 S0xfyamOcnptOQ3bFFu1yCmmHExZ9CfJJI9f8mNne8NQG/LHC8/WMZsVWlIaVrpLeYyq
 1foAA0TNG4/Yy6dTkF+S4vCzvxy2JVhOQMzXiBFnHkxtwodLJZnfHRaZzDekVmPDbskc
 54ay2dOWQwj+Z/zfL0VxVnWvvQn3qVceht5hFJ0wx4hol9uehRpH03qlRERP9sc0/1gz
 Fo8g==
X-Gm-Message-State: ACrzQf0lERjtN8hr/rAiHPGYCBTHr7ibISCi5tKwshvlWxmH5GgS9sqg
 hG+l/dZv7YEUQVaz4CPA3e6CvstslU0iOEywOqiZ3w==
X-Google-Smtp-Source: AMsMyM6iwp0zgDMxWFsMGdjT9jK9QtzT/2MTbqpUB8ll4UFfjwxVXKzym8LdgLtB6OlfdkCckfKV11rODjmero/fhcI=
X-Received: by 2002:a05:6638:3d05:b0:363:a437:e54b with SMTP id
 cl5-20020a0566383d0500b00363a437e54bmr4385671jab.261.1668140560673; Thu, 10
 Nov 2022 20:22:40 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
In-Reply-To: <CAFn=p-YFQdO+ZfAYVw+T1b16kA2jBVZB7Tpy7J68XYbqgT7UZw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Nov 2022 09:52:29 +0530
Message-ID: <CAARzgwyzQ-k5Ek-kpFfvLdgD=TLe2EsW6XcBKJqNvUNYN5Qq=g@mail.gmail.com>
Subject: Re: biosbits test failing on origin/master
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 10, 2022 at 11:37 PM John Snow <jsnow@redhat.com> wrote:
>
> Hiya, on today's origin/master
> (2ccad61746ca7de5dd3e25146062264387e43bd4) I'm finding that "make
> check-avocado" is failing on the new biosbits test on my local
> development machine:
>
>  (001/193) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
> FAIL: True is not false : The VM seems to have failed to shutdown in
> time (83.65 s)
>
> Is this a known issue, or should I begin to investigate it?

In my test environment it does pass.

$ ./tests/venv/bin/avocado run -t acpi tests/avocado
Fetching asset from
tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : 35726df7d3c2e0f41847822620c78195ba45b9b9
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-11-11T09.42-35726df/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
PASS (57.57 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
| CANCEL 0
JOB TIME   : 63.82 s

However, I have seen that on certain slower test machines or when run
within a virtual machine, the test can take longer to complete and 60
secs may not always be enough. In those cases raising the maximum
completion time to 90 secs helps. Perhaps you can try this and let me
know if it helps:

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..b11fe39350 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
         self._vm.launch()
         # biosbits has been configured to run all the specified test suites
         # in batch mode and then automatically initiate a vm shutdown.
-        # sleep for maximum of one minute
-        max_sleep_time = time.monotonic() + 60
+        # sleep for a maximum of one and half minutes to accommodate
running this
+        # even on slower machines.
+        max_sleep_time = time.monotonic() + 90
         while self._vm.is_running() and time.monotonic() < max_sleep_time:
             time.sleep(1)

