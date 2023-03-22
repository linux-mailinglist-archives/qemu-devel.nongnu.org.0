Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D06C5757
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf4ul-0000Gq-3C; Wed, 22 Mar 2023 16:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf4ui-0000GW-IN
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 16:18:28 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pf4uf-0000qU-9J
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 16:18:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w9so77944245edc.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 13:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679516303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JoBiej859d4DiS3m06w+/2B9fVHy2uI2QiEp1GZnKM=;
 b=cEsAR9UTSzsudxGSrcPF97lX1z0dfO+lYTf4oPRxqIgWW8HY4hhXrLncPji64VobE8
 nGcGEHmbozN44xgMDWeCkmmwq4Ozti4qLalNgGzRECJmEndt5lExPQlVJsPNB2PFlSf8
 kOQNUSIbAbuDWho6yvC3jJKi8z+/Wk6nq+HOl83Mc3rYQ3ujW/Uzv32Q8ctP9IyjuyKf
 oEj7u+2cBBuYpgQH81YWHglVAcC0/G1ctZdFOREN+c/dtiHxQFuOFhxcp+pklMZlPBz3
 IFx8FtlQOGNy1UZlGn2NCrGRW+UtjO0BPOjm4W2Tdh72TvTaTxB3ehxhmyUrgp86v59B
 DZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679516303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JoBiej859d4DiS3m06w+/2B9fVHy2uI2QiEp1GZnKM=;
 b=DFv1mq3yd5kDnTLl+ZE8lgchFKupISqWAgiWBneKM1ZAjumt1HtlUEIPcItygq9yfo
 uU8iYW+jJehnDeyv4vromiT1z4YlNaQvhX813m1YV+XSKv+W2NUiy9o70jj7pRnsmMX5
 3/RLhZGGb7VDCyRHheRBP8V/92zSrvhqfIGynH1tspHrnooO1wJy1mFIy0hWmm86Z93G
 jonFKjhQ1UqoUO1retTGGwmjKEPPDbr/Z7in+9bb1+C3NzXQprESSO92iqHmabDZ3+cy
 /3I1A5en2zshSPYDjD6JwIkwW8gQMQLsEWSRL50uDS+hcgJNouFHMHBs921lgAVh9O7K
 Yb5w==
X-Gm-Message-State: AO0yUKVeDQ2QokqBVa2JPwJL/3T1lYXfPzto+HpNhdTdO+G3xwD094/k
 to22cfOyn9GJ2nzdlmrmAa66pSmW5OXkqTRAUuhwxg==
X-Google-Smtp-Source: AK7set9BRYzfCo3yINgwYirRmLKIg/Kr9ttJmKlEYn66TIvJIg0N6rBHnw8IF/OTGinVBCduYuYs79Nh3sfHGUn+UrM=
X-Received: by 2002:a50:d597:0:b0:4fb:e0e8:5140 with SMTP id
 v23-20020a50d597000000b004fbe0e85140mr4212039edi.6.1679516303556; Wed, 22 Mar
 2023 13:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230322163303.4115917-1-alex.bennee@linaro.org>
In-Reply-To: <20230322163303.4115917-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Mar 2023 20:18:12 +0000
Message-ID: <CAFEAcA8ipWKpv09pyQWNQBiUhd2JYM=sn4qv2YBen-pN3beU0Q@mail.gmail.com>
Subject: Re: [PULL v2 for 8.0 00/35] various fixes (testing, plugins, gitdm)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Wed, 22 Mar 2023 at 16:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit c283ff89d11ff123efc9af49128ef58511f730=
12:
>
>   Update version for v8.0.0-rc1 release (2023-03-21 17:15:43 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-220323-1
>
> for you to fetch changes up to e35b9a2e81ccce86db6f1417b1d73bb97d7cbc17:
>
>   qtests: avoid printing comments before g_test_init() (2023-03-22
>   15:08:26 +0000)
>
> Note you will need to remove the old openbsd disk image to trigger a
> rebuild that avoids the issues with -ENOSPC. My pipeline can be seen
> here:
>
>   https://gitlab.com/stsquad/qemu/-/pipelines/814624909
>
> ----------------------------------------------------------------
> Misc fixes for 8.0 (testing, plugins, gitdm)
>
>   - update Alpine image used for testing images
>   - include libslirp in custom runner build env
>   - update gitlab-runner recipe for CentOS
>   - update docker calls for better caching behaviour
>   - document some plugin callbacks
>   - don't use tags to define drives for lkft baseline tests
>   - fix missing clear of plugin_mem_cbs
>   - fix iotests to report individual results
>   - update the gitdm metadata for contributors
>   - avoid printing comments before g_test_init()
>   - probe for multiprocess support before running avocado test
>   - refactor igb.py into netdev-ethtool.py avocado test
>   - rebuild openbsd to have more space space for iotests

I saw this on ppc64. I suspect it of being a pre-existing
intermittent -- I'm retrying it.

=E2=96=B6 737/761 qcow2 copy-before-write
           FAIL
737/761 qemu:block / io-qcow2-copy-before-write
           ERROR           6.80s   exit status 1
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
--- /home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write.out
+++ /home/pm215/qemu/build/all/scratch/qcow2-file-copy-before-write/copy-be=
fore-write.out.bad
@@ -1,5 +1,21 @@
-....
+..F.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+FAIL: test_timeout_break_guest (__main__.TestCbwError.test_timeout_break_g=
uest)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
line 200, in test_timeout_break_guest
+    self.assertEqual(log, """\
+AssertionError: 'wrot[90 chars])\nwrote 524288/524288 bytes at offset
524288\[151 chars]c)\n' !=3D 'wrot[90 chars])\nwrite failed: Connection
timed out\nread 10[85 chars]c)\n'
+  wrote 524288/524288 bytes at offset 0
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
++ write failed: Connection timed out
+- wrote 524288/524288 bytes at offset 524288
+- 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+  read 1048576/1048576 bytes at offset 0
+  1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 ----------------------------------------------------------------------
 Ran 4 tests

-OK
+FAILED (failures=3D1)

-- PMM

