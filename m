Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADFA425992
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:33:28 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXGp-0004QE-NF
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYXER-0001hi-V2
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:31:01 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYXEP-0000rk-MC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:30:59 -0400
Received: by mail-pl1-x635.google.com with SMTP id c4so4396714pls.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cfx8aocFmVZT7TU2k/VlmGzm+QoEv+UAwb9dz1cQiUI=;
 b=yGkrM46PmvUa2Fg2oWYmhmWXXBUASqRK1+pRT/PxbVJ1ZdnJha/0zNgyCJQnuoC0fh
 wkYxqpwDLCFH6gzZHZxQK3RW57MrxCkXpwYZ6EoJf4MYtqPWL9Nhw7B3aNGpdn2qxw3F
 OCMmSPsRY/k8fvdc/f4aJ0ni+nrjAW4HLdxEoChu1XrF+xAyufzQVnYVVEvE+dHGTyGg
 R9yQLRJfOswXIvryclY20N+jgwJqeU2hvGTASjx/U4H8Ogc87r/Qbmu7uJb7W3vXcKxr
 XfKrcGAe16nhFsLJf0iCWIfgyAYLNPvLTSoVVeULL1tiREM1SprPBo/EMfQ7SVYL9p3g
 /3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cfx8aocFmVZT7TU2k/VlmGzm+QoEv+UAwb9dz1cQiUI=;
 b=aAgpIXdUnnvl7im+Zwzcnto8uTMYMpsAg2H7mu2Puxzh9PnnZ69nxXQLuXBE9SXW9H
 1x/JEnrNGDaMo8+jtLXG0VGsdG6yFnhuA4AHsMIxLhFgL8/IK2UCnqDE0VC4anVTdWoR
 rehdsS/XIhSV7Zjwku6Ss/zsMz3lqKcOfaeeuuHseMpTF3akS/f6YPkMT3uUfHNTI24M
 Z27iWCU77o6aEVKqiL7n5MmPdWPOhXMzgTgHxg5wXDd2TOR6IAWlxFyjCMgmOHXRjfho
 oFQ9pEM2L+A1F6nJ3Q2xgAfqnnLbHJDwuUnXsrLMDNlrA91faLyN8kaGrxqITbgsQq6R
 O0xQ==
X-Gm-Message-State: AOAM531QMLD5Heu8rdECCAv1ZR+KMLbIHRuUsBgoXKXY9kzWxZi/Gwav
 uiCR6AL9QWW3qM6Pg7e+BQWsfQ==
X-Google-Smtp-Source: ABdhPJzIKsSmqwOyQAxAKM++DLpJWyEXziALlqO2F9mxCKfzQo523NNfW4iUW+oaqiOKoyY8vArvBg==
X-Received: by 2002:a17:90b:2248:: with SMTP id
 hk8mr6279526pjb.102.1633627854679; 
 Thu, 07 Oct 2021 10:30:54 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.130.49])
 by smtp.googlemail.com with ESMTPSA id 11sm56545pfl.41.2021.10.07.10.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:30:53 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 7 Oct 2021 23:00:47 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v7 01/10] ACPI ERST: specification for ERST support
In-Reply-To: <1633626876-12115-2-git-send-email-eric.devolder@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110072300040.820442@anisinha-lenovo>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
 <1633626876-12115-2-git-send-email-eric.devolder@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x635.google.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 7 Oct 2021, Eric DeVolder wrote:

