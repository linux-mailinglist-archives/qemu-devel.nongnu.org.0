Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B42E876A
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 14:14:00 +0100 (CET)
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvgjI-0007WC-0x
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 08:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvghv-0006sM-My
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:12:35 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvghr-0007mu-3D
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:12:35 -0500
Received: by mail-ej1-x630.google.com with SMTP id d17so30385750ejy.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NQRcdm66eFqBxdFHQtsQf6wh6Hmm8TeiToYHA4o5/YE=;
 b=Ughfb+6tTCWUBEGCQBz/I7QCewkzV23XZk6znIQqiidIWBnRO2un4+dSK+DBDMYeDM
 QIuEnIgH+zYLyEFlAdjpDOp/kJ5ZvtOMtNxcTXQE6mP8h6nkLsyQqvWcbUouOvv0AxQ2
 CEe65HiBvUMw//zlNZKDkymeS0geZckQy2ph49sxqfS91hX2JiSefs/n4xC9dubOmwIj
 +/cSiC9MFl0OEya1/cOCy65c0/3fHqrlG3DNiMDb28Zsi+ZcfBOGv0+x5FVgI0CaLXsB
 pehGN7VKZ3HEhxMvli8KJzy0Iw6QOrz8hN5vtVnDYPqsKqQBnY2ZnbXNTDJnmYe+a2Xu
 TtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NQRcdm66eFqBxdFHQtsQf6wh6Hmm8TeiToYHA4o5/YE=;
 b=kPTGPMqdZAWAbL0W8n/ni1CK4e8ql4asoImv4M2kylxYGuPL6xaUOdiw0HibGdkzap
 FhsmXv8bpa8BHOIe4wuH/3u2s1pKU4qTQgv+J4BI9hKBtZJKpuLbFIQKvuEhPOrAuskr
 MvmTFLDJC2PYiouCe0B1W5NgfcklJFQ6l8Tig7IQeX5DWxaZhJfODzVTlUy3dz8imz9U
 Fa02PpwduNfhKLMBnxUn+GeNTQVBN8CyA/xXILjGOuA7ct5hflNu2ju9YOPPNA/OrLYs
 ZC0PmzhZEzGlYiX38xAPzGpiMti05PTs5Q3GJaYnJs96MPQjH8DAHnNs35zz2jWkZAeF
 jlxg==
X-Gm-Message-State: AOAM533+jhCUgKba67so3X1Lp0nIQ1os6hcF6SHdtKLkm7gLywIBidD6
 f/pTlHf+i94wCZY3Oyw+0O6HBED9B5R/yo6ZgIg74gP/P3k=
X-Google-Smtp-Source: ABdhPJwNsDJW6fYS2o94BBGf2GIu9g2yWctI5L8M81BLK6/pQhumbct9UwZqz3ctst3f/Re9k45tdRK9fJBcucVAJq0=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr59865657ejf.407.1609593148466; 
 Sat, 02 Jan 2021 05:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20201223212735.512062-1-ehabkost@redhat.com>
In-Reply-To: <20201223212735.512062-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jan 2021 13:12:17 +0000
Message-ID: <CAFEAcA-3J5C5zaRfZE1TFRry8v4TXam_YNsw7+x-tVy9GiLsvw@mail.gmail.com>
Subject: Re: [PULL 00/15] Machine queue, 2020-12-23
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Dec 2020 at 21:27, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit a05f8ecd88f15273d033b6f044b850a8af84a5b8:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20201217-1' into staging (2020-12-18 11:12:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to bdd5ce050d086e9f63874f1f36e9e39fa27a976c:
>
>   bugfix: hostmem: Free host_nodes list right after visited (2020-12-18 15:20:23 -0500)
>
> ----------------------------------------------------------------
> Machine queue, 2020-12-23
>
> Cleanup:
> * qdev code cleanup (Eduardo Habkost)
>
> Bug fix:
> * hostmem: Free host_nodes list right after visited (Keqian Zhu)
>
> ----------------------------------------------------------------
>
> Eduardo Habkost (14):
>   qdev: Move softmmu properties to qdev-properties-system.h
>   qdev: Reuse DEFINE_PROP in all DEFINE_PROP_* macros
>   sparc: Use DEFINE_PROP for nwindows property
>   qdev: Get just property name at error_set_from_qdev_prop_error()
>   qdev: Avoid using prop->name unnecessarily
>   qdev: Add name parameter to qdev_class_add_property()
>   qdev: Add name argument to PropertyInfo.create method
>   qdev: Wrap getters and setters in separate helpers
>   qdev: Move dev->realized check to qdev_property_set()
>   qdev: Make PropertyInfo.create return ObjectProperty*
>   qdev: Make qdev_class_add_property() more flexible
>   qdev: Move qdev_prop_tpm declaration to tpm_prop.h
>   qdev: Rename qdev_get_prop_ptr() to object_field_prop_ptr()
>   qdev: Avoid unnecessary DeviceState* variable at set_prop_arraylen()
>
> Keqian Zhu (1):
>   bugfix: hostmem: Free host_nodes list right after visited


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

