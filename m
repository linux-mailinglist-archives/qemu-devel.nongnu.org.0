Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78866CCA03
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 20:29:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phE4J-0004Q6-Uo; Tue, 28 Mar 2023 14:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phE4E-0004Pj-LT
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:29:10 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phE4C-0003WA-CC
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 14:29:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r11so53480734edd.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680028145;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRVxvBqhLiphXJyM1SvRgLyq/wgYHNYe+O5I0ktqa78=;
 b=YubcoUG4QGwGmxDIoeMQ37eeCS30gcxsYCnQyUvnbH/7njFBU60fmJFG3OEGi5H/M2
 MOaq9eVhhlAFzA1C9bLVErWqJ8z8pKp9jjL8a/WeojDA/OhRq74YGEtQjqsTkyA+OpbO
 QQaB9YMOjSTvT7w90NZj7JF+6/YROFMhDqB/X/rPX8yNfNwpVUj8kLNtmg/VFpQvOHna
 huLxC7TWtJrd5N4TR8nzRlNeKffEjxHl/K6by5GqBxw4pQLnimHhZOw1zCpNnbCu8RF9
 ICOqWIP0fIGjW8nSFOUMCXxJxOYaI2EnDz2Kv97j1kAltD8r0ORTiLSx0tjo1RLhPFRQ
 58IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680028145;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRVxvBqhLiphXJyM1SvRgLyq/wgYHNYe+O5I0ktqa78=;
 b=HClowRnF1ryQueH2heTcpd8rpV/6BLadahCCrNVDbX5cU7k6v3/Arn2VX6uRfPG718
 5cJAnawiR4Xv4CKcjnWZoGj6jzGB58GCT2lcn1mgZgYBs0v0T+x5LiGtW7Zass4+UmTO
 TP6elvtkakJJQJ4MATeIiiUpJcJ8kGASYYwZ2Bl7loCNsJ+PelnKBL+Ce6wmVGPlR4Zh
 D3ZgOEl4yfqE/0BVp+WlkrdObHuC6X0REnGqx4JlHfeAdX5OP/DapWt/eJX98F2BNYOk
 8YtmxVaezFxFQnWJZO3qR971ttkkFXb1Rxy64YbbGfAGVZ//9ZUdKIXEzJqJ3DR1dcOl
 y/Yg==
X-Gm-Message-State: AAQBX9fg6gnELUl82TGA1a3EnaFYfRXtQZgIjo45uAln6Z10zHoDKcPZ
 CUOd8vvyiiU3lvhmiY11Is+Tw6xu4dUxKTYvZrq03Q8/aTZ2mKBsTHk=
X-Google-Smtp-Source: AKy350b2PF5OkhOsk7uRa26gepuVdm6RI3GWan2I/pJccjTvtW56DrVYTPPM2nB03TYzq3peAiyGnzqzzw3LaIQZqz8=
X-Received: by 2002:a17:906:cf89:b0:932:4577:6705 with SMTP id
 um9-20020a170906cf8900b0093245776705mr8799513ejb.6.1680028145542; Tue, 28 Mar
 2023 11:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-Xdw6uL+w-Qh+pLFVXEcvQhQZi-o3Xup4iwJuSGNYgmg@mail.gmail.com>
In-Reply-To: <CAFEAcA-Xdw6uL+w-Qh+pLFVXEcvQhQZi-o3Xup4iwJuSGNYgmg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 19:28:55 +0100
Message-ID: <CAFEAcA-=XVWDOtvpPZ_QtN+6wocdoJBZqrQ=u+ni+FhPLzs==A@mail.gmail.com>
Subject: Re: io-qcow2-copy-before-write intermittent failure (ppc64 host)
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Mar 2023 at 13:44, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> ppc64 host:
>
> 737/761 qemu:block / io-qcow2-copy-before-write
>            ERROR           6.77s   exit status 1
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
> --- /home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write.out
> +++ /home/pm215/qemu/build/all/scratch/qcow2-file-copy-before-write/copy-=
before-write.out.bad
> @@ -1,5 +1,21 @@
> -....
> +...F
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +FAIL: test_timeout_break_snapshot
> (__main__.TestCbwError.test_timeout_break_snapshot)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
> line 210, in test_timeout_break_snapshot
> +    self.assertEqual(log, """\
> +AssertionError: 'wrot[195 chars]read 1048576/1048576 bytes at offset
> 0\n1 MiB,[46 chars]c)\n' !=3D 'wrot[195 chars]read failed: Permission
> denied\n'
> +  wrote 524288/524288 bytes at offset 0
> +  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +  wrote 524288/524288 bytes at offset 524288
> +  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> ++ read failed: Permission denied
> +- read 1048576/1048576 bytes at offset 0
> +- 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +
>  ----------------------------------------------------------------------
>  Ran 4 tests
>
> -OK
> +FAILED (failures=3D1)
>
> (test program exited with status code 1)
>
> This is an intermittent; we've seen it before on this host:
> https://lore.kernel.org/qemu-devel/CAFEAcA8ipWKpv09pyQWNQBiUhd2JYM=3Dsn4q=
v2YBen-pN3beU0Q@mail.gmail.com/

And again:

737/761 qemu:block / io-qcow2-copy-before-write
           ERROR
       5.61s   exit status 1
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
fore-write.out.b
ad
@@ -1,5 +1,21 @@
-....
+...F
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+FAIL: test_timeout_break_snapshot
(__main__.TestCbwError.test_timeout_break_snapshot)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/pm215/qemu/tests/qemu-iotests/tests/copy-before-write",
line 210, in test_ti
meout_break_snapshot
+    self.assertEqual(log, """\
+AssertionError: 'wrot[195 chars]read 1048576/1048576 bytes at offset
0\n1 MiB,[46 chars]c)
\n' !=3D 'wrot[195 chars]read failed: Permission denied\n'
+  wrote 524288/524288 bytes at offset 0
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+  wrote 524288/524288 bytes at offset 524288
+  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
++ read failed: Permission denied
+- read 1048576/1048576 bytes at offset 0
+- 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 ----------------------------------------------------------------------
 Ran 4 tests

-OK
+FAILED (failures=3D1)


-- PMM

