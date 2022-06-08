Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE6543746
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:25:45 +0200 (CEST)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxZ2-0000ba-AT
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyxXS-0007fp-EU
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyxXO-0002nO-0d
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654701840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZy2j8/C9TOspXxe56CaAJbUyqp4VGqeNb7kka+Oawo=;
 b=KULXfyiVtUbXp1HUAKVSGtw6xgPCyT8Grdr2NyZCEVWV7J5XsqSemKXh/8Wtu5ZFOP0gg9
 f41iF0z3AHKIkZxboi9cwAMUb1RqcfM0Uln8UG1LwwrheUroVvUiIzNR5/vvf7lhXfMGqS
 GAvXFKDpXgd2YpBNJA75DV1J3JNADBQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-geIeP0X6NoW-aXxLU7f-zg-1; Wed, 08 Jun 2022 11:23:59 -0400
X-MC-Unique: geIeP0X6NoW-aXxLU7f-zg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso7069562wma.1
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xZy2j8/C9TOspXxe56CaAJbUyqp4VGqeNb7kka+Oawo=;
 b=pQKRE4HRPuNq2jLGyRHDjF06KZoLOh0N81mS7LZckkbXgJUJF6+jMlY9qKdumNX//6
 kTo+J4FPOakUFX6e3wd8CxKCtSUvShHJSX24UkeXyIUIooMQ6gnbKiHNY+STFkBrAKea
 naBCZMvWEJl/TgXbsviIVgYljo3snUoHcmHV0FhuJOPXO9SlwDbkpiUmkfeUcV7Un4+w
 y05JygASrHCnahuUMLlrt8IYWQcqsqye/0+/cSh1OYGx1MuJvLg2Os2kwSetVTmxEQ2V
 710j7n2GZ92prk+iAPddZTTgJD45sH3n/NTa+S6hMYMMKPJbEldWPacFH9SKh5zjG2VT
 H4AQ==
X-Gm-Message-State: AOAM531qGH4OmWMOUNcSLh6nAoOOP+Tur+16K4PqftZzVsCgqpbi/rrd
 1eHoG8OoKi5FsdVZrnDrRqSw7rLhAbCCm/Jy8rNPAxU52TO/2Ft1Sy2arB2GHBAK6ZhJXJM552J
 s+07xpm5a/6XfKik=
X-Received: by 2002:a05:600c:d0:b0:39c:5927:3fa7 with SMTP id
 u16-20020a05600c00d000b0039c59273fa7mr10440602wmm.36.1654701838192; 
 Wed, 08 Jun 2022 08:23:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoKRKkkCv/LH1/ExPCuCeHOVgrL7hRr8CFaqUafjXFfb9/vwTjDTNOsoDgWQzpeHsayNAbzQ==
X-Received: by 2002:a05:600c:d0:b0:39c:5927:3fa7 with SMTP id
 u16-20020a05600c00d000b0039c59273fa7mr10440584wmm.36.1654701837995; 
 Wed, 08 Jun 2022 08:23:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b0039756cdc8e1sm24770475wmo.37.2022.06.08.08.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:23:57 -0700 (PDT)
Date: Wed, 8 Jun 2022 16:23:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v5 06/10] hmp: add basic "info stats" implementation
Message-ID: <YqC/C0JnLwiZ2OOk@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-7-pbonzini@redhat.com>
 <Yp+aha8olzKWwOCz@work-vm>
 <97f0df53-73fa-0ddb-d6df-088a41fb5588@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f0df53-73fa-0ddb-d6df-088a41fb5588@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 6/7/22 20:35, Dr. David Alan Gilbert wrote:
> > > +        monitor_printf(mon, "%s", iec_binary_prefix(value->exponent));
> > OK that's better; but it's a shame the limits don't come from something
> > shared; iec_binary_prefix goes upto 60 and si_prefix goes way below -9
> > 
> > Reviewed-by: Dr. David Alan Gilbert<dgilbert@redhat.com>
> > 
> 
> I can remove the limits altogether, and consider it a bug of the provider if
> they're not respected, but it's a bit ugly to have an assertion failure in
> that case.

[I just noticed si_prefix is declared to take 'unsigned int' which is
probably wrong)

Why don't you change the si_prefix/iec_binary_prefix to return NULL
rather than asserting, then we end up with something like:

   exponentstr = NULL;
   if (unit && value->base == 10) {
       exponentstr = si_prefix(value->exponent);
   } else if (unit && value->base == 2) {
       exponentstr = iec_binary_prefix(value->exponent);
   }
   if (exponentstr) {
       monitor_printf(mon, "%s", exponentstr);
   } else if (value->exponent) {

Dave

> Paolo

> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


