Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB96681629
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWoc-00081b-9e; Mon, 30 Jan 2023 11:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMWoV-0007zg-Tk
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:15:25 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMWoU-0007Jf-F6
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:15:23 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id d132so14661734ybb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 08:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgGyWYpGJAMdj+zAj3Yb0A/JAYeQ6Et53JriFDEeHtM=;
 b=F2ERzEKU9IrfvQRdWUr+LVNQlmXGJIcZUqCQeolNDCwkFNvqoFSan8gcDGbWEWeVr1
 LJccnX4QkhwRHlZkiyh/uvEQeGKOn3q0gokABhYN3Mp3Ab0w9g7Unnx6sFV3iBY1OlBd
 of/Fm8WZWC8ktXapuI8ppRSsc5b5kpdx7I7tQG5rY0EGBN5O/ap7cZZxLmPLEkWJD4gS
 agS8pEllIPr2fLdFstRx6aPm2fWkJOuhw7e2azl3vF4LcmCTR7oLnwD6OOn/KxvUviSK
 HGqMwQiOkQCFvYGV7oLIjeGXyV1uVaqhnCDkAVy8bognttZt8BgkfkpJioD5FYL/pgVQ
 /s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgGyWYpGJAMdj+zAj3Yb0A/JAYeQ6Et53JriFDEeHtM=;
 b=kKjqR768ZATkYsDDh3ouMuIlgXjNV869xpATMqAg+kPuSDQ2p7U4l2awDA1H5FKIR+
 kBEiNqUS9NIWwSwCRPyT8ZmTTsxoyU2KHmJaQv5t2o7XlRy5uqXeSD7IBmez4004pgOk
 mIvq7tTeKkSu9pEqGjm3wTv2fJORtDdUwpq0IvjhCrqLYosVtnuHv/PANbx/X4b7+vc0
 fnWAsM5jUeZBK5GbOTaqgJFopoaxVREf5I0LAHp8gSOcLF9eopPbWlFl/GpnGbNfhP6E
 uzepP6vJKYFraJOFowbXEGnFHTCzYkdmmG4Pla6iaqUNXhzcXDqYZ4+U/H9LLFcV0Rsx
 yOmQ==
X-Gm-Message-State: AFqh2krCu0zEz00l0jfg5ujtn5EiNHVFUx6DtR1MWoDeo5KR2HNTCcNX
 dfGsrkFtW/MFHdYuxowCcO5PQGzcRfT3ZLDmkwo=
X-Google-Smtp-Source: AMrXdXtaXD9FAECt+jZ8MiZFu10Fp7dCwKMYlntzlIu0N7+o30MktERiIT3TNijULdB5/bQONHeaxhDOu6V3lsCmdNc=
X-Received: by 2002:a25:344a:0:b0:803:60ae:431c with SMTP id
 b71-20020a25344a000000b0080360ae431cmr4191532yba.642.1675095321230; Mon, 30
 Jan 2023 08:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20230130124728.175610-1-alex.bennee@linaro.org>
In-Reply-To: <20230130124728.175610-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 30 Jan 2023 11:15:09 -0500
Message-ID: <CAJSP0QVxjBD5oeSFqY49sUHgxwsJAmYvHV+LQY20is9U1LUfuQ@mail.gmail.com>
Subject: Re: [PATCH v2] backends/vhost-user: remove the ioeventfd check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com, 
 marcandre.lureau@redhat.com, stefanha@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, sgarzare@redhat.com, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, 30 Jan 2023 at 07:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While ioeventfds are needed for good performance with KVM guests it
> should not be a gating requirement. We can run vhost-user backends using
> simulated ioeventfds or inband signalling.
>
> With this change I can run:
>
>   $QEMU $OPTS \
>     -display gtk,gl=3Don \
>     -device vhost-user-gpu-pci,chardev=3Dvhgpu \
>     -chardev socket,id=3Dvhgpu,path=3Dvhgpu.sock
>
> with:
>
>   ./contrib/vhost-user-gpu/vhost-user-gpu \
>     -s vhgpu.sock \
>     -v
>
> and at least see things start-up - although the display gets rotated by
> 180 degrees. Once lightdm takes over we never make it to the login
> prompt and just get a blank screen.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Message-Id: <20221202132231.1048669-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - reword commit message to make it clear we simulate ioeventfd
>   - drop check altogether as we can fallback for KVM as well
> ---
>  backends/vhost-user.c | 11 -----------
>  1 file changed, 11 deletions(-)

Nice!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

