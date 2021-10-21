Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA26435B4A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:04:49 +0200 (CEST)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdS87-000487-VX
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdS4L-0000tG-RW
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:00:54 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdS4G-0004D4-WF
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:00:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id x66so1690254pfx.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 00:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QEWEr1fL585rvaUV913RZt8Jt30+iWc1hzhIZ1JYeX0=;
 b=DM3MuAKrBiILdbvKWs4b2ehPGcAJ2LwIWyZMqdUvKQnQ2H1f/jgAqvGRFKX8wdHuPA
 XYTAu1loWEf3pmxH5Y6pwwCgwiFAlDDSlPH6shDi6ZT8O8uToasB3i5mjHHoNRefYxIX
 qrf40zRWg7Kd3UuD6uSFAO/pN6N0uiKNlO9qS4NimV1dWQ28qYyC69JNUkXXd0lOMApk
 ReHA/OyKEnYI1SnFmeEeJg0rEWLEuuWD7E6inQdyQ8Av9ToTUlWPdj5DfUaY1RHX+c/4
 0FD+wtcPjSD739yy4btVFmEjKpAJhQto5U6toc/DtD0x2qUYpDzICmnq1mns6FFD6scw
 xklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QEWEr1fL585rvaUV913RZt8Jt30+iWc1hzhIZ1JYeX0=;
 b=tivpbvDe3v8iduL/LRPdYYbxLyOGtd1vyuA+HEZARluj7c62tacP2S62FVjYHxeXA4
 Uv/AP5FoDzr3yb1rZp/Fig1ZPIQsRgP4Wy4nwG7HhKgAxexf1pvcjIVQG1KnAbbufDHn
 CuZKCUEyMXts/bCDERZq+arzZgtJSbwVAE3qMxjCHcqa3H9XZZvFW7l9WGON33TJfZb/
 suJKP+xkKrdODj+wp8D1Ot51JXeINoLWXVuSsPbHhTfV/OItCPE+nmv2uR+I3vUYa46B
 q4SH6sN8XnSfBC+gBZY4OcJDkaTC7fZApFFnfdQ8IzlTTqtpQPg91o9LOqtiAfk894i0
 yHDw==
X-Gm-Message-State: AOAM533qMrP+09jxq12cw9lWmFVmXE60B0zk86zSFh+c/u83cuFS7Ljl
 CgEdt3pC+ed7/OPkNGHEDY6HSA==
X-Google-Smtp-Source: ABdhPJz9TyjErNjy2/ZRThUapYEFlWsxDASZbEpVSSQaum1hPLaMQKZzEBq442ta9oznadDdG2lFAQ==
X-Received: by 2002:a05:6a00:b46:b0:46f:4d87:bd77 with SMTP id
 p6-20020a056a000b4600b0046f4d87bd77mr1518758pfo.21.1634799645831; 
 Thu, 21 Oct 2021 00:00:45 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.246.18])
 by smtp.googlemail.com with ESMTPSA id om5sm4790736pjb.36.2021.10.21.00.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:00:45 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 21 Oct 2021 12:30:40 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <20211021021635-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2110211228240.235596@anisinha-lenovo>
References: <20211007135750.1277213-1-ani@anisinha.ca>
 <20211020043845-mutt-send-email-mst@kernel.org>
 <CAARzgwxh6g=p7UNsKnwPw9EKf+5kAv4Z0s2Bw8qvmX1Lc38wxQ@mail.gmail.com>
 <20211021021635-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 21 Oct 2021, Michael S. Tsirkin wrote:

> On Thu, Oct 21, 2021 at 07:18:43AM +0530, Ani Sinha wrote:
> >
> >
> > On Wed, Oct 20, 2021 at 2:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> >     On Thu, Oct 07, 2021 at 07:27:47PM +0530, Ani Sinha wrote:
> >     > changelist:
> >     > v3: removed "nodefaults" from the command line and rebased the patchset.
> >     > v2: incorporated some of the feedbacks from Igor.
> >     > v1 : initial RFC patch.
> >
> >     This seems to break on s390 hosts for people. Likely an
> >     endian-ness bug somewhere. Dropped for now - care tracking that down
> >     and fixing so I can pick up the test again?
> >
> >     Thanks!
> >
> >
> > So I take it this patch wasn't causing the issue since this has been merged to
> > master now?
> >
> >
>
> Yes, we knew the bug is in the tested functionality not the test of
> course. With help from Thomas I was able to fix the original bug.
> The fix with more detail is here:
>
> commit 0e464f7d993113119f0fd17b890831440734ce15
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Wed Oct 20 05:48:54 2021 -0400
>
>     pci: fix PCI resource reserve capability on BE

BUG is quite old, since the time the function was actually written -

70e1ee59bb94 ("hw/pci: introduce bridge-only vendor-specific capability to
provide some hints to firmware")

I doubt in BE systems it ever worked.



