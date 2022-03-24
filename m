Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDE4E63DF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:06:34 +0100 (CET)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNAf-0003ZN-LJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:06:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXN7x-00022t-Nm
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:03:47 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=40708
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXN7w-0006A7-AK
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:03:45 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id z8so8315039ybh.7
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XdZRhVRUyp6X1hpBeoRwGfPzE9bWpBJxxnd4ATxRzq8=;
 b=HmR0RuOCQcDkpSOCpcvJxmLmldJT/l5xoskIWnbkfnAkyKJ8n74t1UG8rxu/4lAGuV
 TZE3m6oNBQJkz/UYCavADmNXAqKM9vdLNHRmeoShZJrV01KXvXPa/JE1e1U/EEl2leBw
 ikDxQpWpMtKq7J3eA7vAIfcfXBdmRpZvkm2bqnii++Kbm4It0FvKz/wljG/krqsyaeUc
 Hf6sg9yi7cs90TroZtfI7y5s8OCM+sh17oH1YKBPcJtpJ6oUizBJePCpPjwLUA9vO9Kp
 IB+lmBfj13ZswsHlBcGaN1TOrA7QBeRss+EFDrvmABDBuqTxI5G4CD5ITUczEtB9yctf
 31yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XdZRhVRUyp6X1hpBeoRwGfPzE9bWpBJxxnd4ATxRzq8=;
 b=UOHuGytF3RvRZ8/Chbsyq52NVowcmCjRCYGYiLlYPTbD+gwiYb1sD770weWhcrwLQ3
 UJL+LKwyQHIAdq5HR0LP4F+QTp3nvYGmIImrTVLQ21/SmrjojBn5o9eM8jdQpPlpXSta
 o46wUhgkbefgas+HWgdXxNVGK2M3nd8b13i4GiohMbV0mUgwLiVFnMjIaovQjNJ+w+3M
 8nOt4kyAP9cMstZmBNuZvlmb2MLC+J8mdzU/7IcoMvxXqAmwucIiRzcLbHLyLhPJvHx5
 Fr26vrB6VTT2OBoigoXxUeYitSqkFkdkAaPJI2nuDxIRp5ifXCA5pl+4MJzPKAVWYOxI
 Nx1g==
X-Gm-Message-State: AOAM532UXOr53pWcbYIOtnTkxu66zelWGHOS2CcNHJaVuALK7+Vx3wno
 JQvG5JSI+/703l3OUZ9msxfqPbFIBVV99XSaQMrEcg==
X-Google-Smtp-Source: ABdhPJz/2Ncz+M5ygbWJNBDzvPIBhaNdHGqtOJj4DOYSYRm4P6Y2jNnB+iVLvtUthbka2OquggAULIoCpDUGJofwbVI=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr4291052ybf.288.1648127021873; Thu, 24
 Mar 2022 06:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_X7d9-e+u3UpB5WvJrmJhhRKdw8EhUzCdFDNVfhFF8mg@mail.gmail.com>
 <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com>
In-Reply-To: <2d9e3abd-99de-dc56-c6bd-93e54cd22b8e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 13:03:29 +0000
Message-ID: <CAFEAcA8TaE9cpioPPmmxvJ-LhofiOZZynbfHmTkoKuRnTEZGHA@mail.gmail.com>
Subject: Re: hang in migration-test (s390 host)
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 12:59, Laurent Vivier <lvivier@redhat.com> wrote:
>
> Perhaps Juan or Thomas can help too (added to cc)
>
> Is this a regression?
> It looks like a bug in QEMU as it doesn't move from cancelling to cancelled.

This test has had intermittent hangs, especially but not exclusively
on s390, for a very very long time, so I don't think I'd call it
a regression. (I've also seen it hang occasionally on x86 macos host.)

-- PMM

