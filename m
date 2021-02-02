Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497830C08E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:02:57 +0100 (CET)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wGe-0001iK-KT
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6vzE-0000zT-Vi
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:44:57 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6vzD-0000jS-CZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:44:56 -0500
Received: by mail-ed1-x536.google.com with SMTP id s3so9245785edi.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5U0TL9lSfrOEWupCCBHDzbAF7VZuIKmVg/wR/TQQJbo=;
 b=BIHqFXasM2VrmDgMV6UsoCosIcu4j+iZ5LzU5QPW/gzNZEvHKhoUdwN+kEVgIvlmw6
 HVI+QLcQaifafuFspqWArCIlm+buwVNKog7H8/OSKk8+zLzQ8kTUZ+LbqnPHTs4KjEyA
 Cuno53Ik1b+MG6sx5PXIOuu38LOI6wgrPEpnOjWsycWTSYrrkd3OeUdfGa6JpOz6Ng7l
 uCDMqxYIe+7nhYAGGyg+HY2gawMmauW3vIZaCxmcl5SMMfXUti1yxFpRsetiLWGzVUD/
 8SoaDzaKMiaiGlcIfDv2UeuuGcZnsRrz44SFGbOcE9tPNhKfWaNsmK8yyQmDZGpIyvOe
 26hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5U0TL9lSfrOEWupCCBHDzbAF7VZuIKmVg/wR/TQQJbo=;
 b=tqZyhxS+JPedaP6C1CBulFr8GhB1MK4h0iE/FgkdpgVMlGcLCbRcMircquVA/ZDJd5
 cU6WA2U1ljfiCNNkZ/DzhSivBvLEbRw+oyzuCM5PAduYqmlRzbvqcBg4/xTRvb6bJpUP
 SrdNrY1ftYisZ8Qkdk9/uM1UhBSJefNdhlWqb5KVbfrLS4jloEY74HyHOZ4KRDGLtn1a
 RTfW4avUp5t3cenqEbSiRBvjJgoOnHEL6e0Eiwhjc8wqn1/mJZrcJhVsH65SX3I569A7
 8hg2/Sb4SDL4Z8cpGNb2sMthxIerB8z/0e+EGWSl8cgJtM+39ib0HDp4+XV8mZx5pznv
 vi8g==
X-Gm-Message-State: AOAM533J20kLqriuiFBRKZOOW91YYBNigaSLQMS30arWyQJ379jgVvgL
 TSupfrtmnpo76cPbTaaJ82UkaF+nqJJ8xBU4sytMRQ==
X-Google-Smtp-Source: ABdhPJxQY00tzsfrpCwFhEuBGGQfxrFPedbKo0mNW4CS9pYIy+biahoN8hnKGiXcBvjukvccLBmLVfXrpuo+8tbYK0s=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr23329291edb.44.1612273493437; 
 Tue, 02 Feb 2021 05:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
 <CAFEAcA8y0G_sru10vmESAPW54JWPZRcboN7xSfc2bKDQFaqGNA@mail.gmail.com>
 <20210202114123.GB5184@merkur.fritz.box>
In-Reply-To: <20210202114123.GB5184@merkur.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 13:44:42 +0000
Message-ID: <CAFEAcA8aSmZLEQzwnaEJzj7EYcJHq2PuSKd_pKJfRWmPT1Bf7w@mail.gmail.com>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 11:41, Kevin Wolf <kwolf@redhat.com> wrote:
> In any case, the output for 127 must be different because it doesn't use
> the Python framework. Can you post the diff for that one?

Here it is:

127   ...        [11:11:02]              ...                  ^M  TEST
  iotest-qcow2: 127 [fail]
QEMU          --
"/home/qemu/qemu-test.7IGXol/build/tests/qemu-iotests/../../qemu-system-xtensaeb"
-nodefaults -display none -accel qtest
QEMU_IMG      --
"/home/qemu/qemu-test.7IGXol/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.7IGXol/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.7IGXol/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.1
TEST_DIR      -- /home/qemu/qemu-test.7IGXol/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp_q9bk8l6
SOCKET_SCM_HELPER --
--- /home/qemu/qemu-test.7IGXol/src/tests/qemu-iotests/127.out
+++ 127.out.bad
@@ -5,29 +5,3 @@
 wrote 42/42 bytes at offset 0
 42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 { 'execute': 'qmp_capabilities' }
-{"return": {}}
-{ 'execute': 'drive-mirror',
-       'arguments': {
-           'job-id': 'mirror',
-           'device': 'source',
-           'target': 'TEST_DIR/t.IMGFMT.overlay1',
-           'mode':   'existing',
-           'sync':   'top'
-       } }
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id":
"mirror"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
"mirror"}}
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id":
"mirror"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "BLOCK_JOB_READY", "data": {"device": "mirror", "len": 65536,
"offset": 65536, "speed": 0, "type": "mirror"}}
-{ 'execute': 'block-job-complete',
-       'arguments': { 'device': 'mirror' } }
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id":
"mirror"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id":
"mirror"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "BLOCK_JOB_COMPLETED", "data": {"device": "mirror", "len":
65536, "offset": 65536, "speed": 0, "type": "mirror"}}
-{ 'execute': 'quit' }
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id":
"mirror"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id":
"mirror"}}
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "SHUTDOWN", "data": {"guest": false, "reason":
"host-qmp-quit"}}
-*** done
133   ...        [11:11:02]              ...                  ^M  TEST
  iotest-qcow2: 133
134   ...        [11:11:03]              ...                  ^M  TEST
  iotest-qcow2: 134
(etc)

thanks
-- PMM

