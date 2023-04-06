Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164B6D9297
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 11:23:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLos-0008EU-OF; Thu, 06 Apr 2023 05:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkLoq-0008EG-R2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:22:12 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkLoo-0002dK-W2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:22:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ek18so147791953edb.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680772929; x=1683364929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DCFPMN6HO64v1XdZAQn1ECwvM+eLfdzSfeIBcfNkHv4=;
 b=wGj7WRpfAknZqSbbqUMwaoVj9TnK1WBW2Kfw0xJ6Dn9rxYB9OkON/EoMlZdhoyzXN8
 MJb31lQBvlJHSHxQ1/IJx/MHvh0KdCPb4xRFIPDsolRU9xK4PzC+5r6JV7fp4o63MOmV
 NMRXoRTwYvWUn7mAQ2GAHUcC7Lq727MXV7j+xQTfAUe6i4xLuYYXfM3ppeykvBBTpuZA
 tjr3uGmVp0OEEjbAI/lnvDOIoBwybw7aCxDD85b9vf436KFyyCSfSJLPCDhExqDNxQRG
 8bSvtGK2LC7L8i+Ks4KaY/ej0TA4qyKIE4DdW11y66xxUl4Q6ceWTkqhXK+4vrijwFqq
 fESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680772929; x=1683364929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DCFPMN6HO64v1XdZAQn1ECwvM+eLfdzSfeIBcfNkHv4=;
 b=rQ1la/1Dxn9mJ00ImSZpJaSOb+tON0zbUV+WKvntCeRIhrpUh9/vP8jH8WsF09bMqF
 lWaI/ZsfZAR9Jgx2y0Vk/7uEGHCLLElLd/qcjz35Zhwa/j3X+jdTvFhJO6LSnBxqEKwt
 PO9CGEs6xZ3oQqW7OIivOqLciEXjqm7gxgktJbEoq1ZMPtzIVVlrcWJ99/M8Knq/aqkk
 98ox3v4Nwy+WHQ5DkGUeMqWUhfFcB8pe4i3jWqU9AF3J57CQjgG7nkqt/Im5w+zZjPiF
 aJgtUV8ZfNrOXlAu1QBlvYWIVTXSLzyKNyXdWzhVkE/OvyfRGyeomYuE8rHFwcs7YWxj
 0ipw==
X-Gm-Message-State: AAQBX9fWsnjTIYqN8FgarXV8Ih99DGurFItstQ2KgxkLpOl9G2ots+M+
 rDyKK1wQKUrcDThm6xbk3PVxrXuM4CSDN/VlrdBmww==
X-Google-Smtp-Source: AKy350bsIaQcbc0f+hfVDN/oLB8EroOBzhsDLjx0vhF4XHeqW3k5s8bJi9Eqv5QJekebDSERojEYAXAeGrnIB9r1I6Y=
X-Received: by 2002:a17:907:8c0b:b0:92f:41e4:e48b with SMTP id
 ta11-20020a1709078c0b00b0092f41e4e48bmr2859530ejc.6.1680772929109; Thu, 06
 Apr 2023 02:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
In-Reply-To: <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 10:21:58 +0100
Message-ID: <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
Subject: Re: s390 private runner CI job timing out
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Thu, 6 Apr 2023 at 07:57, Thomas Huth <thuth@redhat.com> wrote:
>
> On 05/04/2023 17.15, Peter Maydell wrote:
> > The s390 private runner CI job ubuntu-20.04-s390x-all seems to have
> > started timing out a lot recently. Here's an example where it passed,
> > but with only 53 seconds left on the clock before it would have been
> > killed:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/4066136770
> >
> > It looks like 'make check' was about 30 minutes of the 75 minutes
> > total, and compilation was 45 minutes.
> >
> > Any suggestions for how we can trim this down? (Presumably we
> > could also raise the time limit given that this is a private
> > runner job...)
>
> I don't have access to that system, so I can only guess: Did you check
> whether there are any other processes still running (leftovers from earlier
> test runs)?

I did check for that, as it's been a problem in the past, but
no, in this case no other jobs are running in the VM.

> If not, it's maybe because it is a VM that is running with other
> VMs in parallel that hog the CPU? In that case, you could contact the owner
> of the machine and ask whether there  is anything that could be done about
> it. Or simply increase the timeout a little bit more... (our highest timeout
> in another job is 90 minutes, so I think that would still be OK?).

Christian, does our S390X machine get a guaranteed amount of CPU,
or does it depend on what else is running on the hardware?

thanks
-- PMM

