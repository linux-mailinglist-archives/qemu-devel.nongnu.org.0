Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C933FC02
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:53:25 +0100 (CET)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfye-0004E6-IB
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1lMfxb-0003ir-Ig
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:52:19 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1lMfxX-0001u0-4o
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:52:19 -0400
Received: by mail-ej1-x62b.google.com with SMTP id k10so1088451ejg.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3JZmhqZDaCyCiXnyYvzi4b+uFUQC1FCMRAmuqpw0Nfo=;
 b=PptBgH6Ou80L2nVQxOLeOD+zRfkT6M/pebwIyqENpwYZtMrs0h1iSYscd8Yw4wpJ5N
 +WHgTYawEUmrN4q4oSJcVv6LAiLRlKipNcpRaAiJGmaKG184ejvfhcz8luEFP0M8Lo/g
 pHa03m6XjzNAE1QJGwp2LenwtbHjJjU4FS56r30HsQyABioW6A9P2CFqaIHg6VNxbCE6
 KwNLAlpFNp+Tu1cTBoAczJ1ezrmYCIPP2TMuqnZDtIJeFwG04oS05y9GSMutx25wpUFB
 0Btr79iIr6DrXG4IxXEWFGk5D/PaLTKEJ7RPNZjrHcjlxyb3Y3Sh5kUBkeAJei7jgbm7
 ZstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3JZmhqZDaCyCiXnyYvzi4b+uFUQC1FCMRAmuqpw0Nfo=;
 b=YJZhoGvutWuth/JO13ke6pLTuca8ifrDBx5GhlsM+p4UmUrodm0ENyn4z2/3zMHxtg
 Mj5avUdHAuBI6WDLBI13SOY2UL6ptvzTCSwWs1VNqKfAvwE23NGVjD/Z/09ZIidHD59Y
 3C1fLtZia4iWGfjSm6AfFMx7IFtN/6tVo5/5jkpRwxlYCJSh2oZ/pZqyDc0tdYUfovhn
 Gil31pPmn+gxu5nQiH9OR7U18h8jVuKDCNAAam+hUyQ2eCWjjtveTrJtuuc9Hvt2vsF2
 Y9N1WNr50dZXo7vUSlYUbrkFN7dP3b38njzLQrqKdf8I7szcfxAi2RrYWAGOMtaZeK8N
 4kng==
X-Gm-Message-State: AOAM530f+et1OjOXcUoCFCquYjxuo1so4c3lCDH2SOchUzPgPvQbBc//
 CRwjlnoZ4atDK0Zu0CMq6LAG4RTkitY445hoWooXmA==
X-Google-Smtp-Source: ABdhPJyBAACIe/tmH1ozfTYbyVYtsgXnE90UaOLjas7vJTpw4mYZQ06AtZ9e4PuzP5r3koO6Vhi5BNzgRlw6WK9vILM=
X-Received: by 2002:a17:906:ef2:: with SMTP id
 x18mr38763976eji.323.1616025130658; 
 Wed, 17 Mar 2021 16:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
In-Reply-To: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 17 Mar 2021 16:52:03 -0700
Message-ID: <CAPcyv4hONDtHmUFF70rCc3y3+GX4ix1BdqxMOrWBRwG3mtTXPw@mail.gmail.com>
Subject: Re: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=dan.j.williams@intel.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Jeff Moyer <jmoyer@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Haozhong Zhang <haozhong.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 4:49 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Hi,
> Microsoft and Intel developed two different ACPI NVDIMM _DSM interfaces.
>
> The specs for the Intel interface are available here:
> https://pmem.io/documents/NVDIMM_DSM_Interface_Example.pdf
>
> This is the interface that QEMU emulates. It has been reported that
> Windows 2016 Server and 2019 Server guests do not recognize QEMU's
> emulated NVDIMM devices using the Microsoft driver.
>
> I'd like to understand the path forward that will allow both Linux and
> Windows guests to successfully use QEMU's emulated NVDIMM device
> (https://gitlab.com/qemu-project/qemu/-/blob/master/hw/acpi/nvdimm.c).
>
> Are/have these two interfaces being/been unified?

No, they service 2 different classes of NVDIMMs. The Microsoft
specification was defined for NVDIMM-N devices that are the
traditional battery/super-capacitor backed DDR with sometimes an equal
amount of flash to squirrel away data to non-volatile media on power
loss. The Intel one is for a persistent media class of device where
there is no need to communicate health attributes like "energy source
died" or "restore from flash" failed.

> Should QEMU emulate both of them to make running Windows guests easy?

Depends on how tolerant Windows is to different format-interface-code
implementations and what QEMU should return on each of the functions
it decides to implement.

Note that QEMU only implements a small subset of the Intel commands,
i.e. just enough to provision namespaces in the NVDIMM label area.
"NVDIMM label area" is a concept that is newer than the NVDIMM-N
definition which is why you don't see labels mentioned in the
Microsoft specification. Since then ACPI has developed common label
area access methods, see "6.5.10 NVDIMM Label Methods" in the ACPI 6.4
specification.

Note that you'll also see "9.20.8 NVDIMM Device Methods" in that spec
for some health management commands that overlap what the Microsoft
and Intel specs communicate. Linux does not support them since any
platform that might support them will also support the Intel
specification so there's no driving need for Linux to migrate. I do
not know the status of that command support in Windows, or the HPE
command support in Windows for that matter.

If you need to support guests that expect the Hyper-V command
definition, and will fail to attach NVDIMM support in the absence of
that definition then QEMU needs UUID_NFIT_DIMM_N_HYPERV support, note
that is a different command set than even UUID_NFIT_DIMM_N_MSFT
(include/acpi/acuuid.h). That would also require changes to virtual
ACPI NFIT to advertise the correlated format interface code. There may
be more... you would need someone from Hyper-V land to enumerate all
that is expected.

