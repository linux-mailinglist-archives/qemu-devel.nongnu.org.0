Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653BF44A79A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:29:04 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLZ1-0005CL-5D
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkLNy-0008QJ-2C
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:17:39 -0500
Received: from [2607:f8b0:4864:20::d31] (port=44991
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mkLNu-0004Kk-IL
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:17:36 -0500
Received: by mail-io1-xd31.google.com with SMTP id f9so21441910ioo.11
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 23:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7WtYJ9EuXMavnS9+dpgw1Dy7dte1tlu66IIFJY/z9ZU=;
 b=xnyuQ0nES5viJ7WAr3dnaRrFE1THk/0rvcvEQe0ezf/CJShp6z5GQY1fatkhfR/5EH
 mcV4O7/zMBDyx/dwT6PRdlGtaQvoFvEcie/fh+kArhWUXIY8CInrGCIeLbFE4jKkFEPb
 ebqkV0CTmjJ70lAuMflgNzIv9Tn4mNxtrVS4V09R2jj9ZTSfTYqMfxyQTb6sAmAjO64F
 gRJLSHnt0eSTnFv8QN0Fe56pP+uOcQWuBlx9Y0UKA0uPxEIcy8+yUHE/5VLymEmMz+yp
 IX9rkH+Ykcri78Uv8VT5jRZPCIXGHOH/60LSjbJj7D4PTBUdBMeVh+wEAdFnh7MdNGfj
 w7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7WtYJ9EuXMavnS9+dpgw1Dy7dte1tlu66IIFJY/z9ZU=;
 b=OjizRSCXrDUesvvrfGSYsD+3G5yFt9UdpgTQNf912IHnkSHkYvpWVMXSExeJBoE32P
 W8VE/ie33/lg50tOGF/cLCMfEQNST9t/CMbwMybzswWddSRY0eC9KmjGo2zyTqNjPBCA
 XrIgwuXk+9Kwk+XzKETwoVoucczarH66LV35YkxCwC5CKrycb9oQBjHd+hbNWDwsZKqu
 IRwpSzJiPgMOhFMF7zcyVxumvOwjl8cb/4ZgUoNeI0KuHqcaqwGeM4/qTCMskwzRhPoy
 isuDepFA2OtBt6Gl9v0LdBA20u+1aWAHUcb/83VeG+uFBdS+O8BO3VJ+ZafOqPkl0ZrK
 k8cg==
X-Gm-Message-State: AOAM532tJg5L468ag4D1ag4hsxfYAHebZkN1IwZmCFVOm5qtRjE7nyT3
 Z0VuhU7LxqDd2OlOx/DXOFJsFYl5ZdXKzvYu
X-Google-Smtp-Source: ABdhPJyLIiH+TNcQNc8wazXAm3jFV2Q8AabESuoNXY2XFKFiC6ilia1ILx8vCH3o+Bwhlg0r+ZV+pQ==
X-Received: by 2002:a65:5ac5:: with SMTP id d5mr4171042pgt.165.1636441905210; 
 Mon, 08 Nov 2021 23:11:45 -0800 (PST)
Received: from anisinha-lenovo ([49.207.218.162])
 by smtp.googlemail.com with ESMTPSA id x2sm15537980pfd.144.2021.11.08.23.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 23:11:44 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 9 Nov 2021 12:41:39 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Annie.li" <annie.li@oracle.com>
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
In-Reply-To: <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, "imammedo@redhat.com" <imammedo@redhat.com>,
 jusual@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


+gerd

On Mon, 8 Nov 2021, Annie.li wrote:

> Update:
>
> I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well in q35
> guest. Seems this issue only happens in q35 guest w/ OVMF.
>
> Looks that there is already a bug filed against this hotplug issue in q35
> guest w/ OVMF,
>
> https://bugzilla.redhat.com/show_bug.cgi?id=2004829
>
> In this bug, it is recommended to add "-global
> ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu command for 6.1.
> However, with this option for 6.1(PCIe native hotplug), there still are kinds
> of issues. For example, one of them is the deleted virtio_blk device still
> shows in the Device Manager in Windows q35 guest, the operation of re-scanning
> new hardware takes forever there. This means both PCIe native hotplug and ACPI
> hotplug all have issues in q35 guests.

This is sad.

>
> Per comments in this bug, changes in both OVMF and QEMU are necessary to
> support ACPI hot plug in q35 guest. The fixes may likely be available in QEMU
> 6.2.0.

So we are in soft code freeze for 6.2:
https://wiki.qemu.org/Planning/6.2

I am curious about Gerd's comment #10:
"The 6.2 rebase should make hotplug work
again with the default configuration."

Sadly I have not seen any public discussion on what we want to do
for the issues with acpi hotplug for bridges in q35.

