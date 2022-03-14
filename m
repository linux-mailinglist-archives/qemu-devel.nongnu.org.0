Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7C4D8F93
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 23:29:18 +0100 (CET)
Received: from localhost ([::1]:53006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTtBl-0004RD-IU
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 18:29:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nTtA2-0003Tr-K3
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nTt9y-0007ap-Q8
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 18:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647296845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TpdoUAGo4Vbq1pnSaeeo5GoHtu72AeubKTd62jeGUEg=;
 b=AWBM06LXajqIWRkHCJCbSH0Ew/l22vWd+VIYeSA/GIPtpDh3BSfPt610bH4k8ENZgvNwwJ
 eYfkjrDrBwCykU8/vctH3dAlU3rD0MelqvmKpu+aHAgQgh7jeNzsiLL0MHsLGlbnIAE60B
 taCjnezZlLTk03Qxdl/EjG9A4PX96FQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-oe3_MismPWe2mXXjYhYXPw-1; Mon, 14 Mar 2022 18:27:24 -0400
X-MC-Unique: oe3_MismPWe2mXXjYhYXPw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z19-20020a50cd13000000b0041693869e9aso9320460edi.14
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 15:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TpdoUAGo4Vbq1pnSaeeo5GoHtu72AeubKTd62jeGUEg=;
 b=Is0eZa1BFzUBJWKTRsSn4U451n2vYKGS8u3xzsX0Gpg/04kHYjVWuJu2KbNilQh1Bh
 nkfh8t2GcGi+dtAP8/8VlKUOCwo0xE4ECoJtQYrzYHKn34J8ApUjrjhSMNi4sglIIFgH
 JzzxDUitjH9YOvNNJA0mjVbN5SdvNzjzzW9ctukmv4UcgiagU5GH4MvRj2DeRDTJCv4s
 MB8+EncHOIdTJCmCOFl3+UZyKCpuC3dhQmE9G7xalzAg0WY0fJ24NtSe/KRZ8aCiuPNb
 ZsLYzrh7m1JbH4obJdVf5r03wptxmB8MBGiaBfjTvnSMDz/VbctKooyLml5QXVSH70E4
 N45Q==
X-Gm-Message-State: AOAM532wUddjnE8yYUiqRjh/Fg8B6dyT284aU2fTq9KPgIrR85h0F1AY
 g6tLsf5BDzhE0/Osh1elatGsln7Nbzn3K9Uust3F3ic5irfF1iDyFtIWasoNxn+Lc3Ajizh77Yk
 +9p3cU9hZZMpzSB4=
X-Received: by 2002:a05:6402:2365:b0:415:ed07:70de with SMTP id
 a5-20020a056402236500b00415ed0770demr22875100eda.150.1647296842829; 
 Mon, 14 Mar 2022 15:27:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5ACN3joDR8n40Q4f2vCCOEIdwEoXTxWtPak6qyFiuNZ82SR61qjTgXiDS0VURz0vTmGtUig==
X-Received: by 2002:a05:6402:2365:b0:415:ed07:70de with SMTP id
 a5-20020a056402236500b00415ed0770demr22875090eda.150.1647296842622; 
 Mon, 14 Mar 2022 15:27:22 -0700 (PDT)
Received: from redhat.com ([176.12.250.92]) by smtp.gmail.com with ESMTPSA id
 g23-20020a17090670d700b006ccfd4163f7sm7197673ejk.206.2022.03.14.15.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 15:27:22 -0700 (PDT)
Date: Mon, 14 Mar 2022 18:27:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/4] intel_iommu: Support IR-only mode without DMA
 translation
Message-ID: <20220314182454-mutt-send-email-mst@kernel.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
 <20220314142544.150555-2-dwmw2@infradead.org>
 <20220314112001-mutt-send-email-mst@kernel.org>
 <9db2fb68447b27203e6e006f29e2b960565c37bb.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <9db2fb68447b27203e6e006f29e2b960565c37bb.camel@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 03:45:47PM +0000, David Woodhouse wrote:
> On Mon, 2022-03-14 at 11:24 -0400, Michael S. Tsirkin wrote:
> > On Mon, Mar 14, 2022 at 02:25:42PM +0000, David Woodhouse wrote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > 
> > > By setting none of the SAGAW bits we can indicate to a guest that DMA
> > > translation isn't supported. Tested by booting Windows 10, as well as
> > > Linux guests with the fix at https://git.kernel.org/torvalds/c/c40aaaac10
> > > 
> > > 
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > 
> > this is borderline like a feature, but ...
> 
> It's the opposite of a feature — it's turning the feature *off* ;)

Right. Still - do you believe it's appropriate in soft freeze
and if yes why?

> > > 
> > > @@ -3627,12 +3628,17 @@ static void vtd_init(IntelIOMMUState *s)
> > >      s->next_frcd_reg = 0;
> > >      s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
> > >               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> > > -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> > > +             VTD_CAP_MGAW(s->aw_bits);
> > >      if (s->dma_drain) {
> > >          s->cap |= VTD_CAP_DRAIN;
> > >      }
> > > -    if (s->aw_bits == VTD_HOST_AW_48BIT) {
> > > -        s->cap |= VTD_CAP_SAGAW_48bit;
> > > +    if (s->dma_translation) {
> > > +            if (s->aw_bits >= VTD_HOST_AW_39BIT) {
> > > +                    s->cap |= VTD_CAP_SAGAW_39bit;
> > > +            }
> > > +            if (s->aw_bits >= VTD_HOST_AW_48BIT) {
> > > +                    s->cap |= VTD_CAP_SAGAW_48bit;
> > > +            }
> > >      }
> > >      s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO;
> > > 
> > 
> > 
> > ... this looks like you are actually fixing aw_bits < VTD_HOST_AW_39BIT,
> > right? So maybe this patch is ok like this since it also fixes a
> > bug. Pls add this to commit log though.
> 
> Nah, aw_bits cannot be < VTD_HOST_AW_39BIT. We explicitly check in
> vtd_decide_config(), and only 39 or 48 bits are supported,
> corresponding to 3-level or 4-level page tables.

Oh right. So not a bugfix then.

> The only time we'd want to *not* advertise 39-bit support is if we
> aren't advertising DMA translation at all. Which is the (anti-)feature
> introduced by this patch.
> 



