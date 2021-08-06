Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57273E28AC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:35:16 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxC7-0001bt-Bt
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxAY-0000uh-US
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxAV-0000qb-KO
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628246011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9PPtsVsL1rO1yfen4MitIY0dgI98HSX65QimFT8oIU=;
 b=DZPmbRQ3oYLOqXgx58YWNGnHmuSJg+JGLhf0sMhd4rmIWZ9LuB7/0u6BgfUUMuKNkA0A8n
 9iW8JZNptLoijEc7AL8wm+pXMdaSQkjR8FA2G1rX2g4278l6tbLOucWdAPqwSS5e9JplLv
 R9NyFcgTvS5Ez1/2P5cbmOi8evJepWs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-Ir2HidEVOlqN-GQeJQ1VKw-1; Fri, 06 Aug 2021 06:33:30 -0400
X-MC-Unique: Ir2HidEVOlqN-GQeJQ1VKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s22-20020adf97960000b02901535eae4100so3004072wrb.14
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9PPtsVsL1rO1yfen4MitIY0dgI98HSX65QimFT8oIU=;
 b=FueybC1hbT5JXztYApcDRV/P9gqfvTa0komZnPyolpgAzK1FBZpeWoQWqMJutttcQi
 Mw3S8mR79TDate66ymPEiITYkBZ0oH1KOfD8ruGVvUugHVAB/gALM6maj1ucYcL04Q1z
 W/gR1SoPMdmWiHV4IoGQRgANWukcFPoxjREarfSzH466rYZZs1qoB+qdHkAdoQSL7Sf7
 Myr/mUlGvB4tEbXi8JcZP3wWnnso42Z1vfuWDr1CzQkI0ZIHtOVTshDNC+KhzouI4Lwa
 JHRz2AiUfCUXMiwu06z+HARQ/DzEfYgJy14A1VY0LpC9Yy0KFg4UxwUQ7eoqzWHDgShQ
 pc1w==
X-Gm-Message-State: AOAM532vml9QwiLUt99aiuPdkckzm8k8hDuabh70ZHD0ZD3/nrhmWq7d
 y0lbs2FQfGGPE3L9dAjC/N7jvr/nUlz+LZt9o4SByuvy+Sre1oqZkuaREhRmJ8VQyvcy08hNAUH
 3Azee8nRZ9+g8Rw4=
X-Received: by 2002:adf:cf07:: with SMTP id o7mr9880846wrj.216.1628246009168; 
 Fri, 06 Aug 2021 03:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaNHA81+bKeR4N5sz6OWcAA67wZavTl6F/3z/mvlVPl3t+KUAzDx0uPVigslNpVwTgr9Ew3A==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr9880817wrj.216.1628246008997; 
 Fri, 06 Aug 2021 03:33:28 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m39sm10574457wms.28.2021.08.06.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:33:28 -0700 (PDT)
Date: Fri, 6 Aug 2021 12:33:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
Message-ID: <20210806123326.284595b3@redhat.com>
In-Reply-To: <20210805180915-mutt-send-email-mst@kernel.org>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
 <20210805180915-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, jusual@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 18:13:21 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Aug 05, 2021 at 07:42:35PM +0530, Ani Sinha wrote:
> > Also to be noted that there is a stub for acpi_get_i386_pci_host() which
> > simply returns NULL. This activates when CONFIG_PC is disabled. It is this
> > stub that gets called for mips and hence the check for non-null host is
> > needed in acpi_set_pci_info() function.
> >   
> 
> Frankly this is generating more discussion that it's worth imho.
> IMHO these tweaks will bring little benefit.
> Igor do you feel differently?
replacing 'ifs' with assert is a bit cleaner, but if we are cleaning
it up we should clean up it properly without leaving unnecessary
code around.
That's why I suggested to separate x86 specific parts from piix4.
Philippe (CCed) even have reported issues ACPI parts were
causing on MIPS machines, so if someone is willing to untangle
the mess it might be worth the shot.



