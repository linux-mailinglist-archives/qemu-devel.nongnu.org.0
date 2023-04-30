Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AFF6F2B89
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 01:29:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptGSh-0001aZ-24; Sun, 30 Apr 2023 19:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ptGSe-0001aR-Jz
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 19:28:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ptGSc-0003Wf-2B
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 19:28:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 87E4674633D;
 Mon,  1 May 2023 01:26:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 55403745706; Mon,  1 May 2023 01:26:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 52EBF7456E3;
 Mon,  1 May 2023 01:26:16 +0200 (CEST)
Date: Mon, 1 May 2023 01:26:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Paolo Bonzini <pbonzini@redhat.com>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Rene Engel <ReneEngel80@emailn.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
In-Reply-To: <795e8b13-f314-aa1e-d908-ce95795cd168@eik.bme.hu>
Message-ID: <029a063c-4be5-86fa-e2ae-1859f81d3f0b@eik.bme.hu>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
 <20230220172659-mutt-send-email-mst@kernel.org>
 <f4e755b6-051e-103f-b8bc-2765d277633f@eik.bme.hu>
 <e3a19d91-b9ef-9352-8f60-35432fdf5d1e@redhat.com>
 <c2bdd618-5077-3b3f-12d0-974cf9757692@eik.bme.hu>
 <04f178bb-2407-232f-e843-386bf04b3024@eik.bme.hu>
 <4714e0f2-ccfb-1e9a-149e-aceefef62a9d@redhat.com>
 <e101b894-c722-8def-f591-20fada45795c@redhat.com>
 <48cdc7ae-8e7c-6b6d-76d1-96228ac597c2@eik.bme.hu>
 <CABgObfZLuVgG8pPcF1o517z0wSZTk5SmV8Enn=PC8QmOEVou8w@mail.gmail.com>
 <c2b19806-db0f-54b8-ed41-2e74c19d029e@eik.bme.hu>
 <e0a958ec-fa18-0d13-48db-10feea159491@redhat.com>
 <795e8b13-f314-aa1e-d908-ce95795cd168@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 1 May 2023, BALATON Zoltan wrote:
> - unaligned access is not handled correctly in acpi_pm_cnt_write() which now 
> I think is the place where this should be fixed

And also when running the test script on QEMU:

acpi_pm_cnt_read: 0 2 -> 0x80
acpi_pm_cnt_read: 1 2 -> 0x80

where the second should return 0 so these ops are either wrong or the 
memory layer does not do what's intended for:

static const MemoryRegionOps acpi_pm_cnt_ops = {
     .read = acpi_pm_cnt_read,
     .write = acpi_pm_cnt_write,
     .impl.min_access_size = 2,
     .valid.min_access_size = 1,
     .valid.max_access_size = 2,
     .endianness = DEVICE_LITTLE_ENDIAN,
};

I could patch this up in acpi_pm_cnt_read() abd acpi_pm_cnt_write() but 
how this is supposed to work? Do these functions have to handle unaligned 
access or the impl/valid settings should take care of that?

Regards,
BALATON Zoltan

