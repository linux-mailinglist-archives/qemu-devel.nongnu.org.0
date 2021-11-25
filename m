Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3845D5C2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 08:51:09 +0100 (CET)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq9XA-0000Iv-4d
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 02:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mq9MK-00012o-3O
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:39:56 -0500
Received: from [2a00:1450:4864:20::42b] (port=43767
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mq9MH-0000kw-UL
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 02:39:55 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v11so9529399wrw.10
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 23:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DEo42kCve3jWadnShqYqN47WLK+6/+0ZGU8QVou7LZA=;
 b=kD759+PX2g/dkkhvjXYMRfFYVoCRgjqseyJJKQpRYDqb2ZGsnXqXs5CDcNYyhwxtfw
 QBgbPRzQemGxG2VUmmt4fFW/11lLnFung/t7BSfhaqqHPeHSOns1LoUq+AHntbnpnajO
 U/p4KBZIA/aXk7rAAYpKFGFFle0kEchUgc/9XLePaXazgB4r4yBm1hurNXZWkZ4+/gxS
 lJuVoPMpPiJ6oROhlt06gjzznbI4Ei7KLIBPzs5If6K99kehFsmIkZNrd6XwvzrHJ5Q4
 k+TWNDlyc+0aUtV9YK5FI8CHnzzmwWfdjCnHMaAdt3i1LLzz06QmDunnuPRl6hJP4BWr
 rhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DEo42kCve3jWadnShqYqN47WLK+6/+0ZGU8QVou7LZA=;
 b=gki0Svnsvtt87n2WhfpF882dcPDk9NLjBjqHFK/WTdcHfkc5FoP/YqF2yQBFc0YblO
 HHnUKR8FQzYFCIq6hU9bubta2YTrRi8uChItAQo6fLHcodsBFE9c6sSzm9zMy1a/eMnn
 XAO+59x8v9scb18bGEwDQcm9ftU/0fpS74iwpjnpKxwJNRH+u++2lrOP6WUvMfOUX3Ai
 ImhQD2fIupQ5oLLjazfvlmgP42pePINYGx51fJmPf9skvwR7q5R6uN9cIEulnirfO1ae
 R9Yy8L8CPA8dLNq0AzXecggjDsAd0xZM6iVg84vA+8RH52rP1qJs5e3W7lcBn5+9ySjj
 t6pw==
X-Gm-Message-State: AOAM532A6ttk0O7phySACbjMeGyUZvVhJ4HXTM+nR82ekWxccY+Y5HW7
 R8c/k9Sym7c4gPFD1/hc1bnRVw==
X-Google-Smtp-Source: ABdhPJztJDK8kRDgZOqBaBMFVY5EkDU3LbGH2PrN9zZuXPtOGSknH8L9FFLXbZZHeevuaIn4X+mHbg==
X-Received: by 2002:adf:f206:: with SMTP id p6mr4186658wro.509.1637825990264; 
 Wed, 24 Nov 2021 23:39:50 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n1sm2393687wmq.6.2021.11.24.23.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:39:49 -0800 (PST)
Date: Thu, 25 Nov 2021 07:39:28 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
Message-ID: <YZ89sF2J2oujHeyQ@myrica>
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <871r34r9pz.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871r34r9pz.fsf@dusky.pond.sub.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On Thu, Nov 25, 2021 at 08:11:04AM +0100, Markus Armbruster wrote:
> Peter, this patch fixes a bug that became a regression when the fix
> missed 6.1.  It's been stuck on the list since August.  Please have a
> look, and if it's good, get it merged.  I'll ask the i386/pc maintainers
> to do the same for PATCH 2.

Both fixes have been merged in v6.2 (9dad363a223d and 739b38630c45)

Thanks,
Jean

> 
> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
> 
> > Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> > parameter definitions cannot use underscores, because keyval_dashify()
> > transforms them to dashes and the parser doesn't find the parameter.
> >
> > This affects option default_bus_bypass_iommu which was introduced in the
> > same release:
> >
> > $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
> > qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
> >
> > Rename the parameter to "default-bus-bypass-iommu". Passing
> > "default_bus_bypass_iommu" is still valid since the underscore are
> > transformed automatically.
> >
> > Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/arm/virt.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index b4598d3fe6..7075cdc15e 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2671,10 +2671,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> >                                            "Set the IOMMU type. "
> >                                            "Valid values are none and smmuv3");
> >  
> > -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> > +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
> >                                     virt_get_default_bus_bypass_iommu,
> >                                     virt_set_default_bus_bypass_iommu);
> > -    object_class_property_set_description(oc, "default_bus_bypass_iommu",
> > +    object_class_property_set_description(oc, "default-bus-bypass-iommu",
> >                                            "Set on/off to enable/disable "
> >                                            "bypass_iommu for default root bus");
> 

