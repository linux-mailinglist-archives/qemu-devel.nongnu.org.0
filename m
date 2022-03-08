Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6D34D1DC3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:50:17 +0100 (CET)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRd2O-0008H1-Ep
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRczf-0006Bx-GG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRczb-0003if-Oq
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646758042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s+on1NpjUAuB8mL8ib/14rfdIX5SfsDzGlVhpY8q3Fg=;
 b=UiIiPZSb2UtDtmUovlbDt3I4HUcJ67qMIWP16IV4IjVe53WMAv5KFbyDWbMnQDVZV/5P7t
 teZ1iyO1fHA4mNtFNhRjew/dLAs0PcBrDN97zKRBOeRmsqM2CdjaOFs7OPGgRUVq1qrm2a
 fBeZAtWy79ESbKFhVuIV3MGWtCfqHYU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-Ia0voLk7PJ6RQvsbYGkrlw-1; Tue, 08 Mar 2022 11:47:19 -0500
X-MC-Unique: Ia0voLk7PJ6RQvsbYGkrlw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq34-20020a1709073f2200b006d677c94909so9024839ejc.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s+on1NpjUAuB8mL8ib/14rfdIX5SfsDzGlVhpY8q3Fg=;
 b=VP46kbPNwoE57Cx9FT18XZtTsqvynzwtvyZanEG9cnDaSMEJKCZtnBpiOc/ERRucou
 pl5TxnF8xTLdb/pzVc/aDTwt6u1gz9GP4ZrdczXrYpXUuub8Hhuwfq+Fd8QnLxfcV4Bv
 4rZeKXwJJIDNQhmO+8LGJXGpdcrRO8reSqDhebhlMnSjVFMa+A8G8Efz5YPtBu7662rb
 2C1HKJX+0g+zT541ia/zleZZYrEB1/GnWXMwUneXxGhRQ68CB3FpvGJ/pxUZqoMWRIxf
 jrxTjvAgv4PmOdABNPaMBxxva+N4CF+PY93wP6FcKX6t699pTYOHjQNVgpFiz5izv6dm
 cPdw==
X-Gm-Message-State: AOAM5315DenUIYWnOBrD9AFPkwM2rqSY/eXj+S5PIkxwWV4zEIrp/z0Q
 5eoxWvnv5C5lVzvE2nRodhepdyWj1rpyW7qOVnf6tgHZ2yt+R6jML0RgYklGy8DmErlPYuxMcaK
 JPNHl+xrjToBL5t0=
X-Received: by 2002:a05:6402:5171:b0:415:eed0:664a with SMTP id
 d17-20020a056402517100b00415eed0664amr17224327ede.117.1646758037960; 
 Tue, 08 Mar 2022 08:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjlChzzRZffdF/ov9dQQO/dpKTV9s+hHifL029HIMgDMhYPO3Mu9fIOV3ZXqoaeF5tZOaNZQ==
X-Received: by 2002:a05:6402:5171:b0:415:eed0:664a with SMTP id
 d17-20020a056402517100b00415eed0664amr17224311ede.117.1646758037759; 
 Tue, 08 Mar 2022 08:47:17 -0800 (PST)
Received: from redhat.com ([2.55.24.184]) by smtp.gmail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm8052423edj.49.2022.03.08.08.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 08:47:17 -0800 (PST)
Date: Tue, 8 Mar 2022 11:47:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
Message-ID: <20220308114638-mutt-send-email-mst@kernel.org>
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
 <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: libvir-list@redhat.com, imammedo@redhat.com, jusual@redhat.com,
 qemu list <qemu-devel@nongnu.org>, Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 10:15:11PM +0530, Ani Sinha wrote:
> 
> 
> On Tue, 8 Mar 2022, Laine Stump wrote:
> 
> > Aha! the domain of qemu-devel@nongnu.org was incorrect in the original send
> > (it was "nognu.org"), so none of this thread was making it to that list.
> 
> 
> Not to give any excuses but this happened because on Qemu side I never
> have to type this manually. My git config is set up so that
> the cc in send-email is filled up automatically using
> scripts/get_maintainer.pl. On libvirt side also the domain and mailing
> list is easy to remember. Its only when I have to manually type stuff that
> shit happens :-)

Donnu about alpine, but with mutt you can easily set up
and alias and then it expands for you.

-- 
MST


