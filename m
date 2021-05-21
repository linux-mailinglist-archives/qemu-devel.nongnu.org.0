Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6032038C778
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:07:48 +0200 (CEST)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4sV-0006D1-Fk
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk4r1-00049t-Go
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:06:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk4qx-0001RT-E8
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:06:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id d11so20993010wrw.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lSguVo/SiniPd/Dc3gbriaZ9Yhb83Bmle01IQxzetTM=;
 b=UAdz3ovD3g3vFyNDB8O7mfcglQnWFG1pc153qqUCZi+aSvKBgtu0PmzxzOBzSL1K+S
 JrzbB6oc/LEVjZOeoXjw4W2flOKkSHtjMRiwKEQbC6n2nlCpD4QjRErkylrlTs96SZpx
 W7/4wZum7/bnSMJCSGIJHwyb7S55k9RDFBe6Zk2GGDhyVeQJ0t/jTRO/KaIFps5ZIn7y
 zfp0bEqazEua73RCzJ9kiPf0VGLSKX0MEnm9nmEEDl5HdnN10NJMvfYRz2ZPAgDBJk4B
 WmPdfCSFCkQxL5ckwp5lc3eRWB5TQ9hmJHeev2bWeZo9i0zB0RNq1HK8ivQEFYJlimsA
 NzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lSguVo/SiniPd/Dc3gbriaZ9Yhb83Bmle01IQxzetTM=;
 b=XWOXey6TXkMMd0+N+yn5eZs6SzzxLTeSQTJTS5wb8CFHXs6+IvZ2FRotqF5FC4xym6
 ofdtrUuMe7rAj77qms4m4+vcqvpHd2+stRd9wau0YAXlYnY6QNQ0A0Ze6jllYxzuT8AO
 H04bn4/hIONmNfofwyWjEPnrepAIHL79KIcrMfX0DRNOeVxSsz8Np60MkHd60LdFU+aM
 qqK9LNwWBXARUtHI/lXwdWYdT25/zhCR9901q4q9BQTEtm5fHZsteiM6+7z6qVdcVNos
 Y2SuBLZXhQ7ScildghlDO6LIj+nhIt4GIrilBN5DLULFzZRCb63h8hx4fKMDkTOsvXlZ
 InCg==
X-Gm-Message-State: AOAM532oROsK+q1zocQhEfioSCZHIuZXpuMfKNPJi7xtoz38T1LE6sJv
 5f95/xQy6TP0Tx6dN38/ZlhgaQ==
X-Google-Smtp-Source: ABdhPJxggiGSk9MBl6fVD3QN7XAxgbKzHPFtsjqn09TOIueQDxYFAHk0FVIKO0V98aeu92Tk4du7lw==
X-Received: by 2002:adf:fc44:: with SMTP id e4mr9542213wrs.23.1621602369954;
 Fri, 21 May 2021 06:06:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r5sm2084211wrw.96.2021.05.21.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 06:06:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D1941FF7E;
 Fri, 21 May 2021 14:06:08 +0100 (BST)
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Date: Fri, 21 May 2021 14:05:35 +0100
In-reply-to: <82f5ed3f-3047-bfa3-c7b2-d91300f393f8@redhat.com>
Message-ID: <87pmxkb5j3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 21/05/2021 14.28, Willian Rampazzo wrote:
>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
> [...]
>>> Alternatively, what about renaming the "acceptance" tests to "validatio=
n"
>>> instead? That word does not have a duplicated definition in the context=
 of
>>> QEMU yet, so I think it would be less confusing.
>> While at the beginning of your reply, I started thinking if
>> "validation" would cause less confusion for the QEMU project. Although
>> validation testing is a broader concept inside the Verification &
>> Validation process, encompassing unit testing, functional testing,
>> integration testing, system testing, and acceptance testing, it may be
>> an option for the QEMU project.
>> While system testing would be the correct terminology to use, if it
>> causes more confusion, using a less strict terminology, like
>> validation testing, is valid, in my opinion.
>
> <semi-homorous-friday-bikeshedding>
> Or we could come up with a new, artificial name instead (like
> "qtests"). It certainly need a "q" in the name. For example what
> about:
>
> - avoqado
> - valiqation
> - aqueptance
> - inteqration

make check-quixotic?

>
> ?
> </semi-homorous-friday-bikeshedding>
>
>  Thomas


--=20
Alex Benn=C3=A9e

