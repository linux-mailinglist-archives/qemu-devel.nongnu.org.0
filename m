Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833654BF803
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 13:24:31 +0100 (CET)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMUDV-0003YE-LE
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 07:24:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMUA7-0002im-V7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 07:21:00 -0500
Received: from [2607:f8b0:4864:20::52a] (port=36774
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMUA5-0002ff-QH
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 07:20:59 -0500
Received: by mail-pg1-x52a.google.com with SMTP id h125so16871263pgc.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 04:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=MEifxELebUrqKzT4PDfLWOJqkave+d2/vAABByMug5g=;
 b=tmVs8vu2t+NyrS6iqRkps3klSKYQpA2VihyO/Pl2J5jESPjjOg2UO6jwRS2jiuOWiS
 9v6arBFp5FL/75F7mfR2LXJgS1huI5yvlR/KrnsVu/fe42HpcCKqv1etzUjVq3NyehVZ
 MdBmGhCXXtqzny8UnDdjiOCBEWf/rPArMoBGK/ck8Syw+qjFBDr1CY0dSn+CQ01T63rW
 tvroW7qAWt30yGwzD2oWvtxaiHc4fjpol4SF9KN/8CI3XEvV3HxL3mQ2Bu8uFJvj9l3M
 B/7coZqTxgypfyjWGAMSzh4GOSchQop/7JZLsggNfSydRPTo6KVPaKHyuHAMCc84/Cjn
 CASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=MEifxELebUrqKzT4PDfLWOJqkave+d2/vAABByMug5g=;
 b=P5fYQYW9QaxXkPYFIaPSqY5D0Smcj7vnfELo4dhQY4faoRLgFQURQhQlT17/iNfHr6
 OUWesn3akS1UbX6jTec5IXfZMols06u9P/WXUmoXXDTo2WhjQEJroOAQ+Y/+1789G2in
 NNKbnvErqZ9Pj544qQpmbLhrf5Fb6P0v2ky2V4Ll8L6pjO7QsvJXmdTC5H+w2Wzu4V+M
 j5IDEUsqfjGFhnA8Fi1PDJs2Ora4124D8r02puJA43lHaNd9MRIgIpAxnvkTrG8Rf3/V
 o7CzNsUCswblIks3QMyPZleWuFwB2T0J76aMlMh4x9TwK86z6h2ctIMXyT0jmL4oAcMk
 1mgw==
X-Gm-Message-State: AOAM532+sKgK0+ggoa/udbK3ReFEBTropLAvTDNWaqHMMuASPY19HNQ1
 F8e6WE37YuapC7jESsLGfHw1HQ==
X-Google-Smtp-Source: ABdhPJz6H1PEjEjO5oLo4NZEXgcXU3yoBv4d8WwQf3aRGBXjrPv6yW+Gr1Tsc3YE+cDEpNwV0nO/Rg==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr24560476pfk.47.1645532453979; 
 Tue, 22 Feb 2022 04:20:53 -0800 (PST)
Received: from anisinha-lenovo ([115.96.128.14])
 by smtp.googlemail.com with ESMTPSA id h4sm16565256pfv.166.2022.02.22.04.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:20:53 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 22 Feb 2022 17:50:48 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v2 0/2] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <20220221191323.617323-1-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202221746460.728317@anisinha-lenovo>
References: <20220221191323.617323-1-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: ani@anisinha.ca, imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 21 Feb 2022, Liav Albani wrote:

> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
>
> To allow "flexible" indication, I don't hardcode the bit at location 1
> as on in the IA-PC boot flags, but try to search for i8042 on the ISA
> bus to verify it exists in the system.
>
> Why this is useful you might ask - this patch allows the guest OS to
> probe and use the i8042 controller without decoding the ACPI AML blob
> at all. For example, as a developer of the SerenityOS kernel, I might
> want to allow people to not try to decode the ACPI AML namespace (for
> now, we still don't support ACPI AML as it's a work in progress), but
> still to not probe for the i8042 but just use it after looking in the
> IA-PC boot flags in the ACPI FADT table.
>
> A note about this version of the patch series: I changed the assertion
> checking if the ISA bus exists to a if statement, because I can see how
> in the future someone might want to run a x86 machine without an ISA bus
> so we should not assert if someone calls the ISA check device existence
> function but return FALSE gracefully.
> If someone thinks this is wrong, I'm more than happy to discuss and fix
> the code :)
>
> Liav Albani (2):
>   hw/isa: add function to check for existence of device by its type
>   hw/acpi: add indication for i8042 in IA-PC boot flags of the FADT
>     table
>
>  hw/acpi/aml-build.c         |  7 ++++++-
>  hw/i386/acpi-build.c        |  5 +++++
>  hw/i386/acpi-microvm.c      |  5 +++++
>  hw/isa/isa-bus.c            | 23 +++++++++++++++++++++++
>  include/hw/acpi/acpi-defs.h |  1 +
>  include/hw/isa/isa.h        |  1 +
>  6 files changed, 41 insertions(+), 1 deletion(-)
>

This change breaks bios-tables-test.c:

-[06Dh 0109   2]   Boot Flags (decoded below) : 0000
+[06Dh 0109   2]   Boot Flags (decoded below) : 0002
                Legacy Devices Supported (V2) : 0
-            8042 Present on ports 60/64 (V2) : 0
+            8042 Present on ports 60/64 (V2) : 1


acpi-test: Warning! FACP binary file mismatch. Actual
[aml:/tmp/aml-QXU0H1], Expected [aml:tests/data/acpi/q35/FACP].
See source file tests/qtest/bios-tables-test.c for instructions on how to
update expected files.
# GLib-DEBUG: posix_spawn avoided (fd close requested)
# GLib-DEBUG: posix_spawn avoided (fd close requested)
acpi-test: Warning! FACP mismatch. Actual [asl:/tmp/asl-9AV0H1.dsl,
aml:/tmp/aml-QXU0H1], Expected [asl:/tmp/asl-03P0H1.dsl,
aml:tests/data/acpi/q35/FACP].
**
ERROR:../tests/qtest/bios-tables-test.c:532:test_acpi_asl: assertion
failed: (all_tables_match)
Bail out! ERROR:../tests/qtest/bios-tables-test.c:532:test_acpi_asl:
assertion failed: (all_tables_match)
Aborted (core dumped)

Please fix it. The instrctions are in the header of
tests/test/bios-tables-test.c as the above indicates.

You can check the failure by running it something like this:

QTEST_QEMU_BINARY=/home/ani/workspace/qemu/build/qemu-system-x86_64
V=1 ./tests/qtest/bios-tables-test

V=1 will dump the asl diff between expected and actual.


