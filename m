Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F540EA3C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:49:43 +0200 (CEST)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwS6-00012z-9c
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQwPG-0006al-BV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQwPE-0000Cz-Or
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631818004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hfxa//CuzX4QxWlabn+JBGAQaVNvVFno08VBw5KyPL4=;
 b=c8/ovEGEcT9sn96PGFxngntBasVdz7C6D2x1eVgaG9K8YnlZYDc33u/S3ze5yY8hEMvB62
 65WnYPpMP/9LW3QbBm8J/AtUkPK09biHe6HiuvLsDJwVf+cXxCVSpKACjc8gVVYwkdnVA/
 xt4WRuPZxnXy0yJPnLy2380DtD0g+YI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-08_q0LJyNHK7OpfFZUFmuA-1; Thu, 16 Sep 2021 14:46:40 -0400
X-MC-Unique: 08_q0LJyNHK7OpfFZUFmuA-1
Received: by mail-pl1-f200.google.com with SMTP id
 m18-20020a170902db1200b0013b994f3709so3844171plx.20
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 11:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hfxa//CuzX4QxWlabn+JBGAQaVNvVFno08VBw5KyPL4=;
 b=PgQSEPpV2Bg+wZMR4P9u6RBwz5/JcCx0y/mwaO37BCFkmRimLNa2kJ22niuW88BT1P
 Ah1biuFhx6AXHPyIegnDv0bBE1ZrPp5UrEyL8X93cosNtCsZN/m64HRUytjb4AJggB76
 RY6CU4UpN6AKbpPqKy3tiLEyoPohpQPM1+PHQDy8QwwmSowNmZWDU8EOSpMKtKVfUlPs
 ihL7DSSI52V6ktt2RUWtoF5wL09g8X6TN71WoayHskpwtBg70X8K8YeJuiE2HD/33FsG
 dqA2Bog52HBjQEhDBBsPtpf6Mdu4BymjJ4SvaqiLlYBWUWm0OoVfzBkaNgrio+QukM7E
 KdsQ==
X-Gm-Message-State: AOAM532zV9Z8xBMYkAdoQxPbcZi+plIdruJz41C5CiHXKFUg5lS7kjwn
 HkaEPIG0vMDrvZ1hvxw+esnQuvNIaKDSriUAcsVP5R7+iIQVeemNF4WA+NaDZVlFFd2rNQulzB4
 PKLKmbLR2/FF8Cx8RqBXXqoFaGgpEdfA=
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr7595528pjb.203.1631817999347; 
 Thu, 16 Sep 2021 11:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB0XZPlp0dswA12F9NXvJnHMaicxqOCYblYVXGyWgBYXzBuOvJSPHdQw4VEkos3tmBkTbNzS7IhTFuFPebmMU=
X-Received: by 2002:a17:90b:14cc:: with SMTP id
 jz12mr7595519pjb.203.1631817999176; 
 Thu, 16 Sep 2021 11:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210916182248.721529-1-jsnow@redhat.com>
 <20210916182248.721529-2-jsnow@redhat.com>
In-Reply-To: <20210916182248.721529-2-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 16 Sep 2021 15:46:13 -0300
Message-ID: <CAKJDGDYGHkmcXVMPrBDqijyfkRz9DkpuvptvRwjn5h4hx=NM1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] python: Update for pylint 2.10
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 3:29 PM John Snow <jsnow@redhat.com> wrote:
>
> A few new annoyances. Of note is the new warning for an unspecified
> encoding when opening a text file, which actually does indicate a
> potentially real problem; see
> https://www.python.org/dev/peps/pep-0597/#motivation
>
> Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
> terminal output. Note that Python states: "language code and encoding
> may be None if their values cannot be determined" -- use a platform
> default as a backup.
>
> Notes: Passing encoding=None will generate a suppressed warning on
> Python 3.10+ that 'None' should not be passed as the encoding
> argument. This behavior may be deprecated in the future and the default
> switched to be a ubiquitous UTF-8. Opting in to the locale default will
> be done by passing the encoding 'locale', but that isn't available in
> 3.6 through 3.9. Presumably this warning will be unsuppressed some time
> prior to the actual switch and we can re-investigate these issues at
> that time if necessary.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 7 ++++++-
>  python/setup.cfg               | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


