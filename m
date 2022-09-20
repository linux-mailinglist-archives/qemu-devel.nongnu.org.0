Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13515BE8DA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:26:41 +0200 (CEST)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaeCu-0004Yq-Vj
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oabVL-0005qb-5a
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:33:32 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oabVI-0000ih-Rg
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:33:30 -0400
Received: by mail-ed1-x52b.google.com with SMTP id w28so3368422edi.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=2TPJYbE5oV4Ww0eGtsoF5CtzfvZG+MgglCrM+L8KkCc=;
 b=uQk9+37QU0Nx1XC9bcJOyDYDhL7Ays3aa2YcliaYgsVCfZ9e/6rDvK0jqfjMwc9+KN
 U1puuuHH3HXjP9HUbzh96ugFCrl0BUqS9dbOYTcTs0pX3pBt6pivCM8LqiP8JPAGRzlK
 aQN41XJy78+BCyhrYCuvNjCeLAe3AhDDFixT+nIaJ6LLDHue9u5jjpEqIfbySvsWlC6G
 XdiDN28ynUpqUZyrS30NRZj69Fp4LJku2rx9K3Qp4Sb3WCMED+ebpUtOkVj8E94kjP8K
 OCsIO30r7LulUzzLEW27pmnDjSKNqdaOrywmsaiVlOS324WsbPfr/BtEvnE0M6S2FN48
 Z8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=2TPJYbE5oV4Ww0eGtsoF5CtzfvZG+MgglCrM+L8KkCc=;
 b=IVR/taP8l/fnSHr+P6Nb5wIXXIbf58N2v7Tj9xh8ehO1L7an0rmrwD4TcRvnJ9F+Td
 SQq4IuJUiaRwWmypRA0dHWsjS3vacQM12bIe8UnaXZWmplthQKne4uOiPoXUZecMhuv9
 FISjaMmCYk/cXBfBeH5xYyw7AYNZzM+gTI49pA9NQnuF6syUGqcsdAl0SDnOM/qnyDkR
 31VOTViD9W2Hc//Ljz7utvi77g5JP+Yjqzto7pA7ORrkQ4Oo0h7vQmBDjHoL2gMVBw0c
 OorqBVkI8lNs8bi8gvU80SS2pCucqcsVk0rP5Ip+tJ7htfR9eDril9etqNHdxkPTU8fK
 j+3A==
X-Gm-Message-State: ACrzQf3j2CLnjGmKr5XE8Y5a/KnQw6/xkKWNZvo9mKOFSZWoGVlCnj3c
 ZEzNSSz69OYoYggM6UwzfBCh9A==
X-Google-Smtp-Source: AMsMyM5OAHBhkzzRn62qKvMv+W8tqNQroI/FsJWyefEj4YqssUEXKDqIwynPCsX49EAS1jGRNgwEHw==
X-Received: by 2002:a50:fc93:0:b0:44d:c809:8158 with SMTP id
 f19-20020a50fc93000000b0044dc8098158mr19820447edq.365.1663673606073; 
 Tue, 20 Sep 2022 04:33:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 qn5-20020a170907210500b0078135401b9csm708644ejb.130.2022.09.20.04.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 04:33:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC1B91FFB7;
 Tue, 20 Sep 2022 12:33:24 +0100 (BST)
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <87czbvzu9e.fsf@linaro.org> <YyibNC4CbniKUTmi@fedora>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
Date: Tue, 20 Sep 2022 12:30:51 +0100
In-reply-to: <YyibNC4CbniKUTmi@fedora>
Message-ID: <8735cm9t6j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Fri, Sep 16, 2022 at 07:51:40AM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>=20
>> > Hi,
>> >
>> > This is an update to the previous series which fixes the last few
>> > niggling CI failures I was seeing.
>> >
>> >    Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cl=
eanups
>> >    Date: Tue, 26 Jul 2022 20:21:29 +0100
>> >    Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>
>> >
>> > The CI failures were tricky to track down because they didn't occur
>> > locally but after patching to dump backtraces they all seem to involve
>> > updates to virtio_set_status() as the machine was torn down. I think
>> > patch that switches all users to use virtio_device_started() along
>> > with consistent checking of vhost_dev->started stops this from
>> > happening. The clean-up seems worthwhile in reducing boilerplate
>> > anyway.
>> >
>> > The following patches still need review:
>> >
>> >   - tests/qtest: enable tests for virtio-gpio
>> >   - tests/qtest: add a get_features op to vhost-user-test
>> >   - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
>> >   - tests/qtest: add assert to catch bad features
>> >   - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
>> >   - tests/qtest: catch unhandled vhost-user messages
>> >   - tests/qtest: use qos_printf instead of g_test_message
>> >   - tests/qtest: pass stdout/stderr down to subtests
>> >   - hw/virtio: move vhd->started check into helper and add FIXME
>> >   - hw/virtio: move vm_running check to virtio_device_started
>> >   - hw/virtio: add some vhost-user trace events
>> >   - hw/virtio: log potentially buggy guest drivers
>> >   - hw/virtio: fix some coding style issues
>> >   - include/hw: document vhost_dev feature life-cycle
>> >   - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
>> >   - hw/virtio: fix vhost_user_read tracepoint
>> >   - hw/virtio: handle un-configured shutdown in virtio-pci
>> >   - hw/virtio: gracefully handle unset vhost_dev vdev
>> >   - hw/virtio: incorporate backend features in features
>> <snip>
>>=20
>> Ping?
>
> Who are you pinging?
>
> Only qemu-devel is on To and there are a bunch of people on Cc.

Well I guess MST is the maintainer for the sub-system but I was hoping
other virtio contributors had some sort of view. The process of
up-streaming a simple vhost-user stub has flushed out all sorts of
stuff.

>
> Stefan
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

