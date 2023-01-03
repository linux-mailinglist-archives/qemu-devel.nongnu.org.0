Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E4865C353
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCja3-0007Jm-Db; Tue, 03 Jan 2023 10:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pCjZv-0007Ix-O2
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:51:54 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pCjZt-0005JS-Og
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 10:51:51 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-45c11d1bfc8so441915457b3.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gt9548jnFrSbt6WjWShyKCgZqJSKbYdwRw9a/eTBWS0=;
 b=AZNdcXqL2nsgsadPxVw+G13iLqugyLjBIFR0Tr74tdoMX4O3H6AYIoURKhhSQZLqXe
 Ob+jaIpOYMNtQtfm4aa7p9Btg5ZfowmtoZcKvXgqDFLYiNQF89Fm1gMJuQEeP4Q9hraF
 p+Car1ht7MXtmbu9IW5Yxr5cNW6BLgK3adqyQiSsKpbhgF7lmEcRwoPO1fqVQdGC4JJ9
 aRSIGS2r/gltNg5ZOJJTh1zaEJVGI7Tix14fM5/GPmn7Y21NfvuxhJAzp04Mywdr89Wj
 gUsULwdQ8gnCkIA6OAW1aFacv36GwTvzT1G/luni7J+pbuoe7nYdtxcDRioFppZgiYa2
 pxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gt9548jnFrSbt6WjWShyKCgZqJSKbYdwRw9a/eTBWS0=;
 b=u28us7mZYKzzkPhKS6mP4V5UkL3FdkTVF2+PQmX/6xw2NF9VTflqLkQtjDf5vPP17c
 rz8WUPmxg/NEdv/+bAORofCYVBVsEbymW9eJVLmlo+umYss2JRi4qvJaV6/vj/G923jG
 IxeU55/ooI+t+K5O2e6uWTAYgoFFKw/JKWcGh+N3XpzBhc7uwqNS+LwfMDiLJW4xvAqo
 k7TT5+iA1evq3rjuu02iaX+zeZR922gbNnfETyJMPyQqlLGNGBpS5DhaWp9tqi+L+BwL
 ZoeKh8TWbG8suE+Px8JikQoSzWfmdkXHuthzxvhX4VZCSNysvPftHImInHGiOT/LzQ/j
 BGrA==
X-Gm-Message-State: AFqh2koZFmwzZJ2ZBUXJaCNsrI+uEF2urhaAxxdpEFRS/PX1WmBczk30
 oJer+rFSQSbFPISJh4Dg9IuSNmZVv69h//Mrro0=
X-Google-Smtp-Source: AMrXdXsdXroNE1Uk8GKpULHRl75fBuHmK3LR6n82JWeC/d7jwK35o2+LpJFI/gx84MzfF9E7d084AK3NAtX9hxUFbhE=
X-Received: by 2002:a81:9e0e:0:b0:475:b232:7a17 with SMTP id
 m14-20020a819e0e000000b00475b2327a17mr4107942ywj.111.1672761108436; Tue, 03
 Jan 2023 07:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
 <20230103162603.74f631aa@orange>
In-Reply-To: <20230103162603.74f631aa@orange>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 3 Jan 2023 10:51:36 -0500
Message-ID: <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
To: Alessandro Di Federico <ale@rev.ng>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Taylor Simpson <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>,
 philmd@linaro.org, 
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com, 
 stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
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

On Tue, 3 Jan 2023 at 10:26, Alessandro Di Federico <ale@rev.ng> wrote:
>
> On Tue, 3 Jan 2023 09:37:51 -0500
> Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> > I don't understand the issue. Can you describe the steps that cause
> > meson-buildoptions.sh to become out-of-sync with meson_options.txt?
> >
> > This will continue to be a problem in the future. Is there a way to
> > fix it permanently?
>
> In Makefile we have:
>
>     $(SRC_PATH)/scripts/meson-buildoptions.sh:    $(SRC_PATH)/meson_options.txt
>
> (Cc'ing Paolo since he's the author of this line)
>
> This means make will regenerate
> `$(SRC_PATH)/scripts/meson-buildoptions.sh` if its last modification
> date is older than `$(SRC_PATH)/meson_options.txt`.
>
> However these files are in the source directory, so this will behave
> properly only under certain circumstances.
>
> For instance if, for some reason, someone committed a new version of
> `meson_options.txt` but not of `meson-buildoptions.sh`, a fresh clone
> of the repo will not have the dates set correctly to trigger the
> Makefile rule above:
>
>     $ ls -ln scripts/meson*
>     -rw-r--r-- 1 1000 1000 28913 Jan  3 15:58 scripts/meson-buildoptions.sh
>     -rw-r--r-- 1 1000 1000    91 Jan  3 15:58 scripts/meson.build
>
> This is because git does not update file dates depending on the last
> commit changing them.
>
> This, on top of the fact that invoking `ninja` does not trigger
> regeneration (which works for most other use cases), leads to a good
> chance of forgetting to update meson-buildoptions.sh.
>
> We could add the target to ninja to mitigate the risk, but still, the
> dates problem remains.
>
> An alternative solution would be to avoid committing generated files and
> simply regenerating it every time.
>
> On my machine `meson.py introspect --buildoptions` +
> `scripts/meson-buildoptions.py` take 1.070s.
> `./configure --help` takes 0.162s, so it's a bit sad.
> On the other hand an actual invocation of configure can take
> significantly longer (`./configure` takes 29.150s on my machine).
>
> To avoid re-running it every time we could invoke `make
> update-buildoptions` in `configure` but keep
> `scripts/meson-buildoptions.sh` in the build directory.

QEMU's Makefile used to a use a technique where it generated
"timestamp" files and used cmp(1) to check if rebuilding was
necessary:
1. Always generate meson-buildoptions.sh-timestamp.
2. If cmp meson-buildoptions.sh-timestamp meson-buildoptions.sh
detects a difference, cp meson-buildoptions.sh-timestamp
meson-buildoptions.sh.
3. Let make handle dependencies on meson-buildoptions.sh as usual.

You can find examples by grepping for -timestamp in the git log -p output.

I think this would solve the problem?

Stefan

