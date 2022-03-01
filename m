Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F744C8B22
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 12:53:39 +0100 (CET)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP14U-0003QL-6Y
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 06:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP12m-0002fP-T2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:51:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP12l-0004nm-F2
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 06:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646135510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8Q9kXIF7NJbe+K1q8q4amQw6b0GNreJjL0mJcL3ohg=;
 b=ejn4knrob2sLHun7zL9lnCP8+gjD2Tzsfr+9QY9mCldnhh0J7uwa/A4Dmjho5Tn8qjl8OR
 Q8zK9mKi2839umucsTfuO6EW2xt8IndFg+vUDYiL2nwimkuxz1FkSDjAvR+yELkF1CJxpv
 IUFGexQrGDzYJi8/gi3/dczsNNJS5xA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-dNETb6-GNgOwh23K8t6xmw-1; Tue, 01 Mar 2022 06:51:49 -0500
X-MC-Unique: dNETb6-GNgOwh23K8t6xmw-1
Received: by mail-ed1-f72.google.com with SMTP id
 cm27-20020a0564020c9b00b004137effc24bso5825879edb.10
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 03:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8Q9kXIF7NJbe+K1q8q4amQw6b0GNreJjL0mJcL3ohg=;
 b=fmROaCXzQEsSLCJHQKoBUNNgnvuzl3C2dfx0E4IDhzkpuMuwEU/I+pJc9T2d/I0H+G
 +K84aJAazROkkPYsaipgwJYUiv0q5Ko7P5/CBpNpR5T5oUqE/u55wRgmbfhade6YhIgF
 zau7fwqe0boP8S+5qnJn7mB4YOunyKkLk40Pc5AJySsV6Hj4mrpzlEfeqUldpC897NKV
 QVisWz2/oC0DANDGOKWU1mQfM9pcXO8t8TfmwbJtz6HRktlnByOuNS/hFe9jnaM+aaxT
 4t1KNwomrs+K5LGfv6FTpnYrMQ//s8BrRChRIPL9nvI7RK6qB8/g7X51BOjHwXkI8jbV
 INbg==
X-Gm-Message-State: AOAM5305YMtL8WKbZFU0OKNXoTxuyI9JjhqWUcSXZNksoPMQaUHTUZkH
 olyeIXo12JlK50ngXn3MI5m1NKYs41UxXh5HburxHuJ0ISJlXzdj2IntybtVuWt7A7YBU5V2vGb
 qxDYD47Aj2haPsuk=
X-Received: by 2002:a17:906:2991:b0:6cf:1fd4:39a3 with SMTP id
 x17-20020a170906299100b006cf1fd439a3mr18809565eje.21.1646135508732; 
 Tue, 01 Mar 2022 03:51:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVMiBDWOdgxFR5nvgeNQlnLqQtS86AVdt5EVenA0pEtBXs6KXGQxe77/3Tn1ikQ2EA9NbInA==
X-Received: by 2002:a17:906:2991:b0:6cf:1fd4:39a3 with SMTP id
 x17-20020a170906299100b006cf1fd439a3mr18809560eje.21.1646135508559; 
 Tue, 01 Mar 2022 03:51:48 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 w11-20020aa7d28b000000b00410efb2333dsm7161779edq.41.2022.03.01.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 03:51:48 -0800 (PST)
Date: Tue, 1 Mar 2022 12:51:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220301125147.3129fa5d@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, shentey@gmail.com, Liav Albani <liavalb@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 15:22:17 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> On Tue, 1 Mar 2022, Igor Mammedov wrote:
> 
> > On Mon, 28 Feb 2022 22:17:32 +0200
> > Liav Albani <liavalb@gmail.com> wrote:
> >  
> > > This can allow the guest OS to determine more easily if i8042 controller
> > > is present in the system or not, so it doesn't need to do probing of the
> > > controller, but just initialize it immediately, before enumerating the
> > > ACPI AML namespace.
> > >
> > > This change only applies to the x86/q35 machine type, as it uses FACP
> > > ACPI table with revision higher than 1, which should implement at least
> > > ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> > > flags register according to the ACPI 2.0 specification.
> > >
> > > Signed-off-by: Liav Albani <liavalb@gmail.com>
> > > ---
> > >  hw/acpi/aml-build.c         | 11 ++++++++++-
> > >  hw/i386/acpi-build.c        |  9 +++++++++
> > >  hw/i386/acpi-microvm.c      |  9 +++++++++  
> > commit message says it's q35 specific, so wy it touched microvm anc piix4?  
> 
> Igor is correct. Although I see that currently there are no 8042 devices
> for microvms, maybe we should be conservative and add the code to detect
> the device anyway. In that case, the change could affect microvms too when
> such devices get added in the future.

when that case actually arises implement it then, so I'd say don't generalize
that unless it's actually used within series.
Or planned to be used in near future in which case commit message should
mention that.

> 
> echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
> -monitor stdio 2>/dev/null | grep 8042
> 
> <empty>
> 


