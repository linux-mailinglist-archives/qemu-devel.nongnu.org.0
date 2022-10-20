Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89B6064D2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:40:43 +0200 (CEST)
Received: from localhost ([::1]:54324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXez-0008AP-P9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:40:41 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXc5-0006Wr-KI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olUvp-0000ZH-Mw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:45:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olUvo-0003Z1-61
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666269951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oc8iphM/h11VdtG8ssKZLFIMqbZBEaQ564nDicqdVYQ=;
 b=O8TlRBKIxBSQTsVDS2aODCKudgRq+a8UBxps6fIjkQNJpwDD5gnDSgTzQuKObjVTTFGVA2
 aqq7cNo/LHUDupAcbg7wJyDIb4g8D3/EsAipd49gRrUlQ4mrJZsPU0Z6sGJ9n3U+PJyt0D
 C6xgj9eQnpOOlIZltKqvW5l4plzDlNE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-tlgF4VVPPKWnTWZXmbzbSQ-1; Thu, 20 Oct 2022 08:45:49 -0400
X-MC-Unique: tlgF4VVPPKWnTWZXmbzbSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso235840wrc.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oc8iphM/h11VdtG8ssKZLFIMqbZBEaQ564nDicqdVYQ=;
 b=AZNMrs0pPXfEZdSYjOG2UnjFAEAWszEPGcrCrWeUuDT988zTmF5gIeiwmbkvTkfm4P
 F2Ro1VOWuBDd8629wEwiAbanYCCZxGXfrkZAnnwhttqNBTrZZAGuNpvZVvUcW/LcX8v1
 fIJYYrJEGb3ej5G/1x9JkQp6T4hNjO42Qzda4akYb1uIimnNdfRBW3eVyk6Z16uebzCu
 jXeTvL/IVAYBUOmv6aywtCWRIVhufvwx3nv1x+5Kzk7nrVWWi94V09R19w+Li1KbtJFt
 JPHC8inOrBWA9hDezsHAsEEkZTXC3dSB7cnKDgmy8V03JtAq3SjTJnOm7RwiGseBbbfO
 /qoA==
X-Gm-Message-State: ACrzQf366TFjEc3HodoiN1LrfVF/sJOI0nCo7uwztGKb+e5ouQavFQCS
 GN/4k42XYx0GrpxumJ2W21OWklpaKFinZRjNtgiyv3M9Q3DaZ3MzvYvsY0sKvDUtdsB9GuKuP6N
 3LwKV62/ByBQnPUs=
X-Received: by 2002:a1c:7704:0:b0:3c6:ede9:d2b3 with SMTP id
 t4-20020a1c7704000000b003c6ede9d2b3mr9235921wmi.41.1666269948603; 
 Thu, 20 Oct 2022 05:45:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/UFIczKm5NuxbEyHYlmYJSXNCOfb22vMh2vb8LxzGEnQDkiDl33a+75Buv7ymMfU5kZRsVg==
X-Received: by 2002:a1c:7704:0:b0:3c6:ede9:d2b3 with SMTP id
 t4-20020a1c7704000000b003c6ede9d2b3mr9235899wmi.41.1666269948381; 
 Thu, 20 Oct 2022 05:45:48 -0700 (PDT)
Received: from redhat.com ([2.54.191.184]) by smtp.gmail.com with ESMTPSA id
 f2-20020adff582000000b0022cd0c8c696sm2495780wro.103.2022.10.20.05.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:45:47 -0700 (PDT)
Date: Thu, 20 Oct 2022 08:45:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221020084311-mutt-send-email-mst@kernel.org>
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
> On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
> > >
> > >
> > > Changelog:
> > > v6:
> > >   - skip test when dependencies (xorriso for example) are not installed.
> > >   - skip test when run on a platform other than x86_64.
> >
> > Hmm why is that btw?
> 
> The bits binaries that generate the iso (grub-mkrescue etc) are built
> for and are known to work only on x86_64 platform. They might also
> work on amd64 but I do not have one at my disposal at the moment to
> check.
> On other platforms, for example 32 bit x86 and non-x86, those binaries
> will likely not work. The test will fail.

confused. I thought we are distributing the iso?

-- 
MST


