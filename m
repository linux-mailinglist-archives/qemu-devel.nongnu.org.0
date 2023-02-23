Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2A6A128B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:05:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJht-0004cR-NK; Thu, 23 Feb 2023 17:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-eL3YwYKCsQ2okxtmqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--seanjc.bounces.google.com>)
 id 1pVJhm-0004bz-6S
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:04:47 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-eL3YwYKCsQ2okxtmqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--seanjc.bounces.google.com>)
 id 1pVJhk-0003J1-9W
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:04:45 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 gf1-20020a17090ac7c100b002369bf87b7aso240636pjb.8
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=op+oy1YDQ7KvdZybV8OQUjUsRVDUyPKIIdxPtDryYlQ=;
 b=loBUhV2zLEQLuXPAW0C42cV8HChQm+pD/ZksSVAMsDKYrQdAR3kp9e9EJq4/oYonCT
 bkTf7yAdDIo6UGCpl9Qrmya6clGcxszcv4f25JRukUVThLzanXyrYQJ9vIjFMDF2LpvR
 hDgLQqCguoqdP6p43Mjdij9EHG/hnrHRMrt/QvC5L35IHXK5AjHSqu0tDk/4XkBRNHn3
 x5gKkgDmQ+cxcN2X6vAf6lJyVYtfYS/H81gwvSRPAWl4rTcZvf3W2Gjdo8hWTH30njae
 /mZZd4VR+cDnHLfmh/nxOMWOzWA8lyKh0OrsOW0Ztc3+LKv77rHYp1iodZo8My1zLiJM
 HDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=op+oy1YDQ7KvdZybV8OQUjUsRVDUyPKIIdxPtDryYlQ=;
 b=t4tpl5tPgqpEFfLJcIrz9RpT2GuNlNK/Ry5aMWuqee9CorZaBp4m0OXTrq4QwNIl4r
 FeL5NGY/9QfIpxEn6fmg4Z+TOehQcExbUxU9umUD0syvI7/OUdGJWDy++Av/zraME2zM
 8rdNC/1afz7yN5sBOVJ/kXio+DC6VBAjl7cu34ITbxMhGDdPUQiZCPhUYCOoBhbMsPKB
 VMfjg0mj5dGDWo03JBpaT2wrCgaiMrWKDjPaArhnxi83ZrlRtuno96khi4QR3hsJgtiA
 DhNeW6s3KEwWVFOioQfn5YzHkGlHAQfkq1/KYYcB/UocZr+e6Tg6U7HHiiOu2NPodngA
 QSxg==
X-Gm-Message-State: AO0yUKUxAYGXtcIQvtlRTed1kWcvuB9tQU6J2AFZ4G/11NPORhJcs26C
 VagExL8sHJ0spcRfR/7oRfK7Rs2HWEk=
X-Google-Smtp-Source: AK7set+y2SobsE7Atxlq3uiiFWoOB6fnx5tYBQ74THwpR6KRCJyGX9C9kHG0Txo1l5oIjPYqGARtUtw1MR0=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:7e41:b0:196:433e:2378 with SMTP id
 a1-20020a1709027e4100b00196433e2378mr2165787pln.4.1677189881819; Thu, 23 Feb
 2023 14:04:41 -0800 (PST)
Date: Thu, 23 Feb 2023 14:04:39 -0800
In-Reply-To: <87o7qof00m.fsf@secure.mitica>
Mime-Version: 1.0
References: <87o7qof00m.fsf@secure.mitica>
Message-ID: <Y/fi95ksLZSVc9/T@google.com>
Subject: Re: Fortnightly KVM call for 2023-02-07
From: Sean Christopherson <seanjc@google.com>
To: Juan Quintela <quintela@redhat.com>
Cc: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, Paul Moore <pmoore@redhat.com>,
 peter.maydell@linaro.org
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3-eL3YwYKCsQ2okxtmqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--seanjc.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, Jan 24, 2023, Juan Quintela wrote:
> Please, send any topic that you are interested in covering in the next
> call in 2 weeks.
> 
> We have already topics:
> - single qemu binary
>   People on previous call (today) asked if Markus, Paolo and Peter could
>   be there on next one to further discuss the topic.
> 
> - Huge Memory guests
> 
>   Will send a separate email with the questions that we want to discuss
>   later during the week.
> 
> After discussions on the QEMU Summit, we are going to have always open a
> KVM call where you can add topics.

Hi Juan!

I have a somewhat odd request: can I convince you to rename "KVM call" to something
like "QEMU+KVM call"?

I would like to kickstart a recurring public meeting/forum that (almost) exclusively
targets internal KVM development, but I don't to cause confusion and definitely don't
want to usurp your meeting.  The goal/purpose of the KVM-specific meeting would be to
do design reviews, syncs, etc. on KVM internals and things like KVM selftests, while,
IIUC, the current "KVM call" is aimed at at the entire KVM+QEMU+VFIO ecosystem.

Thanks!

