Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB47338352
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:56:01 +0100 (CET)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKX21-0004JV-1Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWx4-0006jU-HZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:50:54 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:43140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWx2-0004sT-Ts
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:50:54 -0500
Received: by mail-io1-xd33.google.com with SMTP id f20so24065153ioo.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ys9tyKqq+EAULptKrtt9gwkDywWx+osLDvjO5MVWHEE=;
 b=o//6fq5erUEBkljgmsJJ+ZyZiY7jD6nXoROIPUtOomUgsFlIeYcnF37Hj1/lXcUFWx
 eWyVxOz17K3kux5SDmzOs0VdzC8n5l50ThILcpHqFcMdVR1T3MOEbfwRHdWTt8DwK8Qi
 XR/+Q9PN5/j8tp9ZsxAA6t+PP6cGxThtjNpuwVdjqFRLOMA+N35wvhFoSXfzPo2GODG1
 StxZFOLuDDLfgVIRrOz0l1qEECOCL1W9v4TsViS8iXj/hyu7VYoW/EC9QNPMziipDCmc
 x6VLV4IEShqkVN3NC4yHdf6YUbpG63asGO7XdQi9Zp70nWMYNp9O2PXJdZasj7Sdoav9
 r1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ys9tyKqq+EAULptKrtt9gwkDywWx+osLDvjO5MVWHEE=;
 b=d0sHkW+lk7HxVO7c2AZEm5Hts6m9Fwhm+kpIQbLC3A6LHDT+HsILMjk+HFJ6q+mwvb
 RI/QN1VtS4DMOlQjmWebOofOkOuC1qolBOWkVBKNHmCl/taYE5Ouixu5rjK0Ucl/Np3T
 ETe+o6VwKjeCDHQ0RjCAZGiQ5yoa6bsF3dwVFqd/+GkpNCT2wUjxk9pFdPggRRD9o71z
 c2nbFlvJy7NqINwv0vO2fy2pd0VHnCG3TnaMOLC5j6OJHP5HsnU5uaOHTrNHeB+LfHNZ
 oagDx8wlImYb4gNBwcWSNJAncvGFwCDEEEHt1vrdX2M/H0vACoS3z2QAni01gdqV4ft4
 QlIg==
X-Gm-Message-State: AOAM533mbkYCY2whXtSGzpxZj6G56vIFJq+tuoYN8FredHaJPRr4NInO
 uGiQlgnBKscgithNjttc0MCISN3MOjGA3h0/VQYE
X-Google-Smtp-Source: ABdhPJx4mI5ulYvN/lZkjAZF8GxV/XFIsd140NrxrEu/YuMJVBAzO8jVsiD9glouz5OUYXY3B6rmJGgV0s9L+JPRmek=
X-Received: by 2002:a02:a303:: with SMTP id q3mr6518372jai.32.1615513851737;
 Thu, 11 Mar 2021 17:50:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
 <ae0326e2-8766-803a-ef89-1155d45fdd2a@linaro.org>
 <CAJc+Z1EERnkp1QhZu0Xkrxuw3u8bFM02x0=QVfXYxCRSbXiZeA@mail.gmail.com>
 <eaa33646-f25b-a5df-a5f7-0c0ed9fd847b@linaro.org>
In-Reply-To: <eaa33646-f25b-a5df-a5f7-0c0ed9fd847b@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:50:40 +0800
Message-ID: <CAJc+Z1FZAuf6=JiDSW4A0kXZ0kvBOS0qKNaonZTK2kQorFXmBA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] Add migration support for KVM guest with MTE
To: Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

++ more migration experts!

On Tue, 23 Feb 2021 at 06:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/21 1:46 AM, Haibo Xu wrote:
> > As I mentioned in the cover later, the reason to let the tag go with the
> > memory data together is to make it easier to sync with each other. I think
> > if we migratie them separately, it would be hard to keep the tags to sync
> > with the data.
> Well, maybe, maybe not.  See below.
>
>
> > Saying if we migration all the data first, then the tags. If the data got
> > dirty during the migration of the tag memory, we may need to send the data
> > again, or freeze the source VM after data migration? What's more, the
> > KVM_GET_DIRTY_LOG API may not be able to differentiate between a tag and
> > data changes.
> I would certainly expect KVM_GET_DIRTY_LOG to only care about the normal
> memory.  That is, pages as viewed by the guest.
>
> I would expect the separate tag_memory block to be private to the host.  If a
> normal page is dirty, then we would read the tags into the tag_memory and
> manually mark that dirty.  Migration would continue as normal, and eventually
> both normal and tag memory would all be clean and migrated.
>
> But I'll admit that it does require that we retain a buffer 1/16 the size of
> main memory, which is otherwise unused, and thus this is less than ideal.  So
> if we do it your way, we should arrange for tcg to migrate the tag data in the
> same way.
>
> I'll still wait for migration experts, of which I am not one.
>
>
> r~

