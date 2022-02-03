Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C358C4A8885
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:23:34 +0100 (CET)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFetR-0002ge-Jv
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFesS-0001nn-Hr
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:22:32 -0500
Received: from [2a00:1450:4864:20::429] (port=42741
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFero-0006qy-3S
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:22:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id a13so6012612wrh.9
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bl1YFQyQsi5ir81kK12D+/YfsLCx5jkiu7ibIbI2fZ4=;
 b=c86NlqexfX03I8+xSj6ZW1O51GbetYd/CAOut9o0mEdbOC59CLoM9qEy6n6NoC4dtB
 JeWwj3+RtjFqYxhZP53XHHkU+Kb2c9jL8tvAFJiPeIoXi1yZJc1MXOZeRK4zrXKtvEUU
 0BPq0aSM+xRqqLHM3uP1/oIlDTfG7TcjpCbUI1qQxTlffbf9YDCAkqStwqUt0ZMKnIay
 9cNk8sJLEEz+rb1pn7iNCs8B+XFFqAP2CY9jRgZIWyBXoK1unkLNXHRm/wRwseQVi3O0
 jnOeVew665sF0kY8uNmOPO4uVBDDrLase+7Y9DB6xgqwv0v8bOhq4Puc6qzkw+AuOTL7
 34Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bl1YFQyQsi5ir81kK12D+/YfsLCx5jkiu7ibIbI2fZ4=;
 b=lKWT8/JJMN49AeC0mXKKRcB3oy3Krqg/y8h2HCbUF6zPhWnBPHNae0+gR1IPIIU9DS
 eJagsTxDf2w4SQ7T54UYjynxD6j8Xu2XyXR3xBAa5NeZKHVjvE/sEEIVugjfNYJhuMTz
 vDe1Up9d6IPYvYVa2/UfWx78uPO+fVx4MZYBSp1DA0TZ+7GdyY+YkX+SgZRc3r7eAWPn
 2RTSr1ruXdWWAZWtVvsoEm6/6XR+2W7thMJ9tAX+ZTYZpOHvbGA24ROF+WK2b7Qixixm
 jdFm+e59Kc0XTOjvq1VoUhhzvQrYFT6gaEY0N1fnaxnfwVyfh6zywpDrKaSJI+019QqU
 eh1A==
X-Gm-Message-State: AOAM530bV5oSdAvPwpbO1xbG2/XGm9BI3ConCxIYEEO+L3uTYbOfFP0d
 0R/8+Bc8/T+6p7pwF/kNFu1UIz8+1liECWtEbg/k8A==
X-Google-Smtp-Source: ABdhPJzrACZ4T0sQSio5PoMMXoz2z0XiOMQXw40XcNu0woLhHc89VMXqZrvZZEfSFeV7bDfCuVwnWSTLzDuZJHgpWGc=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr29133969wrq.295.1643905241608; 
 Thu, 03 Feb 2022 08:20:41 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
In-Reply-To: <20220203015946.1330386-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 16:20:30 +0000
Message-ID: <CAFEAcA_OXJ6C1UTFXiy6x1gp4VRmaWQY7ntU8N-3-O+TGcsKQQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 01:59, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 47cc1a3655135b89fa75c2824fbddd29df8746=
12:
>
>   Merge remote-tracking branch 'remotes/kwolf-gitlab/tags/for-upstream' i=
nto staging (2022-02-01 19:48:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to b0b662bb2b340d63529672b5bdae596a6243c4d0:
>
>   python/aqmp: add socket bind step to legacy.py (2022-02-02 14:12:22 -05=
00)
>
> ----------------------------------------------------------------
> Python patches
>
> Peter: I expect this to address the iotest 040,041 failures you observed
> on NetBSD. If it doesn't, let me know.

I still see this one, which is different from the 040,041 stuff,
and where 'make check' is for some reason giving a lot less useful
detail. (This is a prexisting intermittent from before this patchset).



[etc]
=E2=96=B6 175/704 /io/channel/pipe/sync
           OK
=E2=96=B6 175/704 /io/channel/pipe/async
           OK
175/704 qemu:unit / test-io-channel-file
           OK              0.11s   5 subtests passed

177/704 qemu:unit / test-io-channel-tls
           RUNNING
>>> G_TEST_BUILDDIR=3D/home/qemu/qemu-test.yiYr4m/build/tests/unit MALLOC_P=
ERTURB_=3D5 G_TEST_SRCDIR=3D/home/qemu/qemu-test.yiYr4m/src/tests/unit /hom=
e/
qemu/qemu-test.yiYr4m/build/tests/unit/test-io-channel-tls --tap -k
=E2=96=B6 176/704 /io/channel/socket/ipv4-sync
           OK
=E2=96=B6 176/704 /io/channel/socket/ipv4-async
           OK
=E2=96=B6 176/704 /io/channel/socket/ipv4-fd
           OK
=E2=96=B6 176/704 /io/channel/socket/ipv6-sync
           OK
=E2=96=B6 176/704 /io/channel/socket/ipv6-async
           OK
=E2=96=B6 176/704 /io/channel/socket/unix-sync
           OK
=E2=96=B6 176/704 /io/channel/socket/unix-async
           OK
=E2=96=B6 176/704 /io/channel/socket/unix-fd-pass
           OK
=E2=96=B6 176/704 /io/channel/socket/unix-listen-cleanup
           OK
176/704 qemu:unit / test-io-channel-socket
           OK              0.13s   9 subtests passed

=E2=96=B6 1/1 qcow2 qsd-jobs                OK
1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status 1

178/704 qemu:unit / test-io-task
           RUNNING
>>> G_TEST_BUILDDIR=3D/home/qemu/qemu-test.yiYr4m/build/tests/unit MALLOC_P=
ERTURB_=3D194 G_TEST_SRCDIR=3D/home/qemu/qemu-test.yiYr4m/src/tests/unit /h=
om
e/qemu/qemu-test.yiYr4m/build/tests/unit/test-io-task --tap -k
=E2=96=B6 147/704 /bdrv-drain/blockjob/iothread/error/drain_subtree
           OK

Summary of Failures:

1/1 qemu:block / qemu-iotests qcow2 ERROR          243.14s   exit status 1


Ok:                 0
Expected Fail:      0
Fail:               1
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Full log written to /home/qemu/qemu-test.yiYr4m/build/meson-logs/iotestslog=
.txt
=E2=96=B6 147/704 /bdrv-drain/deletion/drain
           OK
=E2=96=B6 178/704 /crypto/task/complete
           OK
=E2=96=B6 178/704 /crypto/task/datafree
           OK
[etc]

thanks
-- PMM

