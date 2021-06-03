Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C801B399B8D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:27:38 +0200 (CEST)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohlR-0006GQ-Bw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohkP-0005bD-3R
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohkL-0004jV-VV
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622705188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tm7uvOaf0IVcC/NxuxCOo8O+E0zi1nGv8685U84gR9I=;
 b=abl8vaujQV65NCm+5Qo9xfLM+VMKlIZ1/eReVahUun9a7tGIVxCeG/nfb1u31yP041+SF9
 MRigyh/akYmUbgPJseaSh2TG7g+f5gYCleHmN6kP+0PqE1Si6tmqxXF7NG7iLTApvhPfG0
 QyG2O409zZwz/qFDHZnHBUuZ4AdYveE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-Xm9PpkQuNpqpWJjL3XwaqQ-1; Thu, 03 Jun 2021 03:26:26 -0400
X-MC-Unique: Xm9PpkQuNpqpWJjL3XwaqQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y7-20020aa7ce870000b029038fd7cdcf3bso2803187edv.15
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tm7uvOaf0IVcC/NxuxCOo8O+E0zi1nGv8685U84gR9I=;
 b=BMkZMaxjhL2Lo5mwSguhjCALSSTyPQxc2fs5w+/W90QON47Aj3BILYMatN8bQVktHx
 +IrX2YzjYAuOtxJZOzjIxgiLkM+fPGccgxO48ioMBLmEn5o19h5ei2grz2jweXUkUORq
 AKTOY7tpVDmjKwHeg1yUb0X+JiO5UFWVwhkLgnEL/dIM9Q0ROZh9rb70+1fsl0ZEVOgP
 TvXhBjNVmDt7YQCuFusnOh1MCfipbE7vyjRYc4cuJZpxS8h3orfK90noiMz5pbzjyZ7B
 b3WsBIgXNDvJC/2hV1CxsNsxWWrpmnl0zWp2VRH3EDw0eLiXwXrnVUxYbx17hcgi/rXy
 FYpQ==
X-Gm-Message-State: AOAM532v5EUAbFLSI3jIGCKvq/3HHqGsCUb88ujmDfrMcmAsYXlRebrf
 ls9vgD9F8BGnZu731yA6ZtPuRbWg6Olfq21SzFQVoUQv8e9nW/CbjkvHtOwdf+u50Gc9FDdoVtE
 6tNppAlPrpr25Gro=
X-Received: by 2002:a17:906:6981:: with SMTP id
 i1mr37515096ejr.289.1622705184194; 
 Thu, 03 Jun 2021 00:26:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO1Qsq75OHY4Igr9dPmwyYJAy6Sz8T/TyXjfybwoxNb4iGK7x+NLC/2Uy7LT60zK4Qe01f2w==
X-Received: by 2002:a17:906:6981:: with SMTP id
 i1mr37515074ejr.289.1622705183985; 
 Thu, 03 Jun 2021 00:26:23 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bh2sm1114166ejb.80.2021.06.03.00.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:26:23 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9166bbc-0201-af02-d54b-af4638525ceb@redhat.com>
Date: Thu, 3 Jun 2021 09:26:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603001129.1319515-2-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:11 AM, John Snow wrote:
> Based loosely on libvirt's template, written by Peter Krempa.
> 
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab/issue_templates/bug.md | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 .gitlab/issue_templates/bug.md
> 
> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
> new file mode 100644
> index 00000000000..9445777252b
> --- /dev/null
> +++ b/.gitlab/issue_templates/bug.md
> @@ -0,0 +1,63 @@
> +<!--
> +This is the upstream QEMU issue tracker.
> +
> +Before submitting a bug, please attempt to reproduce your problem using
> +the latest development version of QEMU, built from source. See
> +https://www.qemu.org/download/#source for instructions on how to do
> +this.
> +
> +QEMU generally supports the last two releases advertised via
> +https://www.qemu.org/. Problems with distro-packaged versions of QEMU
> +older than this should be reported to the distribution instead.
> +
> +See https://www.qemu.org/contribute/report-a-bug/ for guidance.
> +
> +If this is a security issue, please consult
> +https://www.qemu.org/contribute/security-process/
> +-->
> +
> +## Host environment
> + - Operating system: (Windows 10 21H1, Fedora 34, etc.)
> + - OS/kernel version: (For POSIX hosts, use `uname -a`)
> + - Architecture: (x86, ARM, s390x, etc.)
> + - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
> + - QEMU version: (e.g. `qemu-system-x86_64 --version`)

I haven't reviewed earlier version, but I wonder about the "build from
sources" use case (this is not a template for distributions but for the
mainstream project), so maybe add:

  ## Build environment (in case you built QEMU from source)
  - configure script command line: (e.g. ./configure --enable-nettle
--disable-glusterfs --disable-user)
  - configure script summary output

> + - QEMU command line:
> +   <!--
> +   Give the smallest, complete command line that exhibits the problem.
> +
> +   If you are using libvirt, virsh, or vmm, you can likely find the QEMU
> +   command line arguments in /var/log/libvirt/qemu/$GUEST.log.
> +   -->
> +   ```
> +   ./qemu-system-x86_64 -M q35 -m 4096 -enable-kvm -hda fedora32.qcow2
> +   ```
> +
> +## Emulated/Virtualized environment
> + - Operating system: (Windows 10 21H1, Fedora 34, etc.)
> + - OS/kernel version: (For POSIX guests, use `uname -a`.)
> + - Architecture: (x86, ARM, s390x, etc.)
> +
> +
> +## Description of problem
> +<!-- Describe the problem, including any error/crash messages seen. -->
> +
> +
> +## Steps to reproduce
> +1.
> +2.
> +3.
> +
> +
> +## Additional information
> +
> +<!--
> +Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
> +If using libvirt, libvirt logs and XML domain information may be relevant.
> +-->
> +
> +<!--
> +The line below ensures that proper tags are added to the issue.
> +Please do not remove it.
> +-->
> +/label ~"kind::Bug"
> 


