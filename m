Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D954B2C7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:10:15 +0200 (CEST)
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17FG-0006Ht-Fi
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o17De-0005Dj-SY
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o17Da-0003M8-9g
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655215709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kx/UuSeDHvtzUeetiHbKL7+G+mSOjE6abcY67he9j7M=;
 b=Ga/dvvZycDDg4A6Xn84DKbey53Zw4c1H0AdKcSIxXNyWSYaHAlEyWiYDiCeHJzs/gqmHIf
 /mz09aCQ+X2vEztt6zQh4JFteXPRgp9SdjODjIkg/QERd4fM46SmZODrT+k7V6fVqz0pdi
 shMS7J4bza3AzeFDmWQTN517haV7TYk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-r2sOdy6VMomFxiKaS-fSKA-1; Tue, 14 Jun 2022 10:08:27 -0400
X-MC-Unique: r2sOdy6VMomFxiKaS-fSKA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p8-20020a5d4588000000b0021033f1f79aso1335143wrq.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 07:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kx/UuSeDHvtzUeetiHbKL7+G+mSOjE6abcY67he9j7M=;
 b=Y6q1+tFRSiV9T535Fndj3ux16k/qq1KXHx1eqRlHU4DOLj5Gcv44KQfnFskWv1Vy9q
 H+kno9XzwXXVlPt8K9IWq0LZoUZxjr8JCHNgxX2fq3MCqHzUwe0RcagTNCkXNVm6OEEy
 83SJlM0IspyiViZ0diXlPK15HSR9rRfz0d7JjtX2jOm1yKpEfgHId8dJiwfi3RegTwf9
 Jidafy8NLNjvnMgNl9PrCpIEpm5UPrG8PAt1p2WZBKf53mNkgBkZGXTjfVYO7WKgnnUK
 Jk8jeiui75RMeecY9mYEewHdFXzNvluL5MGIDKkU0R0ZiDLEa7bSM1HAhFXCJdUpQjH/
 sr+w==
X-Gm-Message-State: AJIora9/XjvkwAyCwpQnQz5f7DmH99WJyEOyhWmpptPigwNEiW5Z3Q28
 0woNwFPNNwaf3OX9Sz4zGWqgTm7tI5Xt/ZtiwiGKLcfEOxApT5wSIsatib5wmGKkB3bRNp+oQ5d
 RlyShk6W3CQJyxBc=
X-Received: by 2002:adf:d1ed:0:b0:215:98d7:2a93 with SMTP id
 g13-20020adfd1ed000000b0021598d72a93mr5186705wrd.637.1655215706553; 
 Tue, 14 Jun 2022 07:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpNSS5PSeEKRclO6DEectA9Mp0jlNPTPn4+V90udcCAlNrs1xyY7IFudiI+TwvxrBApvYS5A==
X-Received: by 2002:adf:d1ed:0:b0:215:98d7:2a93 with SMTP id
 g13-20020adfd1ed000000b0021598d72a93mr5186681wrd.637.1655215706319; 
 Tue, 14 Jun 2022 07:08:26 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc850000000b0039c96b97359sm6365420wml.37.2022.06.14.07.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 07:08:25 -0700 (PDT)
Date: Tue, 14 Jun 2022 16:08:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova
 <jusual@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers
 <qemu-devel@nongnu.org>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Message-ID: <20220614160824.342c03a6@redhat.com>
In-Reply-To: <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
 <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Jun 2022 11:50:43 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 14.06.22 10:54, Igor Mammedov wrote:
> > On Mon, 13 Jun 2022 16:09:53 +0100
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >   
> >> On Mon, Jun 13, 2022 at 05:01:10PM +0200, Julia Suvorova wrote:  
> >>> On Tue, May 31, 2022 at 5:32 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:    
> >>>>
> >>>> On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:    
> >>>>> In the ACPI specification [1], the 'unarmed' bit is set when a device
> >>>>> cannot accept a persistent write. This means that when a memdev is
> >>>>> read-only, the 'unarmed' flag must be turned on. The logic is correct,
> >>>>> just changing the error message.
> >>>>>
> >>>>> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
> >>>>>
> >>>>> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> >>>>> ---
> >>>>>  hw/mem/nvdimm.c | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)    
> >>>>
> >>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>    
> >>>
> >>> It seems like Xiao is not active, whose tree should this patch go to?    
> 
> Is that a temporary or a permanent thing? Do we know?
> 
> > 
> > Perhaps David can add himself as maintainer (i.e. put it
> > under memory mantanership umbrella) and merge it   
> 
> Maybe it makes sense to combine NVDIMM with pc-dimm.c and
> memory-device.c into a "MEMORY DEVICE" section. Then, remove "hw/mem/*"
> from "ACPI/SMBIOS".
just keep me on supporter list for them so I won't miss
patches that needs reviewing.

> cxl_type3.c, npcm7xx_mc.c and sparse-mem.c in /hw/mem/ are a bit
> different. We could add cxl_type3.c to "Compute Express Link".
> npcm7xx_mc.c and sparse-mem.c should be already covered. 
for cxl I'd add Michael as it's mostly all PCI stuff


