Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E73EE096
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 01:55:03 +0200 (CEST)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFmRa-0000qI-1q
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 19:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mFmQY-00008S-AT
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 19:53:58 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mFmQW-0007oX-La
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 19:53:58 -0400
Received: by mail-io1-xd2c.google.com with SMTP id g9so7586533ioq.11
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 16:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rnzdttRGmDpc4upKuRPK555MR67/vxvccDJI40Fjqc=;
 b=F/iM0Qx/CKI/qoIkfwF7bo2W1QE88wd1HUh9CFFxfgaSJVUK/LjcFPKvvwG+dSbFeJ
 1pzn99wwud+I+RxXT1XGhocWCY9oIakvWla6Pcolj5GmtRsw7NZbzMoNKZSGs93AD/0K
 A1KrzDx2OH6b4Db7r2IMm8C0iVB12mlLfaq0k44TtEeDTpAA6diNHGnQHQ1PxTAGjK5n
 KOTBzyKcYKFs++I7hRBrxmP8hG1PjmZX3yMh3rR+OBb4vFomNYr6zGcedWmuaRpvFtTI
 xtiLUI+PsffB5E7AMkE27VyVj5R8qOlH9MY8MtsYbfcj6NWX6qZ+3hMTdrDh9fCshHuh
 r6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rnzdttRGmDpc4upKuRPK555MR67/vxvccDJI40Fjqc=;
 b=Ate1SR/wlM9YvFsH2RCuEe3Rj6bzEaduyBdOIU+INO6J9q7oyChJv9Sgn7oilQSOAO
 T1hbgMtbTx5cdy3VmhEKv+gA8RfaSQI/eW1ErCfQwswh5yBzRwTK3OkNtxh0W21zZPtd
 2XABn+oGaoyxpOgNEWJQHapac+19JxldMuQpHzVsiOr6hpxcvtbGUd8VHuqs5EM9XBNZ
 VMn1fGOA+yR26CmhIW4VHR7Se7ql1+r8Zf8DhclsPQVTQEKuFeIDnw85iW5Or5R+JAuz
 OD0bkwq4jvNErzRGJ3qGW3FSn8cnZOsxgQh+nn+rXHHX8c46P6WngQMgG7PfkAqaPpMK
 o9PQ==
X-Gm-Message-State: AOAM53177hruBvdaXP0RE9LSM+QJ4TZePA4DxPzN5x/ig58nJ9zwMyYy
 Ud8eY5RD3Atl0lJnrytEtxHfeI5VvhSRyyucnCXTmQ==
X-Google-Smtp-Source: ABdhPJxeWwQ+w4zWPBYIqBeuwHefu/YNIr0LXVlgvLDyAYp4yNz4ttC1Ks8VXzvus2helXAwOYuoVoB8VT0g8ZmUzCQ=
X-Received: by 2002:a02:1942:: with SMTP id b63mr371548jab.111.1629158034133; 
 Mon, 16 Aug 2021 16:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
In-Reply-To: <cover.1629118207.git.ashish.kalra@amd.com>
From: Steve Rutherford <srutherford@google.com>
Date: Mon, 16 Aug 2021 16:53:17 -0700
Message-ID: <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, thomas.lendacky@amd.com, 
 brijesh.singh@amd.com, ehabkost@redhat.com, mst@redhat.com, 
 richard.henderson@linaro.org, jejb@linux.ibm.com, tobin@ibm.com, 
 dovmurik@linux.vnet.ibm.com, frankeh@us.ibm.com, dgilbert@redhat.com, 
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=srutherford@google.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 6:37 AM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> This is an RFC series for Mirror VM support that are
> essentially secondary VMs sharing the encryption context
> (ASID) with a primary VM. The patch-set creates a new
> VM and shares the primary VM's encryption context
> with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> The mirror VM uses a separate pair of VM + vCPU file
> descriptors and also uses a simplified KVM run loop,
> for example, it does not support any interrupt vmexit's. etc.
> Currently the mirror VM shares the address space of the
> primary VM.
Sharing an address space is incompatible with post-copy migration via
UFFD on the target side. I'll be honest and say I'm not deeply
familiar with QEMU's implementation of post-copy, but I imagine there
must be a mapping of guest memory that doesn't fault: on the target
side (or on both sides), the migration helper will need to have it's
view of guest memory go through that mapping, or a similar mapping.

Separately, I'm a little weary of leaving the migration helper mapped
into the shared address space as writable. Since the migration threads
will be executing guest-owned code, the guest could use these threads
to do whatever it pleases (including getting free cycles). The
migration helper's code needs to be trusted by both the host and the
guest. Making it non-writable, sourced by the host, and attested by
the hardware would mitigate these concerns. The host could also try to
monitor for malicious use of migration threads, but that would be
pretty finicky.  The host could competitively schedule the migration
helper vCPUs with the guest vCPUs, but I'd imagine that wouldn't be
the best for guest performance.


--Steve

