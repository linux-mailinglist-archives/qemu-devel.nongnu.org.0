Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2884E63D9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:03:36 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXN7n-0001JX-FV
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:03:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXN5s-0008M1-6F
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:01:36 -0400
Received: from [2607:f8b0:4864:20::112b] (port=43053
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXN5q-0005pz-Cg
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:01:35 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e5e31c34bfso49794317b3.10
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0X4V8WlQkL4pJt2RA4dW7APuHUR9hwzivB1IL3XsEs=;
 b=nLHLiP4p3djmq/Tv/HpDMhpBDEmHoxGaQQJ2VATWKzPk8ktQZTLqLuyLcluGxWuxsF
 vSu1fZI69zA8FPEr8+8ASUwiSYNSIDZOJCT25KTmKY3cAqNhFgVDvwklCmnpK+RQl+UK
 +iiEXZ9mdT7XYxiUQJwZbORud1pwzw8DSIrxy9HCz9poJgaa++lEQWd4yYy4LPnoHLlL
 xeGHqAJQsQch0SZJTp3U07dvlnEYgI1W1KJ/0LujWlLUIhig6WCQQvwN8CHoY6ml7tUl
 zriVQXd7k8LxHMRf2wkplyYMom24XASr0n98jIaHkplcUE8T0oKjRvE5poIpJFCsk4s3
 eFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0X4V8WlQkL4pJt2RA4dW7APuHUR9hwzivB1IL3XsEs=;
 b=A6iluF3ku2+FtXSv0M/3oO1/MHQgrOdmzDaTOsIeLMN7KlHquyuvCpsZCQ1UlR7a5m
 yLZn29Vv08Jj44cx6DBYnMKI2ESHn+94a72yRaZP1Sxy4gK2JT4vVMRJ+eEMIQIh/iGu
 /KqMPLFOPoVdX28llhtI59YEXuUdKgp0u0YoFnmoD4WzUwxZX1vHk2crRhZcVdERBNvL
 nXlSmLwxMEXyUquRDwT6COSqqPktdQGceRWJrvqYaEPNhz6JX2a4IEqYzTagl5J+9YmW
 4insou2A1u/IJQFT6jajmE+tpi06j+KL3IZwCe2Hnf+H/QMm/21SRILJX4RJ3UELGkf3
 +UpQ==
X-Gm-Message-State: AOAM531ctsmuBEv+JxsddGzI4Ie72jfvKuAe45zxGDUIu+xKgRa18kOW
 gow1+WAJdqSuD4WNq5YQAHtJ5my8C/gNNjJgXt5C7w==
X-Google-Smtp-Source: ABdhPJwiZZS7Y3KccWAGKIT6Ebq9baYMgYcx7uTWbog4z0/N2K72aKxENnIR9jRZP+c4I72e9zINSAcFRuohWzTNrEM=
X-Received: by 2002:a81:ac15:0:b0:2e6:d7e3:c4ba with SMTP id
 k21-20020a81ac15000000b002e6d7e3c4bamr294690ywh.10.1648126892686; Thu, 24 Mar
 2022 06:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9PDWf+NDajMMTE5svM9mUTOOrWXj+O2wn7Sd8=RZDgaw@mail.gmail.com>
 <6ca237e2-0ab8-242c-69b3-e628ba698f68@redhat.com>
In-Reply-To: <6ca237e2-0ab8-242c-69b3-e628ba698f68@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 13:01:19 +0000
Message-ID: <CAFEAcA-JpnZF4qxLk=RmXxAd9vx0Stgzo9ypSgwF7HA15rgmHg@mail.gmail.com>
Subject: Re: hang in virtio-failover-test (s390 host)
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 11:53, Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 24/03/2022 12:11, Peter Maydell wrote:
> > This is a backtrace from virtio-failover-test, which had hung
> > on the s390 gitlab CI runner. Both processes were using CPU,
> > so this is some kind of livelock, not a deadlock.
> >
> > Looking more closely at the virtio-net-failover process, in the function
> > test_migrate_off_abort() we have executed 'migrate_cancel' and then go
> > into a loop waiting for 'status' to be "cancelled", with aborts if
> > it is either "failed" or "active". But the status the QEMU process
> > returns is "completed", so we loop forever waiting for a status change
> > that will never come (I assume).
> >
>
> It means the migration has been completed before we tried to cancel it.
> The test doesn't fail but is not valid.
>
> Could you try this:
>
> diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
> index 80292eecf65f..80cda4ca28ce 100644
> --- a/tests/qtest/virtio-net-failover.c
> +++ b/tests/qtest/virtio-net-failover.c
> @@ -1425,6 +1425,11 @@ static void test_migrate_off_abort(gconstpointer opaque)
>           ret = migrate_status(qts);
>
>           status = qdict_get_str(ret, "status");
> +        if (strcmp(status, "completed") == 0) {
> +            g_test_skip("Failed to cancel the migration");
> +            qobject_unref(ret);
> +            goto out;
> +        }
>           if (strcmp(status, "cancelled") == 0) {
>               qobject_unref(ret);
>               break;
> @@ -1437,6 +1442,7 @@ static void test_migrate_off_abort(gconstpointer opaque)
>       check_one_card(qts, true, "standby0", MAC_STANDBY0);
>       check_one_card(qts, true, "primary0", MAC_PRIMARY0);
>
> +out:
>       qos_object_destroy((QOSGraphObject *)vdev);
>       machine_stop(qts);
>   }

Looks plausible, but I can't currently get this hang to reproduce
(it's probably a fairly rare intermittent) so I can't really
test a fix in any meaningful way.

It looks like there are several other loops in other tests in
this file which also need to check for "completed".

I would suggest maybe using check_migration_status() instead
of hand-rolling loops here, except that that function seems
to assert on an unexpected "completed" status whereas we want
the test to skip. It could probably be improved to be usable
here, though.

thanks
-- PMM

