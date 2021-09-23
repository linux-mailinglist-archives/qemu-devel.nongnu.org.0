Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7C4158EC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 09:16:44 +0200 (CEST)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTIyJ-0005qO-2S
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 03:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTIwD-0004xF-Eb
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:14:33 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTIwA-00056b-Pk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 03:14:33 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n18so5363223pgm.12
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 00:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=c8V3IDOXZHJK3ehTvL9cy4Jbkf2JzWN4Ozk+Oa0q4n8=;
 b=02ATylKGtr/kMy53q4lWPUcG1jKKr4N4TSKipbScL/K0Itbm2zCnFUJD8EimdeW6Ri
 qylSEjfnYp80xRdBqCBpVVVeq15fXtWGF3Fs4JCQMzf8kD0WSAhjDuNiwbZsA3ysyKrG
 WTE/STXt9NjmwCWMVVT5VG088nY8lCYSAACYXuaiuXIRoVe/anPM/uMCIXfzLBIRTw1t
 2sOQD0pXBgZdGC9L43QlvNAHcLZxslc4u2l9YD3YHcksM1xMkYQkEw8YPS+yLOP/+O5K
 1IAFiOHdxKjWRpNOtakh842AhZ8giIxWPtqcMxjB5u9TxeS3NLSAabZ8deEQCoorS8fn
 UL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=c8V3IDOXZHJK3ehTvL9cy4Jbkf2JzWN4Ozk+Oa0q4n8=;
 b=OgsCsUxyateAlmVV8i8ErnkWxHmkICB9Ow3+E+UoaRF3VNkQmBdVCXFDWJTppCoG+b
 quUrQIg7KKPO62RqzMvactLNkPh1mCCcC40LqHQJcTkbDYFUSsuGA4fgdd4wtQ/LT6BD
 j5OQceDpeWoXBB340YHJ4Fl3Ovnc0C92kCCrXZtUR+jFANLPFoz+vGDokI8RXpvcvWUM
 eIpswB63FxCxhRDtCJDLeAgzzpxmvz41BYH5HLFynbYlH77T98s99D8u4uzT/+MF1BIQ
 54s9YTA/ENxZ8sMOaOyBKoFjPP5NAbv2g7uz5hg7K7LsLS1Kq07H7WNT1PPV0aYOiew7
 v/MA==
X-Gm-Message-State: AOAM531w+nuY6ctMjOhVj0WKgd7w5qrNC9TjuvdyaJpUtC2m/IYhjaPw
 9m375mmgOzqTKVJ/8vHlg0vaKA==
X-Google-Smtp-Source: ABdhPJzaQCC154aHMpbYW/qv0HRY5i4a5LNWcu7XkpEl/kQhM4UmaO/K19gM9M6e0ICGV8KW+1WQDA==
X-Received: by 2002:a63:ac57:: with SMTP id z23mr2853333pgn.239.1632381268471; 
 Thu, 23 Sep 2021 00:14:28 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id bv16sm4331250pjb.12.2021.09.23.00.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:14:28 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 12:44:22 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <20210920070047.3937292-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2109231244190.630@anisinha-lenovo>
References: <20210920070047.3937292-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ...

On Mon, 20 Sep 2021, Ani Sinha wrote:

> This patchset adds a unit test to exercize acpi hotplug support for multifunction
> bridges on q35 machines. This support was added with the commit:
>
> d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
>
> changelist:
> v1 : initial RFC patch.
> v2: incorporated some of the feedbacks from Igor.
> v3: forgot to add the ASL diff for patch 3 in commit log for v2. Added now.
>
> Ani Sinha (3):
>   tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
>     table blob
>   tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
>     for q35
>   tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
>     test
>
>  tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8435 bytes
>  tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
>
> --
> 2.25.1
>
>