> Information on the implementation of the ACPI ERST support.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  docs/specs/acpi_erst.rst | 200 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.rst
>
> diff --git a/docs/specs/acpi_erst.rst b/docs/specs/acpi_erst.rst
> new file mode 100644
> index 0000000..a8a9d22
> --- /dev/null
> +++ b/docs/specs/acpi_erst.rst
> @@ -0,0 +1,200 @@
> +ACPI ERST DEVICE
> +================
> +
> +The ACPI ERST device is utilized to support the ACPI Error Record
> +Serialization Table, ERST, functionality. This feature is designed for
> +storing error records in persistent storage for future reference
> +and/or debugging.
> +
> +The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> +(APEI)", and specifically subsection "Error Serialization", outlines a
> +method for storing error records into persistent storage.
> +
> +The format of error records is described in the UEFI specification[2],
> +in Appendix N "Common Platform Error Record".
> +
> +While the ACPI specification allows for an NVRAM "mode" (see
> +GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
> +directly exposed for direct access by the OS/guest, this device
> +implements the non-NVRAM "mode". This non-NVRAM "mode" is what is
> +implemented by most BIOS (since flash memory requires programming
> +operations in order to update its contents). Furthermore, as of the
> +time of this writing, Linux only supports the non-NVRAM "mode".
> +
> +
> +Background/Motivation
> +---------------------
> +
> +Linux uses the persistent storage filesystem, pstore, to record
> +information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> +independent of, and runs before, kdump.  In certain scenarios (ie.
> +hosts/guests with root filesystems on NFS/iSCSI where networking
> +software and/or hardware fails, and thus kdump fails), pstore may
> +contain information available for post-mortem debugging.
> +
> +Two common storage backends for the pstore filesystem are ACPI ERST
> +and UEFI. Most BIOS implement ACPI ERST. UEFI is not utilized in all
> +guests. With QEMU supporting ACPI ERST, it becomes a viable pstore
> +storage backend for virtual machines (as it is now for bare metal
> +machines).
> +
> +Enabling support for ACPI ERST facilitates a consistent method to
> +capture kernel panic information in a wide range of guests: from
> +resource-constrained microvms to very large guests, and in particular,
> +in direct-boot environments (which would lack UEFI run-time services).
> +
> +Note that Microsoft Windows also utilizes the ACPI ERST for certain
> +crash information, if available[3].
> +
> +
> +Configuration|Usage
> +-------------------
> +
> +To use ACPI ERST, a memory-backend-file object and acpi-erst device
> +can be created, for example:
> +
> + qemu ...
> + -object memory-backend-file,id=erstnvram,mem-path=acpi-erst.backing,size=0x10000,share=on \
> + -device acpi-erst,memdev=erstnvram
> +
> +For proper operation, the ACPI ERST device needs a memory-backend-file
> +object with the following parameters:
> +
> + - id: The id of the memory-backend-file object is used to associate
> +   this memory with the acpi-erst device.
> + - size: The size of the ACPI ERST backing storage. This parameter is
> +   required.
> + - mem-path: The location of the ACPI ERST backing storage file. This
> +   parameter is also required.
> + - share: The share=on parameter is required so that updates to the
> +   ERST backing store are written to the file.
> +
> +and ERST device:
> +
> + - memdev: Is the object id of the memory-backend-file.
> + - record_size: Specifies the size of the records (or slots) in the
> +   backend storage. Must be a power of two value greater than or
> +   equal to 4096 (PAGE_SIZE).
> +
> +
> +PCI Interface
> +-------------
> +
> +The ERST device is a PCI device with two BARs, one for accessing the
> +programming registers, and the other for accessing the record exchange
> +buffer.
> +
> +BAR0 contains the programming interface consisting of ACTION and VALUE
> +64-bit registers.  All ERST actions/operations/side effects happen on
> +the write to the ACTION, by design. Any data needed by the action must
> +be placed into VALUE prior to writing ACTION.  Reading the VALUE
> +simply returns the register contents, which can be updated by a
> +previous ACTION.
> +
> +BAR1 contains the 8KiB record exchange buffer, which is the
> +implemented maximum record size.
> +
> +
> +Backend Storage Format
> +----------------------
> +
> +The backend storage is divided into fixed size "slots", 8KiB in
> +length, with each slot storing a single record.  Not all slots need to
> +be occupied, and they need not be occupied in a contiguous fashion.
> +The ability to clear/erase specific records allows for the formation
> +of unoccupied slots.
> +
> +Slot 0 contains a backend storage header that identifies the contents
> +as ERST and also facilitates efficient access to the records.
> +Depending upon the size of the backend storage, additional slots will
> +be designated to be a part of the slot 0 header. For example, at 8KiB,
> +the slot 0 header can accomodate 1021 records. Thus a storage size
> +of 8MiB (8KiB * 1024) requires an additional slot for use by the
> +header. In this scenario, slot 0 and slot 1 form the backend storage
> +header, and records can be stored starting at slot 2.
> +
> +Below is an example layout of the backend storage format (for storage
> +size less than 8MiB). The size of the storage is a multiple of 8KiB,
> +and contains N number of slots to store records. The example below
> +shows two records (in CPER format) in the backend storage, while the
> +remaining slots are empty/available.
> +
> +::
> +
> + Slot   Record
> +        <------------------ 8KiB -------------------->
> +        +--------------------------------------------+
> +    0   | storage header                             |
> +        +--------------------------------------------+
> +    1   | empty/available                            |
> +        +--------------------------------------------+
> +    2   | CPER                                       |
> +        +--------------------------------------------+
> +    3   | CPER                                       |
> +        +--------------------------------------------+
> +  ...   |                                            |
> +        +--------------------------------------------+
> +    N   | empty/available                            |
> +        +--------------------------------------------+
> +
> +The storage header consists of some basic information and an array
> +of CPER record_id's to efficiently access records in the backend
> +storage.
> +
> +All fields in the header are stored in little endian format.
> +
> +::
> +
> +  +--------------------------------------------+
> +  | magic                                      | 0x0000
> +  +--------------------------------------------+
> +  | record_offset        | record_size         | 0x0008
> +  +--------------------------------------------+
> +  | record_count         | reserved | version  | 0x0010
> +  +--------------------------------------------+
> +  | record_id[0]                               | 0x0018
> +  +--------------------------------------------+
> +  | record_id[1]                               | 0x0020
> +  +--------------------------------------------+
> +  | record_id[...]                             |
> +  +--------------------------------------------+
> +  | record_id[N]                               | 0x1FF8
> +  +--------------------------------------------+
> +
> +The 'magic' field contains the value 0x524F545354535245.
> +
> +The 'record_size' field contains the value 0x2000, 8KiB.
> +
> +The 'record_offset' field points to the first record_id in the array,
> +0x0018.
> +
> +The 'version' field contains 0x0100, the first version.
> +
> +The 'record_count' field contains the number of valid records in the
> +backend storage.
> +
> +The 'record_id' array fields are the 64-bit record identifiers of the
> +CPER record in the corresponding slot. Stated differently, the
> +location of a CPER record_id in the record_id[] array provides the
> +slot index for the corresponding record in the backend storage.
> +
> +Note that, for example, with a backend storage less than 8MiB, slot 0
> +contains the header, so the record_id[0] will never contain a valid
> +CPER record_id. Instead slot 1 is the first available slot and thus
> +record_id_[1] may contain a CPER.
> +
> +A 'record_id' of all 0s or all 1s indicates an invalid record (ie. the
> +slot is available).
> +
> +
> +References
> +----------
> +
> +[1] "Advanced Configuration and Power Interface Specification",
> +    version 4.0, June 2009.
> +
> +[2] "Unified Extensible Firmware Interface Specification",
> +    version 2.1, October 2008.
> +
> +[3] "Windows Hardware Error Architecture", specfically
> +    "Error Record Persistence Mechanism".
> --
> 1.8.3.1
>
>

